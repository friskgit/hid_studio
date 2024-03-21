// -*- compile-command: "cd .. && make jack src=src/source.dsp && cd -"; -*-

declare name	"beatings";
declare version " 0.1 ";
declare author " Henrik Frisk " ;
declare license " BSD ";
declare copyright "(c) dinergy 2024 ";

//---------------`Name` --------------------------
//
// DSP template
//
// * parameters
//
//---------------------------------------------------

import("stdfaust.lib");


rfrq = hslider("root", 261.1, 60, 12000, 0.1) : si.smoo;
marvelous_fourth = rfrq * (75/56);
bizougo_fifth = rfrq * (98/75);
just_major_sixt = rfrq * (5/3);
just_major_third =rfrq * (5/4);
just_perf_fourth = rfrq : *(4/3);
just_major_seven = rfrq : *(15/8);
septimal_subfourth = rfrq : *(21/16);
harmonic_seven = rfrq : *(7/4);
just_perfect_fifth = rfrq : *(3/2);

b_sept4_perf4 = septimal_subfourth - just_perf_fourth;
b_marv4_just4 = marvelous_fourth - just_perf_fourth;

// 1, 2, 4, 8, 16
check1 = checkbox("1/1");
check2 = checkbox("75/56");
osc0 = os.osc(rfrq) * check1 : si.smoo;
osc1 = os.osc(marvelous_fourth) * check2 : si.smoo;
osc2 = os.osc(bizougo_fifth) : *(checkbox("98/75")) : si.smoo;
osc3 = os.osc(just_major_sixt)  : *(checkbox("5/3")) : si.smoo;
osc4 = os.osc(just_major_third) : *(checkbox("5/4")) : si.smoo;
osc5 = os.osc(just_perf_fourth) : *(checkbox("4/3")) : si.smoo;
osc6 = os.osc(just_major_seven)  : *(checkbox("15/8")) : si.smoo;
osc7 = os.osc(septimal_subfourth) : *(checkbox("21/16")) : si.smoo;
osc8 = os.osc(harmonic_seven)  : *(checkbox("7/4")) : si.smoo;
osc9 = os.osc(just_perfect_fifth) : *(checkbox("3/2")) : si.smoo;

vol = hslider("gain", 0.2, 0.0, 1.0, 0.001) : si.smoo;
// osc1 = os.osc(marvelous_fourth);
// osc2 = os.osc(bizougo_fifth);
drumfrq = hslider("drum_frq", 100, 20, 10000, 1);

baseb1 = ba.tempo(b_sept4_perf4*60);
p1 = ba.pulse(baseb1);
hit1 = sy.popFilterDrum(drumfrq, 5, p1) : *(checkbox("21/16 - 4/3"));

baseb2 = ba.tempo(b_marv4_just4*60);
p2 = ba.pulse(baseb2);
hit2 = sy.popFilterDrum(drumfrq, 5, p2) : *(checkbox("75/56 - 4/3"));

process = ((osc0 + osc1 + osc2 + osc3 + osc4 + osc5 + osc6 + osc7 + osc8 + osc9) * vol), ((hit1 + hit2 )* vol) : _,_;

// process = hit;
  // 1200 * (ma.log2 * (3/2));
