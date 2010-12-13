% fin: calculate the energy inside the contour
% 
% Output parameters:
%   output = the energy inside the contour
% 
% Input parameters:
%   phi = current phi
%   logicop = logic operator
%   complement = vector of all channels that we will deal with their complement
%   varargin = input channels

function output = fin(phi, logicop, complement, varargin)

% If the logic operator is 'union', then the energy inside the contour is given
% by the intersection. The opposite is true.

switch logicop
    case 'union'        
        output = scunion(phi, 'inside', complement, varargin{:});
    case 'intersection'        
        output = scintersection(phi, 'inside', complement, varargin{:});
end