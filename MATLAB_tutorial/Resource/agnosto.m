function y=agnosto(x)

p1=0.9*exp(-j*pi/4);
a=poly([p1 conj(p1)]);
y=filter(1,a,x);