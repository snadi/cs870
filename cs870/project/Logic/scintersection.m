% scintersection: the objective function for the intersection logic operator
% 
% Output parameters:
%   output = the logic intersection of multiple channels
% 
% Input parameters:
%   phi = current phi
%   region = 'inside' or 'outside'
%   varargin = input channels

function output = scintersection(phi, region, varargin)

output = ones(size(phi,1), size(phi,2));

switch region
    case 'inside'
        for i = 1 : size(varargin, 2)
            output = (1 - zin(varargin{i}, phi)).*output;
        end
    case 'outside'
        for i = 1 : size(varargin, 2)
            output = (1 - zout(varargin{i}, phi)).*output;
        end
end

output = real(output);
output = 1 - output.^(1/size(varargin,2));