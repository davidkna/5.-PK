# Generated from niminst
# Template is in tools/niminst/makefile.tmpl
# To regenerate run ``niminst csource`` or ``koch csource``

CC = gcc
LINKER = gcc
COMP_FLAGS = -w -O3 -fno-strict-aliasing
LINK_FLAGS = 
binDir = bin

koch := $(shell sh -c 'test -s ../koch.nim && echo "yes"')
ifeq ($(koch),yes)
	binDir = ../bin
endif

ucpu := $(shell sh -c 'uname -m | tr "[:upper:]" "[:lower:]"')
uos := $(shell sh -c 'uname | tr "[:upper:]" "[:lower:]"')

ifeq ($(uos),linux)
	myos = linux
	LINK_FLAGS += -ldl -lm
endif
ifeq ($(uos),dragonfly)
	myos = freebsd
	LINK_FLAGS += -lm
endif
ifeq ($(uos),freebsd)
	myos= freebsd
	CC = clang
	LINKER = clang
	LINK_FLAGS += -lm
endif
ifeq ($(uos),openbsd)
	myos = openbsd
	LINK_FLAGS += -lm
endif
ifeq ($(uos),netbsd)
	myos = netbsd
	LINK_FLAGS += -lm
endif
ifeq ($(uos),darwin)
	myos = macosx
	CC = clang
	LINKER = clang
	LINK_FLAGS += -ldl -lm
	ifeq ($HOSTTYPE,x86_64)
		ucpu = amd64
	endif
endif
ifeq ($(uos),aix)
	myos = aix
	LINK_FLAGS += -dl -lm
endif
ifeq ($(uos),solaris)
	myos = solaris
	LINK_FLAGS += -ldl -lm -lsocket -lnsl
endif
ifeq ($(uos),sun)
	myos = solaris
	LINK_FLAGS += -ldl -lm -lsocket -lnsl
endif
ifeq ($(uos),haiku)
	myos = haiku
endif
ifndef uos
	@echo "Error: unknown operating system: $(uos)"
	@exit 1
endif

ifeq ($(ucpu),i386)
	mycpu = i386
endif
ifeq ($(ucpu),i486)
	mycpu = i386
endif
ifeq ($(ucpu),i586)
	mycpu = i386
endif
ifeq ($(ucpu),i686)
	mycpu = i386
endif
ifeq ($(ucpu),bepc)
	mycpu = i386
endif
ifeq ($(ucpu),i86pc)
	mycpu = i386
endif
ifeq ($(ucpu),amd64)
	mycpu = amd64
endif
ifeq ($(ucpu),x86-64)
	mycpu = amd64
endif
ifeq ($(ucpu),x86_64)
	mycpu = amd64
endif
ifeq ($(ucpu),sparc)
	mycpu = sparc
endif
ifeq ($(ucpu),sun)
	mycpu = sparc
endif
ifeq ($(ucpu),ppc64)
	mycpu = powerpc64
	ifeq ($(myos),linux)
		COMP_FLAGS += -m64
		LINK_FLAGS += -m64
	endif
endif
ifeq ($(ucpu),powerpc)
	mycpu = powerpc
endif
ifeq ($(ucpu),ppc)
	mycpu = ppc
endif
ifeq ($(ucpu),mips)
	mycpu = mips
endif
ifeq ($(ucpu),arm)
	mycpu = arm
endif
ifeq ($(ucpu),armeb)
	mycpu = arm
endif
ifeq ($(ucpu),armel)
	mycpu = arm
endif
ifeq ($(ucpu),armv6l)
	mycpu = arm
endif
ifndef ucpu
	@echo "Error: unknown processor : $(ucpu)"
	@exit 1
endif

ifeq ($(myos),windows)
	ifeq ($(mycpu),i386)
		oFiles = c_code/1_1/PK.o c_code/1_1/stdlib_system.o c_code/1_1/stdlib_os.o c_code/1_1/stdlib_strutils.o c_code/1_1/stdlib_parseutils.o c_code/1_1/stdlib_times.o c_code/1_1/stdlib_winlean.o c_code/1_1/stdlib_osproc.o c_code/1_1/stdlib_strtabs.o c_code/1_1/stdlib_hashes.o c_code/1_1/stdlib_streams.o c_code/1_1/stdlib_cpuinfo.o
	endif
	ifeq ($(mycpu),amd64)
		oFiles = c_code/1_2/PK.o c_code/1_2/stdlib_system.o c_code/1_2/stdlib_os.o c_code/1_2/stdlib_strutils.o c_code/1_2/stdlib_parseutils.o c_code/1_2/stdlib_times.o c_code/1_2/stdlib_winlean.o c_code/1_2/stdlib_osproc.o c_code/1_2/stdlib_strtabs.o c_code/1_2/stdlib_hashes.o c_code/1_2/stdlib_streams.o c_code/1_2/stdlib_cpuinfo.o
	endif
	ifeq ($(mycpu),powerpc64)
		oFiles =
	endif
	ifeq ($(mycpu),arm)
		oFiles =
	endif
	ifeq ($(mycpu),sparc)
		oFiles =
	endif
	ifeq ($(mycpu),mips)
		oFiles =
	endif
	ifeq ($(mycpu),powerpc)
		oFiles =
	endif
endif
ifeq ($(myos),linux)
	ifeq ($(mycpu),i386)
		oFiles = c_code/2_1/PK.o c_code/2_1/stdlib_system.o c_code/2_1/stdlib_os.o c_code/2_1/stdlib_strutils.o c_code/2_1/stdlib_parseutils.o c_code/2_1/stdlib_times.o c_code/2_1/stdlib_posix.o c_code/2_1/stdlib_osproc.o c_code/2_1/stdlib_strtabs.o c_code/2_1/stdlib_hashes.o c_code/2_1/stdlib_streams.o c_code/2_1/stdlib_cpuinfo.o c_code/2_1/stdlib_linux.o
	endif
	ifeq ($(mycpu),amd64)
		oFiles = c_code/2_2/PK.o c_code/2_2/stdlib_system.o c_code/2_2/stdlib_os.o c_code/2_2/stdlib_strutils.o c_code/2_2/stdlib_parseutils.o c_code/2_2/stdlib_times.o c_code/2_2/stdlib_posix.o c_code/2_2/stdlib_osproc.o c_code/2_2/stdlib_strtabs.o c_code/2_2/stdlib_hashes.o c_code/2_2/stdlib_streams.o c_code/2_2/stdlib_cpuinfo.o c_code/2_2/stdlib_linux.o
	endif
	ifeq ($(mycpu),powerpc64)
		oFiles = c_code/2_3/PK.o c_code/2_3/stdlib_system.o c_code/2_3/stdlib_os.o c_code/2_3/stdlib_strutils.o c_code/2_3/stdlib_parseutils.o c_code/2_3/stdlib_times.o c_code/2_3/stdlib_posix.o c_code/2_3/stdlib_osproc.o c_code/2_3/stdlib_strtabs.o c_code/2_3/stdlib_hashes.o c_code/2_3/stdlib_streams.o c_code/2_3/stdlib_cpuinfo.o c_code/2_3/stdlib_linux.o
	endif
	ifeq ($(mycpu),arm)
		oFiles = c_code/2_4/PK.o c_code/2_4/stdlib_system.o c_code/2_4/stdlib_os.o c_code/2_4/stdlib_strutils.o c_code/2_4/stdlib_parseutils.o c_code/2_4/stdlib_times.o c_code/2_4/stdlib_posix.o c_code/2_4/stdlib_osproc.o c_code/2_4/stdlib_strtabs.o c_code/2_4/stdlib_hashes.o c_code/2_4/stdlib_streams.o c_code/2_4/stdlib_cpuinfo.o c_code/2_4/stdlib_linux.o
	endif
	ifeq ($(mycpu),sparc)
		oFiles = c_code/2_5/PK.o c_code/2_5/stdlib_system.o c_code/2_5/stdlib_os.o c_code/2_5/stdlib_strutils.o c_code/2_5/stdlib_parseutils.o c_code/2_5/stdlib_times.o c_code/2_5/stdlib_posix.o c_code/2_5/stdlib_osproc.o c_code/2_5/stdlib_strtabs.o c_code/2_5/stdlib_hashes.o c_code/2_5/stdlib_streams.o c_code/2_5/stdlib_cpuinfo.o c_code/2_5/stdlib_linux.o
	endif
	ifeq ($(mycpu),mips)
		oFiles = c_code/2_6/PK.o c_code/2_6/stdlib_system.o c_code/2_6/stdlib_os.o c_code/2_6/stdlib_strutils.o c_code/2_6/stdlib_parseutils.o c_code/2_6/stdlib_times.o c_code/2_6/stdlib_posix.o c_code/2_6/stdlib_osproc.o c_code/2_6/stdlib_strtabs.o c_code/2_6/stdlib_hashes.o c_code/2_6/stdlib_streams.o c_code/2_6/stdlib_cpuinfo.o c_code/2_6/stdlib_linux.o
	endif
	ifeq ($(mycpu),powerpc)
		oFiles = c_code/2_7/PK.o c_code/2_7/stdlib_system.o c_code/2_7/stdlib_os.o c_code/2_7/stdlib_strutils.o c_code/2_7/stdlib_parseutils.o c_code/2_7/stdlib_times.o c_code/2_7/stdlib_posix.o c_code/2_7/stdlib_osproc.o c_code/2_7/stdlib_strtabs.o c_code/2_7/stdlib_hashes.o c_code/2_7/stdlib_streams.o c_code/2_7/stdlib_cpuinfo.o c_code/2_7/stdlib_linux.o
	endif
endif
ifeq ($(myos),macosx)
	ifeq ($(mycpu),i386)
		oFiles = c_code/3_1/PK.o c_code/3_1/stdlib_system.o c_code/3_1/stdlib_os.o c_code/3_1/stdlib_strutils.o c_code/3_1/stdlib_parseutils.o c_code/3_1/stdlib_times.o c_code/3_1/stdlib_posix.o c_code/3_1/stdlib_osproc.o c_code/3_1/stdlib_strtabs.o c_code/3_1/stdlib_hashes.o c_code/3_1/stdlib_streams.o c_code/3_1/stdlib_cpuinfo.o
	endif
	ifeq ($(mycpu),amd64)
		oFiles = c_code/3_2/PK.o c_code/3_2/stdlib_system.o c_code/3_2/stdlib_os.o c_code/3_2/stdlib_strutils.o c_code/3_2/stdlib_parseutils.o c_code/3_2/stdlib_times.o c_code/3_2/stdlib_posix.o c_code/3_2/stdlib_osproc.o c_code/3_2/stdlib_strtabs.o c_code/3_2/stdlib_hashes.o c_code/3_2/stdlib_streams.o c_code/3_2/stdlib_cpuinfo.o
	endif
	ifeq ($(mycpu),powerpc64)
		oFiles = c_code/3_3/PK.o c_code/3_3/stdlib_system.o c_code/3_3/stdlib_os.o c_code/3_3/stdlib_strutils.o c_code/3_3/stdlib_parseutils.o c_code/3_3/stdlib_times.o c_code/3_3/stdlib_posix.o c_code/3_3/stdlib_osproc.o c_code/3_3/stdlib_strtabs.o c_code/3_3/stdlib_hashes.o c_code/3_3/stdlib_streams.o c_code/3_3/stdlib_cpuinfo.o
	endif
	ifeq ($(mycpu),arm)
		oFiles =
	endif
	ifeq ($(mycpu),sparc)
		oFiles =
	endif
	ifeq ($(mycpu),mips)
		oFiles =
	endif
	ifeq ($(mycpu),powerpc)
		oFiles =
	endif
endif
ifeq ($(myos),solaris)
	ifeq ($(mycpu),i386)
		oFiles = c_code/4_1/PK.o c_code/4_1/stdlib_system.o c_code/4_1/stdlib_os.o c_code/4_1/stdlib_strutils.o c_code/4_1/stdlib_parseutils.o c_code/4_1/stdlib_times.o c_code/4_1/stdlib_posix.o c_code/4_1/stdlib_osproc.o c_code/4_1/stdlib_strtabs.o c_code/4_1/stdlib_hashes.o c_code/4_1/stdlib_streams.o c_code/4_1/stdlib_cpuinfo.o
	endif
	ifeq ($(mycpu),amd64)
		oFiles = c_code/4_2/PK.o c_code/4_2/stdlib_system.o c_code/4_2/stdlib_os.o c_code/4_2/stdlib_strutils.o c_code/4_2/stdlib_parseutils.o c_code/4_2/stdlib_times.o c_code/4_2/stdlib_posix.o c_code/4_2/stdlib_osproc.o c_code/4_2/stdlib_strtabs.o c_code/4_2/stdlib_hashes.o c_code/4_2/stdlib_streams.o c_code/4_2/stdlib_cpuinfo.o
	endif
	ifeq ($(mycpu),powerpc64)
		oFiles =
	endif
	ifeq ($(mycpu),arm)
		oFiles =
	endif
	ifeq ($(mycpu),sparc)
		oFiles = c_code/4_5/PK.o c_code/4_5/stdlib_system.o c_code/4_5/stdlib_os.o c_code/4_5/stdlib_strutils.o c_code/4_5/stdlib_parseutils.o c_code/4_5/stdlib_times.o c_code/4_5/stdlib_posix.o c_code/4_5/stdlib_osproc.o c_code/4_5/stdlib_strtabs.o c_code/4_5/stdlib_hashes.o c_code/4_5/stdlib_streams.o c_code/4_5/stdlib_cpuinfo.o
	endif
	ifeq ($(mycpu),mips)
		oFiles =
	endif
	ifeq ($(mycpu),powerpc)
		oFiles =
	endif
endif
ifeq ($(myos),freebsd)
	ifeq ($(mycpu),i386)
		oFiles = c_code/5_1/PK.o c_code/5_1/stdlib_system.o c_code/5_1/stdlib_os.o c_code/5_1/stdlib_strutils.o c_code/5_1/stdlib_parseutils.o c_code/5_1/stdlib_times.o c_code/5_1/stdlib_posix.o c_code/5_1/stdlib_osproc.o c_code/5_1/stdlib_strtabs.o c_code/5_1/stdlib_hashes.o c_code/5_1/stdlib_streams.o c_code/5_1/stdlib_cpuinfo.o
	endif
	ifeq ($(mycpu),amd64)
		oFiles = c_code/5_2/PK.o c_code/5_2/stdlib_system.o c_code/5_2/stdlib_os.o c_code/5_2/stdlib_strutils.o c_code/5_2/stdlib_parseutils.o c_code/5_2/stdlib_times.o c_code/5_2/stdlib_posix.o c_code/5_2/stdlib_osproc.o c_code/5_2/stdlib_strtabs.o c_code/5_2/stdlib_hashes.o c_code/5_2/stdlib_streams.o c_code/5_2/stdlib_cpuinfo.o
	endif
	ifeq ($(mycpu),powerpc64)
		oFiles =
	endif
	ifeq ($(mycpu),arm)
		oFiles =
	endif
	ifeq ($(mycpu),sparc)
		oFiles =
	endif
	ifeq ($(mycpu),mips)
		oFiles =
	endif
	ifeq ($(mycpu),powerpc)
		oFiles =
	endif
endif
ifeq ($(myos),netbsd)
	ifeq ($(mycpu),i386)
		oFiles = c_code/6_1/PK.o c_code/6_1/stdlib_system.o c_code/6_1/stdlib_os.o c_code/6_1/stdlib_strutils.o c_code/6_1/stdlib_parseutils.o c_code/6_1/stdlib_times.o c_code/6_1/stdlib_posix.o c_code/6_1/stdlib_osproc.o c_code/6_1/stdlib_strtabs.o c_code/6_1/stdlib_hashes.o c_code/6_1/stdlib_streams.o c_code/6_1/stdlib_cpuinfo.o
	endif
	ifeq ($(mycpu),amd64)
		oFiles = c_code/6_2/PK.o c_code/6_2/stdlib_system.o c_code/6_2/stdlib_os.o c_code/6_2/stdlib_strutils.o c_code/6_2/stdlib_parseutils.o c_code/6_2/stdlib_times.o c_code/6_2/stdlib_posix.o c_code/6_2/stdlib_osproc.o c_code/6_2/stdlib_strtabs.o c_code/6_2/stdlib_hashes.o c_code/6_2/stdlib_streams.o c_code/6_2/stdlib_cpuinfo.o
	endif
	ifeq ($(mycpu),powerpc64)
		oFiles =
	endif
	ifeq ($(mycpu),arm)
		oFiles =
	endif
	ifeq ($(mycpu),sparc)
		oFiles =
	endif
	ifeq ($(mycpu),mips)
		oFiles =
	endif
	ifeq ($(mycpu),powerpc)
		oFiles =
	endif
endif
ifeq ($(myos),openbsd)
	ifeq ($(mycpu),i386)
		oFiles = c_code/7_1/PK.o c_code/7_1/stdlib_system.o c_code/7_1/stdlib_os.o c_code/7_1/stdlib_strutils.o c_code/7_1/stdlib_parseutils.o c_code/7_1/stdlib_times.o c_code/7_1/stdlib_posix.o c_code/7_1/stdlib_osproc.o c_code/7_1/stdlib_strtabs.o c_code/7_1/stdlib_hashes.o c_code/7_1/stdlib_streams.o c_code/7_1/stdlib_cpuinfo.o
	endif
	ifeq ($(mycpu),amd64)
		oFiles = c_code/7_2/PK.o c_code/7_2/stdlib_system.o c_code/7_2/stdlib_os.o c_code/7_2/stdlib_strutils.o c_code/7_2/stdlib_parseutils.o c_code/7_2/stdlib_times.o c_code/7_2/stdlib_posix.o c_code/7_2/stdlib_osproc.o c_code/7_2/stdlib_strtabs.o c_code/7_2/stdlib_hashes.o c_code/7_2/stdlib_streams.o c_code/7_2/stdlib_cpuinfo.o
	endif
	ifeq ($(mycpu),powerpc64)
		oFiles =
	endif
	ifeq ($(mycpu),arm)
		oFiles =
	endif
	ifeq ($(mycpu),sparc)
		oFiles =
	endif
	ifeq ($(mycpu),mips)
		oFiles =
	endif
	ifeq ($(mycpu),powerpc)
		oFiles =
	endif
endif
ifeq ($(myos),haiku)
	ifeq ($(mycpu),i386)
		oFiles = c_code/8_1/PK.o c_code/8_1/stdlib_system.o c_code/8_1/stdlib_os.o c_code/8_1/stdlib_strutils.o c_code/8_1/stdlib_parseutils.o c_code/8_1/stdlib_times.o c_code/8_1/stdlib_posix.o c_code/8_1/stdlib_osproc.o c_code/8_1/stdlib_strtabs.o c_code/8_1/stdlib_hashes.o c_code/8_1/stdlib_streams.o c_code/8_1/stdlib_cpuinfo.o
	endif
	ifeq ($(mycpu),amd64)
		oFiles = c_code/8_2/PK.o c_code/8_2/stdlib_system.o c_code/8_2/stdlib_os.o c_code/8_2/stdlib_strutils.o c_code/8_2/stdlib_parseutils.o c_code/8_2/stdlib_times.o c_code/8_2/stdlib_posix.o c_code/8_2/stdlib_osproc.o c_code/8_2/stdlib_strtabs.o c_code/8_2/stdlib_hashes.o c_code/8_2/stdlib_streams.o c_code/8_2/stdlib_cpuinfo.o
	endif
	ifeq ($(mycpu),powerpc64)
		oFiles =
	endif
	ifeq ($(mycpu),arm)
		oFiles =
	endif
	ifeq ($(mycpu),sparc)
		oFiles =
	endif
	ifeq ($(mycpu),mips)
		oFiles =
	endif
	ifeq ($(mycpu),powerpc)
		oFiles =
	endif
endif

ifeq ($(strip $(oFiles)),)
	@echo "Error: no C code generated for: [$(myos): $(mycpu)]"
	@exit 1
endif

%.o: %.c
	$(CC) $(COMP_FLAGS) -Ic_code -c $< -o $@

$(binDir)/pk: $(oFiles)
	@mkdir -p $(binDir)
	$(LINKER) -o $@ $^ $(LINK_FLAGS)
	@echo "SUCCESS"

.PHONY: clean

clean:
	rm -f $(oFiles) $(binDir)/pk

