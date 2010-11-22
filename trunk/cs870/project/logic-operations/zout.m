function output = zout(image, phi)

cout = mean(image(phi < 0));

numerator = double(image - cout).^2;

denomenator = max(max((image)));

output = numerator/denomenator;

end

