function output = zin(image, phi)

inside = mean(image(phi > 0));

numerator = double(abs(image - inside).^2);

denomenator = max(max(abs(image)));


output = numerator/denomenator;

display('zin');
display(size(output));

end

