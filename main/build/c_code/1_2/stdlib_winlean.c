/* Generated by Nim Compiler v0.10.3 */
/*   (c) 2015 Andreas Rumpf */
/* The generated code is subject to the original license. */
#define NIM_INTBITS 64
#include "nimbase.h"

#include <string.h>
typedef struct Tguid104614 Tguid104614;
typedef struct TGenericSeq TGenericSeq;
typedef struct NimStringDesc NimStringDesc;
typedef struct Tfiletime102242 Tfiletime102242;
typedef NI8 TY104627[8];
struct  Tguid104614  {
NI32 D1;
NI16 D2;
NI16 D3;
TY104627 D4;
};
typedef NI8 TY104712[8];
struct  TGenericSeq  {
NI len;
NI reserved;
};
struct  NimStringDesc  {
  TGenericSeq Sup;
NIM_CHAR data[SEQ_DECL_SIZE];
};
typedef N_STDCALL_PTR(NI32, TY103418) (NI16* lpfilename);
typedef N_STDCALL_PTR(NI32, TY102818) (NI16* pathname, void* security);
typedef N_STDCALL_PTR(NI32, TY102658) (void);
typedef N_STDCALL_PTR(NI32, TY102663) (NI32 dwflags, void* lpsource, NI32 dwmessageid, NI32 dwlanguageid, void* lpbuffer, NI32 nsize, void* Arguments);
typedef N_STDCALL_PTR(void, TY102805) (void* p);
typedef N_STDCALL_PTR(void, TY103625) (Tfiletime102242* lpsystemtimeasfiletime);
struct  Tfiletime102242  {
NI32 dwlowdatetime;
NI32 dwhighdatetime;
};
typedef N_STDCALL_PTR(NI32, TY104327) (NI16* pathname);
typedef N_STDCALL_PTR(NI32, TY103421) (NI16* lpfilename, NI32 dwfileattributes);
N_NIMCALL(void*, nimLoadLibrary)(NimStringDesc* path);
N_NOINLINE(void, nimLoadLibraryError)(NimStringDesc* path);
N_NIMCALL(void*, nimGetProcAddr)(void* lib, NCSTRING name);
NIM_CONST TY104712 TMP15 = {((NI8) -114),
((NI8) -23),
((NI8) 118),
((NI8) -27),
((NI8) -116),
((NI8) 116),
((NI8) 6),
((NI8) 62)}
;
NIM_CONST TY104712 TMP16 = {((NI8) -107),
((NI8) -54),
((NI8) 0),
((NI8) -128),
((NI8) 95),
((NI8) 72),
((NI8) -95),
((NI8) -110)}
;
STRING_LITERAL(TMP36, "kernel32", 8);
STRING_LITERAL(TMP37, "kernel32", 8);
Tguid104614 Wsaidconnectex_104714;
Tguid104614 Wsaidacceptex_104718;
Tguid104614 Wsaidgetacceptexsockaddrs_104722;
static void* TMP35;
TY103418 Dl_103417;
TY102818 Dl_102817;
TY102658 Dl_102657;
TY102663 Dl_102662;
TY102805 Dl_102804;
TY103625 Dl_103624;
TY104327 Dl_104326;
TY103421 Dl_103420;

N_NIMCALL(NI64, rdfiletime_103604)(Tfiletime102242 f) {
	NI64 result;
	result = 0;
	result = (NI64)(((NI64)(NU64)(NU32)(f.dwlowdatetime)) | (NI64)((NU64)(((NI64)(NU64)(NU32)(f.dwhighdatetime))) << (NU64)(IL64(32))));
	return result;
}
NIM_EXTERNC N_NOINLINE(void, stdlib_winleanInit)(void) {
	Tguid104614 LOC1;
	Tguid104614 LOC2;
	Tguid104614 LOC3;
	memset((void*)(&LOC1), 0, sizeof(LOC1));
	LOC1.D1 = ((NI32) 631375801);
	LOC1.D2 = ((NI16) -8717);
	LOC1.D3 = ((NI16) 18016);
	memcpy((void*)LOC1.D4, (NIM_CONST void*)TMP15, sizeof(LOC1.D4));
	Wsaidconnectex_104714 = LOC1;
	memset((void*)(&LOC2), 0, sizeof(LOC2));
	LOC2.D1 = ((NI32) -1254720015);
	LOC2.D2 = ((NI16) -13396);
	LOC2.D3 = ((NI16) 4559);
	memcpy((void*)LOC2.D4, (NIM_CONST void*)TMP16, sizeof(LOC2.D4));
	Wsaidacceptex_104718 = LOC2;
	memset((void*)(&LOC3), 0, sizeof(LOC3));
	LOC3.D1 = ((NI32) -1254720014);
	LOC3.D2 = ((NI16) -13396);
	LOC3.D3 = ((NI16) 4559);
	memcpy((void*)LOC3.D4, (NIM_CONST void*)TMP16, sizeof(LOC3.D4));
	Wsaidgetacceptexsockaddrs_104722 = LOC3;
}

NIM_EXTERNC N_NOINLINE(void, stdlib_winleanDatInit)(void) {
if (!((TMP35 = nimLoadLibrary((NimStringDesc*) &TMP36))
)) nimLoadLibraryError((NimStringDesc*) &TMP37);
	Dl_103417 = (TY103418) nimGetProcAddr(TMP35, "GetFileAttributesW");
	Dl_102817 = (TY102818) nimGetProcAddr(TMP35, "CreateDirectoryW");
	Dl_102657 = (TY102658) nimGetProcAddr(TMP35, "GetLastError");
	Dl_102662 = (TY102663) nimGetProcAddr(TMP35, "FormatMessageW");
	Dl_102804 = (TY102805) nimGetProcAddr(TMP35, "LocalFree");
	Dl_103624 = (TY103625) nimGetProcAddr(TMP35, "GetSystemTimeAsFileTime");
	Dl_104326 = (TY104327) nimGetProcAddr(TMP35, "DeleteFileW");
	Dl_103420 = (TY103421) nimGetProcAddr(TMP35, "SetFileAttributesW");
}

