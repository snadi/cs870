function output = fout(A1,A2, phi, logicop)

%this function determines which logic operation will be applied to the
%outside region

switch logicop
    case 'union'
        output = scintersection(A1,A2,phi,'outside');
    case 'intersection'
        output = scunion(A1,A2,phi,'outside');        
end

end

