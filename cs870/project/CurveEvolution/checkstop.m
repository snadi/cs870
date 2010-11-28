function indicator = checkstop(old, new)

error = abs( (old - new) ./ old);
error(~isfinite(error)) = 0;   % Sets Inf and NaN to 0

display(max(max(error)));
pause;

indicator = 0;

end
