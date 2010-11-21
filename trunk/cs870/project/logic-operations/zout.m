function output = zout(image, phi)

outside = mean(image(phi < 0));

numerator = double((image - outside).^2);

denomenator = max(max((image)));

output = numerator/denomenator;

end

