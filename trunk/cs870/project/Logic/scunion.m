function output = scunion(phi, region, varargin)


output = ones(size(phi,1), size(phi,2));
switch(region)
    case 'inside'
        for i = 1 : size(varargin, 2)
            output = zin(varargin{i}, phi).*output;
        end       
    case 'outside'
        for i = 1 : size(varargin, 2)
            output = zout(varargin{i}, phi).*output;
        end        
end

output = real(output);

output = output.^(1/size(varargin,2));


end
