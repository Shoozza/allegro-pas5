UNIT al5d3d;
(*<public Direct3D-related API. *)
(* Copyright (c) 2015 allegro-pas5.

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
    Allegro5, al5base,
{$IFDEF FPC}
    Direct3D9;
{$ELSE}
    Direct3D9;
{$ENDIF}


(******************************************************************************
 * allegro_directd3.h *
 ********************)

  CONST
    ALLEGRO_DIRECT3D = ALLEGRO_DIRECT3D_INTERNAL;

{$IFDEF MSWINDOWS}
  FUNCTION al_get_d3d_device (display: ALLEGRO_DISPLAYptr): IDirect3DDevice9; CDECL;
    EXTERNAL ALLEGRO_LIB_NAME;
  FUNCTION al_get_d3d_system_texture (display: ALLEGRO_BITMAPptr): IDirect3DTexture9; CDECL;
    EXTERNAL ALLEGRO_LIB_NAME;
  FUNCTION al_get_d3d_video_texture (display: ALLEGRO_BITMAPptr): IDirect3DTexture9; CDECL;
    EXTERNAL ALLEGRO_LIB_NAME;
  FUNCTION al_have_d3d_non_pow2_texture_support: AL_BOOL; CDECL;
    EXTERNAL ALLEGRO_LIB_NAME;
  FUNCTION al_have_d3d_non_square_texture_support: AL_BOOL; CDECL;
    EXTERNAL ALLEGRO_LIB_NAME;
  PROCEDURE al_get_d3d_texture_position (bitmap: ALLEGRO_BITMAPptr; OUT w; h: AL_INT); CDECL;
    EXTERNAL ALLEGRO_LIB_NAME;
  FUNCTION al_is_d3d_device_lost (display: ALLEGRO_DISPLAYptr): AL_BOOL; CDECL;
    EXTERNAL ALLEGRO_LIB_NAME;
{$ENDIF}

IMPLEMENTATION

END.
