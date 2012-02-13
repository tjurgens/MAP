MATLAB_ROOT = C:\2010a
MAKEFILE = EssexAidProcessVFrameSwitchable_mex.mk

include EssexAidProcessVFrameSwitchable_mex.mki


SRC_FILES =  \
	EssexAidProcessVFrameSwitchable_mexutil.c \
	EssexAidProcessVFrameSwitchable_data.c \
	EssexAidProcessVFrameSwitchable.c \
	filter.c \
	max.c \
	isfinite.c \
	abs.c \
	log10.c \
	power.c \
	find.c \
	sign.c \
	mean.c \
	sum.c \
	sqrt.c \
	EssexAidProcessVFrameSwitchable_initialize.c \
	EssexAidProcessVFrameSwitchable_terminate.c \
	EssexAidProcessVFrameSwitchable_api.c \
	EssexAidProcessVFrameSwitchable_mex.c

MEX_FILE_NAME_WO_EXT = EssexAidProcessVFrameSwitchable
MEX_FILE_NAME = $(MEX_FILE_NAME_WO_EXT).mexw32
TARGET = $(MEX_FILE_NAME)

SYS_LIBS = 

COMP_FLAGS =

LINK_FLAGS =


#
#====================================================================
# gmake makefile fragment for building MEX functions using LCC
# Copyright 2007-2009 The MathWorks, Inc.
#====================================================================
#
OBJEXT = obj
CC = $(COMPILER)
LD = $(LINKER)
.SUFFIXES: .$(OBJEXT)

OBJLIST += $(SRC_FILES:.c=.$(OBJEXT))
MEXSTUB = $(MEX_FILE_NAME_WO_EXT)2.$(OBJEXT)
LCCSTUB = $(MEX_FILE_NAME_WO_EXT)_lccstub.$(OBJEXT)

target: $(TARGET)

ML_INCLUDES = -I"$(subst \,\\,$(MATLAB_ROOT)\extern\include)"
ML_INCLUDES+= -I"$(subst \,\\,$(MATLAB_ROOT)\simulink\include)"
ML_INCLUDES+= -I"$(subst \,\\,$(MATLAB_ROOT)\toolbox\shared\simtargets)"
SYS_INCLUDE = $(ML_INCLUDES)

# Additional includes

SYS_INCLUDE += -I"$(subst \,\\,C:\MAP\userProgramsASRforDummies\emcprj\mexfcn\EssexAidProcessVFrameSwitchable)"

EML_LIBS = libemlrt.lib libut.lib libmwblascompat32.lib libmwmathutil.lib
SYS_LIBS += $(EML_LIBS)

DIRECTIVES = $(MEX_FILE_NAME_WO_EXT)_mex.def

COMP_FLAGS = $(subst \,\\,$(COMPFLAGS)) -DMX_COMPAT_32
LINK_FLAGS0= $(subst \,\\,$(subst $(MEXSTUB),$(LCCSTUB),$(LINKFLAGS)))
LINK_FLAGS = $(filter-out "%mexFunction.def", $(LINK_FLAGS0))

ifeq ($(EMC_CONFIG),optim)
  COMP_FLAGS += $(OPTIMFLAGS)
  LINK_FLAGS += $(LINKOPTIMFLAGS)
else
  COMP_FLAGS += $(DEBUGFLAGS)
  LINK_FLAGS += $(LINKDEBUGFLAGS)
endif
LINK_FLAGS += -o $(TARGET)
LINK_FLAGS += 

CFLAGS = $(COMP_FLAGS) $(USER_INCLUDE) $(SYS_INCLUDE)

%.$(OBJEXT) : %.c
	$(CC) $(CFLAGS) "$<"

# Additional sources

%.$(OBJEXT) : C:\MAP\userProgramsASRforDummies\emcprj\mexfcn\EssexAidProcessVFrameSwitchable/%.c
	$(CC) -Fo"$@" $(CFLAGS) "$<"



$(LCCSTUB) : $(MATLAB_ROOT)\sys\lcc\mex\lccstub.c
	$(CC) -Fo$(LCCSTUB) $(CFLAGS) "$(subst \,\\,$<)"

$(TARGET): $(OBJLIST) $(LCCSTUB) $(MAKEFILE) $(DIRECTIVES)
	$(LD) $(LINK_FLAGS) $(OBJLIST) $(LINKFLAGSPOST) $(SYS_LIBS) $(DIRECTIVES)
	@cmd /C "echo Build completed using compiler $(EMC_COMPILER)"

#====================================================================

