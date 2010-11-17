function answer = mydirac(x)
answer = diff(myheaviside(x));

function H = myheaviside(z)
H = 0.5*(1 + (2/pi)*atan(z/eps));
display(H);


