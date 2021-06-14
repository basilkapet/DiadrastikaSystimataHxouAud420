Τελική Εργασία 
Βασιλική Καπετανάκη Τχ2016080
Εργασία Διαδραστικα Συστήματα Ήχου

// Καπετανάκη Βασιλική Σοφία ΤΧ2016080


s.boot
(
SynthDef.new(\pulseTest, {
	arg ampHz=0.15, fund=10, maxPartial=11, width=0.25;
	var amp1, amp2, freq1, freq2, sig1, sig2;
	amp1 = LFPulse.kr(ampHz, 0, 0.12) * 0.75;
	amp2 = LFPulse.kr(ampHz, 0.5, 0.12) * 0.75;
	freq1 = LFNoise0.kr(7).exprange(fund, fund*maxPartial).round(fund);
	freq2 = LFNoise0.kr(7).exprange(fund, fund*maxPartial).round(fund);
	freq1 = freq1 * LFPulse.kr(8, add:1);
	freq2 = freq2 * LFPulse.kr(6, add:1);
	sig1 = Pulse.ar(freq1, width, amp1);
	sig2 = Pulse.ar(freq2, width, amp2);
	sig1 = FreeVerb.ar(sig1, 0.7, 0.8, 0.25);
	sig2 = FreeVerb.ar(sig2, 0.7, 0.8, 0.25);
	Out.ar(0, sig1);
	Out.ar(1, sig2);
}).add;
)

//To παρακάτω είναι ο ήχος που έκανα. Εαν τον ακούσουμε για λιγη ώρα και δούμε πως συμπεριφέρεται και τον ακούσουμε μπορούμε να προχωρήσουμε.

x = Synth.new(\pulseTest);

//ενώ παίζει ο ήχος μπορούμε να τον πειράξουμε με αυτά τα κουμπιά

x.set(\fund,80);
x.set(\width, 0.55);
x.set(\maxPartial , 5)
x.set(\ampHz, 0.5);

x.free;
//αφού πατήσουμε τα παραπάνω κουμπιά και αλλάξουν οι παράμετροι μπορούμε να προσθέσουμε την παρακάτω μπότα με shft+return
play{i=Impulse.ar(_);SinOsc.ar(i.(2).lagud(0,1)*250,Integrator.ar(Integrator.ar(i.(82).lag(LFNoise1.ar(2!2,2,2,2,2,2))*20,0.02),0.20).fold2(pi))}

// στη συνέχεις προσθέτουμε και αυτούς τους ήχους να πάιζουν ταυτόχρονα με shft+return

z = Synth.new(\pulseTest, [\ampHz, 0.025, \fund, 20, \maxPartial, 9, \width, 0.15]);

z.free

y =  Synth.new(\pulseTest, [\ampHz, 0.5, \fund, 150, \maxPartial, 20, \width, 0.25]);

y.free

//με τα .free απενεργοποιούμαι όποιον ήχο θέλουμε όποτε θέλουμε
//εδω τελειώνει η εργασία με ctrl+. . Πριν το κλείσουμε μπορούμε να το χαώσουμε με το παρακάτω-->

Pdef(\chaos,
	Pbind(
		\instrument, \pulseTest,
		\dur, Pseq([0, 1, 0, 0, 0.5, 0.5, 0.5, 0.5], inf),
		\degree, Pseq([0, 4, 0, 0, 0, 6, 0], inf),
	\scale, Scale.minor
)
).play(TempoClock.default, quant: 12);






