% shapeUnion : returns the union of two shapes, i.e. min(shape1, shape2)
%
% Output parameters:
%   finalShape = the union of shape1 and shape2
% 
% Input parameters:
%   shape1 = any shape represented by a mxm matrix
%   shape2 = any shape represented by a mxm matrix

function finalShape = shapeUnion(shape1, shape2)
finalShape = min(shape1, shape2);