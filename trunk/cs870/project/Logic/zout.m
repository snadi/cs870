function output = zout(image, phi)

cout = mean(image(phi < 0));

numerator = (image - cout).^2;

denomenator = max(max((image)))^2;

output = double(numerator)/double(denomenator);


end

