#! /bin/sh
# Generated from niminst
# Template is in tools/niminst/buildsh.tmpl
# To regenerate run ``niminst csource`` or ``koch csource``

set -e

while :
do
  case "$1" in
    --extraBuildArgs)
      extraBuildArgs=" $2"
      shift 2
      ;;
    --) # End of all options
      shift
      break;
      ;;
    -*)
      echo "Error: Unknown option: $1" >&2
      exit 1
      ;;
    *)  # No more options
      break
      ;;
  esac
done

CC="gcc"
LINKER="gcc"
COMP_FLAGS="-w -O3 -fno-strict-aliasing$extraBuildArgs"
LINK_FLAGS=""
# platform detection
ucpu=`uname -m`
uos=`uname`
# bin dir detection
binDir=bin

if [ -s ../koch.nim ]; then
  binDir="../bin"
fi

if [ ! -d $binDir ]; then
  mkdir $binDir
fi

# convert to lower case:
ucpu=`echo $ucpu | tr "[:upper:]" "[:lower:]"`
uos=`echo $uos | tr "[:upper:]" "[:lower:]"`

case $uos in
  *linux* ) 
    myos="linux" 
    LINK_FLAGS="$LINK_FLAGS -ldl -lm"
    ;;
  *dragonfly* )
    myos="freebsd"
    LINK_FLAGS="$LINK_FLAGS -lm"
    ;;
  *freebsd* )
    myos="freebsd"
    CC="clang"
    LINKER="clang"
    LINK_FLAGS="$LINK_FLAGS -lm"
    ;;
  *openbsd* )
    myos="openbsd" 
    LINK_FLAGS="$LINK_FLAGS -lm"
    ;;
  *netbsd* )
    myos="netbsd"
    LINK_FLAGS="$LINK_FLAGS -lm"
    ;;
  *darwin* ) 
    myos="macosx"
    CC="clang"
    LINKER="clang"
    LINK_FLAGS="$LINK_FLAGS -ldl -lm"
    if [ "$HOSTTYPE" = "x86_64" ] ; then
      ucpu="amd64"
    fi
    ;;
  *aix* )
    myos="aix"
    LINK_FLAGS="$LINK_FLAGS -ldl -lm"    
    ;;
  *solaris* | *sun* ) 
    myos="solaris"
    LINK_FLAGS="$LINK_FLAGS -ldl -lm -lsocket -lnsl"
    ;;
  *haiku* )
    myos="haiku"
    ;;
  *) 
    echo "Error: unknown operating system: $uos"
    exit 1
    ;;
esac

case $ucpu in
  *i386* | *i486* | *i586* | *i686* | *bepc* | *i86pc* ) 
    mycpu="i386" ;;
  *amd*64* | *x86-64* | *x86_64* ) 
    mycpu="amd64" ;;
  *sparc*|*sun* ) 
    mycpu="sparc" ;;
  *ppc64* ) 
    if [ "$myos" = "linux" ] ; then
      COMP_FLAGS="$COMP_FLAGS -m64"
      LINK_FLAGS="$LINK_FLAGS -m64"
    fi
    mycpu="powerpc64" ;;
  *power*|*ppc* ) 
    mycpu="powerpc" ;;
  *mips* ) 
    mycpu="mips" ;;
  *arm*|*armv6l* )
    mycpu="arm" ;;
  *) 
    echo "Error: unknown processor: $ucpu"
    exit 1
    ;;
esac

# call the compiler:

case $myos in
windows) 
  case $mycpu in
  i386)
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/PK.c -o c_code/1_1/PK.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/PK.c -o c_code/1_1/PK.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_system.c -o c_code/1_1/stdlib_system.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_system.c -o c_code/1_1/stdlib_system.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_os.c -o c_code/1_1/stdlib_os.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_os.c -o c_code/1_1/stdlib_os.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_strutils.c -o c_code/1_1/stdlib_strutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_strutils.c -o c_code/1_1/stdlib_strutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_parseutils.c -o c_code/1_1/stdlib_parseutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_parseutils.c -o c_code/1_1/stdlib_parseutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_times.c -o c_code/1_1/stdlib_times.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_times.c -o c_code/1_1/stdlib_times.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_winlean.c -o c_code/1_1/stdlib_winlean.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_winlean.c -o c_code/1_1/stdlib_winlean.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_osproc.c -o c_code/1_1/stdlib_osproc.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_osproc.c -o c_code/1_1/stdlib_osproc.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_strtabs.c -o c_code/1_1/stdlib_strtabs.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_strtabs.c -o c_code/1_1/stdlib_strtabs.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_hashes.c -o c_code/1_1/stdlib_hashes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_hashes.c -o c_code/1_1/stdlib_hashes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_streams.c -o c_code/1_1/stdlib_streams.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_streams.c -o c_code/1_1/stdlib_streams.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_cpuinfo.c -o c_code/1_1/stdlib_cpuinfo.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_cpuinfo.c -o c_code/1_1/stdlib_cpuinfo.o
    echo "$LINKER -o $binDir/pk  \
c_code/1_1/PK.o \
c_code/1_1/stdlib_system.o \
c_code/1_1/stdlib_os.o \
c_code/1_1/stdlib_strutils.o \
c_code/1_1/stdlib_parseutils.o \
c_code/1_1/stdlib_times.o \
c_code/1_1/stdlib_winlean.o \
c_code/1_1/stdlib_osproc.o \
c_code/1_1/stdlib_strtabs.o \
c_code/1_1/stdlib_hashes.o \
c_code/1_1/stdlib_streams.o \
c_code/1_1/stdlib_cpuinfo.o $LINK_FLAGS"
    $LINKER -o $binDir/pk  \
c_code/1_1/PK.o \
c_code/1_1/stdlib_system.o \
c_code/1_1/stdlib_os.o \
c_code/1_1/stdlib_strutils.o \
c_code/1_1/stdlib_parseutils.o \
c_code/1_1/stdlib_times.o \
c_code/1_1/stdlib_winlean.o \
c_code/1_1/stdlib_osproc.o \
c_code/1_1/stdlib_strtabs.o \
c_code/1_1/stdlib_hashes.o \
c_code/1_1/stdlib_streams.o \
c_code/1_1/stdlib_cpuinfo.o $LINK_FLAGS
    ;;
  amd64)
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/PK.c -o c_code/1_2/PK.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/PK.c -o c_code/1_2/PK.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_system.c -o c_code/1_2/stdlib_system.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_system.c -o c_code/1_2/stdlib_system.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_os.c -o c_code/1_2/stdlib_os.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_os.c -o c_code/1_2/stdlib_os.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_strutils.c -o c_code/1_2/stdlib_strutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_strutils.c -o c_code/1_2/stdlib_strutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_parseutils.c -o c_code/1_2/stdlib_parseutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_parseutils.c -o c_code/1_2/stdlib_parseutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_times.c -o c_code/1_2/stdlib_times.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_times.c -o c_code/1_2/stdlib_times.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_winlean.c -o c_code/1_2/stdlib_winlean.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_winlean.c -o c_code/1_2/stdlib_winlean.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_osproc.c -o c_code/1_2/stdlib_osproc.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_osproc.c -o c_code/1_2/stdlib_osproc.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_strtabs.c -o c_code/1_2/stdlib_strtabs.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_strtabs.c -o c_code/1_2/stdlib_strtabs.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_hashes.c -o c_code/1_2/stdlib_hashes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_hashes.c -o c_code/1_2/stdlib_hashes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_streams.c -o c_code/1_2/stdlib_streams.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_streams.c -o c_code/1_2/stdlib_streams.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_cpuinfo.c -o c_code/1_2/stdlib_cpuinfo.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_cpuinfo.c -o c_code/1_2/stdlib_cpuinfo.o
    echo "$LINKER -o $binDir/pk  \
c_code/1_2/PK.o \
c_code/1_2/stdlib_system.o \
c_code/1_2/stdlib_os.o \
c_code/1_2/stdlib_strutils.o \
c_code/1_2/stdlib_parseutils.o \
c_code/1_2/stdlib_times.o \
c_code/1_2/stdlib_winlean.o \
c_code/1_2/stdlib_osproc.o \
c_code/1_2/stdlib_strtabs.o \
c_code/1_2/stdlib_hashes.o \
c_code/1_2/stdlib_streams.o \
c_code/1_2/stdlib_cpuinfo.o $LINK_FLAGS"
    $LINKER -o $binDir/pk  \
c_code/1_2/PK.o \
c_code/1_2/stdlib_system.o \
c_code/1_2/stdlib_os.o \
c_code/1_2/stdlib_strutils.o \
c_code/1_2/stdlib_parseutils.o \
c_code/1_2/stdlib_times.o \
c_code/1_2/stdlib_winlean.o \
c_code/1_2/stdlib_osproc.o \
c_code/1_2/stdlib_strtabs.o \
c_code/1_2/stdlib_hashes.o \
c_code/1_2/stdlib_streams.o \
c_code/1_2/stdlib_cpuinfo.o $LINK_FLAGS
    ;;
  powerpc64)
    echo "$LINKER -o $binDir/pk  $LINK_FLAGS"
    $LINKER -o $binDir/pk  $LINK_FLAGS
    ;;
  arm)
    echo "$LINKER -o $binDir/pk  $LINK_FLAGS"
    $LINKER -o $binDir/pk  $LINK_FLAGS
    ;;
  sparc)
    echo "$LINKER -o $binDir/pk  $LINK_FLAGS"
    $LINKER -o $binDir/pk  $LINK_FLAGS
    ;;
  mips)
    echo "$LINKER -o $binDir/pk  $LINK_FLAGS"
    $LINKER -o $binDir/pk  $LINK_FLAGS
    ;;
  powerpc)
    echo "$LINKER -o $binDir/pk  $LINK_FLAGS"
    $LINKER -o $binDir/pk  $LINK_FLAGS
    ;;
  *)
    echo "Error: no C code generated for: [$myos: $mycpu]"
    exit 1
    ;;
  esac
  ;;
linux) 
  case $mycpu in
  i386)
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/PK.c -o c_code/2_1/PK.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/PK.c -o c_code/2_1/PK.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_system.c -o c_code/2_1/stdlib_system.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_system.c -o c_code/2_1/stdlib_system.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_os.c -o c_code/2_1/stdlib_os.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_os.c -o c_code/2_1/stdlib_os.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_strutils.c -o c_code/2_1/stdlib_strutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_strutils.c -o c_code/2_1/stdlib_strutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_parseutils.c -o c_code/2_1/stdlib_parseutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_parseutils.c -o c_code/2_1/stdlib_parseutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_times.c -o c_code/2_1/stdlib_times.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_times.c -o c_code/2_1/stdlib_times.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_posix.c -o c_code/2_1/stdlib_posix.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_posix.c -o c_code/2_1/stdlib_posix.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_osproc.c -o c_code/2_1/stdlib_osproc.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_osproc.c -o c_code/2_1/stdlib_osproc.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_strtabs.c -o c_code/2_1/stdlib_strtabs.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_strtabs.c -o c_code/2_1/stdlib_strtabs.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_hashes.c -o c_code/2_1/stdlib_hashes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_hashes.c -o c_code/2_1/stdlib_hashes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_streams.c -o c_code/2_1/stdlib_streams.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_streams.c -o c_code/2_1/stdlib_streams.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_cpuinfo.c -o c_code/2_1/stdlib_cpuinfo.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_cpuinfo.c -o c_code/2_1/stdlib_cpuinfo.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_linux.c -o c_code/2_1/stdlib_linux.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_linux.c -o c_code/2_1/stdlib_linux.o
    echo "$LINKER -o $binDir/pk  \
c_code/2_1/PK.o \
c_code/2_1/stdlib_system.o \
c_code/2_1/stdlib_os.o \
c_code/2_1/stdlib_strutils.o \
c_code/2_1/stdlib_parseutils.o \
c_code/2_1/stdlib_times.o \
c_code/2_1/stdlib_posix.o \
c_code/2_1/stdlib_osproc.o \
c_code/2_1/stdlib_strtabs.o \
c_code/2_1/stdlib_hashes.o \
c_code/2_1/stdlib_streams.o \
c_code/2_1/stdlib_cpuinfo.o \
c_code/2_1/stdlib_linux.o $LINK_FLAGS"
    $LINKER -o $binDir/pk  \
c_code/2_1/PK.o \
c_code/2_1/stdlib_system.o \
c_code/2_1/stdlib_os.o \
c_code/2_1/stdlib_strutils.o \
c_code/2_1/stdlib_parseutils.o \
c_code/2_1/stdlib_times.o \
c_code/2_1/stdlib_posix.o \
c_code/2_1/stdlib_osproc.o \
c_code/2_1/stdlib_strtabs.o \
c_code/2_1/stdlib_hashes.o \
c_code/2_1/stdlib_streams.o \
c_code/2_1/stdlib_cpuinfo.o \
c_code/2_1/stdlib_linux.o $LINK_FLAGS
    ;;
  amd64)
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/PK.c -o c_code/2_2/PK.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/PK.c -o c_code/2_2/PK.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_system.c -o c_code/2_2/stdlib_system.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_system.c -o c_code/2_2/stdlib_system.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_os.c -o c_code/2_2/stdlib_os.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_os.c -o c_code/2_2/stdlib_os.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_strutils.c -o c_code/2_2/stdlib_strutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_strutils.c -o c_code/2_2/stdlib_strutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_parseutils.c -o c_code/2_2/stdlib_parseutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_parseutils.c -o c_code/2_2/stdlib_parseutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_times.c -o c_code/2_2/stdlib_times.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_times.c -o c_code/2_2/stdlib_times.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_posix.c -o c_code/2_2/stdlib_posix.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_posix.c -o c_code/2_2/stdlib_posix.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_osproc.c -o c_code/2_2/stdlib_osproc.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_osproc.c -o c_code/2_2/stdlib_osproc.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_strtabs.c -o c_code/2_2/stdlib_strtabs.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_strtabs.c -o c_code/2_2/stdlib_strtabs.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_hashes.c -o c_code/2_2/stdlib_hashes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_hashes.c -o c_code/2_2/stdlib_hashes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_streams.c -o c_code/2_2/stdlib_streams.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_streams.c -o c_code/2_2/stdlib_streams.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_cpuinfo.c -o c_code/2_2/stdlib_cpuinfo.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_cpuinfo.c -o c_code/2_2/stdlib_cpuinfo.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_linux.c -o c_code/2_2/stdlib_linux.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_linux.c -o c_code/2_2/stdlib_linux.o
    echo "$LINKER -o $binDir/pk  \
c_code/2_2/PK.o \
c_code/2_2/stdlib_system.o \
c_code/2_2/stdlib_os.o \
c_code/2_2/stdlib_strutils.o \
c_code/2_2/stdlib_parseutils.o \
c_code/2_2/stdlib_times.o \
c_code/2_2/stdlib_posix.o \
c_code/2_2/stdlib_osproc.o \
c_code/2_2/stdlib_strtabs.o \
c_code/2_2/stdlib_hashes.o \
c_code/2_2/stdlib_streams.o \
c_code/2_2/stdlib_cpuinfo.o \
c_code/2_2/stdlib_linux.o $LINK_FLAGS"
    $LINKER -o $binDir/pk  \
c_code/2_2/PK.o \
c_code/2_2/stdlib_system.o \
c_code/2_2/stdlib_os.o \
c_code/2_2/stdlib_strutils.o \
c_code/2_2/stdlib_parseutils.o \
c_code/2_2/stdlib_times.o \
c_code/2_2/stdlib_posix.o \
c_code/2_2/stdlib_osproc.o \
c_code/2_2/stdlib_strtabs.o \
c_code/2_2/stdlib_hashes.o \
c_code/2_2/stdlib_streams.o \
c_code/2_2/stdlib_cpuinfo.o \
c_code/2_2/stdlib_linux.o $LINK_FLAGS
    ;;
  powerpc64)
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/PK.c -o c_code/2_3/PK.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/PK.c -o c_code/2_3/PK.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_system.c -o c_code/2_3/stdlib_system.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_system.c -o c_code/2_3/stdlib_system.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_os.c -o c_code/2_3/stdlib_os.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_os.c -o c_code/2_3/stdlib_os.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_strutils.c -o c_code/2_3/stdlib_strutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_strutils.c -o c_code/2_3/stdlib_strutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_parseutils.c -o c_code/2_3/stdlib_parseutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_parseutils.c -o c_code/2_3/stdlib_parseutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_times.c -o c_code/2_3/stdlib_times.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_times.c -o c_code/2_3/stdlib_times.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_posix.c -o c_code/2_3/stdlib_posix.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_posix.c -o c_code/2_3/stdlib_posix.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_osproc.c -o c_code/2_3/stdlib_osproc.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_osproc.c -o c_code/2_3/stdlib_osproc.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_strtabs.c -o c_code/2_3/stdlib_strtabs.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_strtabs.c -o c_code/2_3/stdlib_strtabs.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_hashes.c -o c_code/2_3/stdlib_hashes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_hashes.c -o c_code/2_3/stdlib_hashes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_streams.c -o c_code/2_3/stdlib_streams.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_streams.c -o c_code/2_3/stdlib_streams.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_cpuinfo.c -o c_code/2_3/stdlib_cpuinfo.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_cpuinfo.c -o c_code/2_3/stdlib_cpuinfo.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_linux.c -o c_code/2_3/stdlib_linux.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_linux.c -o c_code/2_3/stdlib_linux.o
    echo "$LINKER -o $binDir/pk  \
c_code/2_3/PK.o \
c_code/2_3/stdlib_system.o \
c_code/2_3/stdlib_os.o \
c_code/2_3/stdlib_strutils.o \
c_code/2_3/stdlib_parseutils.o \
c_code/2_3/stdlib_times.o \
c_code/2_3/stdlib_posix.o \
c_code/2_3/stdlib_osproc.o \
c_code/2_3/stdlib_strtabs.o \
c_code/2_3/stdlib_hashes.o \
c_code/2_3/stdlib_streams.o \
c_code/2_3/stdlib_cpuinfo.o \
c_code/2_3/stdlib_linux.o $LINK_FLAGS"
    $LINKER -o $binDir/pk  \
c_code/2_3/PK.o \
c_code/2_3/stdlib_system.o \
c_code/2_3/stdlib_os.o \
c_code/2_3/stdlib_strutils.o \
c_code/2_3/stdlib_parseutils.o \
c_code/2_3/stdlib_times.o \
c_code/2_3/stdlib_posix.o \
c_code/2_3/stdlib_osproc.o \
c_code/2_3/stdlib_strtabs.o \
c_code/2_3/stdlib_hashes.o \
c_code/2_3/stdlib_streams.o \
c_code/2_3/stdlib_cpuinfo.o \
c_code/2_3/stdlib_linux.o $LINK_FLAGS
    ;;
  arm)
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/PK.c -o c_code/2_4/PK.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/PK.c -o c_code/2_4/PK.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_system.c -o c_code/2_4/stdlib_system.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_system.c -o c_code/2_4/stdlib_system.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_os.c -o c_code/2_4/stdlib_os.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_os.c -o c_code/2_4/stdlib_os.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_strutils.c -o c_code/2_4/stdlib_strutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_strutils.c -o c_code/2_4/stdlib_strutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_parseutils.c -o c_code/2_4/stdlib_parseutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_parseutils.c -o c_code/2_4/stdlib_parseutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_times.c -o c_code/2_4/stdlib_times.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_times.c -o c_code/2_4/stdlib_times.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_posix.c -o c_code/2_4/stdlib_posix.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_posix.c -o c_code/2_4/stdlib_posix.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_osproc.c -o c_code/2_4/stdlib_osproc.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_osproc.c -o c_code/2_4/stdlib_osproc.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_strtabs.c -o c_code/2_4/stdlib_strtabs.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_strtabs.c -o c_code/2_4/stdlib_strtabs.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_hashes.c -o c_code/2_4/stdlib_hashes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_hashes.c -o c_code/2_4/stdlib_hashes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_streams.c -o c_code/2_4/stdlib_streams.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_streams.c -o c_code/2_4/stdlib_streams.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_cpuinfo.c -o c_code/2_4/stdlib_cpuinfo.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_cpuinfo.c -o c_code/2_4/stdlib_cpuinfo.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_linux.c -o c_code/2_4/stdlib_linux.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_linux.c -o c_code/2_4/stdlib_linux.o
    echo "$LINKER -o $binDir/pk  \
c_code/2_4/PK.o \
c_code/2_4/stdlib_system.o \
c_code/2_4/stdlib_os.o \
c_code/2_4/stdlib_strutils.o \
c_code/2_4/stdlib_parseutils.o \
c_code/2_4/stdlib_times.o \
c_code/2_4/stdlib_posix.o \
c_code/2_4/stdlib_osproc.o \
c_code/2_4/stdlib_strtabs.o \
c_code/2_4/stdlib_hashes.o \
c_code/2_4/stdlib_streams.o \
c_code/2_4/stdlib_cpuinfo.o \
c_code/2_4/stdlib_linux.o $LINK_FLAGS"
    $LINKER -o $binDir/pk  \
c_code/2_4/PK.o \
c_code/2_4/stdlib_system.o \
c_code/2_4/stdlib_os.o \
c_code/2_4/stdlib_strutils.o \
c_code/2_4/stdlib_parseutils.o \
c_code/2_4/stdlib_times.o \
c_code/2_4/stdlib_posix.o \
c_code/2_4/stdlib_osproc.o \
c_code/2_4/stdlib_strtabs.o \
c_code/2_4/stdlib_hashes.o \
c_code/2_4/stdlib_streams.o \
c_code/2_4/stdlib_cpuinfo.o \
c_code/2_4/stdlib_linux.o $LINK_FLAGS
    ;;
  sparc)
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/PK.c -o c_code/2_5/PK.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/PK.c -o c_code/2_5/PK.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_system.c -o c_code/2_5/stdlib_system.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_system.c -o c_code/2_5/stdlib_system.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_os.c -o c_code/2_5/stdlib_os.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_os.c -o c_code/2_5/stdlib_os.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_strutils.c -o c_code/2_5/stdlib_strutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_strutils.c -o c_code/2_5/stdlib_strutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_parseutils.c -o c_code/2_5/stdlib_parseutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_parseutils.c -o c_code/2_5/stdlib_parseutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_times.c -o c_code/2_5/stdlib_times.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_times.c -o c_code/2_5/stdlib_times.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_posix.c -o c_code/2_5/stdlib_posix.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_posix.c -o c_code/2_5/stdlib_posix.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_osproc.c -o c_code/2_5/stdlib_osproc.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_osproc.c -o c_code/2_5/stdlib_osproc.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_strtabs.c -o c_code/2_5/stdlib_strtabs.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_strtabs.c -o c_code/2_5/stdlib_strtabs.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_hashes.c -o c_code/2_5/stdlib_hashes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_hashes.c -o c_code/2_5/stdlib_hashes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_streams.c -o c_code/2_5/stdlib_streams.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_streams.c -o c_code/2_5/stdlib_streams.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_cpuinfo.c -o c_code/2_5/stdlib_cpuinfo.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_cpuinfo.c -o c_code/2_5/stdlib_cpuinfo.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_linux.c -o c_code/2_5/stdlib_linux.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_linux.c -o c_code/2_5/stdlib_linux.o
    echo "$LINKER -o $binDir/pk  \
c_code/2_5/PK.o \
c_code/2_5/stdlib_system.o \
c_code/2_5/stdlib_os.o \
c_code/2_5/stdlib_strutils.o \
c_code/2_5/stdlib_parseutils.o \
c_code/2_5/stdlib_times.o \
c_code/2_5/stdlib_posix.o \
c_code/2_5/stdlib_osproc.o \
c_code/2_5/stdlib_strtabs.o \
c_code/2_5/stdlib_hashes.o \
c_code/2_5/stdlib_streams.o \
c_code/2_5/stdlib_cpuinfo.o \
c_code/2_5/stdlib_linux.o $LINK_FLAGS"
    $LINKER -o $binDir/pk  \
c_code/2_5/PK.o \
c_code/2_5/stdlib_system.o \
c_code/2_5/stdlib_os.o \
c_code/2_5/stdlib_strutils.o \
c_code/2_5/stdlib_parseutils.o \
c_code/2_5/stdlib_times.o \
c_code/2_5/stdlib_posix.o \
c_code/2_5/stdlib_osproc.o \
c_code/2_5/stdlib_strtabs.o \
c_code/2_5/stdlib_hashes.o \
c_code/2_5/stdlib_streams.o \
c_code/2_5/stdlib_cpuinfo.o \
c_code/2_5/stdlib_linux.o $LINK_FLAGS
    ;;
  mips)
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/PK.c -o c_code/2_6/PK.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/PK.c -o c_code/2_6/PK.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_system.c -o c_code/2_6/stdlib_system.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_system.c -o c_code/2_6/stdlib_system.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_os.c -o c_code/2_6/stdlib_os.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_os.c -o c_code/2_6/stdlib_os.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_strutils.c -o c_code/2_6/stdlib_strutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_strutils.c -o c_code/2_6/stdlib_strutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_parseutils.c -o c_code/2_6/stdlib_parseutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_parseutils.c -o c_code/2_6/stdlib_parseutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_times.c -o c_code/2_6/stdlib_times.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_times.c -o c_code/2_6/stdlib_times.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_posix.c -o c_code/2_6/stdlib_posix.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_posix.c -o c_code/2_6/stdlib_posix.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_osproc.c -o c_code/2_6/stdlib_osproc.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_osproc.c -o c_code/2_6/stdlib_osproc.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_strtabs.c -o c_code/2_6/stdlib_strtabs.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_strtabs.c -o c_code/2_6/stdlib_strtabs.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_hashes.c -o c_code/2_6/stdlib_hashes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_hashes.c -o c_code/2_6/stdlib_hashes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_streams.c -o c_code/2_6/stdlib_streams.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_streams.c -o c_code/2_6/stdlib_streams.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_cpuinfo.c -o c_code/2_6/stdlib_cpuinfo.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_cpuinfo.c -o c_code/2_6/stdlib_cpuinfo.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_linux.c -o c_code/2_6/stdlib_linux.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_linux.c -o c_code/2_6/stdlib_linux.o
    echo "$LINKER -o $binDir/pk  \
c_code/2_6/PK.o \
c_code/2_6/stdlib_system.o \
c_code/2_6/stdlib_os.o \
c_code/2_6/stdlib_strutils.o \
c_code/2_6/stdlib_parseutils.o \
c_code/2_6/stdlib_times.o \
c_code/2_6/stdlib_posix.o \
c_code/2_6/stdlib_osproc.o \
c_code/2_6/stdlib_strtabs.o \
c_code/2_6/stdlib_hashes.o \
c_code/2_6/stdlib_streams.o \
c_code/2_6/stdlib_cpuinfo.o \
c_code/2_6/stdlib_linux.o $LINK_FLAGS"
    $LINKER -o $binDir/pk  \
c_code/2_6/PK.o \
c_code/2_6/stdlib_system.o \
c_code/2_6/stdlib_os.o \
c_code/2_6/stdlib_strutils.o \
c_code/2_6/stdlib_parseutils.o \
c_code/2_6/stdlib_times.o \
c_code/2_6/stdlib_posix.o \
c_code/2_6/stdlib_osproc.o \
c_code/2_6/stdlib_strtabs.o \
c_code/2_6/stdlib_hashes.o \
c_code/2_6/stdlib_streams.o \
c_code/2_6/stdlib_cpuinfo.o \
c_code/2_6/stdlib_linux.o $LINK_FLAGS
    ;;
  powerpc)
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/PK.c -o c_code/2_7/PK.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/PK.c -o c_code/2_7/PK.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_system.c -o c_code/2_7/stdlib_system.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_system.c -o c_code/2_7/stdlib_system.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_os.c -o c_code/2_7/stdlib_os.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_os.c -o c_code/2_7/stdlib_os.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_strutils.c -o c_code/2_7/stdlib_strutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_strutils.c -o c_code/2_7/stdlib_strutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_parseutils.c -o c_code/2_7/stdlib_parseutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_parseutils.c -o c_code/2_7/stdlib_parseutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_times.c -o c_code/2_7/stdlib_times.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_times.c -o c_code/2_7/stdlib_times.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_posix.c -o c_code/2_7/stdlib_posix.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_posix.c -o c_code/2_7/stdlib_posix.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_osproc.c -o c_code/2_7/stdlib_osproc.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_osproc.c -o c_code/2_7/stdlib_osproc.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_strtabs.c -o c_code/2_7/stdlib_strtabs.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_strtabs.c -o c_code/2_7/stdlib_strtabs.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_hashes.c -o c_code/2_7/stdlib_hashes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_hashes.c -o c_code/2_7/stdlib_hashes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_streams.c -o c_code/2_7/stdlib_streams.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_streams.c -o c_code/2_7/stdlib_streams.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_cpuinfo.c -o c_code/2_7/stdlib_cpuinfo.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_cpuinfo.c -o c_code/2_7/stdlib_cpuinfo.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_linux.c -o c_code/2_7/stdlib_linux.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_linux.c -o c_code/2_7/stdlib_linux.o
    echo "$LINKER -o $binDir/pk  \
c_code/2_7/PK.o \
c_code/2_7/stdlib_system.o \
c_code/2_7/stdlib_os.o \
c_code/2_7/stdlib_strutils.o \
c_code/2_7/stdlib_parseutils.o \
c_code/2_7/stdlib_times.o \
c_code/2_7/stdlib_posix.o \
c_code/2_7/stdlib_osproc.o \
c_code/2_7/stdlib_strtabs.o \
c_code/2_7/stdlib_hashes.o \
c_code/2_7/stdlib_streams.o \
c_code/2_7/stdlib_cpuinfo.o \
c_code/2_7/stdlib_linux.o $LINK_FLAGS"
    $LINKER -o $binDir/pk  \
c_code/2_7/PK.o \
c_code/2_7/stdlib_system.o \
c_code/2_7/stdlib_os.o \
c_code/2_7/stdlib_strutils.o \
c_code/2_7/stdlib_parseutils.o \
c_code/2_7/stdlib_times.o \
c_code/2_7/stdlib_posix.o \
c_code/2_7/stdlib_osproc.o \
c_code/2_7/stdlib_strtabs.o \
c_code/2_7/stdlib_hashes.o \
c_code/2_7/stdlib_streams.o \
c_code/2_7/stdlib_cpuinfo.o \
c_code/2_7/stdlib_linux.o $LINK_FLAGS
    ;;
  *)
    echo "Error: no C code generated for: [$myos: $mycpu]"
    exit 1
    ;;
  esac
  ;;
macosx) 
  case $mycpu in
  i386)
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/PK.c -o c_code/3_1/PK.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/PK.c -o c_code/3_1/PK.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_system.c -o c_code/3_1/stdlib_system.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_system.c -o c_code/3_1/stdlib_system.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_os.c -o c_code/3_1/stdlib_os.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_os.c -o c_code/3_1/stdlib_os.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_strutils.c -o c_code/3_1/stdlib_strutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_strutils.c -o c_code/3_1/stdlib_strutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_parseutils.c -o c_code/3_1/stdlib_parseutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_parseutils.c -o c_code/3_1/stdlib_parseutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_times.c -o c_code/3_1/stdlib_times.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_times.c -o c_code/3_1/stdlib_times.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_posix.c -o c_code/3_1/stdlib_posix.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_posix.c -o c_code/3_1/stdlib_posix.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_osproc.c -o c_code/3_1/stdlib_osproc.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_osproc.c -o c_code/3_1/stdlib_osproc.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_strtabs.c -o c_code/3_1/stdlib_strtabs.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_strtabs.c -o c_code/3_1/stdlib_strtabs.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_hashes.c -o c_code/3_1/stdlib_hashes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_hashes.c -o c_code/3_1/stdlib_hashes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_streams.c -o c_code/3_1/stdlib_streams.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_streams.c -o c_code/3_1/stdlib_streams.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_cpuinfo.c -o c_code/3_1/stdlib_cpuinfo.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_cpuinfo.c -o c_code/3_1/stdlib_cpuinfo.o
    echo "$LINKER -o $binDir/pk  \
c_code/3_1/PK.o \
c_code/3_1/stdlib_system.o \
c_code/3_1/stdlib_os.o \
c_code/3_1/stdlib_strutils.o \
c_code/3_1/stdlib_parseutils.o \
c_code/3_1/stdlib_times.o \
c_code/3_1/stdlib_posix.o \
c_code/3_1/stdlib_osproc.o \
c_code/3_1/stdlib_strtabs.o \
c_code/3_1/stdlib_hashes.o \
c_code/3_1/stdlib_streams.o \
c_code/3_1/stdlib_cpuinfo.o $LINK_FLAGS"
    $LINKER -o $binDir/pk  \
c_code/3_1/PK.o \
c_code/3_1/stdlib_system.o \
c_code/3_1/stdlib_os.o \
c_code/3_1/stdlib_strutils.o \
c_code/3_1/stdlib_parseutils.o \
c_code/3_1/stdlib_times.o \
c_code/3_1/stdlib_posix.o \
c_code/3_1/stdlib_osproc.o \
c_code/3_1/stdlib_strtabs.o \
c_code/3_1/stdlib_hashes.o \
c_code/3_1/stdlib_streams.o \
c_code/3_1/stdlib_cpuinfo.o $LINK_FLAGS
    ;;
  amd64)
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/PK.c -o c_code/3_2/PK.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/PK.c -o c_code/3_2/PK.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_system.c -o c_code/3_2/stdlib_system.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_system.c -o c_code/3_2/stdlib_system.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_os.c -o c_code/3_2/stdlib_os.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_os.c -o c_code/3_2/stdlib_os.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_strutils.c -o c_code/3_2/stdlib_strutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_strutils.c -o c_code/3_2/stdlib_strutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_parseutils.c -o c_code/3_2/stdlib_parseutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_parseutils.c -o c_code/3_2/stdlib_parseutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_times.c -o c_code/3_2/stdlib_times.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_times.c -o c_code/3_2/stdlib_times.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_posix.c -o c_code/3_2/stdlib_posix.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_posix.c -o c_code/3_2/stdlib_posix.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_osproc.c -o c_code/3_2/stdlib_osproc.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_osproc.c -o c_code/3_2/stdlib_osproc.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_strtabs.c -o c_code/3_2/stdlib_strtabs.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_strtabs.c -o c_code/3_2/stdlib_strtabs.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_hashes.c -o c_code/3_2/stdlib_hashes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_hashes.c -o c_code/3_2/stdlib_hashes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_streams.c -o c_code/3_2/stdlib_streams.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_streams.c -o c_code/3_2/stdlib_streams.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_cpuinfo.c -o c_code/3_2/stdlib_cpuinfo.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_cpuinfo.c -o c_code/3_2/stdlib_cpuinfo.o
    echo "$LINKER -o $binDir/pk  \
c_code/3_2/PK.o \
c_code/3_2/stdlib_system.o \
c_code/3_2/stdlib_os.o \
c_code/3_2/stdlib_strutils.o \
c_code/3_2/stdlib_parseutils.o \
c_code/3_2/stdlib_times.o \
c_code/3_2/stdlib_posix.o \
c_code/3_2/stdlib_osproc.o \
c_code/3_2/stdlib_strtabs.o \
c_code/3_2/stdlib_hashes.o \
c_code/3_2/stdlib_streams.o \
c_code/3_2/stdlib_cpuinfo.o $LINK_FLAGS"
    $LINKER -o $binDir/pk  \
c_code/3_2/PK.o \
c_code/3_2/stdlib_system.o \
c_code/3_2/stdlib_os.o \
c_code/3_2/stdlib_strutils.o \
c_code/3_2/stdlib_parseutils.o \
c_code/3_2/stdlib_times.o \
c_code/3_2/stdlib_posix.o \
c_code/3_2/stdlib_osproc.o \
c_code/3_2/stdlib_strtabs.o \
c_code/3_2/stdlib_hashes.o \
c_code/3_2/stdlib_streams.o \
c_code/3_2/stdlib_cpuinfo.o $LINK_FLAGS
    ;;
  powerpc64)
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/PK.c -o c_code/3_3/PK.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/PK.c -o c_code/3_3/PK.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_system.c -o c_code/3_3/stdlib_system.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_system.c -o c_code/3_3/stdlib_system.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_os.c -o c_code/3_3/stdlib_os.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_os.c -o c_code/3_3/stdlib_os.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_strutils.c -o c_code/3_3/stdlib_strutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_strutils.c -o c_code/3_3/stdlib_strutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_parseutils.c -o c_code/3_3/stdlib_parseutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_parseutils.c -o c_code/3_3/stdlib_parseutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_times.c -o c_code/3_3/stdlib_times.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_times.c -o c_code/3_3/stdlib_times.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_posix.c -o c_code/3_3/stdlib_posix.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_posix.c -o c_code/3_3/stdlib_posix.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_osproc.c -o c_code/3_3/stdlib_osproc.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_osproc.c -o c_code/3_3/stdlib_osproc.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_strtabs.c -o c_code/3_3/stdlib_strtabs.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_strtabs.c -o c_code/3_3/stdlib_strtabs.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_hashes.c -o c_code/3_3/stdlib_hashes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_hashes.c -o c_code/3_3/stdlib_hashes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_streams.c -o c_code/3_3/stdlib_streams.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_streams.c -o c_code/3_3/stdlib_streams.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_cpuinfo.c -o c_code/3_3/stdlib_cpuinfo.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_cpuinfo.c -o c_code/3_3/stdlib_cpuinfo.o
    echo "$LINKER -o $binDir/pk  \
c_code/3_3/PK.o \
c_code/3_3/stdlib_system.o \
c_code/3_3/stdlib_os.o \
c_code/3_3/stdlib_strutils.o \
c_code/3_3/stdlib_parseutils.o \
c_code/3_3/stdlib_times.o \
c_code/3_3/stdlib_posix.o \
c_code/3_3/stdlib_osproc.o \
c_code/3_3/stdlib_strtabs.o \
c_code/3_3/stdlib_hashes.o \
c_code/3_3/stdlib_streams.o \
c_code/3_3/stdlib_cpuinfo.o $LINK_FLAGS"
    $LINKER -o $binDir/pk  \
c_code/3_3/PK.o \
c_code/3_3/stdlib_system.o \
c_code/3_3/stdlib_os.o \
c_code/3_3/stdlib_strutils.o \
c_code/3_3/stdlib_parseutils.o \
c_code/3_3/stdlib_times.o \
c_code/3_3/stdlib_posix.o \
c_code/3_3/stdlib_osproc.o \
c_code/3_3/stdlib_strtabs.o \
c_code/3_3/stdlib_hashes.o \
c_code/3_3/stdlib_streams.o \
c_code/3_3/stdlib_cpuinfo.o $LINK_FLAGS
    ;;
  arm)
    echo "$LINKER -o $binDir/pk  $LINK_FLAGS"
    $LINKER -o $binDir/pk  $LINK_FLAGS
    ;;
  sparc)
    echo "$LINKER -o $binDir/pk  $LINK_FLAGS"
    $LINKER -o $binDir/pk  $LINK_FLAGS
    ;;
  mips)
    echo "$LINKER -o $binDir/pk  $LINK_FLAGS"
    $LINKER -o $binDir/pk  $LINK_FLAGS
    ;;
  powerpc)
    echo "$LINKER -o $binDir/pk  $LINK_FLAGS"
    $LINKER -o $binDir/pk  $LINK_FLAGS
    ;;
  *)
    echo "Error: no C code generated for: [$myos: $mycpu]"
    exit 1
    ;;
  esac
  ;;
solaris) 
  case $mycpu in
  i386)
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/PK.c -o c_code/4_1/PK.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/PK.c -o c_code/4_1/PK.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_system.c -o c_code/4_1/stdlib_system.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_system.c -o c_code/4_1/stdlib_system.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_os.c -o c_code/4_1/stdlib_os.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_os.c -o c_code/4_1/stdlib_os.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_strutils.c -o c_code/4_1/stdlib_strutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_strutils.c -o c_code/4_1/stdlib_strutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_parseutils.c -o c_code/4_1/stdlib_parseutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_parseutils.c -o c_code/4_1/stdlib_parseutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_times.c -o c_code/4_1/stdlib_times.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_times.c -o c_code/4_1/stdlib_times.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_posix.c -o c_code/4_1/stdlib_posix.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_posix.c -o c_code/4_1/stdlib_posix.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_osproc.c -o c_code/4_1/stdlib_osproc.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_osproc.c -o c_code/4_1/stdlib_osproc.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_strtabs.c -o c_code/4_1/stdlib_strtabs.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_strtabs.c -o c_code/4_1/stdlib_strtabs.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_hashes.c -o c_code/4_1/stdlib_hashes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_hashes.c -o c_code/4_1/stdlib_hashes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_streams.c -o c_code/4_1/stdlib_streams.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_streams.c -o c_code/4_1/stdlib_streams.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_cpuinfo.c -o c_code/4_1/stdlib_cpuinfo.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_cpuinfo.c -o c_code/4_1/stdlib_cpuinfo.o
    echo "$LINKER -o $binDir/pk  \
c_code/4_1/PK.o \
c_code/4_1/stdlib_system.o \
c_code/4_1/stdlib_os.o \
c_code/4_1/stdlib_strutils.o \
c_code/4_1/stdlib_parseutils.o \
c_code/4_1/stdlib_times.o \
c_code/4_1/stdlib_posix.o \
c_code/4_1/stdlib_osproc.o \
c_code/4_1/stdlib_strtabs.o \
c_code/4_1/stdlib_hashes.o \
c_code/4_1/stdlib_streams.o \
c_code/4_1/stdlib_cpuinfo.o $LINK_FLAGS"
    $LINKER -o $binDir/pk  \
c_code/4_1/PK.o \
c_code/4_1/stdlib_system.o \
c_code/4_1/stdlib_os.o \
c_code/4_1/stdlib_strutils.o \
c_code/4_1/stdlib_parseutils.o \
c_code/4_1/stdlib_times.o \
c_code/4_1/stdlib_posix.o \
c_code/4_1/stdlib_osproc.o \
c_code/4_1/stdlib_strtabs.o \
c_code/4_1/stdlib_hashes.o \
c_code/4_1/stdlib_streams.o \
c_code/4_1/stdlib_cpuinfo.o $LINK_FLAGS
    ;;
  amd64)
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/PK.c -o c_code/4_2/PK.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/PK.c -o c_code/4_2/PK.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_system.c -o c_code/4_2/stdlib_system.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_system.c -o c_code/4_2/stdlib_system.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_os.c -o c_code/4_2/stdlib_os.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_os.c -o c_code/4_2/stdlib_os.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_strutils.c -o c_code/4_2/stdlib_strutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_strutils.c -o c_code/4_2/stdlib_strutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_parseutils.c -o c_code/4_2/stdlib_parseutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_parseutils.c -o c_code/4_2/stdlib_parseutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_times.c -o c_code/4_2/stdlib_times.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_times.c -o c_code/4_2/stdlib_times.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_posix.c -o c_code/4_2/stdlib_posix.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_posix.c -o c_code/4_2/stdlib_posix.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_osproc.c -o c_code/4_2/stdlib_osproc.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_osproc.c -o c_code/4_2/stdlib_osproc.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_strtabs.c -o c_code/4_2/stdlib_strtabs.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_strtabs.c -o c_code/4_2/stdlib_strtabs.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_hashes.c -o c_code/4_2/stdlib_hashes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_hashes.c -o c_code/4_2/stdlib_hashes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_streams.c -o c_code/4_2/stdlib_streams.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_streams.c -o c_code/4_2/stdlib_streams.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_cpuinfo.c -o c_code/4_2/stdlib_cpuinfo.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_cpuinfo.c -o c_code/4_2/stdlib_cpuinfo.o
    echo "$LINKER -o $binDir/pk  \
c_code/4_2/PK.o \
c_code/4_2/stdlib_system.o \
c_code/4_2/stdlib_os.o \
c_code/4_2/stdlib_strutils.o \
c_code/4_2/stdlib_parseutils.o \
c_code/4_2/stdlib_times.o \
c_code/4_2/stdlib_posix.o \
c_code/4_2/stdlib_osproc.o \
c_code/4_2/stdlib_strtabs.o \
c_code/4_2/stdlib_hashes.o \
c_code/4_2/stdlib_streams.o \
c_code/4_2/stdlib_cpuinfo.o $LINK_FLAGS"
    $LINKER -o $binDir/pk  \
c_code/4_2/PK.o \
c_code/4_2/stdlib_system.o \
c_code/4_2/stdlib_os.o \
c_code/4_2/stdlib_strutils.o \
c_code/4_2/stdlib_parseutils.o \
c_code/4_2/stdlib_times.o \
c_code/4_2/stdlib_posix.o \
c_code/4_2/stdlib_osproc.o \
c_code/4_2/stdlib_strtabs.o \
c_code/4_2/stdlib_hashes.o \
c_code/4_2/stdlib_streams.o \
c_code/4_2/stdlib_cpuinfo.o $LINK_FLAGS
    ;;
  powerpc64)
    echo "$LINKER -o $binDir/pk  $LINK_FLAGS"
    $LINKER -o $binDir/pk  $LINK_FLAGS
    ;;
  arm)
    echo "$LINKER -o $binDir/pk  $LINK_FLAGS"
    $LINKER -o $binDir/pk  $LINK_FLAGS
    ;;
  sparc)
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/PK.c -o c_code/4_5/PK.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/PK.c -o c_code/4_5/PK.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_system.c -o c_code/4_5/stdlib_system.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_system.c -o c_code/4_5/stdlib_system.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_os.c -o c_code/4_5/stdlib_os.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_os.c -o c_code/4_5/stdlib_os.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_strutils.c -o c_code/4_5/stdlib_strutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_strutils.c -o c_code/4_5/stdlib_strutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_parseutils.c -o c_code/4_5/stdlib_parseutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_parseutils.c -o c_code/4_5/stdlib_parseutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_times.c -o c_code/4_5/stdlib_times.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_times.c -o c_code/4_5/stdlib_times.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_posix.c -o c_code/4_5/stdlib_posix.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_posix.c -o c_code/4_5/stdlib_posix.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_osproc.c -o c_code/4_5/stdlib_osproc.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_osproc.c -o c_code/4_5/stdlib_osproc.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_strtabs.c -o c_code/4_5/stdlib_strtabs.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_strtabs.c -o c_code/4_5/stdlib_strtabs.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_hashes.c -o c_code/4_5/stdlib_hashes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_hashes.c -o c_code/4_5/stdlib_hashes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_streams.c -o c_code/4_5/stdlib_streams.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_streams.c -o c_code/4_5/stdlib_streams.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_cpuinfo.c -o c_code/4_5/stdlib_cpuinfo.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_cpuinfo.c -o c_code/4_5/stdlib_cpuinfo.o
    echo "$LINKER -o $binDir/pk  \
c_code/4_5/PK.o \
c_code/4_5/stdlib_system.o \
c_code/4_5/stdlib_os.o \
c_code/4_5/stdlib_strutils.o \
c_code/4_5/stdlib_parseutils.o \
c_code/4_5/stdlib_times.o \
c_code/4_5/stdlib_posix.o \
c_code/4_5/stdlib_osproc.o \
c_code/4_5/stdlib_strtabs.o \
c_code/4_5/stdlib_hashes.o \
c_code/4_5/stdlib_streams.o \
c_code/4_5/stdlib_cpuinfo.o $LINK_FLAGS"
    $LINKER -o $binDir/pk  \
c_code/4_5/PK.o \
c_code/4_5/stdlib_system.o \
c_code/4_5/stdlib_os.o \
c_code/4_5/stdlib_strutils.o \
c_code/4_5/stdlib_parseutils.o \
c_code/4_5/stdlib_times.o \
c_code/4_5/stdlib_posix.o \
c_code/4_5/stdlib_osproc.o \
c_code/4_5/stdlib_strtabs.o \
c_code/4_5/stdlib_hashes.o \
c_code/4_5/stdlib_streams.o \
c_code/4_5/stdlib_cpuinfo.o $LINK_FLAGS
    ;;
  mips)
    echo "$LINKER -o $binDir/pk  $LINK_FLAGS"
    $LINKER -o $binDir/pk  $LINK_FLAGS
    ;;
  powerpc)
    echo "$LINKER -o $binDir/pk  $LINK_FLAGS"
    $LINKER -o $binDir/pk  $LINK_FLAGS
    ;;
  *)
    echo "Error: no C code generated for: [$myos: $mycpu]"
    exit 1
    ;;
  esac
  ;;
freebsd) 
  case $mycpu in
  i386)
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/PK.c -o c_code/5_1/PK.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/PK.c -o c_code/5_1/PK.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_system.c -o c_code/5_1/stdlib_system.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_system.c -o c_code/5_1/stdlib_system.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_os.c -o c_code/5_1/stdlib_os.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_os.c -o c_code/5_1/stdlib_os.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_strutils.c -o c_code/5_1/stdlib_strutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_strutils.c -o c_code/5_1/stdlib_strutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_parseutils.c -o c_code/5_1/stdlib_parseutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_parseutils.c -o c_code/5_1/stdlib_parseutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_times.c -o c_code/5_1/stdlib_times.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_times.c -o c_code/5_1/stdlib_times.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_posix.c -o c_code/5_1/stdlib_posix.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_posix.c -o c_code/5_1/stdlib_posix.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_osproc.c -o c_code/5_1/stdlib_osproc.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_osproc.c -o c_code/5_1/stdlib_osproc.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_strtabs.c -o c_code/5_1/stdlib_strtabs.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_strtabs.c -o c_code/5_1/stdlib_strtabs.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_hashes.c -o c_code/5_1/stdlib_hashes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_hashes.c -o c_code/5_1/stdlib_hashes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_streams.c -o c_code/5_1/stdlib_streams.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_streams.c -o c_code/5_1/stdlib_streams.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_cpuinfo.c -o c_code/5_1/stdlib_cpuinfo.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_cpuinfo.c -o c_code/5_1/stdlib_cpuinfo.o
    echo "$LINKER -o $binDir/pk  \
c_code/5_1/PK.o \
c_code/5_1/stdlib_system.o \
c_code/5_1/stdlib_os.o \
c_code/5_1/stdlib_strutils.o \
c_code/5_1/stdlib_parseutils.o \
c_code/5_1/stdlib_times.o \
c_code/5_1/stdlib_posix.o \
c_code/5_1/stdlib_osproc.o \
c_code/5_1/stdlib_strtabs.o \
c_code/5_1/stdlib_hashes.o \
c_code/5_1/stdlib_streams.o \
c_code/5_1/stdlib_cpuinfo.o $LINK_FLAGS"
    $LINKER -o $binDir/pk  \
c_code/5_1/PK.o \
c_code/5_1/stdlib_system.o \
c_code/5_1/stdlib_os.o \
c_code/5_1/stdlib_strutils.o \
c_code/5_1/stdlib_parseutils.o \
c_code/5_1/stdlib_times.o \
c_code/5_1/stdlib_posix.o \
c_code/5_1/stdlib_osproc.o \
c_code/5_1/stdlib_strtabs.o \
c_code/5_1/stdlib_hashes.o \
c_code/5_1/stdlib_streams.o \
c_code/5_1/stdlib_cpuinfo.o $LINK_FLAGS
    ;;
  amd64)
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/PK.c -o c_code/5_2/PK.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/PK.c -o c_code/5_2/PK.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_system.c -o c_code/5_2/stdlib_system.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_system.c -o c_code/5_2/stdlib_system.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_os.c -o c_code/5_2/stdlib_os.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_os.c -o c_code/5_2/stdlib_os.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_strutils.c -o c_code/5_2/stdlib_strutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_strutils.c -o c_code/5_2/stdlib_strutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_parseutils.c -o c_code/5_2/stdlib_parseutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_parseutils.c -o c_code/5_2/stdlib_parseutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_times.c -o c_code/5_2/stdlib_times.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_times.c -o c_code/5_2/stdlib_times.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_posix.c -o c_code/5_2/stdlib_posix.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_posix.c -o c_code/5_2/stdlib_posix.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_osproc.c -o c_code/5_2/stdlib_osproc.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_osproc.c -o c_code/5_2/stdlib_osproc.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_strtabs.c -o c_code/5_2/stdlib_strtabs.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_strtabs.c -o c_code/5_2/stdlib_strtabs.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_hashes.c -o c_code/5_2/stdlib_hashes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_hashes.c -o c_code/5_2/stdlib_hashes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_streams.c -o c_code/5_2/stdlib_streams.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_streams.c -o c_code/5_2/stdlib_streams.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_cpuinfo.c -o c_code/5_2/stdlib_cpuinfo.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_cpuinfo.c -o c_code/5_2/stdlib_cpuinfo.o
    echo "$LINKER -o $binDir/pk  \
c_code/5_2/PK.o \
c_code/5_2/stdlib_system.o \
c_code/5_2/stdlib_os.o \
c_code/5_2/stdlib_strutils.o \
c_code/5_2/stdlib_parseutils.o \
c_code/5_2/stdlib_times.o \
c_code/5_2/stdlib_posix.o \
c_code/5_2/stdlib_osproc.o \
c_code/5_2/stdlib_strtabs.o \
c_code/5_2/stdlib_hashes.o \
c_code/5_2/stdlib_streams.o \
c_code/5_2/stdlib_cpuinfo.o $LINK_FLAGS"
    $LINKER -o $binDir/pk  \
c_code/5_2/PK.o \
c_code/5_2/stdlib_system.o \
c_code/5_2/stdlib_os.o \
c_code/5_2/stdlib_strutils.o \
c_code/5_2/stdlib_parseutils.o \
c_code/5_2/stdlib_times.o \
c_code/5_2/stdlib_posix.o \
c_code/5_2/stdlib_osproc.o \
c_code/5_2/stdlib_strtabs.o \
c_code/5_2/stdlib_hashes.o \
c_code/5_2/stdlib_streams.o \
c_code/5_2/stdlib_cpuinfo.o $LINK_FLAGS
    ;;
  powerpc64)
    echo "$LINKER -o $binDir/pk  $LINK_FLAGS"
    $LINKER -o $binDir/pk  $LINK_FLAGS
    ;;
  arm)
    echo "$LINKER -o $binDir/pk  $LINK_FLAGS"
    $LINKER -o $binDir/pk  $LINK_FLAGS
    ;;
  sparc)
    echo "$LINKER -o $binDir/pk  $LINK_FLAGS"
    $LINKER -o $binDir/pk  $LINK_FLAGS
    ;;
  mips)
    echo "$LINKER -o $binDir/pk  $LINK_FLAGS"
    $LINKER -o $binDir/pk  $LINK_FLAGS
    ;;
  powerpc)
    echo "$LINKER -o $binDir/pk  $LINK_FLAGS"
    $LINKER -o $binDir/pk  $LINK_FLAGS
    ;;
  *)
    echo "Error: no C code generated for: [$myos: $mycpu]"
    exit 1
    ;;
  esac
  ;;
netbsd) 
  case $mycpu in
  i386)
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/PK.c -o c_code/6_1/PK.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/PK.c -o c_code/6_1/PK.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_system.c -o c_code/6_1/stdlib_system.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_system.c -o c_code/6_1/stdlib_system.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_os.c -o c_code/6_1/stdlib_os.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_os.c -o c_code/6_1/stdlib_os.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_strutils.c -o c_code/6_1/stdlib_strutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_strutils.c -o c_code/6_1/stdlib_strutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_parseutils.c -o c_code/6_1/stdlib_parseutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_parseutils.c -o c_code/6_1/stdlib_parseutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_times.c -o c_code/6_1/stdlib_times.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_times.c -o c_code/6_1/stdlib_times.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_posix.c -o c_code/6_1/stdlib_posix.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_posix.c -o c_code/6_1/stdlib_posix.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_osproc.c -o c_code/6_1/stdlib_osproc.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_osproc.c -o c_code/6_1/stdlib_osproc.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_strtabs.c -o c_code/6_1/stdlib_strtabs.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_strtabs.c -o c_code/6_1/stdlib_strtabs.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_hashes.c -o c_code/6_1/stdlib_hashes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_hashes.c -o c_code/6_1/stdlib_hashes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_streams.c -o c_code/6_1/stdlib_streams.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_streams.c -o c_code/6_1/stdlib_streams.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_cpuinfo.c -o c_code/6_1/stdlib_cpuinfo.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_cpuinfo.c -o c_code/6_1/stdlib_cpuinfo.o
    echo "$LINKER -o $binDir/pk  \
c_code/6_1/PK.o \
c_code/6_1/stdlib_system.o \
c_code/6_1/stdlib_os.o \
c_code/6_1/stdlib_strutils.o \
c_code/6_1/stdlib_parseutils.o \
c_code/6_1/stdlib_times.o \
c_code/6_1/stdlib_posix.o \
c_code/6_1/stdlib_osproc.o \
c_code/6_1/stdlib_strtabs.o \
c_code/6_1/stdlib_hashes.o \
c_code/6_1/stdlib_streams.o \
c_code/6_1/stdlib_cpuinfo.o $LINK_FLAGS"
    $LINKER -o $binDir/pk  \
c_code/6_1/PK.o \
c_code/6_1/stdlib_system.o \
c_code/6_1/stdlib_os.o \
c_code/6_1/stdlib_strutils.o \
c_code/6_1/stdlib_parseutils.o \
c_code/6_1/stdlib_times.o \
c_code/6_1/stdlib_posix.o \
c_code/6_1/stdlib_osproc.o \
c_code/6_1/stdlib_strtabs.o \
c_code/6_1/stdlib_hashes.o \
c_code/6_1/stdlib_streams.o \
c_code/6_1/stdlib_cpuinfo.o $LINK_FLAGS
    ;;
  amd64)
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/PK.c -o c_code/6_2/PK.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/PK.c -o c_code/6_2/PK.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_system.c -o c_code/6_2/stdlib_system.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_system.c -o c_code/6_2/stdlib_system.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_os.c -o c_code/6_2/stdlib_os.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_os.c -o c_code/6_2/stdlib_os.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_strutils.c -o c_code/6_2/stdlib_strutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_strutils.c -o c_code/6_2/stdlib_strutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_parseutils.c -o c_code/6_2/stdlib_parseutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_parseutils.c -o c_code/6_2/stdlib_parseutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_times.c -o c_code/6_2/stdlib_times.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_times.c -o c_code/6_2/stdlib_times.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_posix.c -o c_code/6_2/stdlib_posix.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_posix.c -o c_code/6_2/stdlib_posix.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_osproc.c -o c_code/6_2/stdlib_osproc.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_osproc.c -o c_code/6_2/stdlib_osproc.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_strtabs.c -o c_code/6_2/stdlib_strtabs.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_strtabs.c -o c_code/6_2/stdlib_strtabs.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_hashes.c -o c_code/6_2/stdlib_hashes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_hashes.c -o c_code/6_2/stdlib_hashes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_streams.c -o c_code/6_2/stdlib_streams.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_streams.c -o c_code/6_2/stdlib_streams.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_cpuinfo.c -o c_code/6_2/stdlib_cpuinfo.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_cpuinfo.c -o c_code/6_2/stdlib_cpuinfo.o
    echo "$LINKER -o $binDir/pk  \
c_code/6_2/PK.o \
c_code/6_2/stdlib_system.o \
c_code/6_2/stdlib_os.o \
c_code/6_2/stdlib_strutils.o \
c_code/6_2/stdlib_parseutils.o \
c_code/6_2/stdlib_times.o \
c_code/6_2/stdlib_posix.o \
c_code/6_2/stdlib_osproc.o \
c_code/6_2/stdlib_strtabs.o \
c_code/6_2/stdlib_hashes.o \
c_code/6_2/stdlib_streams.o \
c_code/6_2/stdlib_cpuinfo.o $LINK_FLAGS"
    $LINKER -o $binDir/pk  \
c_code/6_2/PK.o \
c_code/6_2/stdlib_system.o \
c_code/6_2/stdlib_os.o \
c_code/6_2/stdlib_strutils.o \
c_code/6_2/stdlib_parseutils.o \
c_code/6_2/stdlib_times.o \
c_code/6_2/stdlib_posix.o \
c_code/6_2/stdlib_osproc.o \
c_code/6_2/stdlib_strtabs.o \
c_code/6_2/stdlib_hashes.o \
c_code/6_2/stdlib_streams.o \
c_code/6_2/stdlib_cpuinfo.o $LINK_FLAGS
    ;;
  powerpc64)
    echo "$LINKER -o $binDir/pk  $LINK_FLAGS"
    $LINKER -o $binDir/pk  $LINK_FLAGS
    ;;
  arm)
    echo "$LINKER -o $binDir/pk  $LINK_FLAGS"
    $LINKER -o $binDir/pk  $LINK_FLAGS
    ;;
  sparc)
    echo "$LINKER -o $binDir/pk  $LINK_FLAGS"
    $LINKER -o $binDir/pk  $LINK_FLAGS
    ;;
  mips)
    echo "$LINKER -o $binDir/pk  $LINK_FLAGS"
    $LINKER -o $binDir/pk  $LINK_FLAGS
    ;;
  powerpc)
    echo "$LINKER -o $binDir/pk  $LINK_FLAGS"
    $LINKER -o $binDir/pk  $LINK_FLAGS
    ;;
  *)
    echo "Error: no C code generated for: [$myos: $mycpu]"
    exit 1
    ;;
  esac
  ;;
openbsd) 
  case $mycpu in
  i386)
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/PK.c -o c_code/7_1/PK.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/PK.c -o c_code/7_1/PK.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_system.c -o c_code/7_1/stdlib_system.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_system.c -o c_code/7_1/stdlib_system.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_os.c -o c_code/7_1/stdlib_os.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_os.c -o c_code/7_1/stdlib_os.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_strutils.c -o c_code/7_1/stdlib_strutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_strutils.c -o c_code/7_1/stdlib_strutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_parseutils.c -o c_code/7_1/stdlib_parseutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_parseutils.c -o c_code/7_1/stdlib_parseutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_times.c -o c_code/7_1/stdlib_times.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_times.c -o c_code/7_1/stdlib_times.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_posix.c -o c_code/7_1/stdlib_posix.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_posix.c -o c_code/7_1/stdlib_posix.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_osproc.c -o c_code/7_1/stdlib_osproc.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_osproc.c -o c_code/7_1/stdlib_osproc.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_strtabs.c -o c_code/7_1/stdlib_strtabs.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_strtabs.c -o c_code/7_1/stdlib_strtabs.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_hashes.c -o c_code/7_1/stdlib_hashes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_hashes.c -o c_code/7_1/stdlib_hashes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_streams.c -o c_code/7_1/stdlib_streams.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_streams.c -o c_code/7_1/stdlib_streams.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_cpuinfo.c -o c_code/7_1/stdlib_cpuinfo.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_cpuinfo.c -o c_code/7_1/stdlib_cpuinfo.o
    echo "$LINKER -o $binDir/pk  \
c_code/7_1/PK.o \
c_code/7_1/stdlib_system.o \
c_code/7_1/stdlib_os.o \
c_code/7_1/stdlib_strutils.o \
c_code/7_1/stdlib_parseutils.o \
c_code/7_1/stdlib_times.o \
c_code/7_1/stdlib_posix.o \
c_code/7_1/stdlib_osproc.o \
c_code/7_1/stdlib_strtabs.o \
c_code/7_1/stdlib_hashes.o \
c_code/7_1/stdlib_streams.o \
c_code/7_1/stdlib_cpuinfo.o $LINK_FLAGS"
    $LINKER -o $binDir/pk  \
c_code/7_1/PK.o \
c_code/7_1/stdlib_system.o \
c_code/7_1/stdlib_os.o \
c_code/7_1/stdlib_strutils.o \
c_code/7_1/stdlib_parseutils.o \
c_code/7_1/stdlib_times.o \
c_code/7_1/stdlib_posix.o \
c_code/7_1/stdlib_osproc.o \
c_code/7_1/stdlib_strtabs.o \
c_code/7_1/stdlib_hashes.o \
c_code/7_1/stdlib_streams.o \
c_code/7_1/stdlib_cpuinfo.o $LINK_FLAGS
    ;;
  amd64)
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/PK.c -o c_code/7_2/PK.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/PK.c -o c_code/7_2/PK.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_system.c -o c_code/7_2/stdlib_system.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_system.c -o c_code/7_2/stdlib_system.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_os.c -o c_code/7_2/stdlib_os.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_os.c -o c_code/7_2/stdlib_os.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_strutils.c -o c_code/7_2/stdlib_strutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_strutils.c -o c_code/7_2/stdlib_strutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_parseutils.c -o c_code/7_2/stdlib_parseutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_parseutils.c -o c_code/7_2/stdlib_parseutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_times.c -o c_code/7_2/stdlib_times.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_times.c -o c_code/7_2/stdlib_times.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_posix.c -o c_code/7_2/stdlib_posix.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_posix.c -o c_code/7_2/stdlib_posix.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_osproc.c -o c_code/7_2/stdlib_osproc.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_osproc.c -o c_code/7_2/stdlib_osproc.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_strtabs.c -o c_code/7_2/stdlib_strtabs.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_strtabs.c -o c_code/7_2/stdlib_strtabs.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_hashes.c -o c_code/7_2/stdlib_hashes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_hashes.c -o c_code/7_2/stdlib_hashes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_streams.c -o c_code/7_2/stdlib_streams.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_streams.c -o c_code/7_2/stdlib_streams.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_cpuinfo.c -o c_code/7_2/stdlib_cpuinfo.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_cpuinfo.c -o c_code/7_2/stdlib_cpuinfo.o
    echo "$LINKER -o $binDir/pk  \
c_code/7_2/PK.o \
c_code/7_2/stdlib_system.o \
c_code/7_2/stdlib_os.o \
c_code/7_2/stdlib_strutils.o \
c_code/7_2/stdlib_parseutils.o \
c_code/7_2/stdlib_times.o \
c_code/7_2/stdlib_posix.o \
c_code/7_2/stdlib_osproc.o \
c_code/7_2/stdlib_strtabs.o \
c_code/7_2/stdlib_hashes.o \
c_code/7_2/stdlib_streams.o \
c_code/7_2/stdlib_cpuinfo.o $LINK_FLAGS"
    $LINKER -o $binDir/pk  \
c_code/7_2/PK.o \
c_code/7_2/stdlib_system.o \
c_code/7_2/stdlib_os.o \
c_code/7_2/stdlib_strutils.o \
c_code/7_2/stdlib_parseutils.o \
c_code/7_2/stdlib_times.o \
c_code/7_2/stdlib_posix.o \
c_code/7_2/stdlib_osproc.o \
c_code/7_2/stdlib_strtabs.o \
c_code/7_2/stdlib_hashes.o \
c_code/7_2/stdlib_streams.o \
c_code/7_2/stdlib_cpuinfo.o $LINK_FLAGS
    ;;
  powerpc64)
    echo "$LINKER -o $binDir/pk  $LINK_FLAGS"
    $LINKER -o $binDir/pk  $LINK_FLAGS
    ;;
  arm)
    echo "$LINKER -o $binDir/pk  $LINK_FLAGS"
    $LINKER -o $binDir/pk  $LINK_FLAGS
    ;;
  sparc)
    echo "$LINKER -o $binDir/pk  $LINK_FLAGS"
    $LINKER -o $binDir/pk  $LINK_FLAGS
    ;;
  mips)
    echo "$LINKER -o $binDir/pk  $LINK_FLAGS"
    $LINKER -o $binDir/pk  $LINK_FLAGS
    ;;
  powerpc)
    echo "$LINKER -o $binDir/pk  $LINK_FLAGS"
    $LINKER -o $binDir/pk  $LINK_FLAGS
    ;;
  *)
    echo "Error: no C code generated for: [$myos: $mycpu]"
    exit 1
    ;;
  esac
  ;;
haiku) 
  case $mycpu in
  i386)
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/PK.c -o c_code/8_1/PK.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/PK.c -o c_code/8_1/PK.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_system.c -o c_code/8_1/stdlib_system.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_system.c -o c_code/8_1/stdlib_system.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_os.c -o c_code/8_1/stdlib_os.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_os.c -o c_code/8_1/stdlib_os.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_strutils.c -o c_code/8_1/stdlib_strutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_strutils.c -o c_code/8_1/stdlib_strutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_parseutils.c -o c_code/8_1/stdlib_parseutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_parseutils.c -o c_code/8_1/stdlib_parseutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_times.c -o c_code/8_1/stdlib_times.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_times.c -o c_code/8_1/stdlib_times.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_posix.c -o c_code/8_1/stdlib_posix.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_posix.c -o c_code/8_1/stdlib_posix.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_osproc.c -o c_code/8_1/stdlib_osproc.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_osproc.c -o c_code/8_1/stdlib_osproc.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_strtabs.c -o c_code/8_1/stdlib_strtabs.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_strtabs.c -o c_code/8_1/stdlib_strtabs.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_hashes.c -o c_code/8_1/stdlib_hashes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_hashes.c -o c_code/8_1/stdlib_hashes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_streams.c -o c_code/8_1/stdlib_streams.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_streams.c -o c_code/8_1/stdlib_streams.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_cpuinfo.c -o c_code/8_1/stdlib_cpuinfo.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_cpuinfo.c -o c_code/8_1/stdlib_cpuinfo.o
    echo "$LINKER -o $binDir/pk  \
c_code/8_1/PK.o \
c_code/8_1/stdlib_system.o \
c_code/8_1/stdlib_os.o \
c_code/8_1/stdlib_strutils.o \
c_code/8_1/stdlib_parseutils.o \
c_code/8_1/stdlib_times.o \
c_code/8_1/stdlib_posix.o \
c_code/8_1/stdlib_osproc.o \
c_code/8_1/stdlib_strtabs.o \
c_code/8_1/stdlib_hashes.o \
c_code/8_1/stdlib_streams.o \
c_code/8_1/stdlib_cpuinfo.o $LINK_FLAGS"
    $LINKER -o $binDir/pk  \
c_code/8_1/PK.o \
c_code/8_1/stdlib_system.o \
c_code/8_1/stdlib_os.o \
c_code/8_1/stdlib_strutils.o \
c_code/8_1/stdlib_parseutils.o \
c_code/8_1/stdlib_times.o \
c_code/8_1/stdlib_posix.o \
c_code/8_1/stdlib_osproc.o \
c_code/8_1/stdlib_strtabs.o \
c_code/8_1/stdlib_hashes.o \
c_code/8_1/stdlib_streams.o \
c_code/8_1/stdlib_cpuinfo.o $LINK_FLAGS
    ;;
  amd64)
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/PK.c -o c_code/8_2/PK.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/PK.c -o c_code/8_2/PK.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_system.c -o c_code/8_2/stdlib_system.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_system.c -o c_code/8_2/stdlib_system.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_os.c -o c_code/8_2/stdlib_os.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_os.c -o c_code/8_2/stdlib_os.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_strutils.c -o c_code/8_2/stdlib_strutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_strutils.c -o c_code/8_2/stdlib_strutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_parseutils.c -o c_code/8_2/stdlib_parseutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_parseutils.c -o c_code/8_2/stdlib_parseutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_times.c -o c_code/8_2/stdlib_times.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_times.c -o c_code/8_2/stdlib_times.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_posix.c -o c_code/8_2/stdlib_posix.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_posix.c -o c_code/8_2/stdlib_posix.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_osproc.c -o c_code/8_2/stdlib_osproc.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_osproc.c -o c_code/8_2/stdlib_osproc.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_strtabs.c -o c_code/8_2/stdlib_strtabs.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_strtabs.c -o c_code/8_2/stdlib_strtabs.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_hashes.c -o c_code/8_2/stdlib_hashes.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_hashes.c -o c_code/8_2/stdlib_hashes.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_streams.c -o c_code/8_2/stdlib_streams.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_streams.c -o c_code/8_2/stdlib_streams.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_cpuinfo.c -o c_code/8_2/stdlib_cpuinfo.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_cpuinfo.c -o c_code/8_2/stdlib_cpuinfo.o
    echo "$LINKER -o $binDir/pk  \
c_code/8_2/PK.o \
c_code/8_2/stdlib_system.o \
c_code/8_2/stdlib_os.o \
c_code/8_2/stdlib_strutils.o \
c_code/8_2/stdlib_parseutils.o \
c_code/8_2/stdlib_times.o \
c_code/8_2/stdlib_posix.o \
c_code/8_2/stdlib_osproc.o \
c_code/8_2/stdlib_strtabs.o \
c_code/8_2/stdlib_hashes.o \
c_code/8_2/stdlib_streams.o \
c_code/8_2/stdlib_cpuinfo.o $LINK_FLAGS"
    $LINKER -o $binDir/pk  \
c_code/8_2/PK.o \
c_code/8_2/stdlib_system.o \
c_code/8_2/stdlib_os.o \
c_code/8_2/stdlib_strutils.o \
c_code/8_2/stdlib_parseutils.o \
c_code/8_2/stdlib_times.o \
c_code/8_2/stdlib_posix.o \
c_code/8_2/stdlib_osproc.o \
c_code/8_2/stdlib_strtabs.o \
c_code/8_2/stdlib_hashes.o \
c_code/8_2/stdlib_streams.o \
c_code/8_2/stdlib_cpuinfo.o $LINK_FLAGS
    ;;
  powerpc64)
    echo "$LINKER -o $binDir/pk  $LINK_FLAGS"
    $LINKER -o $binDir/pk  $LINK_FLAGS
    ;;
  arm)
    echo "$LINKER -o $binDir/pk  $LINK_FLAGS"
    $LINKER -o $binDir/pk  $LINK_FLAGS
    ;;
  sparc)
    echo "$LINKER -o $binDir/pk  $LINK_FLAGS"
    $LINKER -o $binDir/pk  $LINK_FLAGS
    ;;
  mips)
    echo "$LINKER -o $binDir/pk  $LINK_FLAGS"
    $LINKER -o $binDir/pk  $LINK_FLAGS
    ;;
  powerpc)
    echo "$LINKER -o $binDir/pk  $LINK_FLAGS"
    $LINKER -o $binDir/pk  $LINK_FLAGS
    ;;
  *)
    echo "Error: no C code generated for: [$myos: $mycpu]"
    exit 1
    ;;
  esac
  ;;
*) 
  echo "Error: no C code generated for: [$myos: $mycpu]"
  exit 1
  ;;
esac

echo "SUCCESS"

