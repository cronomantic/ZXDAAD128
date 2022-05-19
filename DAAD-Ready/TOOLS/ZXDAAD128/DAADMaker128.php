
<?php
// (C) Cronomantic 2022 - This code is released under the GPL v3 license


global $isBigEndian;
$isBigEndian = false;

define('VERSION_HI',0);
define('VERSION_LO',1);

//================================================================= Error ========================================================
function Error($msg)
{
 echo("Error: $msg.\n");
 exit(2);
}

function Syntax()
{
    echo ("SYNTAX: php daadmaker128.php [options] <bank0.AD0> [bank1.AD1] ...\n\n");
    echo ("+ [options]: one or more of the following:\n");
    echo ("  -t [TAP file]  : (Optional) Name of the tape file. Otherwise, the name of the first bank file will be used.");
    echo ("  -s [SCR file]  : (Optional) SCR file for loading screen.");
    echo ("  -n Filename    : (Optional) Name of the program for the loader.");
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

function CreateTapeBlock($byteArray, $isHeader=false)
{
    $buffer = array();
    $parity = 0;
    foreach($byteArray as $byte) $parity = $parity^$byte;

    writeWord($buffer, sizeof($byteArray) + 2);
    if ($isHeader)
    {
      writeZero($buffer);
      $parity = $parity ^ 0;
    } else {
      writeFF($buffer);
      $parity = $parity ^ 0xFF;
    }
    appendBuffer($byteArray, $buffer);
    writeByte($buffer, $parity);

    return $buffer;

}

/*
The type is 0,1,2 or 3 for a Program, Number array, Character array or Code file.
A SCREEN$ file is regarded as a Code file with start address 16384 and length 6912 decimal.
If the file is a Program file, parameter 1 holds the autostart line number (or a number >=32768 if no LINE parameter was given)
                               and parameter 2 holds the start of the variable area relative to the start of the program.
If it's a Code file, parameter 1 holds the start of the code block when saved, and parameter 2 holds 32768.
For data files finally, the byte at position 14 decimal holds the variable name.
*/
function AddBasicHeader($filename, $autoStartLineNumber, $byteArrayProgram)
{
    $buffer = array();
    writeZero($buffer); //0 = Program;
    //Filename 10 bytes (padded with blanks)
    $filename = str_pad(substr($filename, 0, 10), 10);
    appendBuffer(string2intArr($filename), $buffer);
    writeWord($buffer, sizeof($byteArrayProgram) & 0xFFFF); //Length of data block
    writeWord($buffer, $autoStartLineNumber & 0xFFFF); //Param 1
    writeWord($buffer, sizeof($byteArrayProgram) & 0xFFFF); //Param 2

    $buffer = CreateTapeBlock($buffer, true);
    appendBuffer(CreateTapeBlock($byteArrayProgram, false), $buffer);

    return $buffer;
}
//================================================================= Loader ========================================================

$loaderBytes = string2intArr(gzuncompress(base64_decode("eJxjYLjC8IoBBXw2/Bd/dnLs2+gLMVWbNXjsBO4qMjicrYw92wIUu4QQS4CJXYGICQLFDsDErkHEhJHFbkDERJDFbkHExJDF7kDExBFidgJA+jBTwmfGv/VvK41ion+fNLf7fzaM9cbD9SAZBob1l/8BXSnI6MDIIF36dsNJBi5hhr96fAwM/+MZrD4dALHuxTDwAgCQ2mMK")));

//================================================================= Others ========================================================
function replace_extension($filename, $new_extension) {
    $info = pathinfo($filename);
    return ($info['dirname'] ? $info['dirname'] . DIRECTORY_SEPARATOR : '')
        . $info['filename']
        . '.'
        . $new_extension;
}
//================================================================= Main ========================================================
if (intval(date("Y"))>2018) $extra = '-'.date("Y"); else $extra = '';
echo "DAADMaker128 ".VERSION_HI.".".VERSION_LO. " (C) Cronomantic 2022$extra\n";

$rest_index = null;
$opts = getopt('vt:s:n:', [], $rest_index);
$posArgs = array_slice($argv, $rest_index);

if (sizeof($posArgs) < 1) Syntax();

//Screen file
$screenFileName = '';
if (array_key_exists('s', $opts))
{
    $screenFileName = $opts['s'];
    if (!file_exists($screenFileName)) Error("File '$screenFileName' not found.");
    if (filesize($screenFileName) != 6912) Error("File '$screenFileName' does not have a valid size.");
}

//Program Name
$programFileName = 'ZxDAAD128';
if (array_key_exists('n', $opts)) $programFileName = $opts['n'];


$tape = array();
if ($screenFileName != '')
{
    $bytes = getByteArrayFromFile($screenFileName);
    writeWord($loaderBytes, sizeof($bytes), 5);
    appendBuffer(CreateTapeBlock($bytes), $tape);
}

$cont = 1;
foreach ($posArgs as $idx => $param)
{
    if (!file_exists($param)) Error("File '$param' not found");
    switch($idx)
    {
        case 0: //Bank 0
            if (pathinfo($param, PATHINFO_EXTENSION) != 'AD0') Error("File '$param' not valid");
            if ((filesize($param) == 0)||(filesize($param) > (0x10000 - 0x6000))) Error("File '$param' does not have a valid size.");
            $bytes = getByteArrayFromFile($param);
            writeWord($loaderBytes, sizeof($bytes), (2 * $idx + 7));
            appendBuffer(CreateTapeBlock($bytes), $tape);
            break;
        case 1: //Bank 1
            if (pathinfo($param, PATHINFO_EXTENSION) != 'AD1') Error("File '$param' not valid");
            if ((filesize($param) == 0)||(filesize($param) > (0x10000 - 0xC000))) Error("File '$param' does not have a valid size.");
            $bytes = getByteArrayFromFile($param);
            writeWord($loaderBytes, sizeof($bytes), (2 * $idx + 7));
            appendBuffer(CreateTapeBlock($bytes), $tape);
            break;
        case 2: //Bank 3
            if (pathinfo($param, PATHINFO_EXTENSION) != 'AD3') Error("File '$param' not valid");
            if ((filesize($param) == 0)||(filesize($param) > (0x10000 - 0xC000))) Error("File '$param' does not have a valid size.");
            $bytes = getByteArrayFromFile($param);
            writeWord($loaderBytes, sizeof($bytes), (2 * $idx + 7));
            appendBuffer(CreateTapeBlock($bytes), $tape);
            break;
        case 3:// Bank 4
            if (pathinfo($param, PATHINFO_EXTENSION) != 'AD4') Error("File '$param' not valid");
            if ((filesize($param) == 0)||(filesize($param) > (0x10000 - 0xC000))) Error("File '$param' does not have a valid size.");
            $bytes = getByteArrayFromFile($param);
            writeWord($loaderBytes, sizeof($bytes), (2 * $idx + 7));
            appendBuffer(CreateTapeBlock($bytes), $tape);
            break;
        case 4: //Bank 6
            if (pathinfo($param, PATHINFO_EXTENSION) != 'AD6') Error("File '$param' not valid");
            if ((filesize($param) == 0)||(filesize($param) > (0x10000 - 0xC000))) Error("File '$param' does not have a valid size.");
            $bytes = getByteArrayFromFile($param);
            writeWord($loaderBytes, sizeof($bytes), (2 * $idx + 7));
            appendBuffer(CreateTapeBlock($bytes), $tape);
            break;
        case 5: //Bank 7
            if (pathinfo($param, PATHINFO_EXTENSION) != 'AD7') Error("File '$param' not valid");
            if ((filesize($param) == 0)||(filesize($param) > (0x10000 - 0xC000))) Error("File '$param' does not have a valid size.");
            $bytes = getByteArrayFromFile($param);
            writeWord($loaderBytes, sizeof($bytes), (2 * $idx + 7));
            appendBuffer(CreateTapeBlock($bytes), $tape);
            break;
        default:
            Error("File '$param' not valid");
    }
    if (array_key_exists('v', $opts)) {
        echo(" Block $cont: $param - " . sizeof($bytes) . " Bytes\n");
        $cont++;
    }
}

$loader = AddBasicHeader($programFileName, 10, $loaderBytes);
appendBuffer($tape, $loader);

//Output TAP file
$outputFileName = '';
$inputFileName = $posArgs[0];
if (array_key_exists('t', $opts)) $outputFileName = $opts['t'];
if ($outputFileName=='') $outputFileName = $inputFileName;
$outputFileName = replace_extension($outputFileName, 'TAP');
if ($outputFileName==$inputFileName) Error('Input and output file name cannot be the same');

$outputFileHandler = fopen($outputFileName, "wb");
if (!$outputFileHandler) Error("Couldn't create file '$outputFileName'.\n");
flushBuffer($loader, $outputFileHandler);
fclose($outputFileHandler);
echo "File $outputFileName created.\n";

exit(0);
