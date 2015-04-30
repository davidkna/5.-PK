/* Generated by Nim Compiler v0.10.3 */
/*   (c) 2015 Andreas Rumpf */
/* The generated code is subject to the original license. */
#define NIM_INTBITS 32
#include "nimbase.h"
typedef struct TY143035 TY143035;
typedef struct TGenericSeq TGenericSeq;
typedef struct TNimType TNimType;
typedef struct TNimNode TNimNode;
typedef struct {
N_NIMCALL_PTR(NI, ClPrc) (NF x_143831, NF y_143833, void* ClEnv);
void* ClEnv;
} TY143829;
struct  TGenericSeq  {
NI len;
NI reserved;
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
struct  TNimNode  {
NU8 kind;
NI offset;
TNimType* typ;
NCSTRING name;
NI len;
TNimNode** sons;
};
typedef N_CLOSURE_PTR(NI, TMP64) (NF x_143886, NF y_143888);
typedef N_CLOSURE_PTR(NI, TMP65) (NF x_143886, NF y_143888);
struct TY143035 {
  TGenericSeq Sup;
  NF data[SEQ_DECL_SIZE];
};
N_NIMCALL(void*, newSeq)(TNimType* typ, NI len);
N_NIMCALL(void, merge_143867)(NF* a, NI aLen0, NF* b, NI bLen0, NI lo, NI m, NI hi, TY143829 cmp, NU8 order);
static N_INLINE(NI, HEX2A_132017)(NI x, NU8 order);
extern TNimType NTI143035; /* seq[float] */

static N_INLINE(NI, HEX2A_132017)(NI x, NU8 order) {
	NI result;
	NI y;
	result = 0;
	y = (NI)(((NI) (order)) - ((NI) 1));
	result = (NI)((NI)(x ^ ((NI) (y))) - ((NI) (y)));
	return result;
}

N_NIMCALL(void, merge_143867)(NF* a, NI aLen0, NF* b, NI bLen0, NI lo, NI m, NI hi, TY143829 cmp, NU8 order) {
	NI j;
	NI bb;
	NI i;
	NI k;
{	{
		NI LOC3;
		NI LOC4;
		LOC3 = 0;
		LOC3 = cmp.ClEnv? cmp.ClPrc(a[m], a[(NI)(m + ((NI) 1))], cmp.ClEnv):((TMP64)(cmp.ClPrc))(a[m], a[(NI)(m + ((NI) 1))]);
		LOC4 = 0;
		LOC4 = HEX2A_132017(LOC3, order);
		if (!(LOC4 <= ((NI) 0))) goto LA5;
		goto BeforeRet;
	}
	LA5: ;
	j = lo;
	bb = ((NI) 0);
	{
		while (1) {
			if (!(j <= m)) goto LA8;
			b[bb] = a[j];
			bb += ((NI) 1);
			j += ((NI) 1);
		} LA8: ;
	}
	i = ((NI) 0);
	k = lo;
	{
		while (1) {
			NIM_BOOL LOC11;
			LOC11 = 0;
			LOC11 = (k < j);
			if (!(LOC11)) goto LA12;
			LOC11 = (j <= hi);
			LA12: ;
			if (!LOC11) goto LA10;
			{
				NI LOC15;
				NI LOC16;
				LOC15 = 0;
				LOC15 = cmp.ClEnv? cmp.ClPrc(b[i], a[j], cmp.ClEnv):((TMP65)(cmp.ClPrc))(b[i], a[j]);
				LOC16 = 0;
				LOC16 = HEX2A_132017(LOC15, order);
				if (!(LOC16 <= ((NI) 0))) goto LA17;
				a[k] = b[i];
				i += ((NI) 1);
			}
			goto LA13;
			LA17: ;
			{
				a[k] = a[j];
				j += ((NI) 1);
			}
			LA13: ;
			k += ((NI) 1);
		} LA10: ;
	}
	{
		while (1) {
			if (!(k < j)) goto LA21;
			a[k] = b[i];
			k += ((NI) 1);
			i += ((NI) 1);
		} LA21: ;
	}
	}BeforeRet: ;
}

N_NIMCALL(void, sort_143822)(NF* a, NI aLen0, TY143829 cmp, NU8 order) {
	NI n;
	TY143035* b;
	NI s;
	n = aLen0;
	b = 0;
	b = (TY143035*) newSeq((&NTI143035), ((NI) ((NI)(n / ((NI) 2)))));
	s = ((NI) 1);
	{
		while (1) {
			NI m;
			if (!(s < n)) goto LA2;
			m = (NI)((NI)(n - ((NI) 1)) - s);
			{
				while (1) {
					if (!(((NI) 0) <= m)) goto LA4;
					merge_143867(a, aLen0, b->data, b->Sup.len, (((NI)((NI)(m - s) + ((NI) 1)) >= ((NI) 0)) ? (NI)((NI)(m - s) + ((NI) 1)) : ((NI) 0)), m, (NI)(m + s), cmp, order);
					m -= (NI)(s * ((NI) 2));
				} LA4: ;
			}
			s = (NI)(s * ((NI) 2));
		} LA2: ;
	}
}
NIM_EXTERNC N_NOINLINE(void, stdlib_algorithmInit)(void) {
}

NIM_EXTERNC N_NOINLINE(void, stdlib_algorithmDatInit)(void) {
}

