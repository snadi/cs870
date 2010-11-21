function output = fin(A1,A2,phi,logicop)

%this function determines which logic operation will be applied to the
%inside region

switch logicop
    case 'union'
        output = scunion(A1,A2,phi,'inside');        
    case 'intersection'
        output = scintersection(A1,A2,phi,'inside');
end

end

