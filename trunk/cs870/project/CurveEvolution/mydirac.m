function answer = mydirac(x)
answer = diff(myheaviside(x), 2, 2);
answer = padarray(answer, [0 1], 1);

function H = myheaviside(z)
display(z);
display(atan2(z./eps, z./eps));
pause;
display((2/pi).*atan2(z./eps,z./eps));
pause;
H = 0.5.*(1 + (2/pi).*atan2(z./eps,z./eps));
display(H);
pause;


