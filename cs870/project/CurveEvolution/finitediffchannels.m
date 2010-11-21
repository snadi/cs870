function resultingPhi = finitediffchannels(A1,A2,phi,deltaT, mu, lambda, logicop)

%we used |gradient(phi)| instead of the delta dirac function. This was an
%option stated in the paper
a = norm(gradient(phi));

%calculating the curvature term in the PDE
curvature = kappa(phi);

phi_t = a*(mu*curvature -lambda*(fin(A1,A2,phi,logicop) + fout(A1,A2,phi,logicop)));

resultingPhi = phi + deltaT*phi_t;

end

