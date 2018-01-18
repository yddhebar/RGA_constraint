function y = PrG10c(x)
% Matlab Code by A. Hedar (Nov. 23, 2005).
% Constraints
y(1) = -1+0.0025*(x(4)+x(6));
y(2) = -1+0.0025*(-x(4)+x(5)+x(7));
y(3) = -1+0.01*(-x(5)+x(8));
y(4) = 100*x(1)-x(1)*x(6)+833.33252*x(4)-83333.333;
y(5) = x(2)*x(4)-x(2)*x(7)-1250*x(4)+1250*x(5);
y(6) = x(3)*x(5)-x(3)*x(8)-2500*x(5)+1250000;
% % Variable upper bounds
% y(7) = x(1)-10000;
% y(8) = x(2)-10000;
% y(9) = x(3)-10000;
% y(10) = x(4)-1000;
% y(11) = x(5)-1000;
% y(12) = x(6)-1000;
% y(13) = x(7)-1000;
% y(14) = x(8)-1000;
% % Variable lower bounds
% y(15) = -x(1)+100;
% y(16) = -x(2)+1000;
% y(17) = -x(3)+1000;
% y(18) = -x(4)+10;
% y(19) = -x(5)+10;
% y(20) = -x(6)+10;
% y(21) = -x(7)+10;
% y(22) = -x(8)+10;
% ******************************************************
y=y';