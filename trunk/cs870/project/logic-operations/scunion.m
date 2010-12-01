function output = scunion(A1, A2, phi, region)

switch(region)
    case 'inside'                
        output =  ( zin(A1,phi).*zin(A2,phi) ).^0.5;           
    case 'outside'
        output =  ( zout(A1,phi).*zout(A2,phi) ).^0.5;        
end

output = real(output);



end

