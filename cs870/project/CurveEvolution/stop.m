function indicator = checkstop(image, old, new)

error = size(image(old >= 0), 1) - size(image(new >=0), 1);



if(error == 0)
	indicator = 1;
else
	indicator = 0;
end;

end
