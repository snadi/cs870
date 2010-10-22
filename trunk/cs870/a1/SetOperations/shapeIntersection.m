% shapeIntersection : returns the intersection of any number of shapes,
%                     i.e. max(shape1, shape2, ..., etc)
%
% Output parameters:
%   finalShape = the intersection of shape1 with other shapes
% 
% Input parameters:
%   shape1 = any shape represented by an mxn matrix
%   varargin = any number of shapes (or zero), each represented by an mxn matrix

function finalShape = shapeIntersection(shape1, varargin)

finalShape = shape1;

for i = 1 : size(varargin, 2)
    finalShape = max(finalShape, varargin{i});
end