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
// intervals
marvelous_fourth = rfrq * (75/56);
bizougo_fifth = rfrq * (98/75);
just_major_sixt = rfrq * (5/3);
just_major_third =rfrq * (5/4);
just_perf_fourth = rfrq : *(4/3);
just_major_seven = rfrq : *(15/8);
septimal_subfourth = rfrq : *(21/16);
harmonic_seven = rfrq : *(7/4);
just_perfect_fifth = rfrq : *(3/2);

// Beatings time
b_sept4_perf4 = septimal_subfourth - just_perf_fourth;
b_marv4_just4 = marvelous_fourth - just_perf_fourth;
b_sept4_marv4 = septimal_subfourth - marvelous_fourth;
b_bizougo5_perf5 = bizougo_fifth - just_perfect_fifth;
b_marv4_bizougo5 = bizougo_fifth - marvelous_fourth;
b_maj3_septsub4 = just_major_third - septimal_subfourth;


sig_group(x) = hgroup("Oscillators", x);
// 1, 2, 4, 8, 16
check1 = sig_group(checkbox("1/1"));
check2 = sig_group(checkbox("75/56"));
check3 = sig_group(checkbox("98/75"));
check4 = sig_group(checkbox("5/3"));
check5 = sig_group(checkbox("5/4"));
check6 = sig_group(checkbox("4/3"));
check7 = sig_group(checkbox("15/8"));
check8 = sig_group(checkbox("21/16"));
check9 = sig_group(checkbox("7/4"));
check10 = sig_group(checkbox("3/2"));

beat_group(x) = hgroup("Beats", x);
// 1, 2, 4, 8, 16
beat1 = beat_group(checkbox("21/16 - 4/3"));
beat2 = beat_group(checkbox("75/56 - 4/3"));
beat3 = beat_group(checkbox("75/56 - 21/16"));
beat4 = beat_group(checkbox("98/75 - 3/2"));
beat5 = beat_group(checkbox("75/56 - 98/75"));
beat6 = beat_group(checkbox("5/4 - 21/16"));

osc0 = os.osc(261.1) * check1 : si.smoo;
osc1 = os.osc(marvelous_fourth) * check2 : si.smoo;
osc2 = os.osc(bizougo_fifth) * check3 : si.smoo;
osc3 = os.osc(just_major_sixt) * check4 : si.smoo;
osc4 = os.osc(just_major_third) * check5 : si.smoo;
osc5 = os.osc(just_perf_fourth) * check6 : si.smoo;
osc6 = os.osc(just_major_seven) * check7 : si.smoo;
osc7 = os.osc(septimal_subfourth) * check8 : si.smoo;
osc8 = os.osc(harmonic_seven) * check9 : si.smoo;
osc9 = os.osc(just_perfect_fifth) * check10 : si.smoo;

vol = hslider("gain", 0.2, 0.0, 1.0, 0.001) : si.smoo;
// osc1 = os.osc(marvelous_fourth);
// osc2 = os.osc(bizougo_fifth);
drumfrq = hslider("drum_frq", 100, 20, 10000, 1);

baseb1 = ba.tempo(b_sept4_perf4*60);
p1 = ba.pulse(baseb1);
hit1 = sy.popFilterDrum(drumfrq, 5, p1) * beat1;

baseb2 = ba.tempo(b_marv4_just4*60);
p2 = ba.pulse(baseb2);
hit2 = sy.popFilterDrum(drumfrq, 5, p2) * beat2;

baseb3 = ba.tempo(b_sept4_marv4*60);
p3 = ba.pulse(baseb3);
hit3 = sy.popFilterDrum(drumfrq, 5, p3) * beat3;

baseb4 = ba.tempo(b_bizougo5_perf5*60);
p4 = ba.pulse(baseb4);
hit4 = sy.popFilterDrum(drumfrq, 5, p4) * beat4;

baseb5 = ba.tempo(b_marv4_bizougo5*60);
p5 = ba.pulse(baseb5);
hit5 = sy.popFilterDrum(drumfrq, 5, p5) * beat5;

baseb6 = ba.tempo(b_maj3_septsub4*60);
p6 = ba.pulse(baseb6);
hit6 = sy.popFilterDrum(drumfrq, 5, p6) * beat6;

process = ((osc0 + osc1 + osc2 + osc3 + osc4 + osc5 + osc6 + osc7 + osc8 + osc9) * vol), ((hit1 + hit2 + hit3 + hit4 + hit5 + hit6) * vol) : _,_;

// process = hit;
  // 1200 * (ma.log2 * (3/2));
