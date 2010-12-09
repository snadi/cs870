% scunion: the objective function for the union logic operator
% 
% Output parameters:
%   output = the logic union of multiple channels
% 
% Input parameters:
%   phi = current phi
%   region = 'inside' or 'outside'
%   complement = vector of all channels that we will deal with their complement
%   varargin = input channels

function output = scunion(phi, region, complement, varargin)

output = ones(size(phi,1), size(phi,2));

switch(region)
    case 'inside'
        for i = 1 : size(varargin, 2)
            if(size(find(complement == i) > 0))
                output = sccomplement(zin(varargin{i}, phi)).*output;
            else
                output = zin(varargin{i}, phi).*output;
            end
        end       
    case 'outside'
        for i = 1 : size(varargin, 2)
            if(size(find(complement == i) > 0))
                output = sccomplement(zout(varargin{i}, phi)).*output;
            else
                output = zout(varargin{i}, phi).*output;
            end
        end        
end

output = real(output);

output = output.^(1/size(varargin,2));