play{i=Impulse.ar(_);SinOsc.ar(i.(2).lagud(0,0.4)*360,Integrator.ar(Integrator.ar(i.(64).lag(LFNoise1.ar(2!2,2,2))*99,0.9),0.99).fold2(pi))};
play{f={LocalBuf(512)};r={|k,m|RecordBuf.ar(Pulse.ar(8,m,6e3),k)};r.(a=f.(),0.99);r.(b=f.(),0.99001);Out.ar(0,IFFT([a,b]).tanh)};//44.1kHz:);

(
play{i=Impulse.ar(_);SinOsc.ar(i.(2).lagud(0,0.4)*360,Integrator.ar(Integrator.ar(i.(64).lag(LFNoise1.ar(2!2,2,2))*99,0.9),0.99).fold2(pi))};
play{f={LocalBuf(512)};r={|k,m|RecordBuf.ar(Pulse.ar(8,m,6e3),k)};r.(a=f.(),0.99);r.(b=f.(),0.99001);Out.ar(0,IFFT([a,b]).tanh)};//44.1kHz:);
)

(
f = {
play{i=Impulse.ar(_);SinOsc.ar(i.(2).lagud(0,0.4)*360,Integrator.ar(Integrator.ar(i.(64).lag(LFNoise1.ar(2!2,2,2))*99,0.9),0.99).fold2(pi))};
play{f={LocalBuf(512)};r={|k,m|RecordBuf.ar(Pulse.ar(8,m,6e3),k)};r.(a=f.(),0.99);r.(b=f.(),0.99001);Out.ar(0,IFFT([a,b]).tanh)};//44.1kHz:);
}
)


f.value;

(
j = {
play{LocalOut.ar(k=LeakDC.ar(Integrator.ar(Pulse.ar(pi/[1,2.57],[0.54,0.46]),(1-LocalIn.ar(2)).fold(0,[0.9,0.85])).wrap2(pi).sin));k.mean!2}
}
)

(
g = {
play{t=[0,0,0,1,5,7,10,12,12,12]+30;a=Duty.kr(1/8,0,Dxrand(t+24++t++t,inf));(BHiPass.ar(LFNoise1.ar(8)**6,[a,a+7].midicps,a/3e3,67-a)).tanh}
}
)

(
j.value;
g.value;
)
	