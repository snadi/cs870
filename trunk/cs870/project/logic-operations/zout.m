function output = zout(image, phi)

cout = mean(image(phi < 0));

numerator = (image - cout).^2;%norm(image - cout).^2;

denomenator = max(max((image)));

output = double(numerator)/double(denomenator);

end

