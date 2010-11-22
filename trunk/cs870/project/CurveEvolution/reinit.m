function signedPhi = reinit(phi)

signedPhi = phi ./ sqrt(phi.^2 + 1);

end