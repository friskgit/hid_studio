// -*- compile-command: "cd .. && make jack src=src/hid_studio.dsp && cd -"; -*-

declare name	"Tuning app for HID studio";
declare version " 0.1 ";
declare author " Henrik Frisk " ;
declare license " BSD ";
declare copyright "(c) dinergy 2024 ";

//---------------`Name` --------------------------
//
// Patch for facilitating composing of HID studio project
//
// * 
//
//---------------------------------------------------

import("stdfaust.lib");


rfrq = 261.6;

// Scale steps
a = rfrq, (1, 1 : /) : *;
b = rfrq, (5, 4 : /) : *;
c = rfrq, (8, 5 : /) : *;
d = rfrq, (25, 16 : /) : *;
e = rfrq, (32, 25 : /) : *;
f = rfrq, (7, 4 : /) : *;
g = rfrq, (8, 7 : /) : *;
h = rfrq, (49, 32 : /) : *;
i = rfrq, (64, 49 : /) : *;
j = rfrq, (7, 5 : /) : *;
k = rfrq, (35, 32 : /) : *;
l = rfrq, (40, 21 : /) : *;
m = rfrq, (64, 35 : /) : *;
n = rfrq, (2, 1 : /) : *;

// Beating tempos
rhythm_a = e - b;
rhythm_b = c - d;
rhythm_c = i - b;
rhythm_d = d - h;
rhythm_e = i - e;
rhythm_f = g - k;

sig_group_a(x) = hgroup("[0]scale steps", x);
sig_group_b(x) = hgroup("[1]", x);
sig_group_c(x) = hgroup("[2]", x);

// 1, 2, 4, 8, 16
check1 = sig_group_a(checkbox("[0]1/1"));
check2 = sig_group_a(checkbox("[1]5/4"));
check3 = sig_group_a(checkbox("[2]8/5"));
check4 = sig_group_a(checkbox("[3]25/16"));
check5 = sig_group_a(checkbox("[4]32/25"));
check6 = sig_group_b(checkbox("[5]7/4"));
check7 = sig_group_b(checkbox("[6]8/7"));
check8 = sig_group_b(checkbox("[7]49/32"));
check9 = sig_group_b(checkbox("[8]64/49"));
check10 = sig_group_b(checkbox("[9]7/5"));
check11 = sig_group_c(checkbox("[0]35/32"));
check12 = sig_group_c(checkbox("[1]40/21"));
check13 = sig_group_c(checkbox("[2]64/35"));
check14 = sig_group_c(checkbox("[3]2/1"));

beat_group(x) = hgroup("[3]beatings", x);
beat1 = beat_group(checkbox("[0]32/25 - 5/4"));
beat2 = beat_group(checkbox("[1]8/5 - 25/16"));
beat3 = beat_group(checkbox("[2]64/49 - 5/4"));
beat4 = beat_group(checkbox("[3]25/16 - 49/32"));
beat5 = beat_group(checkbox("[4]64/49 - 32/25"));
beat6 = beat_group(checkbox("[5]8/7 - 35/32"));

// osc0 = os.osc(rfrq) : si.smoo;
osc1 = os.osc(a) * check1 : si.smoo;
osc2 = os.osc(b) * check2 : si.smoo;
osc3 = os.osc(c) * check3 : si.smoo;
osc4 = os.osc(d) * check4 : si.smoo;
osc5 = os.osc(e) * check5 : si.smoo;
osc6 = os.osc(f) * check6 : si.smoo;
osc7 = os.osc(g) * check7 : si.smoo;
osc8 = os.osc(h) * check8 : si.smoo;
osc9 = os.osc(i) * check9 : si.smoo;
osc10 = os.osc(j) * check10 : si.smoo;
osc11 = os.osc(k) * check11 : si.smoo;
osc12 = os.osc(l) * check12 : si.smoo;
osc13 = os.osc(m) * check13 : si.smoo;
osc14 = os.osc(n) * check14 : si.smoo;

vol = hslider("[5]gain", 0.2, 0.0, 1.0, 0.001) : si.smoo;

drumfrq = hslider("[4]drum frequency", 100, 20, 10000, 1);

baseb1 = ba.tempo(rhythm_a*60);
p1 = ba.pulse(baseb1);
hit1 = sy.popFilterDrum(drumfrq, 5, p1) * beat1;

baseb2 = ba.tempo(rhythm_b*60);
p2 = ba.pulse(baseb2);
hit2 = sy.popFilterDrum(drumfrq, 5, p2) * beat2;

baseb3 = ba.tempo(rhythm_c*60);
p3 = ba.pulse(baseb3);
hit3 = sy.popFilterDrum(drumfrq, 5, p3) * beat3;

baseb4 = ba.tempo(rhythm_d*60);
p4 = ba.pulse(baseb4);
hit4 = sy.popFilterDrum(drumfrq, 5, p4) * beat4;

baseb5 = ba.tempo(rhythm_e*60);
p5 = ba.pulse(baseb5);
hit5 = sy.popFilterDrum(drumfrq, 5, p5) * beat5;

baseb6 = ba.tempo(rhythm_f*60);
p6 = ba.pulse(baseb6);
hit6 = sy.popFilterDrum(drumfrq, 5, p6) * beat6;

process = (( osc1 + osc2 + osc3 + osc4 + osc5 + osc6 + osc7 + osc8 + osc9 + osc10 + osc11 + osc12 + osc13 + osc14) * vol),
	  ((hit1 + hit2 + hit3 + hit4 + hit5 + hit6) * vol);

// process = hit;
// 1200 * (ma.log2 * (3/2));

