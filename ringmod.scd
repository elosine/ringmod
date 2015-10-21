(
b = SoundFile.collectIntoBuffers("/Users/jyang/GitHub/ringmod/samples/*");
SynthDef(\rm,{
	arg buf, inamp=1, amp=1, mix=0.5, bend=1, lf1f=0.2;
	var in, dfreq, hasFreq, damp, mod, rm, lf1;
	in = PlayBuf.ar(2, buf, trigger:\t_tr.kr(1,0));
	in = in*inamp;
	# dfreq, hasFreq = Tartini.kr(in);
	damp = Amplitude.kr(in);
	lf1 = LFTri.kr(lf1f)*bend;
	mod = SinOsc.ar( (dfreq.cpsmidi+lf1).midicps )*damp;
	rm = DiodeRingMod.ar(in, mod);
	Out.ar(0, rm*amp);
}).add;
)
a = Synth(\rm, [\buf, b[0],\t_tr, 1, \inamp, 4, \mix, 0.6, \amp, 2, \bend, 1, \lf1f, 0.1]);
a.set(\t_tr, 1, \inamp, 2, \mix, 0.6, \amp, 1.6, \bend, 5, \lf1f, 0.12);
a.set(\buf, b[0], \t_tr, 1);
a.set(\buf, b[1], \t_tr, 1);
a.set(\buf, b[2], \t_tr, 1);
a.set(\buf, b[3], \t_tr, 1);
a.set(\buf, b[4], \t_tr, 1);
a.set(\buf, b[5], \t_tr, 1);
s.meter

