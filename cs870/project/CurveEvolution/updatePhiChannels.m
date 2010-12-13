% updatePhiChannels: update phi for multiple channels
%
% Output parameters:
%   resultingPhi = updated phi
%
% Input parameters:
%   phi = the current value of phi
%   deltaT = the time step
%   mu = scaling term for the length of the contour
%   lambda = scaling term for the forces
%   logicop = the required logical operator
%   complement = vector of all channels that we will deal with their complement
%   varargin = the number of channels to operate on

function resultingPhi = updatePhiChannels(phi, deltaT, mu, lambda, ...
                                            logicop, complement, varargin)

% |gradient(phi)| is used instead of the dirac delta function. This was an
% option stated in the paper.
normOfGradient = norm(gradient(phi));

% Calculate the curvature term in the PDE
curvature = kappa(phi);

% Calculate the forces
forceInside = fin(phi, logicop, complement, varargin{:});
forceOutside = fout(phi, logicop, complement, varargin{:});

% Calculate phi_t according to the PDE in the paper
phi_t =  normOfGradient * ...
                    ( mu * curvature - lambda * (forceInside - forceOutside) );

% Update phi
resultingPhi = phi + deltaT * phi_t;