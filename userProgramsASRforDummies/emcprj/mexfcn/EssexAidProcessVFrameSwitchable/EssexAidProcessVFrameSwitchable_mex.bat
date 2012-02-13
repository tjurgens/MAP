@echo off
set MATLAB=C:\2010a
set MATLAB_ARCH=win32
set MATLAB_BIN="C:\2010a\bin"
set ENTRYPOINT=mexFunction
set OUTDIR=C:\MAP\userProgramsASRforDummies\emcprj\mexfcn\EssexAidProcessVFrameSwitchable\
set LIB_NAME=EssexAidProcessVFrameSwitchable
set MEX_NAME=EssexAidProcessVFrameSwitchable
set MEX_EXT=.mexw32
call mexopts.bat
echo # Make settings for EssexAidProcessVFrameSwitchable > EssexAidProcessVFrameSwitchable_mex.mki
echo COMPILER=%COMPILER%>> EssexAidProcessVFrameSwitchable_mex.mki
echo COMPFLAGS=%COMPFLAGS%>> EssexAidProcessVFrameSwitchable_mex.mki
echo OPTIMFLAGS=%OPTIMFLAGS%>> EssexAidProcessVFrameSwitchable_mex.mki
echo DEBUGFLAGS=%DEBUGFLAGS%>> EssexAidProcessVFrameSwitchable_mex.mki
echo LINKER=%LINKER%>> EssexAidProcessVFrameSwitchable_mex.mki
echo LINKFLAGS=%LINKFLAGS%>> EssexAidProcessVFrameSwitchable_mex.mki
echo LINKOPTIMFLAGS=%LINKOPTIMFLAGS%>> EssexAidProcessVFrameSwitchable_mex.mki
echo LINKDEBUGFLAGS=%LINKDEBUGFLAGS%>> EssexAidProcessVFrameSwitchable_mex.mki
echo MATLAB_ARCH=%MATLAB_ARCH%>> EssexAidProcessVFrameSwitchable_mex.mki
echo BORLAND=%BORLAND%>> EssexAidProcessVFrameSwitchable_mex.mki
echo EMC_COMPILER=lcc>> EssexAidProcessVFrameSwitchable_mex.mki
echo EMC_CONFIG=optim>> EssexAidProcessVFrameSwitchable_mex.mki
"C:\2010a\bin\win32\gmake" -B -f EssexAidProcessVFrameSwitchable_mex.mk
