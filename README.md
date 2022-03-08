# **ZXDAAD128**

***

## **Description**

This project is a **DAAD** interpreter created from scratch with [**Boriel's ZXBasic**](https://github.com/boriel/zxbasic) for **Spectrum 128k** and compatible systems and enabling the use of the extra banks to make bigger adventures and showing bitmap images without the requirement of disk.

**DAAD** is a multi-machine and multi-graphics adventure writer, enabling you to target a broad range of 8-bit and 16-bit systems.
You can see the classic interpreters [here](https://github.com/daad-adventure-writer/daad).

**ZXDAAD128** requires to use the frontend of [**DAAD Reborn Compiler**](https://github.com/daad-adventure-writer/DRC/wiki) with a specific backend supplied with this project in order to distribute parts of the database around other banks. The Messages (**MTX**), System Messages (**STX**), Location Descriptions (**LTX**), Object Descriptions (**OTX**) and the character set will be allocated on other banks if they do not fit on the space available on bank 0. All the other database data will always be on Bank 0.

**ZXDAAD128** supports compressed bitmap graphics with the **DCP** tool, instead of the traditional vector graphics.  
The tool uses the **ZX0** compressor by Einar Saukas to compress full SCR files and the images will also be allocated on the banks of RAM by the compiler backend.  
The CondAct `PICTURE` will prepare an image for loading and the condAct `DISPLAY` will show it on the screen, as described on the original DAAD documentation.  
However, the image will be shown always on full screen, there is no provision of clipping and positioning the image according to the active window.

Supports loading and saving on tape or disk with ESXDOS or +3DOS and 42 or 32 characters per line.

**ZXDAAD128**  also emulates, to some extent, [**Maluva DAAD extension**](https://github.com/Utodev/MALUVA/wiki) which adds new functionalities to the classic interpreters. These are the extended condActs currently supported:

- `XPICTURE`: Load compressed DCP bitmap images from disk instead of RAM. This function does not support the standard Maluva's SC2DAAD format.
- `XMESSAGE`: Use of extra texts. The maximum size allowed is 64Kb, divided into 4 blocks of 16Kb maximum, which will also be distributed around the memory banks by the compiler's backend.
- `XUNDONE`: To cancel the status "done".
- `XLOAD`/`XSAVE`: To load/save your gameplay. They work like the traditional `LOAD`/`SAVE` condActs on this interpreter.

***

## **Supported languages**

- English
- Spanish

***

## **Requirements**

These are the essential requirements to create adventures with this interpreter:

- **DAAD Reborn Compiler**, more precisely, the frontend program `DRF.exe`. It can be obtained [here](https://www.ngpaws.com/downloads/DAAD/DRC/).
- **PHP**, which can be obtained [here](https://www.php.net/), please follow its installation instructions for your OS.

If you want to compile the interpreter, you will also need:

- **ZXBasic**, from [here](http://www.boriel.com/files/zxb/zxbasic-1.16.3-beta5-win32.zip).
  
And for DCP:

- **A C standard compiler**

***

## **How to use**

### **Creating an adventure**

To create your own adventure you need a text source file (**.DSF**), and the source file must be encoded with *Windows-1252* or *ISO-8859-1* charsets.  

There are empty templates in several languages to start your adventure:

- [English DSF blank template](https://github.com/daad-adventure-writer/DRC/blob/master/BLANK_EN.DSF)
- [Spanish DSF blank template](https://github.com/daad-adventure-writer/DRC/blob/master/BLANK_ES.DSF)

To learn more about **how to create your own adventure** your can:

-  Read our [**Wiki pages with several articles**](https://github.com/nataliapc/msx2daad/wiki) about **DAAD** and **MSX2DAAD**.
- Also you can follow this great [**DAAD Tutorial for beginners**](https://medium.com/@uto_dev/a-daad-tutorial-for-beginners-1-b2568ec4df05) writed by the author of the [**DRC**](https://github.com/daad-adventure-writer/DRC/wiki) compiler.

### **Executing the frontend**

After you have the `DSF` file of your adventure, you must compile it with the frontend program `DRF` as described on its [documentation](https://github.com/daad-adventure-writer/DRC/wiki) with the ZX target and the desired subtarget, like so:  

```
    drf zx mygame.dsf
    drf zx plus3 mygame.dsf
    drf zx esxdos mygame.dsf
```

However, instead of generating the `DDB` file with the standard `drb` program, you must use the program `drb128` located on the `/DRC` directory of this distribution.

### **DRB128**

 This is not an executable file but a php script, so you need to run it with a php interpreter. Again, please refer to the [DRC wiki](https://github.com/daad-adventure-writer/DRC/wiki) for more information.  

You could execute it with something like this on the command line:

```
php drb128 -i scr\ TAPE ES mygame.json ZXD128_TAPE_ES_C42.ZDI AD8X6.CHR
```

These are the command line parameters that `drb128` needs:

```
php drb128 [options] <subtarget> <lang> <input file> <interpreter> <character set>
```

The meaning of these parameters are the following:

- **subtarget** : The subtarget machine. Valid values: TAPE, PLUS3, ESXDOS.
- **lang** : The game language, should be 'EN', 'ES', 'DE', 'FR' or 'PT' (English, Spanish, German, French or Portuguese)
- **inputfile** : Path to the json file generated by `DRF`.
- **interpreter** : Path to the binary file with ZDI extension of the interpreter. Read the next section for reference.
- **charsetfile** : Path to a binary file with the embedded charset.

And these are the optional parameters:

- **-v** : verbose output
- **-3** : Prepend +3 header to the resulting files
- **-c** : Forced classic mode
- **-d** : Forced debug mode
- **-p** : Forced padding
- **-b**  : use best fit algorithm when assigning the memory banks (first fit by default).
- **-o [outputfile]** : (optional) path & file name of the output files. If absent, same path & file name of json file would be used.
- **-i [image path]** : (optional) the path for the images to include. If not defined, no images will be loaded.
- **-k [char. id]** : (optional) the number of the character which will be used as a cursor. By default the character "_" will be used.

The character set file must be a 2048 bytes file, 8 bytes per character, 256 characters. Please take in mind that if you are using a 42 lines interpreter, the character set must be 6x8, so despite each of your characters has 8 bits per scanline to define, make sure you don't use the two rightmost ones (and even the third rightmost one if you want to have some space between characters).  
Two character sets, `AD8x8.CHR` and `AD6x8.CHR`, are included for your own use.

By default, the backend will generate one or more files with the same name and path of the input file, but instead the extension `.ADn`, being n a number.
This number is the memory bank where the contents of the corresponding file should be loaded.
So in the previous example, on the path of mygame.json, you would get files like mygame.AD0, mygame.AD1, and so on...  
With the `-o` optional parameter, you can define a different name and path for the output files.

The file with extension `.AD0` should be loaded with the bank 0 active at the address 0x6000 and jump to address 0x6002 in order to run. The other files (if any), should be loaded at 0xC000 with the corresponding bank of the extension active. However, there are two scripts on the distribution, `DAADMaker128` and `DAADMakerPlus3`, which can do the job for you. They will be explained on the following sections.

The backend program will put the interpreter and the main code of the database on Bank 0 always, but it will allocate the Messages (**MTX**), System Messages (**STX**), Location Descriptions (**LTX**), Object Descriptions (**OTX**), the character set, the extra messages and compressed images on other banks if necessary.
The default policy of allocation is *first fit*, that is, it will allocate a data block on the first bank where there is enough space avaliable to fit. This policy will generate the lower number of files. However if there are too much blocks (i.e. images), it becomes inefficient. On that case, you can use the `-b` parameter, which will enable the *best fit* allocation policy instead.

The backend compiler includes the tokens included in the default databases for both English and Spanish, in order to compress the texts.
If you need to get the better tokens for a given title you can use [DRT](https://github.com/daad-adventure-writer/DRT) by Jose Manuel Ferrer, a nice tokenizer for DAAD texts which will get the best compression. In order to use them, you must put the tokens file on the same path and with the same name of the input file, but with extension `.TOK` instead.

If you want images on memory, you must provide a path to a directory in them with the option `-i`. The program will scan the directory for files with name like `012.DCP`, a three digit number as the filename and with DCP extension, that's it.  
To show this image you should do a call to the condAct `PICTURE` with the number of the file as parameter (`PICTURE 12`) to preload it, and then use `DISPLAY` to show it on screen.

### **The interpreters**

As stated in the previous section, you must provide a file with the code of the interpreter to the backend compiler.
This is a binary file with `.ZDI` extension.  
If you are not compiling a custom interpreter, you can make use of the ones already available on the `/bin` directory of the repository.
The following is the list of the capabilities of each one:

|      **Interpreter**     | **Chars.** **per** **line** | **Language** | **Disk support** | **Banks** **not** **avaliable** | **XPICTURE** **support** |
|--------------------------|:------------------------:|:------------:|:----------------:|:----------------:|:----------------:|
| ZXD128_TAPE_EN_C42.ZDI   |            42            |    English   |       None       |   None   | No |
| ZXD128_TAPE_ES_C42.ZDI   |            42            |    Spanish   |       None       |   None   | No |
| ZXD128_TAPE_EN_C32.ZDI   |            32            |    English   |       None       |   None   | No |
| ZXD128_TAPE_ES_C32.ZDI   |            32            |    Spanish   |       None       |   None   | No |
| ZXD128_ESXDOS_EN_C42.ZDI |            42            |    English   |      ESXDOS      |   Half of Bank 7   | Yes |
| ZXD128_ESXDOS_ES_C42.ZDI |            42            |    Spanish   |      ESXDOS      |   Half of Bank 7   | Yes |
| ZXD128_ESXDOS_EN_C32.ZDI |            32            |    English   |      ESXDOS      |   Half of Bank 7   | Yes |
| ZXD128_ESXDOS_ES_C32.ZDI |            32            |    Spanish   |      ESXDOS      |   Half of Bank 7   | Yes |
| ZXD128_PLUS3_EN_C42.ZDI  |            42            |    English   |       +3DOS      |   Half of Bank 6 and bank 7   | Yes |
| ZXD128_PLUS3_ES_C42.ZDI  |            42            |    Spanish   |       +3DOS      |   Half of Bank 6 and bank 7   | Yes |
| ZXD128_PLUS3_EN_C32.ZDI  |            32            |    English   |       +3DOS      |   Half of Bank 6 and bank 7   | Yes |
| ZXD128_PLUS3_ES_C32.ZDI  |            32            |    Spanish   |       +3DOS      |   Half of Bank 6 and bank 7   | Yes |

The versions with disk support require some RAM available for buffers and control, so some banks will not be available. Take that into consideration when developing adventures for these versions.

### **DCP**

With this tool you can compress SCR files (dumps of the Spectrum video RAM) in order to allocate then on the banks of RAM or load them from disk with the `XPICTURE` condAct.  
The use is quite simple:

```
    dcp [-f] input [output]
```

You must supply the path of a SCR file, and optionally the path of the output file.
The parameter `-f` will force the overwritting of the destination file if it already exists.

### **DAADMaker128**

`DAADMaker128` will help you create a `.TAP` file from the bank files created with `drc128` with a loader.  
You can also add an optional loading screen in .SCR format. If you don't provide one the game won't have a loading screen but will work anyway.  
This is a PHP script, so like with `drc128`, you need to have PHP installed.  

```
    php daadmaker128 [options] <bank0.AD0> [bank1.AD1] ...
```

The bank files to include on the `.TAP` file should be stated on the command line *in the correct order* and *do not forget any file* or you will get unexplained resets.  
There are also the following optional parameteres to customize the loader:

- **-t** **[TAP file]**  : Name of the tape file. Otherwise, the name of the first bank file will be used.
- **-s** **[SCR file]**  : SCR file which will be used as loading screen.
- **-n** **Name**    : Name of the program for the loader. That is, the name of the file that will appear when the loading process begins.

### **DAADMakerPlus3**

This php script is the equivalent of the previous one, but instead it will create two files to make al self-bootable disk for +3.
It works in the same way as `DAADMaker128`:  

```
    php daadmakerPlus3.php [options] <bank0.AD0> [bank1.AD1] ...
```

Again, the bank files should be stated on the command line *in the correct order* and *do not forget any file*.  
Also, you have the following options:

- **-d** **[path]**      : Destination of the loader and data filer to include on a image.
- **-s** **[SCR file]**  : SCR file which will be used as loading screen.

This program will generate two files: a `bin.bin` file (the binary data to load) and a `disk` file(the loader).
After that, you can create a disk image file with those two files included. For that, you can use the program `MKP3FS` from taptools. You can find compiled versions [here](http://www.seasip.info/ZX/unix.html).

***

## **Shortcomings**

- The interpreter is very big! Almost 24 Kb on some cases!
- The images are always full screen. They do not ajust themselves to the dimensions and position of the active window, which is the standard behaviour.
- No support for ZXUno & Next.
- CondActs `CALL`, `GFX` & `SFX` not implemented.
- No support for Externs.
- ESXDOS is still experimental.

***

## **How to compile**

### **Compiling the interpreter**

In order to compile, Boriel's ZXBasic is required.
This is an example of the command line options to compile the interpreter for tape & english:

```
  zxbc -o ZXD128_EN.ZDI --optimize 4 --org 0x6002 -H 3072 -D LANG_EN ZXDAAD128.bas 
```

Check ZXBasic documentation or the command line `--help` of the compiler to know the meaning of the command line options.

Most of these options have optimal values. You can alter some of them, but be aware of the following:

- The output file must have `.ZDI` extension for the backend.
- The ORG address must be always 0x6002, this is *imperative*.
- Use the maximum level of optimization possible (4 for now).
- The heap will allocate the objects data, temporary text buffers, ramsave data and disc save data. If you get a *"Game error 9"* message, then you need to allocate more ram for the heap.
  
There also are symbols you can define with the `-D` option in order to customize your interpreter:

- Language:
  - `LANG_ES`: Use the Spanish language.
  - `LANG_EN`: Use the English language (default).
- Disk drive support:
  - `PLUS3`: Use +3DOS.
  - `ESXDOS`: Use ESXDOS.
  - `TAPE`: No disk support (default).
- Number of characters per line:
  - `FONT32`: 32 characters per line
  - `FONT42`: 42 characters per line (default).

### **Compiling DCP**

If you want to compile the DCP program, any standard C compiler will serve. You can tinker with the Makefile for your needs.

***

## **License & Acknowledgments**

- The interpreter **ZXDAAD128** is (c) Cronomantic 2022. Is distributed under the GPLv3 license.
- The graphic compressor **DCP** is based on [**RCS**](https://github.com/einar-saukas/RCS) & [**ZX0**](https://github.com/einar-saukas/ZX0) which are created by Einar Saukas and is distributed under a 'BSD-3' License.
- **DRB128** is a fork from Uto's original [**DRB**](https://github.com/daad-adventure-writer/daad), (c) Uto 2018. Is distributed under the GPLv3 license.
- [**Boriel's ZXBasic**](https://github.com/boriel/zxbasic) and its libraries have been used to build the interpreter. They are distributed under the GPLv3 license and the MIT License respectively.
- Plus3 loader has been made thanks to the help of Sergio thEpOpE.

***
