function J = computeCost(y,h)

m = length(y);
J = -1/m*(y'*log(h) + (1-y')*log(1 - h));