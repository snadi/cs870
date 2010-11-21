function output = scintersection(A1, A2, phi, region)

switch region
    case 'inside'      
        output = 1 - (abs(1 - zin(A1, phi)).*abs(1-zin(A2,phi))).^0.5;               
    case 'outside'       
        output = 1 - (abs(1 - zout(A1, phi)).*abs(1-zout(A2,phi))).^0.5;        
end

end

