(
z = {
	arg noiseHz=8;
	var  freq, amp, sig;
	freq = LFNoise0.kr(noiseHz).exprange(200,1000);
	amp = LFNoise1.kr(12).exprange(0.02, 1);
	sig = SinOsc.ar(freq) * amp;
}.play;
)

z.set(\noiseHz,64);
z.set(\noiseHz, exprand(4,64));
z.free;

(
SynthDef.new(\sineTest, {
	arg noiseHz=8;
	var  freq, amp, sig;
	freq = LFNoise0.kr(noiseHz).exprange(200,1000);
	amp = LFNoise1.kr(12).exprange(0.02, 1);
	sig = SinOsc.ar(freq) * amp;
	Out.ar(0, sig);
}).add;
)

x = Synth.new(\sineTest, [\noiseHz, 32]);

x.set(\noiseHz, 12)


(
SynthDef.new(\pulseTest, {
	arg ampHz=7, fund=80, maxPartial=4, width=0.5;
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

x = Synth.new(\pulseTest);

x.set(\width, 0.50);
x.set(\fund,30);
x.set(\maxPartial , 20)
x.set(\amp Hz, 0.25);

x = Synth.new(\pulseTest, [\ampHz, 10, \fund, 800, \maxPartial, 2, \width, 0.15]);

y =  Synth.new(\pulseTest, [\ampHz, 4.5, \fund, 10, \maxPartial, 10, \width, 0.2]);

play{i=Impulse.ar(_);SinOsc.ar(i.(2).lagud(0,1)*250,Integrator.ar(Integrator.ar(i.(82).lag(LFNoise1.ar(2!2,2,2,2,2,2))*20,0.02),0.20).fold2(pi))}




