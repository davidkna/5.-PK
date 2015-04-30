/* Generated by Nim Compiler v0.10.3 */
/*   (c) 2015 Andreas Rumpf */
/* The generated code is subject to the original license. */
#define NIM_INTBITS 64
#include "nimbase.h"
typedef struct TY141293 TY141293;
typedef struct TGenericSeq TGenericSeq;
typedef struct TNimType TNimType;
typedef struct TNimNode TNimNode;
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
struct TY141293 {
  TGenericSeq Sup;
  NI data[SEQ_DECL_SIZE];
};
N_NIMCALL(TY141293*, newseq_141011)(NI len);
N_NIMCALL(void, TMP62)(void* p, NI op);
N_NIMCALL(NI, random_138212)(NI max);
N_NIMCALL(void, shuffle_140004)(TY141293** x);
N_NIMCALL(TY141293*, sortedkeys_141004)(NI lHEXC3HEXA4nge);
N_NIMCALL(void, weakshuffle_140055)(TY141293** x);
N_NIMCALL(TY141293*, reversekeys_141200)(NI lHEXC3HEXA4nge);
N_NIMCALL(NI, gaussrand_140106)(NI lHEXC3HEXA4nge);
extern TNimType NTI108; /* int */
TNimType NTI141293; /* seq[int] */
N_NIMCALL(void, TMP62)(void* p, NI op) {
	TY141293* a;
	NI LOC1;
	a = (TY141293*)p;
	LOC1 = 0;
	for (LOC1 = 0; LOC1 < a->Sup.len; LOC1++) {
	}
}

N_NIMCALL(TY141293*, randkeys_141290)(NI lHEXC3HEXA4nge) {
	TY141293* result;
	result = 0;
	result = newseq_141011(((NI) (lHEXC3HEXA4nge)));
	{
		NI i_141332;
		NI HEX3Atmp_141335;
		NI res_141338;
		i_141332 = 0;
		HEX3Atmp_141335 = 0;
		HEX3Atmp_141335 = (result ? (result->Sup.len-1) : -1);
		res_141338 = ((NI) 0);
		{
			while (1) {
				if (!(res_141338 <= HEX3Atmp_141335)) goto LA3;
				i_141332 = res_141338;
				result->data[i_141332] = random_138212(lHEXC3HEXA4nge);
				res_141338 += ((NI) 1);
			} LA3: ;
		}
	}
	shuffle_140004((&result));
	return result;
}

N_NIMCALL(TY141293*, sortedkeys_141004)(NI lHEXC3HEXA4nge) {
	TY141293* result;
	result = 0;
	result = newseq_141011(((NI) (lHEXC3HEXA4nge)));
	{
		NI i_141059;
		NI HEX3Atmp_141061;
		NI res_141064;
		i_141059 = 0;
		HEX3Atmp_141061 = 0;
		HEX3Atmp_141061 = (result ? (result->Sup.len-1) : -1);
		res_141064 = ((NI) 0);
		{
			while (1) {
				if (!(res_141064 <= HEX3Atmp_141061)) goto LA3;
				i_141059 = res_141064;
				result->data[i_141059] = i_141059;
				res_141064 += ((NI) 1);
			} LA3: ;
		}
	}
	return result;
}

N_NIMCALL(TY141293*, almostsortedkeys_141188)(NI lHEXC3HEXA4nge) {
	TY141293* result;
	result = 0;
	result = sortedkeys_141004(lHEXC3HEXA4nge);
	weakshuffle_140055((&result));
	return result;
}

N_NIMCALL(TY141293*, reversekeys_141200)(NI lHEXC3HEXA4nge) {
	TY141293* result;
	result = 0;
	result = newseq_141011(((NI) (lHEXC3HEXA4nge)));
	{
		NI i_141242;
		NI HEX3Atmp_141244;
		NI res_141247;
		i_141242 = 0;
		HEX3Atmp_141244 = 0;
		HEX3Atmp_141244 = (result ? (result->Sup.len-1) : -1);
		res_141247 = ((NI) 0);
		{
			while (1) {
				if (!(res_141247 <= HEX3Atmp_141244)) goto LA3;
				i_141242 = res_141247;
				result->data[i_141242] = (NI)(lHEXC3HEXA4nge - i_141242);
				res_141247 += ((NI) 1);
			} LA3: ;
		}
	}
	return result;
}

N_NIMCALL(TY141293*, almostreversekeys_141266)(NI lHEXC3HEXA4nge) {
	TY141293* result;
	result = 0;
	result = reversekeys_141200(lHEXC3HEXA4nge);
	weakshuffle_140055((&result));
	return result;
}

N_NIMCALL(TY141293*, equalkeys_141083)(NI lHEXC3HEXA4nge) {
	TY141293* result;
	result = 0;
	result = newseq_141011(((NI) (lHEXC3HEXA4nge)));
	return result;
}

N_NIMCALL(TY141293*, fewuniquekeys_141121)(NI lHEXC3HEXA4nge) {
	TY141293* result;
	result = 0;
	result = newseq_141011(((NI) (lHEXC3HEXA4nge)));
	{
		NI i_141163;
		NI HEX3Atmp_141166;
		NI res_141169;
		i_141163 = 0;
		HEX3Atmp_141166 = 0;
		HEX3Atmp_141166 = (result ? (result->Sup.len-1) : -1);
		res_141169 = ((NI) 0);
		{
			while (1) {
				if (!(res_141169 <= HEX3Atmp_141166)) goto LA3;
				i_141163 = res_141169;
				result->data[i_141163] = (NI)(i_141163 / ((NI) 15));
				res_141169 += ((NI) 1);
			} LA3: ;
		}
	}
	shuffle_140004((&result));
	return result;
}

N_NIMCALL(TY141293*, shuffledkeys_141278)(NI lHEXC3HEXA4nge) {
	TY141293* result;
	result = 0;
	result = sortedkeys_141004(lHEXC3HEXA4nge);
	shuffle_140004((&result));
	return result;
}

N_NIMCALL(TY141293*, normalkeys_141357)(NI lHEXC3HEXA4nge) {
	TY141293* result;
	result = 0;
	result = newseq_141011(((NI) (lHEXC3HEXA4nge)));
	{
		NI i_141399;
		NI HEX3Atmp_141401;
		NI res_141404;
		i_141399 = 0;
		HEX3Atmp_141401 = 0;
		HEX3Atmp_141401 = (result ? (result->Sup.len-1) : -1);
		res_141404 = ((NI) 0);
		{
			while (1) {
				if (!(res_141404 <= HEX3Atmp_141401)) goto LA3;
				i_141399 = res_141404;
				result->data[i_141399] = gaussrand_140106(lHEXC3HEXA4nge);
				res_141404 += ((NI) 1);
			} LA3: ;
		}
	}
	return result;
}
NIM_EXTERNC N_NOINLINE(void, HEX00_listSpawnerInit)(void) {
}

NIM_EXTERNC N_NOINLINE(void, HEX00_listSpawnerDatInit)(void) {
NTI141293.size = sizeof(TY141293*);
NTI141293.kind = 24;
NTI141293.base = (&NTI108);
NTI141293.flags = 2;
NTI141293.marker = TMP62;
}

