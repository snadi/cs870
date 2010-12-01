function output = fin(phi,logicop, varargin)

%this function determines which logic operation will be applied to the
%inside region

switch logicop
    case 'union'
        output = scunion(phi,'inside', varargin{:});               
    case 'intersection'
        output = scintersection(phi, 'inside', varargin{:});
end

end

