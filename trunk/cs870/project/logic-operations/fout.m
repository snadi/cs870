function output = fout(phi, logicop, varargin)

%this function determines which logic operation will be applied to the
%outside region

switch logicop
    case 'union'
        output = scintersection(phi,'outside', varargin{:});
    case 'intersection'
        output = scunion(phi,'outside', varargin{:});        
end

end

