function output = zin(image, phi)

cin = mean(image(phi > 0));

numerator = double(image - cin).^2;

denomenator = max(max(image));

output = numerator/denomenator;

end

