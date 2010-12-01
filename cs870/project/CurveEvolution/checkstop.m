function indicator = checkstop(image, old, new)

% error = abs( (old - new) ./ old);
% error(~isfinite(error)) = 0;   % Sets Inf and NaN to 0
% 
% errorValue = max(max(error));
% display(errorValue);

error = size(image(old >= 0), 1) - size(image(new >=0), 1);



if(error == 0)
	indicator = 1;
else
	indicator = 0;
end;

end
