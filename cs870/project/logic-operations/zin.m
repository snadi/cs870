function output = zin(image, phi)

cin = mean(image(phi > 0));


numerator = (image - cin).^2;

denomenator = max(max(image))^2;

output = double(numerator)/double(denomenator);



end

