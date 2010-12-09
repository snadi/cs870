% fout: calculate the energy outside the contour
% 
% Output parameters:
%   output = the energy outside the contour
% 
% Input parameters:
%   phi = current phi
%   logicop = logic operator
%   complement = vector of all channels that we will deal with their complement
%   varargin = input channels

function output = fout(phi, logicop, complement, varargin)

% If the logic operator is 'union', then the energy outside the contour is given
% by the intersection. The opposite is true.

switch logicop
    case 'union'
        output = scintersection(phi, 'outside', complement, varargin{:});
    case 'intersection'        
        output = scunion(phi, 'outside', complement, varargin{:});
end