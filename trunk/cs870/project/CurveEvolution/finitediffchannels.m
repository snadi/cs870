function resultingPhi = finitediffchannels(A1,A2,phi,deltaT, mu, lambda, logicop)

%we used |gradient(phi)| instead of the delta dirac function. This was an
%option stated in the paper
a = norm(gradient(phi));

%calculating the curvature term in the PDE
curvature = kappa(phi);


%force1 = double(fin(A1,A2,phi,logicop));
%force2 = double(fout(A1,A2,phi,logicop));
force1 = fin(A1, A2, phi, logicop);
force2 = fout(A1, A2, phi, logicop);

%phi_t =  a*(mu*curvature -lambda*(force1 + force2));
phi_t = -lambda * (force1 + force2);

resultingPhi = phi + deltaT*phi_t;

end

