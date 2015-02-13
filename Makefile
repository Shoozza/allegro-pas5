REL_FLAGS  = -l- -O3 -Xs- -XX
DREL_FLAGS =
DBG_FLAGS  = -l- -dDEBUGMODE -g
DDBG_FLAGS =
FLAGS      = $(DBG_FLAGS)
DFLAGS     = $(DDBG_FLAGS)

DIRS  = -Fulib -FUobj
DDIRS = -Ilib -Ulib -Oobj -Q

EX_OUT   = -FEexamples
DEX_OUT  = -Eexamples
LIB_OUT  = -FEobj
DLIB_OUT = -Eobj

CC  = fpc
DCC = DCC32


all: release example
all_delphi: release_delphi example_delphi

debug:
	@$(CC) $(DBG_FLAGS) $(DIRS) lib/*.pas
debug_delphi:
	@$(DCC) $(DDBG_FLAGS) $(DDIRS) lib\*.pas

release:
	@$(CC) $(REL_FLAGS) $(DIRS) lib/*.pas
release_delphi:
	@$(DCC) $(DREL_FLAGS) $(DDIRS) lib\\*.pas

example:
	@$(CC) $(FLAGS) $(DIRS) $(EX_OUT) examples/ex_audio_simple.pas
	@$(CC) $(FLAGS) $(DIRS) $(EX_OUT) examples/ex_blit.pas
	@$(CC) $(FLAGS) $(DIRS) $(EX_OUT) examples/ex_font.pas
	@$(CC) $(FLAGS) $(DIRS) $(EX_OUT) examples/ex_gldepth.pas
	@$(CC) $(FLAGS) $(DIRS) $(EX_OUT) examples/ex_haiku.pas
	@$(CC) $(FLAGS) $(DIRS) $(EX_OUT) examples/ex_lines.pas
	@$(CC) $(FLAGS) $(DIRS) $(EX_OUT) examples/ex_prim.pas
	@$(CC) $(FLAGS) $(DIRS) $(EX_OUT) examples/ex_rotate.pas
	@$(CC) $(FLAGS) $(DIRS) $(EX_OUT) examples/ex_scale.pas
	@$(CC) $(FLAGS) $(DIRS) $(EX_OUT) examples/ex_transform.pas
	@$(CC) $(FLAGS) $(DIRS) $(EX_OUT) examples/ex_warp_mouse.pas

example_delphi:
	@$(DCC) $(DFLAGS) $(DDIRS) $(DEX_OUT) examples\ex_audio_simple.pas
	@$(DCC) $(DFLAGS) $(DDIRS) $(DEX_OUT) examples\ex_audio_simple.pas
	@$(DCC) $(DFLAGS) $(DDIRS) $(DEX_OUT) examples\ex_blit.pas
	@$(DCC) $(DFLAGS) $(DDIRS) $(DEX_OUT) examples\ex_font.pas
	#@$(DCC) $(DFLAGS) $(DDIRS) $(DEX_OUT) examples\ex_gldepth.pas
	@$(DCC) $(DFLAGS) $(DDIRS) $(DEX_OUT) examples\ex_haiku.pas
	@$(DCC) $(DFLAGS) $(DDIRS) $(DEX_OUT) examples\ex_lines.pas
	#@$(DCC) $(DFLAGS) $(DDIRS) $(DEX_OUT) examples\ex_prim.pas
	@$(DCC) $(DFLAGS) $(DDIRS) $(DEX_OUT) examples\ex_rotate.pas
	@$(DCC) $(DFLAGS) $(DDIRS) $(DEX_OUT) examples\ex_scale.pas
	@$(DCC) $(DFLAGS) $(DDIRS) $(DEX_OUT) examples\ex_transform.pas
	@$(DCC) $(DFLAGS) $(DDIRS) $(DEX_OUT) examples\ex_warp_mouse.pas

clean:
	@rm -f obj/*.o \
	       obj/*.a \
	       obj/*.s \
	       obj/*.ppu \
	       obj/*.dcu \
	       examples/*.exe

.PHONY: all debug release example test clean
