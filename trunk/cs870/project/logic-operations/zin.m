function output = zin(image, phi)

cin = mean(image(phi > 0));

numerator = (image - cin).^2;%norm(image - cin).^2;

denomenator = max(max(image));

output = double(numerator)/double(denomenator);

end

