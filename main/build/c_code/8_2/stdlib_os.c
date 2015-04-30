/* Generated by Nim Compiler v0.10.3 */
/*   (c) 2015 Andreas Rumpf */
/* The generated code is subject to the original license. */
#define NIM_INTBITS 64
#include "nimbase.h"

#include <sys/stat.h>

#include <sys/types.h>

#include <time.h>

#include <string.h>

#include <errno.h>

#include <stdio.h>
typedef struct TY121008 TY121008;
typedef struct NimStringDesc NimStringDesc;
typedef struct TGenericSeq TGenericSeq;
typedef struct Oserror3433 Oserror3433;
typedef struct Systemerror3429 Systemerror3429;
typedef struct Exception Exception;
typedef struct TNimObject TNimObject;
typedef struct TNimType TNimType;
typedef struct TNimNode TNimNode;
typedef struct Tcell46347 Tcell46347;
typedef struct Tcellseq46363 Tcellseq46363;
typedef struct Tgcheap48216 Tgcheap48216;
typedef struct Tcellset46359 Tcellset46359;
typedef struct Tpagedesc46355 Tpagedesc46355;
typedef struct Tmemregion28210 Tmemregion28210;
typedef struct Tsmallchunk27440 Tsmallchunk27440;
typedef struct Tllchunk28204 Tllchunk28204;
typedef struct Tbigchunk27442 Tbigchunk27442;
typedef struct Tintset27417 Tintset27417;
typedef struct Ttrunk27413 Ttrunk27413;
typedef struct Tavlnode28208 Tavlnode28208;
typedef struct Tgcstat48214 Tgcstat48214;
typedef struct Tbasechunk27438 Tbasechunk27438;
typedef struct Tfreecell27430 Tfreecell27430;
struct  TGenericSeq  {
NI len;
NI reserved;
};
struct  NimStringDesc  {
  TGenericSeq Sup;
NIM_CHAR data[SEQ_DECL_SIZE];
};
typedef N_NIMCALL_PTR(void, TY3289) (void* p, NI op);
typedef N_NIMCALL_PTR(void*, TY3294) (void* p);
struct  TNimType  {
NI size;
NU8 kind;
NU8 flags;
TNimType* base;
TNimNode* node;
void* finalizer;
TY3289 marker;
TY3294 deepcopy;
};
struct  TNimObject  {
TNimType* m_type;
};
struct  Exception  {
  TNimObject Sup;
Exception* parent;
NCSTRING name;
NimStringDesc* message;
NimStringDesc* trace;
};
struct  Systemerror3429  {
  Exception Sup;
};
struct  Oserror3433  {
  Systemerror3429 Sup;
NI32 errorcode;
};
struct  TNimNode  {
NU8 kind;
NI offset;
TNimType* typ;
NCSTRING name;
NI len;
TNimNode** sons;
};
struct  Tcell46347  {
NI refcount;
TNimType* typ;
};
struct  Tcellseq46363  {
NI len;
NI cap;
Tcell46347** d;
};
struct  Tcellset46359  {
NI counter;
NI max;
Tpagedesc46355* head;
Tpagedesc46355** data;
};
typedef Tsmallchunk27440* TY28222[512];
typedef Ttrunk27413* Ttrunkbuckets27415[256];
struct  Tintset27417  {
Ttrunkbuckets27415 data;
};
struct  Tmemregion28210  {
NI minlargeobj;
NI maxlargeobj;
TY28222 freesmallchunks;
Tllchunk28204* llmem;
NI currmem;
NI maxmem;
NI freemem;
NI lastsize;
Tbigchunk27442* freechunkslist;
Tintset27417 chunkstarts;
Tavlnode28208* root;
Tavlnode28208* deleted;
Tavlnode28208* last;
Tavlnode28208* freeavlnodes;
};
struct  Tgcstat48214  {
NI stackscans;
NI cyclecollections;
NI maxthreshold;
NI maxstacksize;
NI maxstackcells;
NI cycletablesize;
NI64 maxpause;
};
struct  Tgcheap48216  {
void* stackbottom;
NI cyclethreshold;
Tcellseq46363 zct;
Tcellseq46363 decstack;
Tcellset46359 cycleroots;
Tcellseq46363 tempstack;
NI recgclock;
Tmemregion28210 region;
Tgcstat48214 stat;
};
typedef NI TY27420[8];
struct  Tpagedesc46355  {
Tpagedesc46355* next;
NI key;
TY27420 bits;
};
struct  Tbasechunk27438  {
NI prevsize;
NI size;
NIM_BOOL used;
};
struct  Tsmallchunk27440  {
  Tbasechunk27438 Sup;
Tsmallchunk27440* next;
Tsmallchunk27440* prev;
Tfreecell27430* freelist;
NI free;
NI acc;
NF data;
};
struct  Tllchunk28204  {
NI size;
NI acc;
Tllchunk28204* next;
};
struct  Tbigchunk27442  {
  Tbasechunk27438 Sup;
Tbigchunk27442* next;
Tbigchunk27442* prev;
NI align;
NF data;
};
struct  Ttrunk27413  {
Ttrunk27413* next;
NI key;
TY27420 bits;
};
typedef Tavlnode28208* TY28214[2];
struct  Tavlnode28208  {
TY28214 link;
NI key;
NI upperbound;
NI level;
};
struct  Tfreecell27430  {
Tfreecell27430* next;
NI zerofield;
};
struct TY121008 {
  TGenericSeq Sup;
  NimStringDesc* data[SEQ_DECL_SIZE];
};
N_NIMCALL(void, rawcreatedir_122839)(NimStringDesc* dir);
N_NIMCALL(void, raiseoserror_115809)(NI32 errorcode);
N_NIMCALL(void*, newObj)(TNimType* typ, NI size);
N_NIMCALL(NimStringDesc*, oserrormsg_115620)(NI32 errorcode);
N_NIMCALL(NimStringDesc*, copyString)(NimStringDesc* src);
N_NIMCALL(NimStringDesc*, cstrToNimstr)(NCSTRING str);
static N_INLINE(void, asgnRefNoCycle)(void** dest, void* src);
static N_INLINE(Tcell46347*, usrtocell_49846)(void* usr);
static N_INLINE(void, rtladdzct_51404)(Tcell46347* c);
N_NOINLINE(void, addzct_49817)(Tcellseq46363* s, Tcell46347* c);
N_NIMCALL(NimStringDesc*, copyStringRC1)(NimStringDesc* src);
static N_INLINE(void, nimGCunrefNoCycle)(void* p);
N_NIMCALL(void, raiseException)(Exception* e, NCSTRING ename);
N_NIMCALL(NI32, oslasterror_115833)(void);
N_NIMCALL(NimStringDesc*, copyStrLast)(NimStringDesc* s, NI start_76243, NI last);
N_NIMCALL(NimStringDesc*, copyStrLast)(NimStringDesc* s, NI first, NI last);
STRING_LITERAL(TMP37, "", 0);
STRING_LITERAL(TMP38, "unknown OS error", 16);
NIM_BOOL envcomputed_121007;
TY121008* environment_121009;
extern NCSTRING* environ;
extern int cmdCount;
extern NCSTRING* cmdLine;
extern TNimType NTI115812; /* ref OSError */
extern TNimType NTI3433; /* OSError */
extern Tgcheap48216 gch_48244;

N_NIMCALL(NIM_BOOL, nosexistsDir)(NimStringDesc* dir) {
	NIM_BOOL result;
	struct stat res;
	NIM_BOOL LOC1;
	int LOC2;
{	result = 0;
	memset((void*)(&res), 0, sizeof(res));
	LOC1 = 0;
	LOC2 = 0;
	LOC2 = stat(dir->data, (&res));
	LOC1 = (((NI32) 0) <= LOC2);
	if (!(LOC1)) goto LA3;
	LOC1 = S_ISDIR(res.st_mode);
	LA3: ;
	result = LOC1;
	goto BeforeRet;
	}BeforeRet: ;
	return result;
}

N_NIMCALL(NimStringDesc*, oserrormsg_115620)(NI32 errorcode) {
	NimStringDesc* result;
	result = 0;
	result = copyString(((NimStringDesc*) &TMP37));
	{
		NCSTRING LOC5;
		if (!!((errorcode == ((NI32) 0)))) goto LA3;
		LOC5 = 0;
		LOC5 = strerror(errorcode);
		result = cstrToNimstr(LOC5);
	}
	LA3: ;
	return result;
}

static N_INLINE(Tcell46347*, usrtocell_49846)(void* usr) {
	Tcell46347* result;
	result = 0;
	result = ((Tcell46347*) ((NI)((NU64)(((NI) (usr))) - (NU64)(((NI)sizeof(Tcell46347))))));
	return result;
}

static N_INLINE(void, rtladdzct_51404)(Tcell46347* c) {
	addzct_49817((&gch_48244.zct), c);
}

static N_INLINE(void, asgnRefNoCycle)(void** dest, void* src) {
	{
		Tcell46347* c;
		if (!!((src == NIM_NIL))) goto LA3;
		c = usrtocell_49846(src);
		(*c).refcount += ((NI) 8);
	}
	LA3: ;
	{
		Tcell46347* c;
		if (!!(((*dest) == NIM_NIL))) goto LA7;
		c = usrtocell_49846((*dest));
		{
			(*c).refcount -= ((NI) 8);
			if (!((NU64)((*c).refcount) < (NU64)(((NI) 8)))) goto LA11;
			rtladdzct_51404(c);
		}
		LA11: ;
	}
	LA7: ;
	(*dest) = src;
}

static N_INLINE(void, nimGCunrefNoCycle)(void* p) {
	Tcell46347* c;
	c = usrtocell_49846(p);
	{
		(*c).refcount -= ((NI) 8);
		if (!((NU64)((*c).refcount) < (NU64)(((NI) 8)))) goto LA3;
		rtladdzct_51404(c);
	}
	LA3: ;
}

N_NIMCALL(void, raiseoserror_115809)(NI32 errorcode) {
	Oserror3433* e;
	e = 0;
	e = (Oserror3433*) newObj((&NTI115812), sizeof(Oserror3433));
	(*e).Sup.Sup.Sup.m_type = (&NTI3433);
	(*e).errorcode = errorcode;
	asgnRefNoCycle((void**) (&(*e).Sup.Sup.message), oserrormsg_115620(errorcode));
	{
		NimStringDesc* LOC5;
		if (!(((*e).Sup.Sup.message) && ((*e).Sup.Sup.message)->Sup.len == 0)) goto LA3;
		LOC5 = 0;
		LOC5 = (*e).Sup.Sup.message; (*e).Sup.Sup.message = copyStringRC1(((NimStringDesc*) &TMP38));
		if (LOC5) nimGCunrefNoCycle(LOC5);
	}
	LA3: ;
	raiseException((Exception*)e, "OSError");
}

N_NIMCALL(NI32, oslasterror_115833)(void) {
	NI32 result;
	result = 0;
	result = errno;
	return result;
}

N_NIMCALL(void, rawcreatedir_122839)(NimStringDesc* dir) {
	{
		NIM_BOOL LOC3;
		int LOC4;
		NI32 LOC8;
		LOC3 = 0;
		LOC4 = 0;
		LOC4 = mkdir(dir->data, ((mode_t) 511));
		LOC3 = !((LOC4 == ((NI32) 0)));
		if (!(LOC3)) goto LA5;
		LOC3 = !((errno == EEXIST));
		LA5: ;
		if (!LOC3) goto LA6;
		LOC8 = 0;
		LOC8 = oslasterror_115833();
		raiseoserror_115809(LOC8);
	}
	LA6: ;
}

N_NIMCALL(void, noscreateDir)(NimStringDesc* dir) {
	NIM_BOOL omitnext;
	omitnext = NIM_FALSE;
	{
		NI i_123211;
		NI HEX3Atmp_123224;
		NI res_123227;
		i_123211 = 0;
		HEX3Atmp_123224 = 0;
		HEX3Atmp_123224 = (NI)((dir ? dir->Sup.len : 0) - ((NI) 1));
		res_123227 = ((NI) 1);
		{
			while (1) {
				if (!(res_123227 <= HEX3Atmp_123224)) goto LA3;
				i_123211 = res_123227;
				{
					if (!(((NU8)(dir->data[i_123211])) == ((NU8)(47)) || ((NU8)(dir->data[i_123211])) == ((NU8)(47)))) goto LA6;
					{
						if (!omitnext) goto LA10;
						omitnext = NIM_FALSE;
					}
					goto LA8;
					LA10: ;
					{
						NimStringDesc* LOC13;
						LOC13 = 0;
						LOC13 = copyStrLast(dir, ((NI) 0), (NI)(i_123211 - ((NI) 1)));
						rawcreatedir_122839(LOC13);
					}
					LA8: ;
				}
				LA6: ;
				res_123227 += ((NI) 1);
			} LA3: ;
		}
	}
	rawcreatedir_122839(dir);
}

N_NIMCALL(NIM_BOOL, nosexistsFile)(NimStringDesc* filename) {
	NIM_BOOL result;
	struct stat res;
	NIM_BOOL LOC1;
	int LOC2;
{	result = 0;
	memset((void*)(&res), 0, sizeof(res));
	LOC1 = 0;
	LOC2 = 0;
	LOC2 = stat(filename->data, (&res));
	LOC1 = (((NI32) 0) <= LOC2);
	if (!(LOC1)) goto LA3;
	LOC1 = S_ISREG(res.st_mode);
	LA3: ;
	result = LOC1;
	goto BeforeRet;
	}BeforeRet: ;
	return result;
}

N_NIMCALL(void, nosremoveFile)(NimStringDesc* file) {
	{
		NIM_BOOL LOC3;
		int LOC4;
		Oserror3433* e_120803;
		NCSTRING LOC8;
		LOC3 = 0;
		LOC4 = 0;
		LOC4 = remove(file->data);
		LOC3 = !((LOC4 == ((NI32) 0)));
		if (!(LOC3)) goto LA5;
		LOC3 = !((errno == ENOENT));
		LA5: ;
		if (!LOC3) goto LA6;
		e_120803 = 0;
		e_120803 = (Oserror3433*) newObj((&NTI115812), sizeof(Oserror3433));
		(*e_120803).Sup.Sup.Sup.m_type = (&NTI3433);
		LOC8 = 0;
		LOC8 = strerror(errno);
		asgnRefNoCycle((void**) (&(*e_120803).Sup.Sup.message), cstrToNimstr(LOC8));
		raiseException((Exception*)e_120803, "OSError");
	}
	LA6: ;
}
NIM_EXTERNC N_NOINLINE(void, stdlib_osInit)(void) {
}

NIM_EXTERNC N_NOINLINE(void, stdlib_osDatInit)(void) {
}

