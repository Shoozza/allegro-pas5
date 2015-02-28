UNIT al5ttf;
(*<This unit registers TrueType Font format handlers for @link(al_load_font). *)
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

{$include allegro.cfg}

INTERFACE

  USES
    allegro5, al5base, al5font;

  CONST
  (* Do not use any kerning even if the font file supports it.
    @seealso(al_load_font) @seealso(al_load_ttf_font) *)
    ALLEGRO_TTF_NO_KERNING = 1;
  (* Loads as monochrome, which means no anti-aliasing of the font is done.
    @seealso(al_load_font) @seealso(al_load_ttf_font) *)
    ALLEGRO_TTF_MONOCHROME  = 2;
  (* Do not use hinging (?).
    @seealso(al_load_font) @seealso(al_load_ttf_font) *)
    ALLEGRO_TTF_NO_AUTOHINT = 4;

  FUNCTION al_load_ttf_font (CONST filename: STRING; size, flags: AL_INT): ALLEGRO_FONTptr; {$IFDEF FPC}INLINE;{$ENDIF}
  FUNCTION al_load_ttf_font_stretch (CONST filename: STRING; w, h, flags: AL_INT): ALLEGRO_FONTptr; {$IFDEF FPC}INLINE;{$ENDIF}

  (* TODO: These need Allegro's file access.

  FUNCTION al_load_ttf_font_f (file_: ALLEGRO_FILEptr; CONST filename: STRING; size, flags: AL_INT): ALLEGRO_FONTptr; {$IFDEF FPC}INLINE;{$ENDIF}
  FUNCTION al_load_ttf_font_stretch_f (file_: ALLEGRO_FILEptr; CONST filename: STRING; w, h, flags: AL_INT): ALLEGRO_FONTptr; {$IFDEF FPC}INLINE;{$ENDIF}
  *)

(* Initializes the TTF addon. *)
  FUNCTION al_init_ttf_addon: AL_BOOL; CDECL;
    EXTERNAL ALLEGRO_TTF_LIB_NAME;

(* Shut down the TTF addon. This is done automatically at program exit, but can be called any time the user wishes as well. *)
  PROCEDURE al_shutdown_ttf_addon; CDECL;
    EXTERNAL ALLEGRO_TTF_LIB_NAME;

(* Returns the (compiled) version of the addon, in the same format as @link(al_get_allegro_version). *)
  FUNCTION al_get_allegro_ttf_version: AL_UINT32; CDECL;
    EXTERNAL ALLEGRO_TTF_LIB_NAME;

IMPLEMENTATION

  FUNCTION _al_load_ttf_font_ (CONST filename: AL_STRptr; size, flags: AL_INT): ALLEGRO_FONTptr; CDECL;
  EXTERNAL ALLEGRO_FONT_LIB_NAME NAME 'al_load_ttf_font';
  FUNCTION al_load_ttf_font (CONST filename: STRING; size, flags: AL_INT): ALLEGRO_FONTptr;
  BEGIN
    al_load_ttf_font := _al_load_ttf_font_ (AL_STRptr (filename), size, flags);
  END;

  {TODO: This needs Allegro's file access.

  FUNCTION _al_load_ttf_font_f_ (CONST filename: AL_STRptr; size, flags: AL_INT): ALLEGRO_FONTptr; CDECL;
  EXTERNAL ALLEGRO_FONT_LIB_NAME NAME 'al_load_ttf_font_f';
  FUNCTION al_load_ttf_font_f (file_: ALLEGRO_FILEptr; CONST filename: STRING; size, flags: AL_INT): ALLEGRO_FONTptr;
  BEGIN
    al_load_ttf_font_f := _al_load_ttf_font_f_ (AL_FILEptr (file_), AL_STRptr (filename), size, flags);
  END;
  }

  FUNCTION _al_load_ttf_font_stretch_ (CONST filename: AL_STRptr; w, h, flags: AL_INT): ALLEGRO_FONTptr; CDECL;
  EXTERNAL ALLEGRO_FONT_LIB_NAME NAME 'al_load_ttf_font_stretch';
  FUNCTION al_load_ttf_font_stretch (CONST filename: STRING; w, h, flags: AL_INT): ALLEGRO_FONTptr;
  BEGIN
    al_load_ttf_font_stretch := _al_load_ttf_font_stretch_ (AL_STRptr (filename), w, h, flags);
  END;

  {TODO: This needs Allegro's file access.

  FUNCTION _al_load_ttf_font_stretch_f_ (CONST filename: AL_STRptr; size, flags: AL_INT): ALLEGRO_FONTptr; CDECL;
  EXTERNAL ALLEGRO_FONT_LIB_NAME NAME 'al_load_ttf_font_stretch_f';
  FUNCTION al_load_ttf_font_stretch_f (file_: ALLEGRO_FILEptr; CONST filename: STRING; w, h, flags: AL_INT): ALLEGRO_FONTptr;
  BEGIN
    al_load_ttf_font_stretch_f := _al_load_ttf_font_stretch_f_ (AL_FILEptr (file_), AL_STRptr (filename), w, h, flags);
  END;
  }
END.
