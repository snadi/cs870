function output = zout(image, phi)

outside = mean(image(phi < 0));

numerator = double(abs(image - outside).^2);

denomenator = max(max((image)));

output = numerator/denomenator;

end

