%Sarah Nadi 20290927

%this constructs a cone with the equation given in the paper  to make sure
%that inside the cirlce is positive and outside is negative
function phi = cone(radius, center, m)
h = 1 / (m - 1);

phi = zeros(m,m);
for i = 1 : m 
    for j = 1 : m
        phi(i,j) = -1*(sqrt( ((j-1) - center(1))^2 + ((i-1) - center(2))^2)) + radius;
    end
end
end



