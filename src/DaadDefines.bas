#ifndef _DAAD_DEFINES_
#define _DAAD_DEFINES_


#define TEXT_BUFFER_LEN   100

' Maximum number of Windows
#ifndef DISABLE_WINDOW
  #define WINDOWS_NUM   8
#else
  #define WINDOWS_NUM   1
#endif

' System Flags (0-63)
#define fDark      0  ' when non zero indicates game is dark (see also object 0)
#define fNOCarr    1  ' Holds quantity of objects player is carrying (but not wearing)
#define fWork1     2  ' These are system as we consider the stack such
#define fWork2     3  ' define fFULL      3  ' to here - There will be an internal one soon
#define fMALUVA   20  ' Flags for MALUVA
#define fEMPTY    23  ' Stack can run from here
#define fStack    24  ' A small stack (always 2 bytes pushed) 10 pushes
#define fO2Num    25  ' 1st free in system 64
#define fO2Con    26  ' Object 2 is a container
#define fO2Loc    27  '
#define fDarkF    28  '
#define fGFlags   29  ' This is best tested using HASAT GMODE
#define fScore    30  ' (Optional) Score flag
#define fTurns    31  ' Number of turns taken (2 bytes LE)
#define fVerb     33  ' Verb for the current logical sentence
#define fNoun1    34  ' First Noun in the current logical sentence
#define fAdject1  35  ' Adjective for first Noun
#define fAdverb   36  ' Adverb for the current logical sentence
#define fMaxCarr  37  ' Maximum number of objects conveyable (initially 4) Set using ABILITY action.
#define fPlayer   38  ' Current location of player
#define fO2Att    39  ' (Optional) Using Flags 39 and 40 to contain attribs for other obj
#define fInStream 41  ' Gives stream number for input to use. 0 means current stream. Used Mod 8. i.e. 8 is considered as 0
#define fPrompt   42  ' Holds prompt to use a system message number (0 selects one of four randomly)
#define fPrep     43  ' Preposition in the current logical sentence
#define fNoun2    44  ' Second Noun in the current logical sentence
#define fAdject2  45  ' Adjective for the second Noun
#define fCPNoun   46  ' Current pronoun ("IT" usually) Noun
#define fCPAdject 47  ' Current pronoun ("IT" usually) Adjective
#define fTime     48  ' Timeout duration required
#define fTIFlags  49  ' Timeout Control bitmask flags (see documentation page 61 or "Bitmask used by flag fTIFlags" above)
#define fDAObjNo  50  ' Objno. for DOALL loop. i.e. value following DOALL
#define fCONum    51  ' Last object referenced by GET/DROP/WEAR/WHATO etc.
#define fStrength 52  ' Players strength (maximum weight of objects carried and worn - initially 10)
#define fOFlags   53  ' Holds object print flags (bitmask see documentation)
#define fCOLoc    54  ' Holds the present location of the currently referenced object
#define fCOWei    55  ' Holds the weight of the currently referenced object
#define fCOCon    56  ' Is 128 if the currently referenced object is a container
#define fCOWR     57  ' Is 128 if the currently referenced object is wearable
#define fCOAtt    58  ' Currently referenced objects user attribs
#define fKey1     60  ' Key returned by INKEY
#define fKey2     61  ' Key for IBM extended code only (0 otherwise)
#define fScMode   62  ' See gfxSetScreenModeFlags() comment for explanation
#define fCurWin   63  ' Which window is active at the moment (for read only)

'Mask for object attributtes
#define OBJ_WEIGHT_MASK       %00111111
#define OBJ_IS_CONTAINER_MASK %01000000
#define OBJ_IS_WORN_MASK      %10000000


#define CONDACT_MASK       %01111111
#define INDIRECTION_MASK   %10000000

' Used in struct Object->location
#define LOC_NOTCREATED    252
#define LOC_WORN          253
#define LOC_CARRIED       254
#define LOC_HERE          255

' Vocabulary constant
#define NULLWORD      255

' Used by HASHAT/HASNAT
#define HAS_WAREABLE    23    ' Flag 57 (fCOWR) Bit#7
#define HAS_CONTAINER   31    ' Flag 56 (fCOCon) Bit#7
#define HAS_LISTED      55    ' Flag 53 (fOFlags) Bit#7
#define HAS_TIMEOUT     87    ' Flag 49 (fTIFlags) Bit#7
#define HAS_MOUSE     240   ' Flag 29 (fGFlags) Bit#0
#define HAS_GMODE     247   ' Flag 29 (fGFlags) Bit#7
' Bitmasks
#define F57_WAREABLE    128   ' (fCOWR) Bitmask: Current object is wearable
#define F56_CONTAINER   128   ' (fCOCon) Bitmask: Current object is a container
#define F53_LISTED      128   ' (fOFlags) Bitmask: If objects listed by LISTOBJ
#define F53_CONT        64    ' (fOFlags) Bitmask: Continuous object listing mode
#define F29_MOUSE       1     ' (fGFlags) Bitmask: Mouse available
#define F29_GMODE       128   ' (fGFlags) Bitmask: Graphics available

' Used by INPUT
#define INPUT_CLEARWINDOW   1
#define INPUT_PRINTCOMPLETE 2
#define INPUT_PRINTTIMEOUT  4

' Bitmask used by flag fTIFlags (used by TIME, INPUT condacts)
#define TIME_FIRSTCHAR    1   ' Set this so timeout can occur at start of input only (from TIME condact)
#define TIME_MORE         2   ' Set this so timeout can occur on "More..." (from TIME condact)
#define TIME_ANYKEY       4   ' Set this so timeout can occur on ANYKEY (from TIME condact)
#define TIME_CLEAR        8   ' Set this to clear window after input (from INPUT condact)
#define TIME_INPUT        16    ' Set this to print input in current stream after edit (from INPUT condact)
#define TIME_RECALL       32    ' TODO Set this to cause auto recall of input buffer after timeout (from INPUT condact)
#define TIME_AVAILABLE    64    ' TODO Set if data available for recall (not of use to writer)
#define TIME_TIMEOUT      128   ' Set if timeout occurred last frame

' Used by MODE
#define MODE_FORCEGCHAR   1   ' Force the use of ^G (upper charset) in current window
#define MODE_DISABLEMORE  2   ' Disable SYS32 "More..." when current window text overflows

' Machine system constants (DDB header)
#define MACHINE_PC      0
#define MACHINE_SPECTRUM  1
#define MACHINE_C64     2
#define MACHINE_CPC     3
#define MACHINE_MSX     4
#define MACHINE_ST      5
#define MACHINE_AMIGA   6
#define MACHINE_PCW     7
#define MACHINE_MSX2    15
#define MACHINE_SPECTRUM_128  16

' Language constants (DDB header)
#define LANGUAGE_EN     0
#define LANGUAGE_ES     1

'Vocabulary types
#define VERB            0
#define ADVERB          1
#define NOUN            2
#define ADJECTIVE       3
#define PREPOSITION     4
#define CONJUNCTION     5
#define PRONOUN         6
#define PRONOUNVERB     128
#define SEPARATOR       129

#define NUM_PROCS 10
#define NO_LASTPICTURE $FFFF

#define LAST_PROPER_NOUN      50
#define LAST_CONVERTIBLE_NOUN 20

#endif
