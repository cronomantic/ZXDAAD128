# **ZXDAAD128**

***

## ***Description***

This project is a **DAAD** interpreter created from scratch with [**Boriel's ZXBasic**](https://github.com/boriel/zxbasic) for **Spectrum 128k** and compatible systems and enabling the use of the extra banks to make bigger adventures.

**DAAD** is a multi-machine and multi-graphics adventure writer, enabling you to target a broad range of 8-bit and 16-bit systems.  
You can see the classic interpreters [here](https://github.com/daad-adventure-writer/daad).

**ZXDAAD128** requires to use the frontend of [**DAAD Reborn Compiler**](https://github.com/daad-adventure-writer/DRC/wiki) with a specific backend supplied with this project in order to distribute parts of the database around the different banks.

The Messages(**MTX**), System Messages(**STX**), Location Descriptions(**LTX**), Object Descriptions(**OTX**) and the character set will be allocated on other banks if they do not fit on the space available on bank 0. All the other database data will always be on Bank 0.

**ZXDAAD128** supports compressed bitmap graphics with the **DCP** tool, instead of the traditional vector graphics.
The tool uses the **ZX0** compressor by Einar Saukas to compress full SCR files and the images images will be also allocated on the banks of RAM by the backend.
The CondAct `PICTURE` will prepare an image and the CondAct `DISPLAY` will show it on the screen, as described on the original DAAD documentation.
However, the image will be shown always on full screen, there is no provision to clip and position the image according to the active window, as described on the original documentation, too.

**ZXDAAD128**  also emulates, to some extent, [**Maluva DAAD extension**](https://github.com/Utodev/MALUVA/wiki) which adds new functionalities to the classic interpreters. These are the extended condacts currently supported:

- `XPICTURE`: Load compressed DCP bitmap images from disk, instead of the RAM. This do not support the standard Maluva's SC2DAAD format. 
- `XMESSAGE`: Use of extra texts. The maximum size allowed is 64Kb, divided into 4 blocks of 16Kb maximum, which will be distributed also around the memory banks by the compiler's backend.
- `XUNDONE`: To cancel the status "done".
- `XLOAD`/`XSAVE`: To load/save your gameplay. They work like the original `LOAD`/`SAVE` condacts on this interpreter.

Supports Tape, ESXDOS and Plus3.

***

## **Supported languages**

- English
- Spanish

***

## **Theory of operation**



***

## **Shortcomings**
- The interpreter is very big! Almost 24 Kb on some cases!
- No support for ZXUno & Next.
- CondActs `CALL`, `GFX` & `SFX` not implemented.
- No support for Externs.
- ESXDOS is still experimental.

***

## **How to compile**

In order to compile, Boriel's ZXBasic is required.
This is an example of the command line options to compile the interpreter for tape & english:
  
  > zxbc -o ZXD128_EN.ZDI --optimize 4 --org 0x6002 -H 3072 -D LANG_EN ZXDAAD128.bas 

Check ZXBasic documentation or the command line `--help` of the compiler to know the meaning of the command line options. 
Most of these options and values are optimal. You can alter some of them, but be aware of the following:

* The output file must have `.ZDI` extension for the backend.
* The ORG address must be always 0x6002, this is *imperative*.
* Use the maximum level of optimization possible (4 as of now).
* The heap will allocate the objects data, temporary text buffers, ramsave data and disc save data. If you get *"Game error 9"* messages, then you need to allocate more ram for the heap.
  
There is also a series of symbols you can define with the `-D` option to customize your interpreter:

  - Languaje:
    * `LANG_ES`: Use the Spanish languaje.
    * `LANG_EN`: Use the English languaje (default). 
  - Disk drive support:
    * `PLUS3`: Use +3DOS.
    * `ESXDOS`: Use ESXDOS.
    * `TAPE`: No disk support (default). 
  - Number of characters per line:
    * `FONT32`: 32 characters per line
    * `FONT42`: 42 characters per line (default). 

***
## **License & Acknowledgments**

 - The interpreter **ZXDAAD128** is (c) Cronomantic 2022. Is distributed under the GPLv3 license.
 - The graphic compressor **DCP** is based on [**RCS**](https://github.com/einar-saukas/RCS) & [**ZX0**](https://github.com/einar-saukas/ZX0) which are created by Einar Saukas and is distributed under a 'BSD-3' License.
 - **DRB128** is a fork from Uto's original [**DRB**](https://github.com/daad-adventure-writer/daad), (c) Uto 2018. Is distributed under the GPLv3 license. 
 - [**Boriel's ZXBasic**](https://github.com/boriel/zxbasic) and its libraries have been used to build the interpreter. They are distributed under the GPLv3 license and the MIT License respectively.
 - Plus3 loader has been made thanks to the help of Sergio thEpOpE.

***
