REL_FLAGS = -l- -O3 -Xs- -XX
DBG_FLAGS = -l- -dDEBUGMODE -g
FLAGS     = $(DBG_FLAGS)

DIRS = -Fulib -FUobj

EX_OUT  = -FEexamples
LIB_OUT = -FEobj

all: release example test

debug:
	@fpc $(DBG_FLAGS) $(DIRS) lib/*.pas

release:
	@fpc $(REL_FLAGS) $(DIRS) lib/*.pas

example:
	@fpc $(FLAGS) $(DIRS) $(EX_OUT) examples/ex_audio_simple.pas
	@fpc $(FLAGS) $(DIRS) $(EX_OUT) examples/ex_blit.pas
	@fpc $(FLAGS) $(DIRS) $(EX_OUT) examples/ex_font.pas
	@fpc $(FLAGS) $(DIRS) $(EX_OUT) examples/ex_gldepth.pas
	@fpc $(FLAGS) $(DIRS) $(EX_OUT) examples/ex_haiku.pas
	@fpc $(FLAGS) $(DIRS) $(EX_OUT) examples/ex_lines.pas
	@fpc $(FLAGS) $(DIRS) $(EX_OUT) examples/ex_prim.pas
	@fpc $(FLAGS) $(DIRS) $(EX_OUT) examples/ex_rotate.pas
	@fpc $(FLAGS) $(DIRS) $(EX_OUT) examples/ex_scale.pas
	@fpc $(FLAGS) $(DIRS) $(EX_OUT) examples/ex_transform.pas
	@fpc $(FLAGS) $(DIRS) $(EX_OUT) examples/ex_warp_mouse.pas

test:
clean:
	@rm -f obj/*.o \
	       obj/*.a \
	       obj/*.s \
	       obj/*.ppu \
	       obj/*.dcu \
	       examples/*.exe

.PHONY: all debug release example test clean

