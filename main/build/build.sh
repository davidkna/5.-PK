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
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/main.c -o c_code/1_1/main.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/main.c -o c_code/1_1/main.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_system.c -o c_code/1_1/stdlib_system.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_system.c -o c_code/1_1/stdlib_system.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/bench.c -o c_code/1_1/bench.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/bench.c -o c_code/1_1/bench.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_times.c -o c_code/1_1/stdlib_times.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_times.c -o c_code/1_1/stdlib_times.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_strutils.c -o c_code/1_1/stdlib_strutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_strutils.c -o c_code/1_1/stdlib_strutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_parseutils.c -o c_code/1_1/stdlib_parseutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_parseutils.c -o c_code/1_1/stdlib_parseutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_winlean.c -o c_code/1_1/stdlib_winlean.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_winlean.c -o c_code/1_1/stdlib_winlean.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_os.c -o c_code/1_1/stdlib_os.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_os.c -o c_code/1_1/stdlib_os.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/saveData.c -o c_code/1_1/saveData.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/saveData.c -o c_code/1_1/saveData.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_algorithm.c -o c_code/1_1/stdlib_algorithm.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_algorithm.c -o c_code/1_1/stdlib_algorithm.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/sorts.c -o c_code/1_1/sorts.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/sorts.c -o c_code/1_1/sorts.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_sequtils.c -o c_code/1_1/stdlib_sequtils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_sequtils.c -o c_code/1_1/stdlib_sequtils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/listSpawner.c -o c_code/1_1/listSpawner.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/listSpawner.c -o c_code/1_1/listSpawner.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/shuffle.c -o c_code/1_1/shuffle.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/shuffle.c -o c_code/1_1/shuffle.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_math.c -o c_code/1_1/stdlib_math.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/stdlib_math.c -o c_code/1_1/stdlib_math.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_1/radixListSpawner.c -o c_code/1_1/radixListSpawner.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_1/radixListSpawner.c -o c_code/1_1/radixListSpawner.o
    echo "$LINKER -o $binDir/main  \
c_code/1_1/main.o \
c_code/1_1/stdlib_system.o \
c_code/1_1/bench.o \
c_code/1_1/stdlib_times.o \
c_code/1_1/stdlib_strutils.o \
c_code/1_1/stdlib_parseutils.o \
c_code/1_1/stdlib_winlean.o \
c_code/1_1/stdlib_os.o \
c_code/1_1/saveData.o \
c_code/1_1/stdlib_algorithm.o \
c_code/1_1/sorts.o \
c_code/1_1/stdlib_sequtils.o \
c_code/1_1/listSpawner.o \
c_code/1_1/shuffle.o \
c_code/1_1/stdlib_math.o \
c_code/1_1/radixListSpawner.o $LINK_FLAGS"
    $LINKER -o $binDir/main  \
c_code/1_1/main.o \
c_code/1_1/stdlib_system.o \
c_code/1_1/bench.o \
c_code/1_1/stdlib_times.o \
c_code/1_1/stdlib_strutils.o \
c_code/1_1/stdlib_parseutils.o \
c_code/1_1/stdlib_winlean.o \
c_code/1_1/stdlib_os.o \
c_code/1_1/saveData.o \
c_code/1_1/stdlib_algorithm.o \
c_code/1_1/sorts.o \
c_code/1_1/stdlib_sequtils.o \
c_code/1_1/listSpawner.o \
c_code/1_1/shuffle.o \
c_code/1_1/stdlib_math.o \
c_code/1_1/radixListSpawner.o $LINK_FLAGS
    ;;
  amd64)
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/main.c -o c_code/1_2/main.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/main.c -o c_code/1_2/main.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_system.c -o c_code/1_2/stdlib_system.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_system.c -o c_code/1_2/stdlib_system.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/bench.c -o c_code/1_2/bench.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/bench.c -o c_code/1_2/bench.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_times.c -o c_code/1_2/stdlib_times.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_times.c -o c_code/1_2/stdlib_times.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_strutils.c -o c_code/1_2/stdlib_strutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_strutils.c -o c_code/1_2/stdlib_strutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_parseutils.c -o c_code/1_2/stdlib_parseutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_parseutils.c -o c_code/1_2/stdlib_parseutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_winlean.c -o c_code/1_2/stdlib_winlean.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_winlean.c -o c_code/1_2/stdlib_winlean.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_os.c -o c_code/1_2/stdlib_os.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_os.c -o c_code/1_2/stdlib_os.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/saveData.c -o c_code/1_2/saveData.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/saveData.c -o c_code/1_2/saveData.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_algorithm.c -o c_code/1_2/stdlib_algorithm.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_algorithm.c -o c_code/1_2/stdlib_algorithm.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/sorts.c -o c_code/1_2/sorts.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/sorts.c -o c_code/1_2/sorts.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_sequtils.c -o c_code/1_2/stdlib_sequtils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_sequtils.c -o c_code/1_2/stdlib_sequtils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/listSpawner.c -o c_code/1_2/listSpawner.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/listSpawner.c -o c_code/1_2/listSpawner.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/shuffle.c -o c_code/1_2/shuffle.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/shuffle.c -o c_code/1_2/shuffle.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_math.c -o c_code/1_2/stdlib_math.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/stdlib_math.c -o c_code/1_2/stdlib_math.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/1_2/radixListSpawner.c -o c_code/1_2/radixListSpawner.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/1_2/radixListSpawner.c -o c_code/1_2/radixListSpawner.o
    echo "$LINKER -o $binDir/main  \
c_code/1_2/main.o \
c_code/1_2/stdlib_system.o \
c_code/1_2/bench.o \
c_code/1_2/stdlib_times.o \
c_code/1_2/stdlib_strutils.o \
c_code/1_2/stdlib_parseutils.o \
c_code/1_2/stdlib_winlean.o \
c_code/1_2/stdlib_os.o \
c_code/1_2/saveData.o \
c_code/1_2/stdlib_algorithm.o \
c_code/1_2/sorts.o \
c_code/1_2/stdlib_sequtils.o \
c_code/1_2/listSpawner.o \
c_code/1_2/shuffle.o \
c_code/1_2/stdlib_math.o \
c_code/1_2/radixListSpawner.o $LINK_FLAGS"
    $LINKER -o $binDir/main  \
c_code/1_2/main.o \
c_code/1_2/stdlib_system.o \
c_code/1_2/bench.o \
c_code/1_2/stdlib_times.o \
c_code/1_2/stdlib_strutils.o \
c_code/1_2/stdlib_parseutils.o \
c_code/1_2/stdlib_winlean.o \
c_code/1_2/stdlib_os.o \
c_code/1_2/saveData.o \
c_code/1_2/stdlib_algorithm.o \
c_code/1_2/sorts.o \
c_code/1_2/stdlib_sequtils.o \
c_code/1_2/listSpawner.o \
c_code/1_2/shuffle.o \
c_code/1_2/stdlib_math.o \
c_code/1_2/radixListSpawner.o $LINK_FLAGS
    ;;
  powerpc64)
    echo "$LINKER -o $binDir/main  $LINK_FLAGS"
    $LINKER -o $binDir/main  $LINK_FLAGS
    ;;
  arm)
    echo "$LINKER -o $binDir/main  $LINK_FLAGS"
    $LINKER -o $binDir/main  $LINK_FLAGS
    ;;
  sparc)
    echo "$LINKER -o $binDir/main  $LINK_FLAGS"
    $LINKER -o $binDir/main  $LINK_FLAGS
    ;;
  mips)
    echo "$LINKER -o $binDir/main  $LINK_FLAGS"
    $LINKER -o $binDir/main  $LINK_FLAGS
    ;;
  powerpc)
    echo "$LINKER -o $binDir/main  $LINK_FLAGS"
    $LINKER -o $binDir/main  $LINK_FLAGS
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
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/main.c -o c_code/2_1/main.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/main.c -o c_code/2_1/main.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_system.c -o c_code/2_1/stdlib_system.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_system.c -o c_code/2_1/stdlib_system.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/bench.c -o c_code/2_1/bench.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/bench.c -o c_code/2_1/bench.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_times.c -o c_code/2_1/stdlib_times.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_times.c -o c_code/2_1/stdlib_times.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_strutils.c -o c_code/2_1/stdlib_strutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_strutils.c -o c_code/2_1/stdlib_strutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_parseutils.c -o c_code/2_1/stdlib_parseutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_parseutils.c -o c_code/2_1/stdlib_parseutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_os.c -o c_code/2_1/stdlib_os.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_os.c -o c_code/2_1/stdlib_os.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_posix.c -o c_code/2_1/stdlib_posix.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_posix.c -o c_code/2_1/stdlib_posix.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/saveData.c -o c_code/2_1/saveData.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/saveData.c -o c_code/2_1/saveData.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_algorithm.c -o c_code/2_1/stdlib_algorithm.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_algorithm.c -o c_code/2_1/stdlib_algorithm.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/sorts.c -o c_code/2_1/sorts.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/sorts.c -o c_code/2_1/sorts.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_sequtils.c -o c_code/2_1/stdlib_sequtils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_sequtils.c -o c_code/2_1/stdlib_sequtils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/listSpawner.c -o c_code/2_1/listSpawner.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/listSpawner.c -o c_code/2_1/listSpawner.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/shuffle.c -o c_code/2_1/shuffle.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/shuffle.c -o c_code/2_1/shuffle.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_math.c -o c_code/2_1/stdlib_math.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/stdlib_math.c -o c_code/2_1/stdlib_math.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_1/radixListSpawner.c -o c_code/2_1/radixListSpawner.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_1/radixListSpawner.c -o c_code/2_1/radixListSpawner.o
    echo "$LINKER -o $binDir/main  \
c_code/2_1/main.o \
c_code/2_1/stdlib_system.o \
c_code/2_1/bench.o \
c_code/2_1/stdlib_times.o \
c_code/2_1/stdlib_strutils.o \
c_code/2_1/stdlib_parseutils.o \
c_code/2_1/stdlib_os.o \
c_code/2_1/stdlib_posix.o \
c_code/2_1/saveData.o \
c_code/2_1/stdlib_algorithm.o \
c_code/2_1/sorts.o \
c_code/2_1/stdlib_sequtils.o \
c_code/2_1/listSpawner.o \
c_code/2_1/shuffle.o \
c_code/2_1/stdlib_math.o \
c_code/2_1/radixListSpawner.o $LINK_FLAGS"
    $LINKER -o $binDir/main  \
c_code/2_1/main.o \
c_code/2_1/stdlib_system.o \
c_code/2_1/bench.o \
c_code/2_1/stdlib_times.o \
c_code/2_1/stdlib_strutils.o \
c_code/2_1/stdlib_parseutils.o \
c_code/2_1/stdlib_os.o \
c_code/2_1/stdlib_posix.o \
c_code/2_1/saveData.o \
c_code/2_1/stdlib_algorithm.o \
c_code/2_1/sorts.o \
c_code/2_1/stdlib_sequtils.o \
c_code/2_1/listSpawner.o \
c_code/2_1/shuffle.o \
c_code/2_1/stdlib_math.o \
c_code/2_1/radixListSpawner.o $LINK_FLAGS
    ;;
  amd64)
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/main.c -o c_code/2_2/main.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/main.c -o c_code/2_2/main.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_system.c -o c_code/2_2/stdlib_system.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_system.c -o c_code/2_2/stdlib_system.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/bench.c -o c_code/2_2/bench.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/bench.c -o c_code/2_2/bench.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_times.c -o c_code/2_2/stdlib_times.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_times.c -o c_code/2_2/stdlib_times.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_strutils.c -o c_code/2_2/stdlib_strutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_strutils.c -o c_code/2_2/stdlib_strutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_parseutils.c -o c_code/2_2/stdlib_parseutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_parseutils.c -o c_code/2_2/stdlib_parseutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_os.c -o c_code/2_2/stdlib_os.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_os.c -o c_code/2_2/stdlib_os.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_posix.c -o c_code/2_2/stdlib_posix.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_posix.c -o c_code/2_2/stdlib_posix.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/saveData.c -o c_code/2_2/saveData.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/saveData.c -o c_code/2_2/saveData.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_algorithm.c -o c_code/2_2/stdlib_algorithm.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_algorithm.c -o c_code/2_2/stdlib_algorithm.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/sorts.c -o c_code/2_2/sorts.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/sorts.c -o c_code/2_2/sorts.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_sequtils.c -o c_code/2_2/stdlib_sequtils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_sequtils.c -o c_code/2_2/stdlib_sequtils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/listSpawner.c -o c_code/2_2/listSpawner.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/listSpawner.c -o c_code/2_2/listSpawner.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/shuffle.c -o c_code/2_2/shuffle.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/shuffle.c -o c_code/2_2/shuffle.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_math.c -o c_code/2_2/stdlib_math.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/stdlib_math.c -o c_code/2_2/stdlib_math.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_2/radixListSpawner.c -o c_code/2_2/radixListSpawner.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_2/radixListSpawner.c -o c_code/2_2/radixListSpawner.o
    echo "$LINKER -o $binDir/main  \
c_code/2_2/main.o \
c_code/2_2/stdlib_system.o \
c_code/2_2/bench.o \
c_code/2_2/stdlib_times.o \
c_code/2_2/stdlib_strutils.o \
c_code/2_2/stdlib_parseutils.o \
c_code/2_2/stdlib_os.o \
c_code/2_2/stdlib_posix.o \
c_code/2_2/saveData.o \
c_code/2_2/stdlib_algorithm.o \
c_code/2_2/sorts.o \
c_code/2_2/stdlib_sequtils.o \
c_code/2_2/listSpawner.o \
c_code/2_2/shuffle.o \
c_code/2_2/stdlib_math.o \
c_code/2_2/radixListSpawner.o $LINK_FLAGS"
    $LINKER -o $binDir/main  \
c_code/2_2/main.o \
c_code/2_2/stdlib_system.o \
c_code/2_2/bench.o \
c_code/2_2/stdlib_times.o \
c_code/2_2/stdlib_strutils.o \
c_code/2_2/stdlib_parseutils.o \
c_code/2_2/stdlib_os.o \
c_code/2_2/stdlib_posix.o \
c_code/2_2/saveData.o \
c_code/2_2/stdlib_algorithm.o \
c_code/2_2/sorts.o \
c_code/2_2/stdlib_sequtils.o \
c_code/2_2/listSpawner.o \
c_code/2_2/shuffle.o \
c_code/2_2/stdlib_math.o \
c_code/2_2/radixListSpawner.o $LINK_FLAGS
    ;;
  powerpc64)
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/main.c -o c_code/2_3/main.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/main.c -o c_code/2_3/main.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_system.c -o c_code/2_3/stdlib_system.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_system.c -o c_code/2_3/stdlib_system.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/bench.c -o c_code/2_3/bench.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/bench.c -o c_code/2_3/bench.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_times.c -o c_code/2_3/stdlib_times.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_times.c -o c_code/2_3/stdlib_times.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_strutils.c -o c_code/2_3/stdlib_strutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_strutils.c -o c_code/2_3/stdlib_strutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_parseutils.c -o c_code/2_3/stdlib_parseutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_parseutils.c -o c_code/2_3/stdlib_parseutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_os.c -o c_code/2_3/stdlib_os.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_os.c -o c_code/2_3/stdlib_os.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_posix.c -o c_code/2_3/stdlib_posix.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_posix.c -o c_code/2_3/stdlib_posix.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/saveData.c -o c_code/2_3/saveData.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/saveData.c -o c_code/2_3/saveData.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_algorithm.c -o c_code/2_3/stdlib_algorithm.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_algorithm.c -o c_code/2_3/stdlib_algorithm.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/sorts.c -o c_code/2_3/sorts.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/sorts.c -o c_code/2_3/sorts.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_sequtils.c -o c_code/2_3/stdlib_sequtils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_sequtils.c -o c_code/2_3/stdlib_sequtils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/listSpawner.c -o c_code/2_3/listSpawner.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/listSpawner.c -o c_code/2_3/listSpawner.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/shuffle.c -o c_code/2_3/shuffle.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/shuffle.c -o c_code/2_3/shuffle.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_math.c -o c_code/2_3/stdlib_math.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/stdlib_math.c -o c_code/2_3/stdlib_math.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_3/radixListSpawner.c -o c_code/2_3/radixListSpawner.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_3/radixListSpawner.c -o c_code/2_3/radixListSpawner.o
    echo "$LINKER -o $binDir/main  \
c_code/2_3/main.o \
c_code/2_3/stdlib_system.o \
c_code/2_3/bench.o \
c_code/2_3/stdlib_times.o \
c_code/2_3/stdlib_strutils.o \
c_code/2_3/stdlib_parseutils.o \
c_code/2_3/stdlib_os.o \
c_code/2_3/stdlib_posix.o \
c_code/2_3/saveData.o \
c_code/2_3/stdlib_algorithm.o \
c_code/2_3/sorts.o \
c_code/2_3/stdlib_sequtils.o \
c_code/2_3/listSpawner.o \
c_code/2_3/shuffle.o \
c_code/2_3/stdlib_math.o \
c_code/2_3/radixListSpawner.o $LINK_FLAGS"
    $LINKER -o $binDir/main  \
c_code/2_3/main.o \
c_code/2_3/stdlib_system.o \
c_code/2_3/bench.o \
c_code/2_3/stdlib_times.o \
c_code/2_3/stdlib_strutils.o \
c_code/2_3/stdlib_parseutils.o \
c_code/2_3/stdlib_os.o \
c_code/2_3/stdlib_posix.o \
c_code/2_3/saveData.o \
c_code/2_3/stdlib_algorithm.o \
c_code/2_3/sorts.o \
c_code/2_3/stdlib_sequtils.o \
c_code/2_3/listSpawner.o \
c_code/2_3/shuffle.o \
c_code/2_3/stdlib_math.o \
c_code/2_3/radixListSpawner.o $LINK_FLAGS
    ;;
  arm)
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/main.c -o c_code/2_4/main.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/main.c -o c_code/2_4/main.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_system.c -o c_code/2_4/stdlib_system.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_system.c -o c_code/2_4/stdlib_system.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/bench.c -o c_code/2_4/bench.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/bench.c -o c_code/2_4/bench.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_times.c -o c_code/2_4/stdlib_times.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_times.c -o c_code/2_4/stdlib_times.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_strutils.c -o c_code/2_4/stdlib_strutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_strutils.c -o c_code/2_4/stdlib_strutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_parseutils.c -o c_code/2_4/stdlib_parseutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_parseutils.c -o c_code/2_4/stdlib_parseutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_os.c -o c_code/2_4/stdlib_os.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_os.c -o c_code/2_4/stdlib_os.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_posix.c -o c_code/2_4/stdlib_posix.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_posix.c -o c_code/2_4/stdlib_posix.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/saveData.c -o c_code/2_4/saveData.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/saveData.c -o c_code/2_4/saveData.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_algorithm.c -o c_code/2_4/stdlib_algorithm.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_algorithm.c -o c_code/2_4/stdlib_algorithm.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/sorts.c -o c_code/2_4/sorts.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/sorts.c -o c_code/2_4/sorts.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_sequtils.c -o c_code/2_4/stdlib_sequtils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_sequtils.c -o c_code/2_4/stdlib_sequtils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/listSpawner.c -o c_code/2_4/listSpawner.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/listSpawner.c -o c_code/2_4/listSpawner.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/shuffle.c -o c_code/2_4/shuffle.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/shuffle.c -o c_code/2_4/shuffle.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_math.c -o c_code/2_4/stdlib_math.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/stdlib_math.c -o c_code/2_4/stdlib_math.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_4/radixListSpawner.c -o c_code/2_4/radixListSpawner.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_4/radixListSpawner.c -o c_code/2_4/radixListSpawner.o
    echo "$LINKER -o $binDir/main  \
c_code/2_4/main.o \
c_code/2_4/stdlib_system.o \
c_code/2_4/bench.o \
c_code/2_4/stdlib_times.o \
c_code/2_4/stdlib_strutils.o \
c_code/2_4/stdlib_parseutils.o \
c_code/2_4/stdlib_os.o \
c_code/2_4/stdlib_posix.o \
c_code/2_4/saveData.o \
c_code/2_4/stdlib_algorithm.o \
c_code/2_4/sorts.o \
c_code/2_4/stdlib_sequtils.o \
c_code/2_4/listSpawner.o \
c_code/2_4/shuffle.o \
c_code/2_4/stdlib_math.o \
c_code/2_4/radixListSpawner.o $LINK_FLAGS"
    $LINKER -o $binDir/main  \
c_code/2_4/main.o \
c_code/2_4/stdlib_system.o \
c_code/2_4/bench.o \
c_code/2_4/stdlib_times.o \
c_code/2_4/stdlib_strutils.o \
c_code/2_4/stdlib_parseutils.o \
c_code/2_4/stdlib_os.o \
c_code/2_4/stdlib_posix.o \
c_code/2_4/saveData.o \
c_code/2_4/stdlib_algorithm.o \
c_code/2_4/sorts.o \
c_code/2_4/stdlib_sequtils.o \
c_code/2_4/listSpawner.o \
c_code/2_4/shuffle.o \
c_code/2_4/stdlib_math.o \
c_code/2_4/radixListSpawner.o $LINK_FLAGS
    ;;
  sparc)
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/main.c -o c_code/2_5/main.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/main.c -o c_code/2_5/main.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_system.c -o c_code/2_5/stdlib_system.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_system.c -o c_code/2_5/stdlib_system.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/bench.c -o c_code/2_5/bench.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/bench.c -o c_code/2_5/bench.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_times.c -o c_code/2_5/stdlib_times.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_times.c -o c_code/2_5/stdlib_times.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_strutils.c -o c_code/2_5/stdlib_strutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_strutils.c -o c_code/2_5/stdlib_strutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_parseutils.c -o c_code/2_5/stdlib_parseutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_parseutils.c -o c_code/2_5/stdlib_parseutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_os.c -o c_code/2_5/stdlib_os.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_os.c -o c_code/2_5/stdlib_os.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_posix.c -o c_code/2_5/stdlib_posix.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_posix.c -o c_code/2_5/stdlib_posix.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/saveData.c -o c_code/2_5/saveData.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/saveData.c -o c_code/2_5/saveData.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_algorithm.c -o c_code/2_5/stdlib_algorithm.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_algorithm.c -o c_code/2_5/stdlib_algorithm.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/sorts.c -o c_code/2_5/sorts.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/sorts.c -o c_code/2_5/sorts.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_sequtils.c -o c_code/2_5/stdlib_sequtils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_sequtils.c -o c_code/2_5/stdlib_sequtils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/listSpawner.c -o c_code/2_5/listSpawner.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/listSpawner.c -o c_code/2_5/listSpawner.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/shuffle.c -o c_code/2_5/shuffle.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/shuffle.c -o c_code/2_5/shuffle.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_math.c -o c_code/2_5/stdlib_math.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/stdlib_math.c -o c_code/2_5/stdlib_math.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_5/radixListSpawner.c -o c_code/2_5/radixListSpawner.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_5/radixListSpawner.c -o c_code/2_5/radixListSpawner.o
    echo "$LINKER -o $binDir/main  \
c_code/2_5/main.o \
c_code/2_5/stdlib_system.o \
c_code/2_5/bench.o \
c_code/2_5/stdlib_times.o \
c_code/2_5/stdlib_strutils.o \
c_code/2_5/stdlib_parseutils.o \
c_code/2_5/stdlib_os.o \
c_code/2_5/stdlib_posix.o \
c_code/2_5/saveData.o \
c_code/2_5/stdlib_algorithm.o \
c_code/2_5/sorts.o \
c_code/2_5/stdlib_sequtils.o \
c_code/2_5/listSpawner.o \
c_code/2_5/shuffle.o \
c_code/2_5/stdlib_math.o \
c_code/2_5/radixListSpawner.o $LINK_FLAGS"
    $LINKER -o $binDir/main  \
c_code/2_5/main.o \
c_code/2_5/stdlib_system.o \
c_code/2_5/bench.o \
c_code/2_5/stdlib_times.o \
c_code/2_5/stdlib_strutils.o \
c_code/2_5/stdlib_parseutils.o \
c_code/2_5/stdlib_os.o \
c_code/2_5/stdlib_posix.o \
c_code/2_5/saveData.o \
c_code/2_5/stdlib_algorithm.o \
c_code/2_5/sorts.o \
c_code/2_5/stdlib_sequtils.o \
c_code/2_5/listSpawner.o \
c_code/2_5/shuffle.o \
c_code/2_5/stdlib_math.o \
c_code/2_5/radixListSpawner.o $LINK_FLAGS
    ;;
  mips)
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/main.c -o c_code/2_6/main.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/main.c -o c_code/2_6/main.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_system.c -o c_code/2_6/stdlib_system.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_system.c -o c_code/2_6/stdlib_system.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/bench.c -o c_code/2_6/bench.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/bench.c -o c_code/2_6/bench.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_times.c -o c_code/2_6/stdlib_times.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_times.c -o c_code/2_6/stdlib_times.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_strutils.c -o c_code/2_6/stdlib_strutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_strutils.c -o c_code/2_6/stdlib_strutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_parseutils.c -o c_code/2_6/stdlib_parseutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_parseutils.c -o c_code/2_6/stdlib_parseutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_os.c -o c_code/2_6/stdlib_os.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_os.c -o c_code/2_6/stdlib_os.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_posix.c -o c_code/2_6/stdlib_posix.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_posix.c -o c_code/2_6/stdlib_posix.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/saveData.c -o c_code/2_6/saveData.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/saveData.c -o c_code/2_6/saveData.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_algorithm.c -o c_code/2_6/stdlib_algorithm.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_algorithm.c -o c_code/2_6/stdlib_algorithm.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/sorts.c -o c_code/2_6/sorts.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/sorts.c -o c_code/2_6/sorts.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_sequtils.c -o c_code/2_6/stdlib_sequtils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_sequtils.c -o c_code/2_6/stdlib_sequtils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/listSpawner.c -o c_code/2_6/listSpawner.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/listSpawner.c -o c_code/2_6/listSpawner.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/shuffle.c -o c_code/2_6/shuffle.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/shuffle.c -o c_code/2_6/shuffle.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_math.c -o c_code/2_6/stdlib_math.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/stdlib_math.c -o c_code/2_6/stdlib_math.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_6/radixListSpawner.c -o c_code/2_6/radixListSpawner.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_6/radixListSpawner.c -o c_code/2_6/radixListSpawner.o
    echo "$LINKER -o $binDir/main  \
c_code/2_6/main.o \
c_code/2_6/stdlib_system.o \
c_code/2_6/bench.o \
c_code/2_6/stdlib_times.o \
c_code/2_6/stdlib_strutils.o \
c_code/2_6/stdlib_parseutils.o \
c_code/2_6/stdlib_os.o \
c_code/2_6/stdlib_posix.o \
c_code/2_6/saveData.o \
c_code/2_6/stdlib_algorithm.o \
c_code/2_6/sorts.o \
c_code/2_6/stdlib_sequtils.o \
c_code/2_6/listSpawner.o \
c_code/2_6/shuffle.o \
c_code/2_6/stdlib_math.o \
c_code/2_6/radixListSpawner.o $LINK_FLAGS"
    $LINKER -o $binDir/main  \
c_code/2_6/main.o \
c_code/2_6/stdlib_system.o \
c_code/2_6/bench.o \
c_code/2_6/stdlib_times.o \
c_code/2_6/stdlib_strutils.o \
c_code/2_6/stdlib_parseutils.o \
c_code/2_6/stdlib_os.o \
c_code/2_6/stdlib_posix.o \
c_code/2_6/saveData.o \
c_code/2_6/stdlib_algorithm.o \
c_code/2_6/sorts.o \
c_code/2_6/stdlib_sequtils.o \
c_code/2_6/listSpawner.o \
c_code/2_6/shuffle.o \
c_code/2_6/stdlib_math.o \
c_code/2_6/radixListSpawner.o $LINK_FLAGS
    ;;
  powerpc)
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/main.c -o c_code/2_7/main.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/main.c -o c_code/2_7/main.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_system.c -o c_code/2_7/stdlib_system.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_system.c -o c_code/2_7/stdlib_system.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/bench.c -o c_code/2_7/bench.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/bench.c -o c_code/2_7/bench.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_times.c -o c_code/2_7/stdlib_times.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_times.c -o c_code/2_7/stdlib_times.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_strutils.c -o c_code/2_7/stdlib_strutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_strutils.c -o c_code/2_7/stdlib_strutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_parseutils.c -o c_code/2_7/stdlib_parseutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_parseutils.c -o c_code/2_7/stdlib_parseutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_os.c -o c_code/2_7/stdlib_os.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_os.c -o c_code/2_7/stdlib_os.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_posix.c -o c_code/2_7/stdlib_posix.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_posix.c -o c_code/2_7/stdlib_posix.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/saveData.c -o c_code/2_7/saveData.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/saveData.c -o c_code/2_7/saveData.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_algorithm.c -o c_code/2_7/stdlib_algorithm.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_algorithm.c -o c_code/2_7/stdlib_algorithm.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/sorts.c -o c_code/2_7/sorts.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/sorts.c -o c_code/2_7/sorts.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_sequtils.c -o c_code/2_7/stdlib_sequtils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_sequtils.c -o c_code/2_7/stdlib_sequtils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/listSpawner.c -o c_code/2_7/listSpawner.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/listSpawner.c -o c_code/2_7/listSpawner.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/shuffle.c -o c_code/2_7/shuffle.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/shuffle.c -o c_code/2_7/shuffle.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_math.c -o c_code/2_7/stdlib_math.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/stdlib_math.c -o c_code/2_7/stdlib_math.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/2_7/radixListSpawner.c -o c_code/2_7/radixListSpawner.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/2_7/radixListSpawner.c -o c_code/2_7/radixListSpawner.o
    echo "$LINKER -o $binDir/main  \
c_code/2_7/main.o \
c_code/2_7/stdlib_system.o \
c_code/2_7/bench.o \
c_code/2_7/stdlib_times.o \
c_code/2_7/stdlib_strutils.o \
c_code/2_7/stdlib_parseutils.o \
c_code/2_7/stdlib_os.o \
c_code/2_7/stdlib_posix.o \
c_code/2_7/saveData.o \
c_code/2_7/stdlib_algorithm.o \
c_code/2_7/sorts.o \
c_code/2_7/stdlib_sequtils.o \
c_code/2_7/listSpawner.o \
c_code/2_7/shuffle.o \
c_code/2_7/stdlib_math.o \
c_code/2_7/radixListSpawner.o $LINK_FLAGS"
    $LINKER -o $binDir/main  \
c_code/2_7/main.o \
c_code/2_7/stdlib_system.o \
c_code/2_7/bench.o \
c_code/2_7/stdlib_times.o \
c_code/2_7/stdlib_strutils.o \
c_code/2_7/stdlib_parseutils.o \
c_code/2_7/stdlib_os.o \
c_code/2_7/stdlib_posix.o \
c_code/2_7/saveData.o \
c_code/2_7/stdlib_algorithm.o \
c_code/2_7/sorts.o \
c_code/2_7/stdlib_sequtils.o \
c_code/2_7/listSpawner.o \
c_code/2_7/shuffle.o \
c_code/2_7/stdlib_math.o \
c_code/2_7/radixListSpawner.o $LINK_FLAGS
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
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/main.c -o c_code/3_1/main.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/main.c -o c_code/3_1/main.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_system.c -o c_code/3_1/stdlib_system.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_system.c -o c_code/3_1/stdlib_system.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/bench.c -o c_code/3_1/bench.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/bench.c -o c_code/3_1/bench.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_times.c -o c_code/3_1/stdlib_times.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_times.c -o c_code/3_1/stdlib_times.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_strutils.c -o c_code/3_1/stdlib_strutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_strutils.c -o c_code/3_1/stdlib_strutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_parseutils.c -o c_code/3_1/stdlib_parseutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_parseutils.c -o c_code/3_1/stdlib_parseutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_os.c -o c_code/3_1/stdlib_os.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_os.c -o c_code/3_1/stdlib_os.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_posix.c -o c_code/3_1/stdlib_posix.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_posix.c -o c_code/3_1/stdlib_posix.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/saveData.c -o c_code/3_1/saveData.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/saveData.c -o c_code/3_1/saveData.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_algorithm.c -o c_code/3_1/stdlib_algorithm.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_algorithm.c -o c_code/3_1/stdlib_algorithm.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/sorts.c -o c_code/3_1/sorts.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/sorts.c -o c_code/3_1/sorts.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_sequtils.c -o c_code/3_1/stdlib_sequtils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_sequtils.c -o c_code/3_1/stdlib_sequtils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/listSpawner.c -o c_code/3_1/listSpawner.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/listSpawner.c -o c_code/3_1/listSpawner.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/shuffle.c -o c_code/3_1/shuffle.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/shuffle.c -o c_code/3_1/shuffle.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_math.c -o c_code/3_1/stdlib_math.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/stdlib_math.c -o c_code/3_1/stdlib_math.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_1/radixListSpawner.c -o c_code/3_1/radixListSpawner.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_1/radixListSpawner.c -o c_code/3_1/radixListSpawner.o
    echo "$LINKER -o $binDir/main  \
c_code/3_1/main.o \
c_code/3_1/stdlib_system.o \
c_code/3_1/bench.o \
c_code/3_1/stdlib_times.o \
c_code/3_1/stdlib_strutils.o \
c_code/3_1/stdlib_parseutils.o \
c_code/3_1/stdlib_os.o \
c_code/3_1/stdlib_posix.o \
c_code/3_1/saveData.o \
c_code/3_1/stdlib_algorithm.o \
c_code/3_1/sorts.o \
c_code/3_1/stdlib_sequtils.o \
c_code/3_1/listSpawner.o \
c_code/3_1/shuffle.o \
c_code/3_1/stdlib_math.o \
c_code/3_1/radixListSpawner.o $LINK_FLAGS"
    $LINKER -o $binDir/main  \
c_code/3_1/main.o \
c_code/3_1/stdlib_system.o \
c_code/3_1/bench.o \
c_code/3_1/stdlib_times.o \
c_code/3_1/stdlib_strutils.o \
c_code/3_1/stdlib_parseutils.o \
c_code/3_1/stdlib_os.o \
c_code/3_1/stdlib_posix.o \
c_code/3_1/saveData.o \
c_code/3_1/stdlib_algorithm.o \
c_code/3_1/sorts.o \
c_code/3_1/stdlib_sequtils.o \
c_code/3_1/listSpawner.o \
c_code/3_1/shuffle.o \
c_code/3_1/stdlib_math.o \
c_code/3_1/radixListSpawner.o $LINK_FLAGS
    ;;
  amd64)
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/main.c -o c_code/3_2/main.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/main.c -o c_code/3_2/main.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_system.c -o c_code/3_2/stdlib_system.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_system.c -o c_code/3_2/stdlib_system.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/bench.c -o c_code/3_2/bench.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/bench.c -o c_code/3_2/bench.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_times.c -o c_code/3_2/stdlib_times.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_times.c -o c_code/3_2/stdlib_times.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_strutils.c -o c_code/3_2/stdlib_strutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_strutils.c -o c_code/3_2/stdlib_strutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_parseutils.c -o c_code/3_2/stdlib_parseutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_parseutils.c -o c_code/3_2/stdlib_parseutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_os.c -o c_code/3_2/stdlib_os.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_os.c -o c_code/3_2/stdlib_os.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_posix.c -o c_code/3_2/stdlib_posix.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_posix.c -o c_code/3_2/stdlib_posix.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/saveData.c -o c_code/3_2/saveData.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/saveData.c -o c_code/3_2/saveData.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_algorithm.c -o c_code/3_2/stdlib_algorithm.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_algorithm.c -o c_code/3_2/stdlib_algorithm.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/sorts.c -o c_code/3_2/sorts.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/sorts.c -o c_code/3_2/sorts.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_sequtils.c -o c_code/3_2/stdlib_sequtils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_sequtils.c -o c_code/3_2/stdlib_sequtils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/listSpawner.c -o c_code/3_2/listSpawner.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/listSpawner.c -o c_code/3_2/listSpawner.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/shuffle.c -o c_code/3_2/shuffle.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/shuffle.c -o c_code/3_2/shuffle.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_math.c -o c_code/3_2/stdlib_math.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/stdlib_math.c -o c_code/3_2/stdlib_math.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_2/radixListSpawner.c -o c_code/3_2/radixListSpawner.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_2/radixListSpawner.c -o c_code/3_2/radixListSpawner.o
    echo "$LINKER -o $binDir/main  \
c_code/3_2/main.o \
c_code/3_2/stdlib_system.o \
c_code/3_2/bench.o \
c_code/3_2/stdlib_times.o \
c_code/3_2/stdlib_strutils.o \
c_code/3_2/stdlib_parseutils.o \
c_code/3_2/stdlib_os.o \
c_code/3_2/stdlib_posix.o \
c_code/3_2/saveData.o \
c_code/3_2/stdlib_algorithm.o \
c_code/3_2/sorts.o \
c_code/3_2/stdlib_sequtils.o \
c_code/3_2/listSpawner.o \
c_code/3_2/shuffle.o \
c_code/3_2/stdlib_math.o \
c_code/3_2/radixListSpawner.o $LINK_FLAGS"
    $LINKER -o $binDir/main  \
c_code/3_2/main.o \
c_code/3_2/stdlib_system.o \
c_code/3_2/bench.o \
c_code/3_2/stdlib_times.o \
c_code/3_2/stdlib_strutils.o \
c_code/3_2/stdlib_parseutils.o \
c_code/3_2/stdlib_os.o \
c_code/3_2/stdlib_posix.o \
c_code/3_2/saveData.o \
c_code/3_2/stdlib_algorithm.o \
c_code/3_2/sorts.o \
c_code/3_2/stdlib_sequtils.o \
c_code/3_2/listSpawner.o \
c_code/3_2/shuffle.o \
c_code/3_2/stdlib_math.o \
c_code/3_2/radixListSpawner.o $LINK_FLAGS
    ;;
  powerpc64)
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/main.c -o c_code/3_3/main.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/main.c -o c_code/3_3/main.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_system.c -o c_code/3_3/stdlib_system.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_system.c -o c_code/3_3/stdlib_system.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/bench.c -o c_code/3_3/bench.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/bench.c -o c_code/3_3/bench.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_times.c -o c_code/3_3/stdlib_times.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_times.c -o c_code/3_3/stdlib_times.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_strutils.c -o c_code/3_3/stdlib_strutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_strutils.c -o c_code/3_3/stdlib_strutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_parseutils.c -o c_code/3_3/stdlib_parseutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_parseutils.c -o c_code/3_3/stdlib_parseutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_os.c -o c_code/3_3/stdlib_os.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_os.c -o c_code/3_3/stdlib_os.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_posix.c -o c_code/3_3/stdlib_posix.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_posix.c -o c_code/3_3/stdlib_posix.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/saveData.c -o c_code/3_3/saveData.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/saveData.c -o c_code/3_3/saveData.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_algorithm.c -o c_code/3_3/stdlib_algorithm.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_algorithm.c -o c_code/3_3/stdlib_algorithm.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/sorts.c -o c_code/3_3/sorts.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/sorts.c -o c_code/3_3/sorts.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_sequtils.c -o c_code/3_3/stdlib_sequtils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_sequtils.c -o c_code/3_3/stdlib_sequtils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/listSpawner.c -o c_code/3_3/listSpawner.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/listSpawner.c -o c_code/3_3/listSpawner.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/shuffle.c -o c_code/3_3/shuffle.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/shuffle.c -o c_code/3_3/shuffle.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_math.c -o c_code/3_3/stdlib_math.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/stdlib_math.c -o c_code/3_3/stdlib_math.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/3_3/radixListSpawner.c -o c_code/3_3/radixListSpawner.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/3_3/radixListSpawner.c -o c_code/3_3/radixListSpawner.o
    echo "$LINKER -o $binDir/main  \
c_code/3_3/main.o \
c_code/3_3/stdlib_system.o \
c_code/3_3/bench.o \
c_code/3_3/stdlib_times.o \
c_code/3_3/stdlib_strutils.o \
c_code/3_3/stdlib_parseutils.o \
c_code/3_3/stdlib_os.o \
c_code/3_3/stdlib_posix.o \
c_code/3_3/saveData.o \
c_code/3_3/stdlib_algorithm.o \
c_code/3_3/sorts.o \
c_code/3_3/stdlib_sequtils.o \
c_code/3_3/listSpawner.o \
c_code/3_3/shuffle.o \
c_code/3_3/stdlib_math.o \
c_code/3_3/radixListSpawner.o $LINK_FLAGS"
    $LINKER -o $binDir/main  \
c_code/3_3/main.o \
c_code/3_3/stdlib_system.o \
c_code/3_3/bench.o \
c_code/3_3/stdlib_times.o \
c_code/3_3/stdlib_strutils.o \
c_code/3_3/stdlib_parseutils.o \
c_code/3_3/stdlib_os.o \
c_code/3_3/stdlib_posix.o \
c_code/3_3/saveData.o \
c_code/3_3/stdlib_algorithm.o \
c_code/3_3/sorts.o \
c_code/3_3/stdlib_sequtils.o \
c_code/3_3/listSpawner.o \
c_code/3_3/shuffle.o \
c_code/3_3/stdlib_math.o \
c_code/3_3/radixListSpawner.o $LINK_FLAGS
    ;;
  arm)
    echo "$LINKER -o $binDir/main  $LINK_FLAGS"
    $LINKER -o $binDir/main  $LINK_FLAGS
    ;;
  sparc)
    echo "$LINKER -o $binDir/main  $LINK_FLAGS"
    $LINKER -o $binDir/main  $LINK_FLAGS
    ;;
  mips)
    echo "$LINKER -o $binDir/main  $LINK_FLAGS"
    $LINKER -o $binDir/main  $LINK_FLAGS
    ;;
  powerpc)
    echo "$LINKER -o $binDir/main  $LINK_FLAGS"
    $LINKER -o $binDir/main  $LINK_FLAGS
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
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/main.c -o c_code/4_1/main.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/main.c -o c_code/4_1/main.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_system.c -o c_code/4_1/stdlib_system.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_system.c -o c_code/4_1/stdlib_system.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/bench.c -o c_code/4_1/bench.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/bench.c -o c_code/4_1/bench.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_times.c -o c_code/4_1/stdlib_times.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_times.c -o c_code/4_1/stdlib_times.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_strutils.c -o c_code/4_1/stdlib_strutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_strutils.c -o c_code/4_1/stdlib_strutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_parseutils.c -o c_code/4_1/stdlib_parseutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_parseutils.c -o c_code/4_1/stdlib_parseutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_os.c -o c_code/4_1/stdlib_os.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_os.c -o c_code/4_1/stdlib_os.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_posix.c -o c_code/4_1/stdlib_posix.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_posix.c -o c_code/4_1/stdlib_posix.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/saveData.c -o c_code/4_1/saveData.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/saveData.c -o c_code/4_1/saveData.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_algorithm.c -o c_code/4_1/stdlib_algorithm.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_algorithm.c -o c_code/4_1/stdlib_algorithm.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/sorts.c -o c_code/4_1/sorts.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/sorts.c -o c_code/4_1/sorts.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_sequtils.c -o c_code/4_1/stdlib_sequtils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_sequtils.c -o c_code/4_1/stdlib_sequtils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/listSpawner.c -o c_code/4_1/listSpawner.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/listSpawner.c -o c_code/4_1/listSpawner.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/shuffle.c -o c_code/4_1/shuffle.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/shuffle.c -o c_code/4_1/shuffle.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_math.c -o c_code/4_1/stdlib_math.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/stdlib_math.c -o c_code/4_1/stdlib_math.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_1/radixListSpawner.c -o c_code/4_1/radixListSpawner.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_1/radixListSpawner.c -o c_code/4_1/radixListSpawner.o
    echo "$LINKER -o $binDir/main  \
c_code/4_1/main.o \
c_code/4_1/stdlib_system.o \
c_code/4_1/bench.o \
c_code/4_1/stdlib_times.o \
c_code/4_1/stdlib_strutils.o \
c_code/4_1/stdlib_parseutils.o \
c_code/4_1/stdlib_os.o \
c_code/4_1/stdlib_posix.o \
c_code/4_1/saveData.o \
c_code/4_1/stdlib_algorithm.o \
c_code/4_1/sorts.o \
c_code/4_1/stdlib_sequtils.o \
c_code/4_1/listSpawner.o \
c_code/4_1/shuffle.o \
c_code/4_1/stdlib_math.o \
c_code/4_1/radixListSpawner.o $LINK_FLAGS"
    $LINKER -o $binDir/main  \
c_code/4_1/main.o \
c_code/4_1/stdlib_system.o \
c_code/4_1/bench.o \
c_code/4_1/stdlib_times.o \
c_code/4_1/stdlib_strutils.o \
c_code/4_1/stdlib_parseutils.o \
c_code/4_1/stdlib_os.o \
c_code/4_1/stdlib_posix.o \
c_code/4_1/saveData.o \
c_code/4_1/stdlib_algorithm.o \
c_code/4_1/sorts.o \
c_code/4_1/stdlib_sequtils.o \
c_code/4_1/listSpawner.o \
c_code/4_1/shuffle.o \
c_code/4_1/stdlib_math.o \
c_code/4_1/radixListSpawner.o $LINK_FLAGS
    ;;
  amd64)
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/main.c -o c_code/4_2/main.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/main.c -o c_code/4_2/main.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_system.c -o c_code/4_2/stdlib_system.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_system.c -o c_code/4_2/stdlib_system.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/bench.c -o c_code/4_2/bench.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/bench.c -o c_code/4_2/bench.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_times.c -o c_code/4_2/stdlib_times.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_times.c -o c_code/4_2/stdlib_times.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_strutils.c -o c_code/4_2/stdlib_strutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_strutils.c -o c_code/4_2/stdlib_strutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_parseutils.c -o c_code/4_2/stdlib_parseutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_parseutils.c -o c_code/4_2/stdlib_parseutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_os.c -o c_code/4_2/stdlib_os.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_os.c -o c_code/4_2/stdlib_os.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_posix.c -o c_code/4_2/stdlib_posix.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_posix.c -o c_code/4_2/stdlib_posix.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/saveData.c -o c_code/4_2/saveData.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/saveData.c -o c_code/4_2/saveData.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_algorithm.c -o c_code/4_2/stdlib_algorithm.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_algorithm.c -o c_code/4_2/stdlib_algorithm.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/sorts.c -o c_code/4_2/sorts.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/sorts.c -o c_code/4_2/sorts.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_sequtils.c -o c_code/4_2/stdlib_sequtils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_sequtils.c -o c_code/4_2/stdlib_sequtils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/listSpawner.c -o c_code/4_2/listSpawner.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/listSpawner.c -o c_code/4_2/listSpawner.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/shuffle.c -o c_code/4_2/shuffle.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/shuffle.c -o c_code/4_2/shuffle.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_math.c -o c_code/4_2/stdlib_math.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/stdlib_math.c -o c_code/4_2/stdlib_math.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_2/radixListSpawner.c -o c_code/4_2/radixListSpawner.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_2/radixListSpawner.c -o c_code/4_2/radixListSpawner.o
    echo "$LINKER -o $binDir/main  \
c_code/4_2/main.o \
c_code/4_2/stdlib_system.o \
c_code/4_2/bench.o \
c_code/4_2/stdlib_times.o \
c_code/4_2/stdlib_strutils.o \
c_code/4_2/stdlib_parseutils.o \
c_code/4_2/stdlib_os.o \
c_code/4_2/stdlib_posix.o \
c_code/4_2/saveData.o \
c_code/4_2/stdlib_algorithm.o \
c_code/4_2/sorts.o \
c_code/4_2/stdlib_sequtils.o \
c_code/4_2/listSpawner.o \
c_code/4_2/shuffle.o \
c_code/4_2/stdlib_math.o \
c_code/4_2/radixListSpawner.o $LINK_FLAGS"
    $LINKER -o $binDir/main  \
c_code/4_2/main.o \
c_code/4_2/stdlib_system.o \
c_code/4_2/bench.o \
c_code/4_2/stdlib_times.o \
c_code/4_2/stdlib_strutils.o \
c_code/4_2/stdlib_parseutils.o \
c_code/4_2/stdlib_os.o \
c_code/4_2/stdlib_posix.o \
c_code/4_2/saveData.o \
c_code/4_2/stdlib_algorithm.o \
c_code/4_2/sorts.o \
c_code/4_2/stdlib_sequtils.o \
c_code/4_2/listSpawner.o \
c_code/4_2/shuffle.o \
c_code/4_2/stdlib_math.o \
c_code/4_2/radixListSpawner.o $LINK_FLAGS
    ;;
  powerpc64)
    echo "$LINKER -o $binDir/main  $LINK_FLAGS"
    $LINKER -o $binDir/main  $LINK_FLAGS
    ;;
  arm)
    echo "$LINKER -o $binDir/main  $LINK_FLAGS"
    $LINKER -o $binDir/main  $LINK_FLAGS
    ;;
  sparc)
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/main.c -o c_code/4_5/main.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/main.c -o c_code/4_5/main.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_system.c -o c_code/4_5/stdlib_system.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_system.c -o c_code/4_5/stdlib_system.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/bench.c -o c_code/4_5/bench.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/bench.c -o c_code/4_5/bench.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_times.c -o c_code/4_5/stdlib_times.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_times.c -o c_code/4_5/stdlib_times.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_strutils.c -o c_code/4_5/stdlib_strutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_strutils.c -o c_code/4_5/stdlib_strutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_parseutils.c -o c_code/4_5/stdlib_parseutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_parseutils.c -o c_code/4_5/stdlib_parseutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_os.c -o c_code/4_5/stdlib_os.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_os.c -o c_code/4_5/stdlib_os.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_posix.c -o c_code/4_5/stdlib_posix.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_posix.c -o c_code/4_5/stdlib_posix.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/saveData.c -o c_code/4_5/saveData.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/saveData.c -o c_code/4_5/saveData.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_algorithm.c -o c_code/4_5/stdlib_algorithm.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_algorithm.c -o c_code/4_5/stdlib_algorithm.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/sorts.c -o c_code/4_5/sorts.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/sorts.c -o c_code/4_5/sorts.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_sequtils.c -o c_code/4_5/stdlib_sequtils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_sequtils.c -o c_code/4_5/stdlib_sequtils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/listSpawner.c -o c_code/4_5/listSpawner.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/listSpawner.c -o c_code/4_5/listSpawner.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/shuffle.c -o c_code/4_5/shuffle.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/shuffle.c -o c_code/4_5/shuffle.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_math.c -o c_code/4_5/stdlib_math.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/stdlib_math.c -o c_code/4_5/stdlib_math.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/4_5/radixListSpawner.c -o c_code/4_5/radixListSpawner.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/4_5/radixListSpawner.c -o c_code/4_5/radixListSpawner.o
    echo "$LINKER -o $binDir/main  \
c_code/4_5/main.o \
c_code/4_5/stdlib_system.o \
c_code/4_5/bench.o \
c_code/4_5/stdlib_times.o \
c_code/4_5/stdlib_strutils.o \
c_code/4_5/stdlib_parseutils.o \
c_code/4_5/stdlib_os.o \
c_code/4_5/stdlib_posix.o \
c_code/4_5/saveData.o \
c_code/4_5/stdlib_algorithm.o \
c_code/4_5/sorts.o \
c_code/4_5/stdlib_sequtils.o \
c_code/4_5/listSpawner.o \
c_code/4_5/shuffle.o \
c_code/4_5/stdlib_math.o \
c_code/4_5/radixListSpawner.o $LINK_FLAGS"
    $LINKER -o $binDir/main  \
c_code/4_5/main.o \
c_code/4_5/stdlib_system.o \
c_code/4_5/bench.o \
c_code/4_5/stdlib_times.o \
c_code/4_5/stdlib_strutils.o \
c_code/4_5/stdlib_parseutils.o \
c_code/4_5/stdlib_os.o \
c_code/4_5/stdlib_posix.o \
c_code/4_5/saveData.o \
c_code/4_5/stdlib_algorithm.o \
c_code/4_5/sorts.o \
c_code/4_5/stdlib_sequtils.o \
c_code/4_5/listSpawner.o \
c_code/4_5/shuffle.o \
c_code/4_5/stdlib_math.o \
c_code/4_5/radixListSpawner.o $LINK_FLAGS
    ;;
  mips)
    echo "$LINKER -o $binDir/main  $LINK_FLAGS"
    $LINKER -o $binDir/main  $LINK_FLAGS
    ;;
  powerpc)
    echo "$LINKER -o $binDir/main  $LINK_FLAGS"
    $LINKER -o $binDir/main  $LINK_FLAGS
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
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/main.c -o c_code/5_1/main.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/main.c -o c_code/5_1/main.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_system.c -o c_code/5_1/stdlib_system.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_system.c -o c_code/5_1/stdlib_system.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/bench.c -o c_code/5_1/bench.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/bench.c -o c_code/5_1/bench.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_times.c -o c_code/5_1/stdlib_times.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_times.c -o c_code/5_1/stdlib_times.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_strutils.c -o c_code/5_1/stdlib_strutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_strutils.c -o c_code/5_1/stdlib_strutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_parseutils.c -o c_code/5_1/stdlib_parseutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_parseutils.c -o c_code/5_1/stdlib_parseutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_os.c -o c_code/5_1/stdlib_os.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_os.c -o c_code/5_1/stdlib_os.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_posix.c -o c_code/5_1/stdlib_posix.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_posix.c -o c_code/5_1/stdlib_posix.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/saveData.c -o c_code/5_1/saveData.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/saveData.c -o c_code/5_1/saveData.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_algorithm.c -o c_code/5_1/stdlib_algorithm.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_algorithm.c -o c_code/5_1/stdlib_algorithm.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/sorts.c -o c_code/5_1/sorts.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/sorts.c -o c_code/5_1/sorts.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_sequtils.c -o c_code/5_1/stdlib_sequtils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_sequtils.c -o c_code/5_1/stdlib_sequtils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/listSpawner.c -o c_code/5_1/listSpawner.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/listSpawner.c -o c_code/5_1/listSpawner.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/shuffle.c -o c_code/5_1/shuffle.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/shuffle.c -o c_code/5_1/shuffle.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_math.c -o c_code/5_1/stdlib_math.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/stdlib_math.c -o c_code/5_1/stdlib_math.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_1/radixListSpawner.c -o c_code/5_1/radixListSpawner.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_1/radixListSpawner.c -o c_code/5_1/radixListSpawner.o
    echo "$LINKER -o $binDir/main  \
c_code/5_1/main.o \
c_code/5_1/stdlib_system.o \
c_code/5_1/bench.o \
c_code/5_1/stdlib_times.o \
c_code/5_1/stdlib_strutils.o \
c_code/5_1/stdlib_parseutils.o \
c_code/5_1/stdlib_os.o \
c_code/5_1/stdlib_posix.o \
c_code/5_1/saveData.o \
c_code/5_1/stdlib_algorithm.o \
c_code/5_1/sorts.o \
c_code/5_1/stdlib_sequtils.o \
c_code/5_1/listSpawner.o \
c_code/5_1/shuffle.o \
c_code/5_1/stdlib_math.o \
c_code/5_1/radixListSpawner.o $LINK_FLAGS"
    $LINKER -o $binDir/main  \
c_code/5_1/main.o \
c_code/5_1/stdlib_system.o \
c_code/5_1/bench.o \
c_code/5_1/stdlib_times.o \
c_code/5_1/stdlib_strutils.o \
c_code/5_1/stdlib_parseutils.o \
c_code/5_1/stdlib_os.o \
c_code/5_1/stdlib_posix.o \
c_code/5_1/saveData.o \
c_code/5_1/stdlib_algorithm.o \
c_code/5_1/sorts.o \
c_code/5_1/stdlib_sequtils.o \
c_code/5_1/listSpawner.o \
c_code/5_1/shuffle.o \
c_code/5_1/stdlib_math.o \
c_code/5_1/radixListSpawner.o $LINK_FLAGS
    ;;
  amd64)
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/main.c -o c_code/5_2/main.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/main.c -o c_code/5_2/main.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_system.c -o c_code/5_2/stdlib_system.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_system.c -o c_code/5_2/stdlib_system.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/bench.c -o c_code/5_2/bench.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/bench.c -o c_code/5_2/bench.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_times.c -o c_code/5_2/stdlib_times.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_times.c -o c_code/5_2/stdlib_times.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_strutils.c -o c_code/5_2/stdlib_strutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_strutils.c -o c_code/5_2/stdlib_strutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_parseutils.c -o c_code/5_2/stdlib_parseutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_parseutils.c -o c_code/5_2/stdlib_parseutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_os.c -o c_code/5_2/stdlib_os.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_os.c -o c_code/5_2/stdlib_os.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_posix.c -o c_code/5_2/stdlib_posix.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_posix.c -o c_code/5_2/stdlib_posix.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/saveData.c -o c_code/5_2/saveData.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/saveData.c -o c_code/5_2/saveData.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_algorithm.c -o c_code/5_2/stdlib_algorithm.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_algorithm.c -o c_code/5_2/stdlib_algorithm.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/sorts.c -o c_code/5_2/sorts.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/sorts.c -o c_code/5_2/sorts.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_sequtils.c -o c_code/5_2/stdlib_sequtils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_sequtils.c -o c_code/5_2/stdlib_sequtils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/listSpawner.c -o c_code/5_2/listSpawner.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/listSpawner.c -o c_code/5_2/listSpawner.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/shuffle.c -o c_code/5_2/shuffle.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/shuffle.c -o c_code/5_2/shuffle.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_math.c -o c_code/5_2/stdlib_math.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/stdlib_math.c -o c_code/5_2/stdlib_math.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/5_2/radixListSpawner.c -o c_code/5_2/radixListSpawner.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/5_2/radixListSpawner.c -o c_code/5_2/radixListSpawner.o
    echo "$LINKER -o $binDir/main  \
c_code/5_2/main.o \
c_code/5_2/stdlib_system.o \
c_code/5_2/bench.o \
c_code/5_2/stdlib_times.o \
c_code/5_2/stdlib_strutils.o \
c_code/5_2/stdlib_parseutils.o \
c_code/5_2/stdlib_os.o \
c_code/5_2/stdlib_posix.o \
c_code/5_2/saveData.o \
c_code/5_2/stdlib_algorithm.o \
c_code/5_2/sorts.o \
c_code/5_2/stdlib_sequtils.o \
c_code/5_2/listSpawner.o \
c_code/5_2/shuffle.o \
c_code/5_2/stdlib_math.o \
c_code/5_2/radixListSpawner.o $LINK_FLAGS"
    $LINKER -o $binDir/main  \
c_code/5_2/main.o \
c_code/5_2/stdlib_system.o \
c_code/5_2/bench.o \
c_code/5_2/stdlib_times.o \
c_code/5_2/stdlib_strutils.o \
c_code/5_2/stdlib_parseutils.o \
c_code/5_2/stdlib_os.o \
c_code/5_2/stdlib_posix.o \
c_code/5_2/saveData.o \
c_code/5_2/stdlib_algorithm.o \
c_code/5_2/sorts.o \
c_code/5_2/stdlib_sequtils.o \
c_code/5_2/listSpawner.o \
c_code/5_2/shuffle.o \
c_code/5_2/stdlib_math.o \
c_code/5_2/radixListSpawner.o $LINK_FLAGS
    ;;
  powerpc64)
    echo "$LINKER -o $binDir/main  $LINK_FLAGS"
    $LINKER -o $binDir/main  $LINK_FLAGS
    ;;
  arm)
    echo "$LINKER -o $binDir/main  $LINK_FLAGS"
    $LINKER -o $binDir/main  $LINK_FLAGS
    ;;
  sparc)
    echo "$LINKER -o $binDir/main  $LINK_FLAGS"
    $LINKER -o $binDir/main  $LINK_FLAGS
    ;;
  mips)
    echo "$LINKER -o $binDir/main  $LINK_FLAGS"
    $LINKER -o $binDir/main  $LINK_FLAGS
    ;;
  powerpc)
    echo "$LINKER -o $binDir/main  $LINK_FLAGS"
    $LINKER -o $binDir/main  $LINK_FLAGS
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
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/main.c -o c_code/6_1/main.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/main.c -o c_code/6_1/main.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_system.c -o c_code/6_1/stdlib_system.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_system.c -o c_code/6_1/stdlib_system.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/bench.c -o c_code/6_1/bench.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/bench.c -o c_code/6_1/bench.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_times.c -o c_code/6_1/stdlib_times.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_times.c -o c_code/6_1/stdlib_times.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_strutils.c -o c_code/6_1/stdlib_strutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_strutils.c -o c_code/6_1/stdlib_strutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_parseutils.c -o c_code/6_1/stdlib_parseutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_parseutils.c -o c_code/6_1/stdlib_parseutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_os.c -o c_code/6_1/stdlib_os.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_os.c -o c_code/6_1/stdlib_os.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_posix.c -o c_code/6_1/stdlib_posix.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_posix.c -o c_code/6_1/stdlib_posix.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/saveData.c -o c_code/6_1/saveData.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/saveData.c -o c_code/6_1/saveData.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_algorithm.c -o c_code/6_1/stdlib_algorithm.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_algorithm.c -o c_code/6_1/stdlib_algorithm.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/sorts.c -o c_code/6_1/sorts.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/sorts.c -o c_code/6_1/sorts.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_sequtils.c -o c_code/6_1/stdlib_sequtils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_sequtils.c -o c_code/6_1/stdlib_sequtils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/listSpawner.c -o c_code/6_1/listSpawner.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/listSpawner.c -o c_code/6_1/listSpawner.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/shuffle.c -o c_code/6_1/shuffle.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/shuffle.c -o c_code/6_1/shuffle.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_math.c -o c_code/6_1/stdlib_math.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/stdlib_math.c -o c_code/6_1/stdlib_math.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_1/radixListSpawner.c -o c_code/6_1/radixListSpawner.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_1/radixListSpawner.c -o c_code/6_1/radixListSpawner.o
    echo "$LINKER -o $binDir/main  \
c_code/6_1/main.o \
c_code/6_1/stdlib_system.o \
c_code/6_1/bench.o \
c_code/6_1/stdlib_times.o \
c_code/6_1/stdlib_strutils.o \
c_code/6_1/stdlib_parseutils.o \
c_code/6_1/stdlib_os.o \
c_code/6_1/stdlib_posix.o \
c_code/6_1/saveData.o \
c_code/6_1/stdlib_algorithm.o \
c_code/6_1/sorts.o \
c_code/6_1/stdlib_sequtils.o \
c_code/6_1/listSpawner.o \
c_code/6_1/shuffle.o \
c_code/6_1/stdlib_math.o \
c_code/6_1/radixListSpawner.o $LINK_FLAGS"
    $LINKER -o $binDir/main  \
c_code/6_1/main.o \
c_code/6_1/stdlib_system.o \
c_code/6_1/bench.o \
c_code/6_1/stdlib_times.o \
c_code/6_1/stdlib_strutils.o \
c_code/6_1/stdlib_parseutils.o \
c_code/6_1/stdlib_os.o \
c_code/6_1/stdlib_posix.o \
c_code/6_1/saveData.o \
c_code/6_1/stdlib_algorithm.o \
c_code/6_1/sorts.o \
c_code/6_1/stdlib_sequtils.o \
c_code/6_1/listSpawner.o \
c_code/6_1/shuffle.o \
c_code/6_1/stdlib_math.o \
c_code/6_1/radixListSpawner.o $LINK_FLAGS
    ;;
  amd64)
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/main.c -o c_code/6_2/main.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/main.c -o c_code/6_2/main.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_system.c -o c_code/6_2/stdlib_system.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_system.c -o c_code/6_2/stdlib_system.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/bench.c -o c_code/6_2/bench.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/bench.c -o c_code/6_2/bench.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_times.c -o c_code/6_2/stdlib_times.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_times.c -o c_code/6_2/stdlib_times.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_strutils.c -o c_code/6_2/stdlib_strutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_strutils.c -o c_code/6_2/stdlib_strutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_parseutils.c -o c_code/6_2/stdlib_parseutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_parseutils.c -o c_code/6_2/stdlib_parseutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_os.c -o c_code/6_2/stdlib_os.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_os.c -o c_code/6_2/stdlib_os.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_posix.c -o c_code/6_2/stdlib_posix.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_posix.c -o c_code/6_2/stdlib_posix.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/saveData.c -o c_code/6_2/saveData.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/saveData.c -o c_code/6_2/saveData.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_algorithm.c -o c_code/6_2/stdlib_algorithm.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_algorithm.c -o c_code/6_2/stdlib_algorithm.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/sorts.c -o c_code/6_2/sorts.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/sorts.c -o c_code/6_2/sorts.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_sequtils.c -o c_code/6_2/stdlib_sequtils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_sequtils.c -o c_code/6_2/stdlib_sequtils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/listSpawner.c -o c_code/6_2/listSpawner.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/listSpawner.c -o c_code/6_2/listSpawner.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/shuffle.c -o c_code/6_2/shuffle.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/shuffle.c -o c_code/6_2/shuffle.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_math.c -o c_code/6_2/stdlib_math.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/stdlib_math.c -o c_code/6_2/stdlib_math.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/6_2/radixListSpawner.c -o c_code/6_2/radixListSpawner.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/6_2/radixListSpawner.c -o c_code/6_2/radixListSpawner.o
    echo "$LINKER -o $binDir/main  \
c_code/6_2/main.o \
c_code/6_2/stdlib_system.o \
c_code/6_2/bench.o \
c_code/6_2/stdlib_times.o \
c_code/6_2/stdlib_strutils.o \
c_code/6_2/stdlib_parseutils.o \
c_code/6_2/stdlib_os.o \
c_code/6_2/stdlib_posix.o \
c_code/6_2/saveData.o \
c_code/6_2/stdlib_algorithm.o \
c_code/6_2/sorts.o \
c_code/6_2/stdlib_sequtils.o \
c_code/6_2/listSpawner.o \
c_code/6_2/shuffle.o \
c_code/6_2/stdlib_math.o \
c_code/6_2/radixListSpawner.o $LINK_FLAGS"
    $LINKER -o $binDir/main  \
c_code/6_2/main.o \
c_code/6_2/stdlib_system.o \
c_code/6_2/bench.o \
c_code/6_2/stdlib_times.o \
c_code/6_2/stdlib_strutils.o \
c_code/6_2/stdlib_parseutils.o \
c_code/6_2/stdlib_os.o \
c_code/6_2/stdlib_posix.o \
c_code/6_2/saveData.o \
c_code/6_2/stdlib_algorithm.o \
c_code/6_2/sorts.o \
c_code/6_2/stdlib_sequtils.o \
c_code/6_2/listSpawner.o \
c_code/6_2/shuffle.o \
c_code/6_2/stdlib_math.o \
c_code/6_2/radixListSpawner.o $LINK_FLAGS
    ;;
  powerpc64)
    echo "$LINKER -o $binDir/main  $LINK_FLAGS"
    $LINKER -o $binDir/main  $LINK_FLAGS
    ;;
  arm)
    echo "$LINKER -o $binDir/main  $LINK_FLAGS"
    $LINKER -o $binDir/main  $LINK_FLAGS
    ;;
  sparc)
    echo "$LINKER -o $binDir/main  $LINK_FLAGS"
    $LINKER -o $binDir/main  $LINK_FLAGS
    ;;
  mips)
    echo "$LINKER -o $binDir/main  $LINK_FLAGS"
    $LINKER -o $binDir/main  $LINK_FLAGS
    ;;
  powerpc)
    echo "$LINKER -o $binDir/main  $LINK_FLAGS"
    $LINKER -o $binDir/main  $LINK_FLAGS
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
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/main.c -o c_code/7_1/main.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/main.c -o c_code/7_1/main.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_system.c -o c_code/7_1/stdlib_system.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_system.c -o c_code/7_1/stdlib_system.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/bench.c -o c_code/7_1/bench.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/bench.c -o c_code/7_1/bench.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_times.c -o c_code/7_1/stdlib_times.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_times.c -o c_code/7_1/stdlib_times.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_strutils.c -o c_code/7_1/stdlib_strutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_strutils.c -o c_code/7_1/stdlib_strutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_parseutils.c -o c_code/7_1/stdlib_parseutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_parseutils.c -o c_code/7_1/stdlib_parseutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_os.c -o c_code/7_1/stdlib_os.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_os.c -o c_code/7_1/stdlib_os.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_posix.c -o c_code/7_1/stdlib_posix.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_posix.c -o c_code/7_1/stdlib_posix.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/saveData.c -o c_code/7_1/saveData.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/saveData.c -o c_code/7_1/saveData.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_algorithm.c -o c_code/7_1/stdlib_algorithm.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_algorithm.c -o c_code/7_1/stdlib_algorithm.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/sorts.c -o c_code/7_1/sorts.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/sorts.c -o c_code/7_1/sorts.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_sequtils.c -o c_code/7_1/stdlib_sequtils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_sequtils.c -o c_code/7_1/stdlib_sequtils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/listSpawner.c -o c_code/7_1/listSpawner.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/listSpawner.c -o c_code/7_1/listSpawner.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/shuffle.c -o c_code/7_1/shuffle.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/shuffle.c -o c_code/7_1/shuffle.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_math.c -o c_code/7_1/stdlib_math.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/stdlib_math.c -o c_code/7_1/stdlib_math.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_1/radixListSpawner.c -o c_code/7_1/radixListSpawner.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_1/radixListSpawner.c -o c_code/7_1/radixListSpawner.o
    echo "$LINKER -o $binDir/main  \
c_code/7_1/main.o \
c_code/7_1/stdlib_system.o \
c_code/7_1/bench.o \
c_code/7_1/stdlib_times.o \
c_code/7_1/stdlib_strutils.o \
c_code/7_1/stdlib_parseutils.o \
c_code/7_1/stdlib_os.o \
c_code/7_1/stdlib_posix.o \
c_code/7_1/saveData.o \
c_code/7_1/stdlib_algorithm.o \
c_code/7_1/sorts.o \
c_code/7_1/stdlib_sequtils.o \
c_code/7_1/listSpawner.o \
c_code/7_1/shuffle.o \
c_code/7_1/stdlib_math.o \
c_code/7_1/radixListSpawner.o $LINK_FLAGS"
    $LINKER -o $binDir/main  \
c_code/7_1/main.o \
c_code/7_1/stdlib_system.o \
c_code/7_1/bench.o \
c_code/7_1/stdlib_times.o \
c_code/7_1/stdlib_strutils.o \
c_code/7_1/stdlib_parseutils.o \
c_code/7_1/stdlib_os.o \
c_code/7_1/stdlib_posix.o \
c_code/7_1/saveData.o \
c_code/7_1/stdlib_algorithm.o \
c_code/7_1/sorts.o \
c_code/7_1/stdlib_sequtils.o \
c_code/7_1/listSpawner.o \
c_code/7_1/shuffle.o \
c_code/7_1/stdlib_math.o \
c_code/7_1/radixListSpawner.o $LINK_FLAGS
    ;;
  amd64)
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/main.c -o c_code/7_2/main.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/main.c -o c_code/7_2/main.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_system.c -o c_code/7_2/stdlib_system.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_system.c -o c_code/7_2/stdlib_system.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/bench.c -o c_code/7_2/bench.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/bench.c -o c_code/7_2/bench.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_times.c -o c_code/7_2/stdlib_times.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_times.c -o c_code/7_2/stdlib_times.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_strutils.c -o c_code/7_2/stdlib_strutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_strutils.c -o c_code/7_2/stdlib_strutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_parseutils.c -o c_code/7_2/stdlib_parseutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_parseutils.c -o c_code/7_2/stdlib_parseutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_os.c -o c_code/7_2/stdlib_os.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_os.c -o c_code/7_2/stdlib_os.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_posix.c -o c_code/7_2/stdlib_posix.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_posix.c -o c_code/7_2/stdlib_posix.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/saveData.c -o c_code/7_2/saveData.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/saveData.c -o c_code/7_2/saveData.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_algorithm.c -o c_code/7_2/stdlib_algorithm.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_algorithm.c -o c_code/7_2/stdlib_algorithm.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/sorts.c -o c_code/7_2/sorts.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/sorts.c -o c_code/7_2/sorts.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_sequtils.c -o c_code/7_2/stdlib_sequtils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_sequtils.c -o c_code/7_2/stdlib_sequtils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/listSpawner.c -o c_code/7_2/listSpawner.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/listSpawner.c -o c_code/7_2/listSpawner.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/shuffle.c -o c_code/7_2/shuffle.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/shuffle.c -o c_code/7_2/shuffle.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_math.c -o c_code/7_2/stdlib_math.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/stdlib_math.c -o c_code/7_2/stdlib_math.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/7_2/radixListSpawner.c -o c_code/7_2/radixListSpawner.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/7_2/radixListSpawner.c -o c_code/7_2/radixListSpawner.o
    echo "$LINKER -o $binDir/main  \
c_code/7_2/main.o \
c_code/7_2/stdlib_system.o \
c_code/7_2/bench.o \
c_code/7_2/stdlib_times.o \
c_code/7_2/stdlib_strutils.o \
c_code/7_2/stdlib_parseutils.o \
c_code/7_2/stdlib_os.o \
c_code/7_2/stdlib_posix.o \
c_code/7_2/saveData.o \
c_code/7_2/stdlib_algorithm.o \
c_code/7_2/sorts.o \
c_code/7_2/stdlib_sequtils.o \
c_code/7_2/listSpawner.o \
c_code/7_2/shuffle.o \
c_code/7_2/stdlib_math.o \
c_code/7_2/radixListSpawner.o $LINK_FLAGS"
    $LINKER -o $binDir/main  \
c_code/7_2/main.o \
c_code/7_2/stdlib_system.o \
c_code/7_2/bench.o \
c_code/7_2/stdlib_times.o \
c_code/7_2/stdlib_strutils.o \
c_code/7_2/stdlib_parseutils.o \
c_code/7_2/stdlib_os.o \
c_code/7_2/stdlib_posix.o \
c_code/7_2/saveData.o \
c_code/7_2/stdlib_algorithm.o \
c_code/7_2/sorts.o \
c_code/7_2/stdlib_sequtils.o \
c_code/7_2/listSpawner.o \
c_code/7_2/shuffle.o \
c_code/7_2/stdlib_math.o \
c_code/7_2/radixListSpawner.o $LINK_FLAGS
    ;;
  powerpc64)
    echo "$LINKER -o $binDir/main  $LINK_FLAGS"
    $LINKER -o $binDir/main  $LINK_FLAGS
    ;;
  arm)
    echo "$LINKER -o $binDir/main  $LINK_FLAGS"
    $LINKER -o $binDir/main  $LINK_FLAGS
    ;;
  sparc)
    echo "$LINKER -o $binDir/main  $LINK_FLAGS"
    $LINKER -o $binDir/main  $LINK_FLAGS
    ;;
  mips)
    echo "$LINKER -o $binDir/main  $LINK_FLAGS"
    $LINKER -o $binDir/main  $LINK_FLAGS
    ;;
  powerpc)
    echo "$LINKER -o $binDir/main  $LINK_FLAGS"
    $LINKER -o $binDir/main  $LINK_FLAGS
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
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/main.c -o c_code/8_1/main.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/main.c -o c_code/8_1/main.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_system.c -o c_code/8_1/stdlib_system.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_system.c -o c_code/8_1/stdlib_system.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/bench.c -o c_code/8_1/bench.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/bench.c -o c_code/8_1/bench.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_times.c -o c_code/8_1/stdlib_times.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_times.c -o c_code/8_1/stdlib_times.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_strutils.c -o c_code/8_1/stdlib_strutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_strutils.c -o c_code/8_1/stdlib_strutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_parseutils.c -o c_code/8_1/stdlib_parseutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_parseutils.c -o c_code/8_1/stdlib_parseutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_os.c -o c_code/8_1/stdlib_os.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_os.c -o c_code/8_1/stdlib_os.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_posix.c -o c_code/8_1/stdlib_posix.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_posix.c -o c_code/8_1/stdlib_posix.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/saveData.c -o c_code/8_1/saveData.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/saveData.c -o c_code/8_1/saveData.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_algorithm.c -o c_code/8_1/stdlib_algorithm.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_algorithm.c -o c_code/8_1/stdlib_algorithm.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/sorts.c -o c_code/8_1/sorts.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/sorts.c -o c_code/8_1/sorts.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_sequtils.c -o c_code/8_1/stdlib_sequtils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_sequtils.c -o c_code/8_1/stdlib_sequtils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/listSpawner.c -o c_code/8_1/listSpawner.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/listSpawner.c -o c_code/8_1/listSpawner.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/shuffle.c -o c_code/8_1/shuffle.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/shuffle.c -o c_code/8_1/shuffle.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_math.c -o c_code/8_1/stdlib_math.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/stdlib_math.c -o c_code/8_1/stdlib_math.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_1/radixListSpawner.c -o c_code/8_1/radixListSpawner.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_1/radixListSpawner.c -o c_code/8_1/radixListSpawner.o
    echo "$LINKER -o $binDir/main  \
c_code/8_1/main.o \
c_code/8_1/stdlib_system.o \
c_code/8_1/bench.o \
c_code/8_1/stdlib_times.o \
c_code/8_1/stdlib_strutils.o \
c_code/8_1/stdlib_parseutils.o \
c_code/8_1/stdlib_os.o \
c_code/8_1/stdlib_posix.o \
c_code/8_1/saveData.o \
c_code/8_1/stdlib_algorithm.o \
c_code/8_1/sorts.o \
c_code/8_1/stdlib_sequtils.o \
c_code/8_1/listSpawner.o \
c_code/8_1/shuffle.o \
c_code/8_1/stdlib_math.o \
c_code/8_1/radixListSpawner.o $LINK_FLAGS"
    $LINKER -o $binDir/main  \
c_code/8_1/main.o \
c_code/8_1/stdlib_system.o \
c_code/8_1/bench.o \
c_code/8_1/stdlib_times.o \
c_code/8_1/stdlib_strutils.o \
c_code/8_1/stdlib_parseutils.o \
c_code/8_1/stdlib_os.o \
c_code/8_1/stdlib_posix.o \
c_code/8_1/saveData.o \
c_code/8_1/stdlib_algorithm.o \
c_code/8_1/sorts.o \
c_code/8_1/stdlib_sequtils.o \
c_code/8_1/listSpawner.o \
c_code/8_1/shuffle.o \
c_code/8_1/stdlib_math.o \
c_code/8_1/radixListSpawner.o $LINK_FLAGS
    ;;
  amd64)
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/main.c -o c_code/8_2/main.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/main.c -o c_code/8_2/main.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_system.c -o c_code/8_2/stdlib_system.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_system.c -o c_code/8_2/stdlib_system.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/bench.c -o c_code/8_2/bench.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/bench.c -o c_code/8_2/bench.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_times.c -o c_code/8_2/stdlib_times.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_times.c -o c_code/8_2/stdlib_times.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_strutils.c -o c_code/8_2/stdlib_strutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_strutils.c -o c_code/8_2/stdlib_strutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_parseutils.c -o c_code/8_2/stdlib_parseutils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_parseutils.c -o c_code/8_2/stdlib_parseutils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_os.c -o c_code/8_2/stdlib_os.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_os.c -o c_code/8_2/stdlib_os.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_posix.c -o c_code/8_2/stdlib_posix.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_posix.c -o c_code/8_2/stdlib_posix.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/saveData.c -o c_code/8_2/saveData.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/saveData.c -o c_code/8_2/saveData.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_algorithm.c -o c_code/8_2/stdlib_algorithm.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_algorithm.c -o c_code/8_2/stdlib_algorithm.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/sorts.c -o c_code/8_2/sorts.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/sorts.c -o c_code/8_2/sorts.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_sequtils.c -o c_code/8_2/stdlib_sequtils.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_sequtils.c -o c_code/8_2/stdlib_sequtils.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/listSpawner.c -o c_code/8_2/listSpawner.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/listSpawner.c -o c_code/8_2/listSpawner.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/shuffle.c -o c_code/8_2/shuffle.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/shuffle.c -o c_code/8_2/shuffle.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_math.c -o c_code/8_2/stdlib_math.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/stdlib_math.c -o c_code/8_2/stdlib_math.o
    echo "$CC $COMP_FLAGS -Ic_code -c c_code/8_2/radixListSpawner.c -o c_code/8_2/radixListSpawner.o"
    $CC $COMP_FLAGS -Ic_code -c c_code/8_2/radixListSpawner.c -o c_code/8_2/radixListSpawner.o
    echo "$LINKER -o $binDir/main  \
c_code/8_2/main.o \
c_code/8_2/stdlib_system.o \
c_code/8_2/bench.o \
c_code/8_2/stdlib_times.o \
c_code/8_2/stdlib_strutils.o \
c_code/8_2/stdlib_parseutils.o \
c_code/8_2/stdlib_os.o \
c_code/8_2/stdlib_posix.o \
c_code/8_2/saveData.o \
c_code/8_2/stdlib_algorithm.o \
c_code/8_2/sorts.o \
c_code/8_2/stdlib_sequtils.o \
c_code/8_2/listSpawner.o \
c_code/8_2/shuffle.o \
c_code/8_2/stdlib_math.o \
c_code/8_2/radixListSpawner.o $LINK_FLAGS"
    $LINKER -o $binDir/main  \
c_code/8_2/main.o \
c_code/8_2/stdlib_system.o \
c_code/8_2/bench.o \
c_code/8_2/stdlib_times.o \
c_code/8_2/stdlib_strutils.o \
c_code/8_2/stdlib_parseutils.o \
c_code/8_2/stdlib_os.o \
c_code/8_2/stdlib_posix.o \
c_code/8_2/saveData.o \
c_code/8_2/stdlib_algorithm.o \
c_code/8_2/sorts.o \
c_code/8_2/stdlib_sequtils.o \
c_code/8_2/listSpawner.o \
c_code/8_2/shuffle.o \
c_code/8_2/stdlib_math.o \
c_code/8_2/radixListSpawner.o $LINK_FLAGS
    ;;
  powerpc64)
    echo "$LINKER -o $binDir/main  $LINK_FLAGS"
    $LINKER -o $binDir/main  $LINK_FLAGS
    ;;
  arm)
    echo "$LINKER -o $binDir/main  $LINK_FLAGS"
    $LINKER -o $binDir/main  $LINK_FLAGS
    ;;
  sparc)
    echo "$LINKER -o $binDir/main  $LINK_FLAGS"
    $LINKER -o $binDir/main  $LINK_FLAGS
    ;;
  mips)
    echo "$LINKER -o $binDir/main  $LINK_FLAGS"
    $LINKER -o $binDir/main  $LINK_FLAGS
    ;;
  powerpc)
    echo "$LINKER -o $binDir/main  $LINK_FLAGS"
    $LINKER -o $binDir/main  $LINK_FLAGS
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

