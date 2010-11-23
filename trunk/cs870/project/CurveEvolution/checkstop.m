function indicator = checkstop(old, new, error)

difference = abs(new - old);

display(max(max(difference)));

erroneousIndices = find(difference > error + eps);

if (length(erroneousIndices) > 0)
    indicator = 1;
end

indicator = 0;

end
