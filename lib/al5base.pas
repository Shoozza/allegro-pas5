UNIT al5base;
(*<Base definitions to interface with Allegro dynamic module.

  This unit includes definitions of data types used by Allegro.  They're used
  internally to be sure they're the correct in any platform (i.e. 32bit or
  64bit).  You may use them if you wish.
 *)
(* Copyright (c) 2012 Guillermo Martínez J.

  This software is provided 'as-is', without any express or implied
  warranty. In no event will the authors be held liable for any damages
  arising from the use of this software.

  Permission is granted to anyone to use this software for any purpose,
  including commercial applications, and to alter it and redistribute it
  freely, subject to the following restrictions:

    1. The origin of this software must not be misrepresented; you must not
    claim that you wrote the original software. If you use this software
    in a product, an acknowledgment in the product documentation would be
    appreciated but is not required.

    2. Altered source versions must be plainly marked as such, and must not be
    misrepresented as being the original software.

    3. This notice may not be removed or altered from any source
    distribution.
 *)

{$INCLUDE allegro.cfg}

INTERFACE

  (* Defines some constants with the names of the library files. *)
  CONST
    { Used only for Windows builds }
    ALLEGRO_VERSION = '5.2';
{$IFDEF DEBUGMODE}
    { @exclude }
    _DBG_ = '-debug';
{$ELSE}
    { @exclude }
    _DBG_ = '';
{$ENDIF}

{$IF DEFINED(UNIX)}
    {$IF DEFINED(DARWIN)}
      { @exclude }
      ALLEGRO_LIB_NAME_SUFFIX     =  _DBG_+'.5.2';
      { ALLEGRO_LIB_NAME_SUFFIX     =  _DBG_+'.5.0.dynlib'; }
      {$linklib allegro}
      {$linklib allegro_acodec}
      {$linklib allegro_audio}
      {$linklib allegro_color}
      {$linklib allegro_font}
      {$linklib allegro_image}
      {$linklib allegro_main}
      {$linklib allegro_dialog}
      {$linklib allegro_primitives}
      {$linklib allegro_ttf}
    {$ELSE}
      { @exclude }
      ALLEGRO_LIB_NAME_SUFFIX     =  _DBG_+'.so.5.2';
    {$IFEND}
    { @exclude }
    ALLEGRO_LIB_NAME            = 'liballegro'+ALLEGRO_LIB_NAME_SUFFIX;
    { @exclude }
    ALLEGRO_ACODEC_LIB_NAME     = 'liballegro_acodec'+ALLEGRO_LIB_NAME_SUFFIX;
    { @exclude }
    ALLEGRO_AUDIO_LIB_NAME      = 'liballegro_audio'+ALLEGRO_LIB_NAME_SUFFIX;
    { @exclude }
    ALLEGRO_COLOR_LIB_NAME      = 'liballegro_color'+ALLEGRO_LIB_NAME_SUFFIX;
    { @exclude }
    ALLEGRO_FONT_LIB_NAME       = 'liballegro_font'+ALLEGRO_LIB_NAME_SUFFIX;
    { @exclude }
    ALLEGRO_IMAGE_LIB_NAME      = 'liballegro_image'+ALLEGRO_LIB_NAME_SUFFIX;
    { @exclude }
    ALLEGRO_MAIN_LIB_NAME       = 'liballegro_main'+ALLEGRO_LIB_NAME_SUFFIX;
    { @exclude }
    ALLEGRO_NATIVE_DLG_LIB_NAME = 'liballegro_dialog'+ALLEGRO_LIB_NAME_SUFFIX;
    { @exclude }
    ALLEGRO_PRIMITIVES_LIB_NAME = 'liballegro_primitives'+ALLEGRO_LIB_NAME_SUFFIX;
    { @exclude }
    ALLEGRO_TTF_LIB_NAME        = 'liballegro_ttf'+ALLEGRO_LIB_NAME_SUFFIX;
{$ELSEIF DEFINED(MSWINDOWS)}
  {$IF DEFINED(MONOLITH)}
  {It uses monolith statically linked version. }
    { @exclude }
    ALLEGRO_LIB_NAME            = 'allegro_monolith-'+ALLEGRO_VERSION+_DBG_+'.dll';
    { @exclude }
    ALLEGRO_ACODEC_LIB_NAME     = ALLEGRO_LIB_NAME;
    { @exclude }
    ALLEGRO_AUDIO_LIB_NAME      = ALLEGRO_LIB_NAME;
    { @exclude }
    ALLEGRO_COLOR_LIB_NAME      = ALLEGRO_LIB_NAME;
    { @exclude }
    ALLEGRO_FONT_LIB_NAME       = ALLEGRO_LIB_NAME;
    { @exclude }
    ALLEGRO_IMAGE_LIB_NAME      = ALLEGRO_LIB_NAME;
    { @exclude }
    ALLEGRO_MAIN_LIB_NAME       = ALLEGRO_LIB_NAME;
    { @exclude }
    ALLEGRO_NATIVE_DLG_LIB_NAME = ALLEGRO_LIB_NAME;
    { @exclude }
    ALLEGRO_PRIMITIVES_LIB_NAME = ALLEGRO_LIB_NAME;
    { @exclude }
    ALLEGRO_TTF_LIB_NAME        = ALLEGRO_LIB_NAME;
  {$ELSEIF DEFINED(MSYS2)}
    { @exclude }
    ALLEGRO_LIB_NAME_SUFFIX     =  _DBG_+'-5.2.dll';
    { @exclude }
    ALLEGRO_LIB_NAME            = 'allegro'+ALLEGRO_LIB_NAME_SUFFIX;
    { @exclude }
    ALLEGRO_ACODEC_LIB_NAME     = 'allegro_acodec'+ALLEGRO_LIB_NAME_SUFFIX;
    { @exclude }
    ALLEGRO_AUDIO_LIB_NAME      = 'allegro_audio'+ALLEGRO_LIB_NAME_SUFFIX;
    { @exclude }
    ALLEGRO_COLOR_LIB_NAME      = 'allegro_color'+ALLEGRO_LIB_NAME_SUFFIX;
    { @exclude }
    ALLEGRO_FONT_LIB_NAME       = 'allegro_font'+ALLEGRO_LIB_NAME_SUFFIX;
    { @exclude }
    ALLEGRO_IMAGE_LIB_NAME      = 'allegro_image'+ALLEGRO_LIB_NAME_SUFFIX;
    { @exclude }
    ALLEGRO_MAIN_LIB_NAME       = 'allegro_main'+ALLEGRO_LIB_NAME_SUFFIX;
    { @exclude }
    ALLEGRO_NATIVE_DLG_LIB_NAME = 'allegro_dialog'+ALLEGRO_LIB_NAME_SUFFIX;
    { @exclude }
    ALLEGRO_PRIMITIVES_LIB_NAME = 'allegro_primitives'+ALLEGRO_LIB_NAME_SUFFIX;
    { @exclude }
    ALLEGRO_TTF_LIB_NAME        = 'allegro_ttf'+ALLEGRO_LIB_NAME_SUFFIX;
  {$ELSE}
  {It uses add-ons }
    { @exclude }
    ALLEGRO_LIB_NAME_SUFFIX     = ALLEGRO_VERSION+_DBG_+'.dll';
    { @exclude }
    ALLEGRO_LIB_NAME            = 'allegro-'+ALLEGRO_LIB_NAME_SUFFIX;
    { @exclude }
    ALLEGRO_ACODEC_LIB_NAME     = 'allegro_acodec-'+ALLEGRO_LIB_NAME_SUFFIX;
    { @exclude }
    ALLEGRO_AUDIO_LIB_NAME      = 'allegro_audio-'+ALLEGRO_LIB_NAME_SUFFIX;
    { @exclude }
    ALLEGRO_COLOR_LIB_NAME      = 'allegro_color-'+ALLEGRO_LIB_NAME_SUFFIX;
    { @exclude }
    ALLEGRO_FONT_LIB_NAME       = 'allegro_font-'+ALLEGRO_LIB_NAME_SUFFIX;
    { @exclude }
    ALLEGRO_IMAGE_LIB_NAME      = 'allegro_image-'+ALLEGRO_LIB_NAME_SUFFIX;
    { @exclude }
    ALLEGRO_MAIN_LIB_NAME       = 'allegro_main-'+ALLEGRO_LIB_NAME_SUFFIX;
    { @exclude }
    ALLEGRO_NATIVE_DLG_LIB_NAME = 'allegro_dialog-'+ALLEGRO_LIB_NAME_SUFFIX;
    { @exclude }
    ALLEGRO_PRIMITIVES_LIB_NAME = 'allegro_primitives-'+ALLEGRO_LIB_NAME_SUFFIX;
    { @exclude }
    ALLEGRO_TTF_LIB_NAME        = 'allegro_primitives-'+ALLEGRO_LIB_NAME_SUFFIX;
  {$IFEND}
{$IFEND}



(*
   Next are definitions of numeric data types.  We may use FPC's ctype unit,
   but Delphi doesn't has it so I prefer to do it this way.

   First: it defines some integers with specific lenght.
   Then: it defines the types used by C declarations.
 *)

  TYPE
  (* Generic pointer. *)
    AL_POINTER = POINTER;
  (* Signed 8bit integer values. *)
    AL_INT8 = SHORTINT;
  (* Unsigned 8bit integer values. *)
    AL_UINT8 = BYTE;
  (* Signed 16bit integer values. *)
    AL_INT16 = SMALLINT;
  (* Unsigned 16bit integer values. *)
    AL_UINT16 = WORD;
  (* Signed 32bit integer values. *)
    AL_INT32 = LONGINT;
  (* Unsigned 32bit integer values. *)
    AL_UINT32 = LONGWORD;
  (* Signed 64bit integer values. *)
    AL_INT64 = INT64;
  (* Unsigned 64bit integer values. *)
    AL_UINT64 = {$IFDEF FPC}QWORD{$ELSE}{$IFDEF ISDELPHI2007ANDUP}UInt64{$ELSE}Int64{$ENDIF}{$ENDIF};



  (* Boolean result. *)
    AL_BOOL = BYTEBOOL;
  (* Signed 8bit integer.

    Note that it isn't Pascal's CHAR type! *)
    AL_CHAR = AL_INT8;
  (* Unsigned 8bit integer values. *)
    AL_UCHAR = AL_UINT8;
  (* Signed 16bit integer values. *)
    AL_SHORT = AL_INT16;
  (* Unsigned 16bit integer values. *)
    AL_USHORT = AL_UINT16;
  (* Signed 32bit integer values. *)
    AL_INT = AL_INT32;
  (* Unsigned 32bit integer values. *)
    AL_UINT = AL_UINT32;
{$IFDEF CPU64}
  {$IFDEF WINDOWS}
  (* Signed 32/64bit integer values. *)
    AL_LONG = AL_INT32;
  (* Unsigned 32/64bit integer values. *)
    AL_ULONG = AL_UINT32;
  {$ELSE}
  (* Signed 32/64bit integer values. *)
    AL_LONG = AL_INT64;
  (* Unsigned 32/64bit integer values. *)
    AL_ULONG = AL_UINT64;
  {$ENDIF}
(* size_t equivalent. *)
  AL_SIZE_T = AL_UINT64;
(* Fake pointer type.  It's needed because the need of pointer arithmetics in
  some inlined methods. *)
  AL_UINTPTR_T = AL_UINT64;
{$ELSE}
  (* Signed 32/64bit integer values. *)
    AL_LONG = AL_INT32;
  (* Unsigned 32/64bit integer values. *)
    AL_ULONG = AL_UINT32;
(* size_t equivalent. *)
  AL_SIZE_T = AL_UINT32;
(* Fake pointer type.  It's needed because the need of pointer arithmetics in
  some inlined methods. *)
  AL_UINTPTR_T = AL_UINT32;
{$ENDIF}

  (* Float value. *)
    AL_FLOAT = SINGLE;
  (* Double value. *)
    AL_DOUBLE = DOUBLE;

  (* Pointer. *)
    AL_VOIDptr = AL_POINTER;
  (* Pointer to text strings.  Used to convert Pascal's @code(STRING) to C
    @code(char * ) *)
    AL_STRptr = PCHAR;
  (* Pointer to integer. *)
    AL_INTptr = ^AL_INT;
  (* Pointer to float. *)
    AL_FLOATptr = ^AL_FLOAT;

IMPLEMENTATION

END.
