/* Generated by Nim Compiler v0.10.3 */
/*   (c) 2015 Andreas Rumpf */
/* The generated code is subject to the original license. */
#define NIM_INTBITS 64
#include "nimbase.h"

#include <string.h>
typedef struct NimStringDesc NimStringDesc;
typedef struct TGenericSeq TGenericSeq;
typedef struct Twin32finddata104219 Twin32finddata104219;
typedef struct Tfiletime103242 Tfiletime103242;
typedef struct TY117789 TY117789;
typedef struct Tcell46346 Tcell46346;
typedef struct TNimType TNimType;
typedef struct Tcellseq46362 Tcellseq46362;
typedef struct Tgcheap48216 Tgcheap48216;
typedef struct Tcellset46358 Tcellset46358;
typedef struct Tpagedesc46354 Tpagedesc46354;
typedef struct Tmemregion28210 Tmemregion28210;
typedef struct Tsmallchunk27440 Tsmallchunk27440;
typedef struct Tllchunk28204 Tllchunk28204;
typedef struct Tbigchunk27442 Tbigchunk27442;
typedef struct Tintset27417 Tintset27417;
typedef struct Ttrunk27413 Ttrunk27413;
typedef struct Tavlnode28208 Tavlnode28208;
typedef struct Tgcstat48214 Tgcstat48214;
typedef struct Processobj143402 Processobj143402;
typedef struct Stringtableobj135012 Stringtableobj135012;
typedef struct TNimNode TNimNode;
typedef struct Tbasechunk27438 Tbasechunk27438;
typedef struct Tfreecell27430 Tfreecell27430;
typedef struct TNimObject TNimObject;
typedef struct Keyvaluepairseq135010 Keyvaluepairseq135010;
typedef struct TY117508 TY117508;
struct  TGenericSeq  {
NI len;
NI reserved;
};
struct  NimStringDesc  {
  TGenericSeq Sup;
NIM_CHAR data[SEQ_DECL_SIZE];
};
struct  Tfiletime103242  {
NI32 dwlowdatetime;
NI32 dwhighdatetime;
};
typedef NI16 TY104228[260];
typedef NI16 TY104232[14];
struct  Twin32finddata104219  {
NI32 dwfileattributes;
Tfiletime103242 ftcreationtime;
Tfiletime103242 ftlastaccesstime;
Tfiletime103242 ftlastwritetime;
NI32 nfilesizehigh;
NI32 nfilesizelow;
NI32 dwreserved0;
NI32 dwreserved1;
TY104228 cfilename;
TY104232 calternatefilename;
};
struct TY117789 {
NimStringDesc* Field0;
NimStringDesc* Field1;
NimStringDesc* Field2;
};
struct  Tcell46346  {
NI refcount;
TNimType* typ;
};
struct  Tcellseq46362  {
NI len;
NI cap;
Tcell46346** d;
};
struct  Tcellset46358  {
NI counter;
NI max;
Tpagedesc46354* head;
Tpagedesc46354** data;
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
Tcellseq46362 zct;
Tcellseq46362 decstack;
Tcellset46358 cycleroots;
Tcellseq46362 tempstack;
NI recgclock;
Tmemregion28210 region;
Tgcstat48214 stat;
};
typedef N_STDCALL_PTR(NI32, TY104245) (NI hfindfile, Twin32finddata104219* lpfindfiledata);
typedef N_STDCALL_PTR(void, TY104405) (NI hfindfile);
typedef NimStringDesc* TY143637[1];
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
typedef NI TY27420[8];
struct  Tpagedesc46354  {
Tpagedesc46354* next;
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
struct  TNimObject  {
TNimType* m_type;
};
struct  Processobj143402  {
  TNimObject Sup;
NI fprocesshandle;
int inhandle;
int outhandle;
int errhandle;
NI id;
int exitcode;
};
struct  Stringtableobj135012  {
  TNimObject Sup;
NI counter;
Keyvaluepairseq135010* data;
NU8 mode;
};
struct  TNimNode  {
NU8 kind;
NI offset;
TNimType* typ;
NCSTRING name;
NI len;
TNimNode** sons;
};
struct  Tfreecell27430  {
Tfreecell27430* next;
NI zerofield;
};
struct TY117508 {
NimStringDesc* Field0;
NimStringDesc* Field1;
};
struct Keyvaluepairseq135010 {
  TGenericSeq Sup;
  TY117508 data[SEQ_DECL_SIZE];
};
N_NIMCALL(NimStringDesc*, HEX2F_117492)(NimStringDesc* head, NimStringDesc* tail);
N_NIMCALL(NimStringDesc*, nosgetCurrentDir)(void);
N_NIMCALL(NI, findfirstfile_114416)(NimStringDesc* a, Twin32finddata104219* b);
static N_INLINE(NIM_BOOL, skipfinddata_114436)(Twin32finddata104219* f);
N_NIMCALL(void, nossplitFile)(NimStringDesc* path, TY117789* Result);
N_NIMCALL(NimStringDesc*, nosextractFilename)(NimStringDesc* path);
N_NIMCALL(NimStringDesc*, HEX24_80989)(NI16* s);
static N_INLINE(void, asgnRefNoCycle)(void** dest, void* src);
static N_INLINE(Tcell46346*, usrtocell_49846)(void* usr);
static N_INLINE(void, rtladdzct_51404)(Tcell46346* c);
N_NOINLINE(void, addzct_49817)(Tcellseq46362* s, Tcell46346* c);
N_NIMCALL(void, nosremoveFile)(NimStringDesc* file);
N_NIMCALL(NI, nospcountProcessors)(void);
N_NIMCALL(Processobj143402*, nospstartProcess)(NimStringDesc* command, NimStringDesc* workingdir, NimStringDesc** args, NI argsLen0, Stringtableobj135012* env, NU8 options);
static N_INLINE(void, appendString)(NimStringDesc* dest, NimStringDesc* src);
N_NIMCALL(NimStringDesc*, rawNewString)(NI space);
N_NIMCALL(void, nossleep)(NI milsecs);
static N_INLINE(void, initStackBottomWith)(void* locals);
N_NOINLINE(void, setStackBottom)(void* thestackbottom);
NIM_EXTERNC N_NOINLINE(void, systemInit)(void);
NIM_EXTERNC N_NOINLINE(void, systemDatInit)(void);
NIM_EXTERNC N_NOINLINE(void, stdlib_parseutilsInit)(void);
NIM_EXTERNC N_NOINLINE(void, stdlib_parseutilsDatInit)(void);
NIM_EXTERNC N_NOINLINE(void, stdlib_strutilsInit)(void);
NIM_EXTERNC N_NOINLINE(void, stdlib_strutilsDatInit)(void);
NIM_EXTERNC N_NOINLINE(void, stdlib_winleanInit)(void);
NIM_EXTERNC N_NOINLINE(void, stdlib_winleanDatInit)(void);
NIM_EXTERNC N_NOINLINE(void, stdlib_timesInit)(void);
NIM_EXTERNC N_NOINLINE(void, stdlib_timesDatInit)(void);
NIM_EXTERNC N_NOINLINE(void, stdlib_osInit)(void);
NIM_EXTERNC N_NOINLINE(void, stdlib_osDatInit)(void);
NIM_EXTERNC N_NOINLINE(void, stdlib_hashesInit)(void);
NIM_EXTERNC N_NOINLINE(void, stdlib_hashesDatInit)(void);
NIM_EXTERNC N_NOINLINE(void, stdlib_strtabsInit)(void);
NIM_EXTERNC N_NOINLINE(void, stdlib_strtabsDatInit)(void);
NIM_EXTERNC N_NOINLINE(void, stdlib_streamsInit)(void);
NIM_EXTERNC N_NOINLINE(void, stdlib_streamsDatInit)(void);
NIM_EXTERNC N_NOINLINE(void, stdlib_cpuinfoInit)(void);
NIM_EXTERNC N_NOINLINE(void, stdlib_cpuinfoDatInit)(void);
NIM_EXTERNC N_NOINLINE(void, stdlib_osprocInit)(void);
NIM_EXTERNC N_NOINLINE(void, stdlib_osprocDatInit)(void);
NIM_EXTERNC N_NOINLINE(void, PKInit)(void);
NIM_EXTERNC N_NOINLINE(void, PKDatInit)(void);
STRING_LITERAL(TMP40, "testData", 8);
STRING_LITERAL(TMP41, "*.csv.lock", 10);
STRING_LITERAL(TMP65, "main", 4);
STRING_LITERAL(TMP66, "exe", 3);
STRING_LITERAL(TMP67, "", 0);
NimStringDesc* file_147004;
extern Tgcheap48216 gch_48244;
extern TY104245 Dl_104244;
extern TY104405 Dl_104404;
NI n_147025;
NI i_147042;

static N_INLINE(NIM_BOOL, skipfinddata_114436)(Twin32finddata104219* f) {
	NIM_BOOL result;
	NIM_BOOL LOC1;
	NIM_BOOL LOC3;
	NIM_BOOL LOC5;
	result = 0;
	LOC1 = 0;
	LOC1 = (((NI) ((*f).cfilename[(((NI) 0))- 0])) == ((NI) 46));
	if (!(LOC1)) goto LA2;
	LOC3 = 0;
	LOC3 = (((NI) ((*f).cfilename[(((NI) 1))- 0])) == ((NI) 0));
	if (LOC3) goto LA4;
	LOC5 = 0;
	LOC5 = (((NI) ((*f).cfilename[(((NI) 1))- 0])) == ((NI) 46));
	if (!(LOC5)) goto LA6;
	LOC5 = (((NI) ((*f).cfilename[(((NI) 2))- 0])) == ((NI) 0));
	LA6: ;
	LOC3 = LOC5;
	LA4: ;
	LOC1 = LOC3;
	LA2: ;
	result = LOC1;
	return result;
}

static N_INLINE(Tcell46346*, usrtocell_49846)(void* usr) {
	Tcell46346* result;
	result = 0;
	result = ((Tcell46346*) ((NI)((NU64)(((NI) (usr))) - (NU64)(((NI)sizeof(Tcell46346))))));
	return result;
}

static N_INLINE(void, rtladdzct_51404)(Tcell46346* c) {
	addzct_49817((&gch_48244.zct), c);
}

static N_INLINE(void, asgnRefNoCycle)(void** dest, void* src) {
	{
		Tcell46346* c;
		if (!!((src == NIM_NIL))) goto LA3;
		c = usrtocell_49846(src);
		(*c).refcount += ((NI) 8);
	}
	LA3: ;
	{
		Tcell46346* c;
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

static N_INLINE(void, appendString)(NimStringDesc* dest, NimStringDesc* src) {
	memcpy(((NCSTRING) ((&(*dest).data[((*dest).Sup.len)- 0]))), ((NCSTRING) ((*src).data)), (NI)((*src).Sup.len + ((NI) 1)));
	(*dest).Sup.len += (*src).Sup.len;
}

static N_INLINE(void, initStackBottomWith)(void* locals) {
	setStackBottom(locals);
}
void PreMainInner() {
	systemInit();
	stdlib_parseutilsDatInit();
	stdlib_strutilsDatInit();
	stdlib_winleanDatInit();
	stdlib_timesDatInit();
	stdlib_osDatInit();
	stdlib_hashesDatInit();
	stdlib_strtabsDatInit();
	stdlib_streamsDatInit();
	stdlib_cpuinfoDatInit();
	stdlib_osprocDatInit();
	PKDatInit();
	stdlib_parseutilsInit();
	stdlib_strutilsInit();
	stdlib_winleanInit();
	stdlib_timesInit();
	stdlib_osInit();
	stdlib_hashesInit();
	stdlib_strtabsInit();
	stdlib_streamsInit();
	stdlib_cpuinfoInit();
	stdlib_osprocInit();
}

void PreMain() {
	void (*volatile inner)();
	systemDatInit();
	inner = PreMainInner;
	initStackBottomWith((void *)&inner);
	(*inner)();
}

int cmdCount;
char** cmdLine;
char** gEnv;
N_CDECL(void, NimMainInner)(void) {
	PKInit();
}

N_CDECL(void, NimMain)(void) {
	void (*volatile inner)();
	PreMain();
	inner = NimMainInner;
	initStackBottomWith((void *)&inner);
	(*inner)();
}

int main(int argc, char** args, char** env) {
	cmdLine = args;
	cmdCount = argc;
	gEnv = env;
	NimMain();
	return nim_program_result;
}

NIM_EXTERNC N_NOINLINE(void, PKInit)(void) {
	{
		NimStringDesc* HEX3Atmp_147006;
		NimStringDesc* LOC2;
		NimStringDesc* LOC3;
		Twin32finddata104219 f_147009;
		NI res_147011;
		HEX3Atmp_147006 = 0;
		LOC2 = 0;
		LOC2 = nosgetCurrentDir();
		LOC3 = 0;
		LOC3 = HEX2F_117492(LOC2, ((NimStringDesc*) &TMP40));
		HEX3Atmp_147006 = HEX2F_117492(LOC3, ((NimStringDesc*) &TMP41));
		memset((void*)(&f_147009), 0, sizeof(f_147009));
		res_147011 = 0;
		res_147011 = findfirstfile_114416(HEX3Atmp_147006, (&f_147009));
		{
			if (!!((res_147011 == ((NI) -1)))) goto LA6;
			{
				while (1) {
					{
						NIM_BOOL LOC12;
						NIM_BOOL LOC13;
						TY117789 LOC17;
						NimStringDesc* LOC18;
						NimStringDesc* LOC19;
						LOC12 = 0;
						LOC13 = 0;
						LOC13 = skipfinddata_114436((&f_147009));
						LOC12 = !(LOC13);
						if (!(LOC12)) goto LA14;
						LOC12 = ((NI32)(f_147009.dwfileattributes & ((NI32) 16)) == ((NI32) 0));
						LA14: ;
						if (!LOC12) goto LA15;
						memset((void*)(&LOC17), 0, sizeof(LOC17));
						nossplitFile(HEX3Atmp_147006, (&LOC17));
						LOC18 = 0;
						LOC18 = HEX24_80989(((NI16*) ((&f_147009.cfilename[(((NI) 0))- 0]))));
						LOC19 = 0;
						LOC19 = nosextractFilename(LOC18);
						asgnRefNoCycle((void**) (&file_147004), HEX2F_117492(LOC17.Field0, LOC19));
						nosremoveFile(file_147004);
					}
					LA15: ;
					{
						NI32 LOC22;
						LOC22 = 0;
						LOC22 = Dl_104244(res_147011, (&f_147009));
						if (!(LOC22 == ((NI32) 0))) goto LA23;
						goto LA8;
					}
					LA23: ;
				}
			} LA8: ;
			Dl_104404(res_147011);
		}
		LA6: ;
	}
	n_147025 = nospcountProcessors();
	{
		NIM_BOOL LOC27;
		LOC27 = 0;
		LOC27 = unlikely((n_147025 == ((NI) 0)));
		if (!LOC27) goto LA28;
		n_147025 = ((NI) 1);
	}
	LA28: ;
	{
		NI res_147047;
		res_147047 = ((NI) 1);
		{
			while (1) {
				NimStringDesc* LOC33;
				NimStringDesc* LOC34;
				NimStringDesc* LOC35;
				TY143637 LOC36;
				Processobj143402* LOC37;
				if (!(res_147047 <= n_147025)) goto LA32;
				i_147042 = res_147047;
				LOC33 = 0;
				LOC34 = 0;
				LOC34 = nosgetCurrentDir();
				LOC35 = 0;
				LOC35 = HEX2F_117492(LOC34, ((NimStringDesc*) &TMP65));
				LOC33 = rawNewString(LOC35->Sup.len + 3);
appendString(LOC33, LOC35);
appendString(LOC33, ((NimStringDesc*) &TMP66));
				memset((void*)LOC36, 0, sizeof(LOC36));
				LOC37 = 0;
				LOC37 = nospstartProcess(LOC33, ((NimStringDesc*) &TMP67), LOC36, 0, NIM_NIL, 8);
				nossleep(((NI) 500));
				res_147047 += ((NI) 1);
			} LA32: ;
		}
	}
}

NIM_EXTERNC N_NOINLINE(void, PKDatInit)(void) {
}

