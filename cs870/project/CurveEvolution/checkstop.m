function indicator = checkstop(old, new, error)

difference = abs(new  - old);

av = sum(sum(difference)) / prod(size(difference));
display(round(av));

erroneousIndices = find(difference > error + eps);

if (length(erroneousIndices) > 0)
    indicator = 1;
end

indicator = 0;

end
