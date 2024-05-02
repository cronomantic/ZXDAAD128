<?php
// (C) Cronomantic 2022 - This code is released under the GPL v3 license


global $isBigEndian;
$isBigEndian = false;

define('VERSION_HI',1);
define('VERSION_LO',0);

//================================================================= Error ========================================================
function Error($msg)
{
 echo("Error: $msg.\n");
 exit(2);
}

function Syntax()
{
    echo ("SYNTAX: php daadmakerPlus3.php [options] <bank0.AD0> [bank1.AD1] ...\n\n");
    echo ("+ [options]: one or more of the following:\n");
    echo ("  -d [path]      : (Optional) Destination of the loader and data filer to include on a image.");
    echo ("  -s [SCR file]  : (Optional) SCR file for loading screen.");
    echo ("\n");
    echo ("The order of the positional arguments determine the order of loading into the banks, ¡Be careful!");
}

//================================================================= filewrite ========================================================
function string2intArr($string)
{
    $l = strlen($string);
    $r = array();
    for($i = 0; $i < $l; $i++)
    {
      $r[] = ord($string{$i});
    }
    return $r;
}

// Writes a byte value to buffer
function writeByte(&$buffer, $byte, $pos=null, $bigEndian=false)
{
    if ($byte > 255)
        writeWord($buffer, $byte, $pos, $bigEndian);
    else
    {
        if (is_null($pos)) $pos = count($buffer);
        $buffer[$pos] = $byte;
    }
}

function writeWord(&$buffer, $word, $pos=null, $bigEndian=false)
{
    $word = intval($word);
    $a = ($word & 0xff00) >> 8;
    $b = ($word & 0xff);
    if ($bigEndian)
    {
        $tmp = $b;
        $b = $a;
        $a = $tmp;
    }
    if (is_null($pos))
    {
        writeByte($buffer, $b, null, $bigEndian);
        writeByte($buffer, $a, null, $bigEndian);
    } else {
        writeByte($buffer, $b, $pos, $bigEndian);
        writeByte($buffer, $a, $pos+1, $bigEndian);
    }
}

// shortcut for writeByte(0)
function writeZero(&$buffer)
{
    $b =0;
    writeByte($buffer, $b);
}

// shortcut for writeByte(0xFF)
function writeFF(&$buffer)
{
    $b =0xFF;
    writeByte($buffer, $b);
}

// Saves the buffer to a file
function flushBuffer($buffer, $handle)
{
    foreach ($buffer as $byte)
        fwrite($handle, chr($byte), 1);
}

// Saves the buffer to a file
function appendBuffer($bufferOrigin, &$bufferDest)
{
    foreach ($bufferOrigin as $byte) writeByte($bufferDest, $byte);
}

function getByteArrayFromFile($fileName)
{
    $byteArray = array();
    $bytes = file_get_contents($fileName);
    if (!$bytes) return false;
    $bytes = string2intArr($bytes);
    foreach($bytes as $byte) writeByte($byteArray, $byte);
    return $byteArray;
}
//================================================================= Loader ========================================================

$loaderBytes = string2intArr(gzuncompress(base64_decode("eJxjYBBlfMWAAj4b/os/uz6WkZFBkJFBsTr2LBvj2+gLMVWbNTgZGRgUGRzOCgEFLiEEEsACVyACQC0MB8AC1yACzHCBGxABFrjALYgAG1zgDkSAHSrAxnCWk/HsHMazk2P5GM62xB5mSnBxdHTRc/L0+28VE/3sx0bGv/VvK41iok8Cuaefw3hW6dGn209fZ5MH8tKjT66//A/oakFGB0YG6dK3G4BKgQqfvfjGDlbMJg9U/uzHNxawYkWGCkGOisP2jAxcwgx/9fgYGP7HM1h9OgBi3Yth4AUAO95o5A==")));

//================================================================= Others ========================================================
function replace_extension($filename, $new_extension) {
    $info = pathinfo($filename);
    return ($info['dirname'] ? $info['dirname'] . DIRECTORY_SEPARATOR : '')
        . $info['filename']
        . '.'
        . $new_extension;
}

//================================================================= other ========================================================

/*
El primer $00 de la cabecera indica
que es un programa Basic. El siguiente valor
($0133) es el tamaño del programa Basic, el
siguiente valor ($0000) el número de línea de
autoejecución9
, y el siguiente valor es el tamaño
del Basic descontando las variables. En este
caso el Basic no incluye ninguna variable con
valor y por ello es el mismo valor que el tamaño
del Basic.
*/
function prependPlus3Header($outputFileName, $type, $startAddress)
{
    //0x03; // Bytes
    //0x00; //BASIC
    $type = intval($type);
    if ($type > 0x03) $type = 0x03;

    $fileSize = filesize($outputFileName) + 128; // Final file size wit header
    $inputHandle = fopen($outputFileName, 'r');
    $outputHandle = fopen("prepend.tmp", "w");

    $header = array();
    $header[]= ord('P');
    $header[]= ord('L');
    $header[]= ord('U');
    $header[]= ord('S');
    $header[]= ord('3');
    $header[]= ord('D');
    $header[]= ord('O');
    $header[]= ord('S');
    $header[]= 0x1A; // Soft EOF
    $header[]= 0x01; // Issue
    $header[]= 0x00; // Version
    $header[]= $fileSize & 0XFF;  // Four bytes for file size
    $header[]= ($fileSize & 0xFF00) >> 8;
    $header[]= ($fileSize & 0xFF0000) >> 16;
    $header[]= ($fileSize & 0xFF000000) >> 24;
    $header[]= $type; // Bytes:
    $fileSize -= 128; // Get original size
    $header[]= $fileSize & 0x00FF;  // Two bytes for data size
    $header[]= ($fileSize & 0xFF00) >> 8;
    $header[]= $startAddress & 0x00FF;  // Two Bytes for load addres
    $header[]= ($startAddress & 0xFF00) >> 8;
    $header[]= $fileSize & 0x00FF;  // Two bytes for data size
    $header[]= ($fileSize & 0xFF00) >> 8;
    while (sizeof($header)<127) $header[]= 0; // Fillers
    $checksum = 0;
    for ($i=0;$i<127;$i++)  $checksum+=$header[$i];
    $header[]= $checksum & 0xFF; // Checksum

    // Dump header
    for ($i=0;$i<128;$i++) fputs($outputHandle, chr($header[$i]), 1);

    // Dump original DDB
    while (!feof($inputHandle))
    {
        $c = fgetc($inputHandle);
        fputs($outputHandle,$c,1);
    }
    fclose($inputHandle);
    fclose($outputHandle);
    unlink($outputFileName);
    rename("prepend.tmp" ,$outputFileName);
}

//================================================================= Main ========================================================
if (intval(date("Y"))>2018) $extra = '-'.date("Y"); else $extra = '';
echo "DAADMakerPlus3 ".VERSION_HI.".".VERSION_LO. " (C) Cronomantic 2022$extra\n";

$rest_index = null;
$opts = getopt('vs:d:', [], $rest_index);
$posArgs = array_slice($argv, $rest_index);

if (sizeof($posArgs) < 1) Syntax();

$loaderFilename = "disk";
$dataFilename = "daad.bin";

//Destination path
if (array_key_exists('d', $opts)) {
    $destPath = $opts['d'];
    if (!is_dir($destPath)) Error("Invalid destination path.");
    $loaderFilename = $destPath . DIRECTORY_SEPARATOR . $loaderFilename;
    $dataFilename = $destPath . DIRECTORY_SEPARATOR . $dataFilename;
}


//Screen file
$screenFileName = '';
if (array_key_exists('s', $opts))
{
    $screenFileName = $opts['s'];
    if (!file_exists($screenFileName)) Error("File '$screenFileName' not found.");
    if (filesize($screenFileName) != 6912) Error("File '$screenFileName' does not have a valid size.");
}

$fileDisk = array();
if ($screenFileName != '')
{
    $bytes = getByteArrayFromFile($screenFileName);
    writeWord($loaderBytes, sizeof($bytes), 5);
    appendBuffer($bytes, $fileDisk);
}

$cont = 1;
foreach ($posArgs as $idx => $param)
{
    if (!file_exists($param)) Error("File '$param' not found\n");
    switch($idx)
    {
        case 0: //Bank 0
            if (pathinfo($param, PATHINFO_EXTENSION) != 'AD0') Error("File '$param' not valid");
            if ((filesize($param) == 0)||(filesize($param) > (0x10000 - 0x6000))) Error("File '$param' does not have a valid size.");
            $bytes = getByteArrayFromFile($param);
            writeWord($loaderBytes, sizeof($bytes), (2 * $idx + 7));
            appendBuffer($bytes, $fileDisk);
            break;
        case 1: //Bank 1
            if (pathinfo($param, PATHINFO_EXTENSION) != 'AD1') Error("File '$param' not valid");
            if ((filesize($param) == 0)||(filesize($param) > (0x10000 - 0xC000))) Error("File '$param' does not have a valid size.");
            $bytes = getByteArrayFromFile($param);
            writeWord($loaderBytes, sizeof($bytes), (2 * $idx + 7));
            appendBuffer($bytes, $fileDisk);
            break;
        case 2: //Bank 3
            if (pathinfo($param, PATHINFO_EXTENSION) != 'AD3') Error("File '$param' not valid");
            if ((filesize($param) == 0)||(filesize($param) > (0x10000 - 0xC000))) Error("File '$param' does not have a valid size.");
            $bytes = getByteArrayFromFile($param);
            writeWord($loaderBytes, sizeof($bytes), (2 * $idx + 7));
            appendBuffer($bytes, $fileDisk);
            break;
        case 3:// Bank 4
            if (pathinfo($param, PATHINFO_EXTENSION) != 'AD4') Error("File '$param' not valid");
            if ((filesize($param) == 0)||(filesize($param) > (0x10000 - 0xC000))) Error("File '$param' does not have a valid size.");
            $bytes = getByteArrayFromFile($param);
            writeWord($loaderBytes, sizeof($bytes), (2 * $idx + 7));
            appendBuffer($bytes, $fileDisk);
            break;
        case 4: //Bank 6
            if (pathinfo($param, PATHINFO_EXTENSION) != 'AD6') Error("File '$param' not valid");
            if ((filesize($param) == 0)||(filesize($param) > (0x10000 - 0xC000))) Error("File '$param' does not have a valid size.");
            $bytes = getByteArrayFromFile($param);
            writeWord($loaderBytes, sizeof($bytes), (2 * $idx + 7));
            appendBuffer($bytes, $fileDisk);
            break;
        case 5: //Bank 7
            if (pathinfo($param, PATHINFO_EXTENSION) != 'AD7') Error("File '$param' not valid");
            if ((filesize($param) == 0)||(filesize($param) > (0x10000 - 0xC000))) Error("File '$param' does not have a valid size.");
            $bytes = getByteArrayFromFile($param);
            writeWord($loaderBytes, sizeof($bytes), (2 * $idx + 7));
            appendBuffer($bytes, $fileDisk);
            break;
        default:
            Error("File '$param' not valid");
    }
    if (array_key_exists('v', $opts)) {
        echo(" Block $cont: $param - " . sizeof($bytes) . " Bytes\n");
        $cont++;
    }
}

$outputFileHandlerL = fopen($loaderFilename, "wb");
if (!$outputFileHandlerL) Error("Couldn't create file '$loaderFilename'.");

$outputFileHandlerD = fopen($dataFilename, "wb");
if (!$outputFileHandlerD) Error("Couldn't create file '$dataFilename'.");

flushBuffer($loaderBytes, $outputFileHandlerL);
fclose($outputFileHandlerL);
prependPlus3Header($loaderFilename, 0, 10);
echo "File $loaderFilename created.\n";

flushBuffer($fileDisk, $outputFileHandlerD);
fclose($outputFileHandlerD);
echo "File $dataFilename created.\n";
