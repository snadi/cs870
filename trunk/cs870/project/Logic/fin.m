% fin: calculate the energy inside the contour
% 
% Output parameters:
%   output = the energy inside the contour
% 
% Input parameters:
%   phi = current phi
%   logicop = logic operator
%   varargin = input channels

function output = fin(phi, logicop, varargin)

% If the logic operator is 'union', then the energy inside the contour is given
% by the intersection. The opposite is true.
switch logicop
    case 'union'
        output = scunion(phi, 'inside', varargin{:});               
    case 'intersection'
        output = scintersection(phi, 'inside', varargin{:});
end