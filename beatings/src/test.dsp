// -*- compile-command: "cd .. && make jack src=src/test.dsp && cd -"; -*-

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

a = checkbox("A");

process = a <: attach(_,abs : ba.linear2db : vbargraph("Level",-60,0));

