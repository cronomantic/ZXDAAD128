# **ZXDAAD128**

***

## **Table of Contents**

- [**ZXDAAD128**](#zxdaad128)
  - [**Table of Contents**](#table-of-contents)
  - [**Description**](#description)
  - [**Shortcomings**](#shortcomings)
  - [**Supported languages**](#supported-languages)
  - [**Requirements**](#requirements)
  - [**How to use**](#how-to-use)
    - [**Creating an adventure**](#creating-an-adventure)
    - [**Executing the frontend**](#executing-the-frontend)
    - [**DRB128**](#drb128)
    - [**The interpreters**](#the-interpreters)
    - [**DCP**](#dcp)
    - [**DAADMaker128**](#daadmaker128)
    - [**DAADMakerPlus3**](#daadmakerplus3)
    - [**DAAD Ready**](#daad-ready)
  - [**How to compile**](#how-to-compile)
    - [**Compiling an interpreter**](#compiling-an-interpreter)
    - [**Building DRB128**](#building-drb128)
    - [**Building DAADMaker128 & DAADMakerPlus3**](#building-daadmaker128--daadmakerplus3)
    - [**Compiling DCP**](#compiling-dcp)
    - [**Build batch file**](#build-batch-file)
  - [**Extending the interpreter**](#extending-the-interpreter)
    - [**Inserting binary data on the database**](#inserting-binary-data-on-the-database)
    - [**The calling mechanism**](#the-calling-mechanism)
      - [**1 - SFX & EXTERN:**](#1---sfx--extern)
      - [**2 - Interrupt routine**](#2---interrupt-routine)
      - [**3 - CALL address**](#3---call-address)
      - [**4 - Jumping to another bank**](#4---jumping-to-another-bank)
    - [**Odd and ends for coding a extension**](#odd-and-ends-for-coding-a-extension)
  - [**License**](#license)
  - [**Acknowledgments**](#acknowledgments)

***

## **Description**

This project is a **DAAD** interpreter created from scratch with [**Boriel's ZXBasic**](https://github.com/boriel/zxbasic) for **Spectrum 128k** and compatible systems and enabling the use of the extra banks to make bigger adventures and showing bitmap images without the requirement of disk.

**DAAD** is a multi-machine and multi-graphics adventure writer, enabling you to target a broad range of 8-bit and 16-bit systems.
You can see the classic interpreters [here](https://github.com/daad-adventure-writer/daad).

**ZXDAAD128** requires to use the frontend of [**DAAD Reborn Compiler**](https://github.com/daad-adventure-writer/DRC/wiki) with a specific backend supplied with this project in order to distribute parts of the database around other banks. The Messages (**MTX**), System Messages (**STX**), Location Descriptions (**LTX**), Object Descriptions (**OTX**) and the character set will be allocated on other banks if they do not fit on the space available on bank 0. All the other database data will always be on Bank 0.

**ZXDAAD128** supports compressed bitmap graphics with the **DCP** tool, instead of the traditional vector graphics.  
The tool uses the **ZX0** compressor by Einar Saukas to compress full SCR files and the images will also be allocated on the banks of RAM by the compiler backend on the `TAPE` subtarget. On `PLUS3`, they will be loaded from disk.
In order to show pictures, first you must use the CondAct `PICTURE` to prepare the image for showing. On `PLUS3` subtarget, it will load the image on buffer and on the `TAPE` subtarget it will simply check that it exists on RAM. Please, refer to the original DAAD documentation, since the interpreter imitates its behabiour.
Then you must use the condAct `DISPLAY` to show the buffered image on screen, also described on the original DAAD documentation.  
Be aware that the image will be shown always on full screen, there is no provision of clipping and positioning the image according to the active window.

Supports loading and saving on tape or disk with +3DOS and 42 or 32 characters per line.

**ZXDAAD128**  also emulates, to some extent, [**Maluva DAAD extension**](https://github.com/Utodev/MALUVA/wiki) which adds new functionalities to the classic interpreters. These are the extended condActs currently supported:

- `XPICTURE`: Loads and shows a compressed DCP bitmap image. This function does not support the standard Maluva's SC2DAAD format. Instead, it will execute the `PICTURE` and `DISPLAY` condacts on sequence and report error with the standard Maluva method of error reporting, please refer to its wiki for more information.
- `XMESSAGE`: Use of extra texts. The maximum size allowed is 64Kb, divided into 4 blocks of 16Kb maximum, which will also be distributed around the memory banks by the compiler's backend on both targets.
- `XUNDONE`: To cancel the status "done".
- `XLOAD`/`XSAVE`: To load/save your gameplay. They work like the traditional `LOAD`/`SAVE` condActs on this interpreter.

***

## **Shortcomings**

- The interpreter is very big!
- The images are always full screen. They do not ajust themselves to the dimensions and position of the active window, which is the standard behaviour.
- CondActs `GFX` not implemented.
- Maluva's condActs `XPART`, `XBEEP`. `XSPLITSCR`, `XNEXTCLS`, `XNEXTRST` & `XSPEED` not supported.

***

## **Supported languages**

- English
- Spanish

***

## **Requirements**

These are the essential requirements to create adventures with this interpreter:

- **DAAD Reborn Compiler**, more precisely, the frontend program `DRF.exe`, version 0.27 or upper. It can be obtained [here](https://www.ngpaws.com/downloads/DAAD/DRC/).
- **PHP**, which can be obtained [here](https://www.php.net/), please follow its installation instructions for your OS.

If you want to compile the interpreter, you will also need:

- **ZXBasic**, from [here](http://www.boriel.com/files/zxb/zxbasic-1.16.3-beta5-win32.zip).
- **Python**, from [here](https://www.python.org/).
- **SjAsmPlus**, from [here](https://github.com/z00m128/sjasmplus).
  
And for DCP:

- Any **C99** standard compiler.

***

## **How to use**

### **Creating an adventure**

To create your own adventure you need a text source file (**.DSF**), and the source file must be encoded with *Windows-1252* or *ISO-8859-1* charsets.  

There are empty templates in several languages to start your adventure:

- [English DSF blank template](https://github.com/daad-adventure-writer/DRC/blob/master/BLANK_EN.DSF)
- [Spanish DSF blank template](https://github.com/daad-adventure-writer/DRC/blob/master/BLANK_ES.DSF)

To learn more about **how to create your own adventure**, your can:

- Read the excellent [**Wiki pages**](https://github.com/nataliapc/msx2daad/wiki) of Natalia's [**Msx2Daad**](https://github.com/nataliapc/msx2daad) project, to know more about **DAAD**.
- Also you can follow this great [**DAAD Tutorial for beginners**](https://medium.com/@uto_dev/a-daad-tutorial-for-beginners-1-b2568ec4df05) writted by the author of the [**DRC**](https://github.com/daad-adventure-writer/DRC/wiki) compiler.

From now on, you have to paths to follow:

- Use [**DAAD Ready**](https://www.ngpaws.com/daadready/), please refer to the relevant [**section**](#DAAD-Ready).
- Doing it yourself manually with the instructions detailed on the next sections.

DAAD Ready will avoid you all the hassle of setting up a build framework from the ground up, but it is recommended to skim a bit the following sections in order to know some useful options of the intepreter to customize your adventure.
If you want to do your own build, all the required files are on the `/DRC` directory.

### **Executing the frontend**

After you have the `DSF` file of your adventure, you must compile it with the frontend program `DRF` as described on its [documentation](https://github.com/daad-adventure-writer/DRC/wiki) with the ZX target and the desired subtarget, like so:  

```
    drf zx mygame.dsf
    drf zx plus3 mygame.dsf
```

However, instead of generating the `DDB` file with the standard `drb` program, you must use the program `drb128` located on the `/DRC` directory of this distribution.

### **DRB128**

 This is not an executable file but a php script, so you need to run it with a php interpreter. Again, please refer to the [DRC wiki](https://github.com/daad-adventure-writer/DRC/wiki) for more information.  

You could execute it with something like this on the command line:

```
php drb128 -i scr\ TAPE EN EN 42 mygame.json AD8X6.CHR
```

These are the command line parameters that `drb128` needs:

```
php drb128 [options] <subtarget> <lang.> <lang. interpreter> <characters per line> <input file> <character set>
```

The meaning of these parameters are the following:

- **subtarget** : The subtarget machine. Valid values: `TAPE` or `PLUS3`.
- **lang.** : The game language, should be `EN`, `ES`, `DE`, `FR` or `PT` (English, Spanish, German, French or Portuguese).
- **lang. interpreter**: The languaje employed by the interpreter. Valid values: `EN` or `ES` (English, Spanish)
- **characters per line**: Number of characters per line. Valid values: `42` or `32`.
- **inputfile** : Path to the json file generated by `DRF`.
- **charsetfile** : Path to a binary file with the embedded charset.

And these are the optional parameters:

- **-v** : Verbose output
- **-3** : Prepend +3 header to the resulting files
- **-c** : Forced classic mode
- **-d** : Forced debug mode
- **-b**  : Use best fit algorithm when assigning the memory banks (first fit by default).
- **-o [output file]** : Path & file name of the output files. If absent, same path & file name of json input file would be used.
- **-i [image path]** : The path for the images to load on RAM. If not defined, no images will be loaded. Only for TAPE target, since on PLUS3, they will be loaded from disk.
- **-k [char. id]** : The ASCII code of the character which will be used as a cursor. By default, the character "_" will be used (code 95).
- **-p [palette file]** : Path to a JSON file which define the colors of the 16 values used on the interpreter. Please refer to the file `DRC/palette.json` for a sample.
- **-t [Token file]** : Path to a file with alternative tokens for text compression.
- **-x [bank number]** : Number of bank to exclude from allocation.

The character set file must be a 2048 bytes file, 8 bytes per character, 256 characters. Please take in mind that if you are using a 42 lines interpreter, the character set must be 6x8, so despite each of your characters has 8 bits per scanline to define, make sure you don't use the two rightmost ones (and even the third rightmost one if you want to have some space between characters).  
Two character sets, `AD8x8.CHR` and `AD6x8.CHR`, are included for your own use.

By default, the backend will generate one or more files with the same name and path of the input file, but instead the extension `.ADn`, being n a number.
This number is the memory bank where the contents of the corresponding file should be loaded.
So in the previous example, on the path of `mygame.json`, you would get files like `mygame.AD0`, `mygame.AD1`, and so on...  
With the `-o` optional parameter, you can define a different name and path for the output files.

The file with extension `.AD0` should be loaded with the bank 0 active at the address 0x6000 and jump to address 0x6002 in order to run. The other files (if any), should be loaded at 0xC000 with the corresponding bank of the extension active. However, there are two scripts on the distribution, `DAADMaker128` and `DAADMakerPlus3`, which can do the job for you. They will be explained on the following sections.

The backend program will put the interpreter and the main code of the database on Bank 0 always, but it will allocate the Messages (**MTX**), System Messages (**STX**), Location Descriptions (**LTX**), Object Descriptions (**OTX**), the character set, the extra messages and compressed images on other banks if necessary.
The default policy of allocation is *first fit*, that is, it will allocate a data block on the first bank where there is enough space avaliable to fit. This policy will generate the lower number of files.  
However, if there are too much blocks (i.e. images), it becomes inefficient. On that case, you can use the `-b` parameter, which will enable the *best fit* allocation policy instead. This means that the block will be allocated on the bank with less space where it can fit.

The backend compiler includes the tokens included in the default databases for both English and Spanish, in order to compress the texts.
If you need to get the better tokens for a given title you can use [DRT](https://github.com/daad-adventure-writer/DRT) by Jose Manuel Ferrer, a nice tokenizer for DAAD texts which will get the best compression. In order to use them, you must use the option `-t` to provide an alternative tokens file.

If you want images on memory for the `TAPE` subtarget, you must provide a path to a directory with the image files with the option `-i`. The program will scan the directory for files with name like `012.DCP`, a three digit number from 0 to 255 (included) as the filename and with DCP extension.
On `PLUS3`, the interpreter will load the image files from the disk instead, so the compressed image files must be present on the disk.  
To show an image, you should do a call to the condAct `PICTURE` with the number of the file as parameter (i.e. `PICTURE 12` for image of file `012.DCP`) to preload it, and then use `DISPLAY` to show it on screen. Please refer to those two condActs on the original DAAD manual. The CondAct `XPICTURE` will do both of operations, while behaving like the Maluva equivalent on the error reporting mechanism.

### **The interpreters**

Depending of your configuration on `DRB128` of the target, characters per line and languaje, the application will use one of the 8 interpreters available, each one compiled with the corresponding configuration.
This is the characteristics of each configuration:

|  **Target**  | **Chars.** **per** **line** | **Language** | **Disk save** | **Banks** **reserved** | **Source of images** |
|------- |:----:|:------------:|:-----:|:----------------:|:----------------:|
| TAPE   |  42  |    English   |  No   |   None                        | RAM |
| TAPE   |  42  |    Spanish   |  No   |   None                        | RAM |
| TAPE   |  32  |    English   |  No   |   None                        | RAM |
| TAPE   |  32  |    Spanish   |  No   |   None                        | RAM |
| PLUS3  |  42  |    English   |  Yes  |   Most of bank 6 and bank 7   | Disk |
| PLUS3  |  42  |    Spanish   |  Yes  |   Most of bank 6 and bank 7   | Disk |
| PLUS3  |  32  |    English   |  Yes  |   Most of bank 6 and bank 7   | Disk |
| PLUS3  |  32  |    Spanish   |  Yes  |   Most of bank 6 and bank 7   | Disk |

The versions with disk support require some RAM for buffers and control, so some banks will not be available. Take that into consideration when developing adventures for these versions.

### **DCP**

With this tool you can compress SCR files (dumps of the Spectrum video RAM) in order to allocate then on the banks of RAM or load them from disk on the +3 interpreters.  
The use is quite simple:

```
    dcp [-f] input [output]
```

You must supply the path of a SCR file, and optionally the path of the output file.
The parameter `-f` will force the overwritting of the destination file if it already exists.

### **DAADMaker128**

`DAADMaker128` will help you create a `.TAP` file from the bank files created with `drc128` with a loader.  
You can also add an optional loading screen in .SCR format. If you don't provide one the game won't have a loading screen but will work anyway.  
This is a PHP script, so like with `drb128`, you need to have PHP installed.  

```
    php daadmaker128 [options] <bank0.AD0> [bank1.AD1] ...
```

The bank files to include on the `.TAP` file should be stated on the command line *in the correct order* and *do not forget any file* or you will get unexplained resets.  
There are also the following optional parameteres to customize the loader:

- **-t** **[TAP file]**  : Name of the tape file. Otherwise, the name of the first bank file will be used.
- **-s** **[SCR file]**  : SCR file which will be used as loading screen.
- **-n** **Name**    : Name of the program for the loader. That is, the name of the file that will appear when the loading process begins.

### **DAADMakerPlus3**

This php script is the equivalent of the previous one, but instead it will create two files to make a self-bootable disk for +3.
It works in the same way as `DAADMaker128`:  

```
    php daadmakerPlus3 [options] <bank0.AD0> [bank1.AD1] ...
```

Again, the bank files should be stated on the command line *in the correct order* and *do not forget any file*.  
Also, you have the following options:

- **-d** **[path]**      : Destination of the loader and data filer to include on a disk image.
- **-s** **[SCR file]**  : SCR file which will be used as loading screen.

This program will generate two files: a `daad.bin` file (the binary data to load) and a `disk` file (the loader).
After that, you can create a disk image file with those two files, including also the compressed image files needed on the adventure.
For that, you can use the program `MKP3FS` from taptools. You can find compiled versions [here](http://www.seasip.info/ZX/unix.html).

### **DAAD Ready**

ZXDAAD128 is already included on [**DAAD Ready**](https://www.ngpaws.com/daadready/), however it may have an older version.  
If you want to use the bleeding edge version of the interpreter, a patch is included on the `\DAAD-Ready` directory of this project.
Just copy the contents of this directory onto your DAAD Ready directory to overwrite the older files and you are ready to go!

## **How to compile**

### **Compiling an interpreter**

In order to compile, Boriel's ZXBasic and a Python 3.x interpreter is required.
This is an example of the command line options to compile the interpreter for tape & english:

```
  zxbc -o MY_INTERPRETER.BIN --optimize 4 --org 0x6002 -H 2048 -D LANG_EN ZXDAAD128.bas 
```

Check ZXBasic documentation or the command line `--help` of the compiler to know the meaning of the command line options.

Most of these options have optimal values. You can alter some of them, but be aware of the following:

- The output file must have `.BIN` extension for the backend.
- The ORG address must be always 0x6002, this is *imperative*.
- Use the maximum level of optimization possible (4 for now).
- The heap will allocate the objects data, temporary text buffers, ramsave data and disc save data. If you get a *"Game error 9"* message, then you need to allocate more ram for the heap.
  
There also are symbols you can define with the `-D` option in order to customize your interpreter:

- Language:
  - `LANG_ES`: Use the Spanish language.
  - `LANG_EN`: Use the English language (default).
- Disk drive support:
  - `PLUS3`: Use +3DOS.
  - `TAPE`: No disk support (default).
- Number of characters per line:
  - `FONT32`: 32 characters per line
  - `FONT42`: 42 characters per line (default).

### **Building DRB128**

The script `DRB128.php` is generated by the Python script `build_drb128.py` and the template file `drb128_template.php`.
It will try to find the following files on the same path:

- ZXD128_TAPE_ES_C42.BIN
- ZXD128_TAPE_EN_C42.BIN
- ZXD128_TAPE_ES_C32.BIN
- ZXD128_TAPE_EN_C32.BIN
- ZXD128_PLUS3_ES_C42.BIN
- ZXD128_PLUS3_EN_C42.BIN
- ZXD128_PLUS3_ES_C32.BIN
- ZXD128_PLUS3_EN_C32.BIN

And it will replace the appropiate placeholders on the template. The naming of the files is clear enough to know which compilation options the script expects on every binary.

### **Building DAADMaker128 & DAADMakerPlus3**

The other two scripts are build on the same way that DRB128. Fittingly, they are called `build_DAADMaker128.py` and `build_DAADMakerPlus3.py` and the template files `DAADMaker128_template.php` and `DAADMakerPlus3_template.php`.  
These two scripts will try to find the file `loader.bin` for DAADMaker128 and `loaderplus3.bin` for DAADMakerPlus3, which contains the binary of the loaders. These loaders are assembled from the `.asm` files with the same names on the directory `src\asm` with Sjasmplus.

### **Compiling DCP**

If you want to compile the DCP program, any standard C99 compiler will serve. You can tinker with the Makefile for your own needs.

### **Build batch file**

The whole build process is done on the batch file `src/build.bat`, so you can peruse it to understand the whole process.
The batch expects to have python, zxbc (Boriel´s zxbasic compiler) and sjasmplus (assembler) executables on the path.
For the moment, there is only a windows BAT file.

***

## **Extending the interpreter**

The original DAAD interpreter had a simple extension system to add extra functionality to the final adventure. **ZXDAAD128** supports an emulation of this mechanism and is extended with support for inserting custom data in one of the banks.

### **Inserting binary data on the database**

The idea is to include a block of assembly language and call it from a DAAD program.
The only real free memory in the DAAD system is the area used for the database, so it seemed logical to include assembler blobs in this section. On **ZXDAAD128**, you can also reserve one of the banks to do this. More on the relevant section.

The database is fairly simple in layout, it consists of a header to all the data structures of the database, and after these pointers come the data tables generated by the compiler.  
The first is the CTL section. Now because this is actually empty and always at the same address (after the pointers) it is the only really useful address/place for any non relocatable code.  
If you include machine code anywhere else in the database you will not know its address until compile time, and as you make changes to the database its position may change, so you would have to re-assemble and compile again.
Thus the only code you should include elsewhere in the database is relocatable code/data. Machine code is just a series of numbers like any piece of data so the next problem is to get your code inserted in the database.  
The compiler provides several pre-processor commands to achieve this.  

- **#incbin filespec**: Will include a memory image file at the current position in the database.
- **#defb expression {{{expression} expression}**: Will include the indicated byte value(s) in the database at the current address.
- **#defw expression {{{expression} expression}**: Will include the indicated word value(s) in the database at the current address.
- **#hex hexpair{{whitespace}{hexpair}....}**: Will include direct hex data in the db. This is similar to the HEX statement of PDS.
- **#dbaddr symbol**: Will give symbol the current address in the database. This can be used for CALL or #defw commands.

**NOTE**: You aren't limited to only assembly language. You can generate new data tables as well with these commands.

### **The calling mechanism**

In order to call an assembler routine you have various mechanisms:

#### **1 - SFX & EXTERN:**  

These two condacts have an external vector. Which can be set using two special forms of the #incbin directive:

- **#extern {filespec}**
- **#sfx {filespec}**
  
If you include the filename then it will cause the given file to be included in the database (as if the command was followed by #incbin).
The vector in the interpreter is set on database load to the address of the routine. Now any EXTERN or SFX commands will be directed to your routine.  

Be careful with condact `EXTERN`, since it is also used with the Maluva emulation, and that one will take precedence. If a MALUVA function is recognized, it will take precedence over the call to the EXTERN code.  
On ZXDAAD128, EXTERN takes always two parameters after de CondAct:

```
> EXTERN A B
```

The parámeter A is the parámeter that it will be passed on to the MALUVA function, and the second is the code of the actual Maluva function to run.  
In order to run your own code, **B must be always bigger than 11**, because the lower values are reserved for Maluva.

When executed, your routine will be supplied with the following information on the registers:

- A - Value of first parameter (may be indirected, in which case you will get the contents of the flag in A).
- HL - Points at the Flag given by the first parameter (or the flag given by the contents of the flag if is indirected).
- DE - Points at the Object location given by the first parameter.
- IX - Address of Flag 0, 256 bytes after this are the objects.
- BC - points at the second parameter of the call.

The BC register must be preserved/updated,that is, you should advance the BC pointer and leave it pointing at the last inline parameter if you wish to include more parameters or data after de CondAct.
  
e.g.

```
EXTERN 0 6
#defw Anaddress
```

Could be accessed with the following routine:

```
    LD A,(BC)
    PUSH AF
    INC BC
    LD A,(BC)
    LD E,A
    INC BC
    LD A,(BC)
    LD D,A ; DE = Anaddress
    POP AF ; A = 6
```

The rest of the registers can be thrased.

#### **2 - Interrupt routine**

It is declared on DRC with the following directive:

- **#int {filespec}**

Any routine placed on this vector will be called 50 times a second for the entire period that the game is running.
Thus there is no command in the DAAD language to call the routine.
All registers currently active are stored on the stack to save the context, so be sure to save also the alternate registers should you use them too.

#### **3 - CALL address**

This is a special CondAct which transfers execution to the given routine.
Although flexible it can't pass any parameters directly. You need to place data in Flags before the call or use #defb/w after to include static parmeters and these can be extracted using the BC pointer.
The information on the registers is the same as EXTERN/SFX, except the BC register already points at the next CondAct or any following data, so you must leave it pointing to the first non parameter byte afterwards.

#### **4 - Jumping to another bank**

All the previous mechanism were already there in DAAD for the Spectrum, and it was designed for the 48K model alone.
Thus, custom code could only be inserted on bank 0. This can be enough for small routines but is clearly a problem when you want to include something bigger, like a music player.
To solve this, ZXDAAD128 allows to reserve one of the banks for inserting your own code. For that, you must use the option `-x n` with **DRB128**, with `n` being the number of the bank to reserve. A non sensible value for `n` will give an error, so remember that banks 2 & 5 are not available, and 6 & 7 too for the Plus3 target.  
When you have your custom code assembled, the resultant binary file should have extension `*.ADn`, with `n` being the number of the excluded bank. This file can be included among all other output bank files from DRB128 in order to be packed with any of the DAADMaker scripts.

Now, for jumping into this code, you can call the 'false CondAct' JumpToBank. This false CondAct is not recognized by DRC, so on your code you should do this to call it:

```
> EXTERN n 11 
  #defb p
```

Where `n` will be the bank to jump, which **should be the same number as the bank reserved**, otherwise ugly things will ensue.
The byte `p` included after de CondAct is a parameter value that will be passed to the code on bank `n` on the A register and pointer to the start of the flags/objects array will be set on IX.
This extern command will change the current active bank to `n` and do a `CALL $C000`, so the startup code is expected there.
On return, a boolean result is expected on the A register, with 0 being the false value. This value will set the result of the CondAct using the Maluva error reporting method.

### **Odd and ends for coding a extension**

You will need to have knowledge on Z80 assembler to make extensions. With the previous instructions, it should be almost enough to handle this task. 
However, a handicap of this interpreter is that the database's addresses varies depending of the options of said interpreter. This is intentional in order to have the maximum memory available in each case. This could be cumbersome, so to ease things, on the `/asm` directory, there is a series of ASM files with equates of the labels and addresses for each option:

- ZXD128_TAPE_ES_C42_LABELS.ASM
- ZXD128_TAPE_EN_C42_LABELS.ASM
- ZXD128_TAPE_ES_C32_LABELS.ASM
- ZXD128_TAPE_EN_C32_LABELS.ASM
- ZXD128_PLUS3_ES_C42_LABELS.ASM
- ZXD128_PLUS3_EN_C42_LABELS.ASM
- ZXD128_PLUS3_ES_C32_LABELS.ASM
- ZXD128_PLUS3_EN_C32_LABELS.ASM

***

## **License**

- The interpreter **ZXDAAD128**, **DAADMaker128** and **DAADMakerPlus3** is (c) Cronomantic 2022. Is distributed under the GPLv3 license.
- The graphic compressor **DCP** is based on [**RCS**](https://github.com/einar-saukas/RCS) & [**ZX0**](https://github.com/einar-saukas/ZX0) which are created by Einar Saukas and is distributed under a 'BSD-3' License.
- **DRB128** is a fork from Uto's original [**DRB**](https://github.com/daad-adventure-writer/daad), (c) Uto 2018. Is distributed under the GPLv3 license.
- [**Boriel's ZXBasic**](https://github.com/boriel/zxbasic) and its libraries have been used to build the interpreter. They are distributed under the GPLv3 license and the MIT License respectively.

***

## **Acknowledgments**

- To Boriel for his wonderful compiler.
- This work has been made posible thanks to the continuous help of Uto and his marvelous [**DAAD Ready**](https://github.com/Utodev/DAAD-Ready).
- Thanks to NataliaPC for their [**Msx2Daad**](https://github.com/nataliapc/msx2daad), a great source of inspiration.
- Plus3 loader has been made thanks to the help of Sergio thEpOpE.
- Thanks to [Dwalin](www.rudolphinerur.com) for his help on testing the interpreter.
