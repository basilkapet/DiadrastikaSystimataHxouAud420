play{i=Impulse.ar(_);SinOsc.ar(i.(2).lagud(0,0.4)*360,Integrator.ar(Integrator.ar(i.(64).lag(LFNoise1.ar(2!2,2,2))*99,0.9),0.99).fold2(pi))}
