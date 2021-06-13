s.boot;
x={SinOsc.ar(40 * 55)}.play;

z.free;

(
x = {
	arg freq=200, amp=1;
	var sig;
	sig = SinOsc.ar(freq) * amp;
}.play;
)

x.set(\freq, 290);
x.set(\amp, 0.125);
x.set(\amp, 0.85, \freq, 500);







y={SinOscFB.ar(MouseY.kr(10,1000,'exponential'),MouseX.kr(0.5pi,pi))*0.1}.play





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