info = importdata('information_gain.csv')
x = info.data(:,1);     % rate
y = info.data(:,2);     % gain
[m,n] = size(x);

t_w = 30;    % avg time between patches in secs
t_b = 5;   % avg patch processing time in secs
lamda = 1/t_b;

% Parameters for the regression
alfa = 0.01;    % learning rate
Nit = 100;      % number of iterations
theta(1,:) = zeros(1,n);

% Logarithmic regression to find the optimal search time
for i=2:Nit+1

    g = theta(i-1)*log(x) + theta(1);
    J_der = 1/m*(g - y)'*x;
    theta(i,:) = theta(i-1,:) - alfa*J_der;
    J(i-1) = -1/m*(y'*log(g) + (1-y')*log(1 - g));

end

rate = lamda*g/(1+lamda*t_w);
plot(rate)
hold on
plot(g, '--')
hold off
