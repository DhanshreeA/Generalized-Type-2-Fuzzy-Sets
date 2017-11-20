% Triangular GT2FS with vertical slice representation 
% and triangular secondary MF

% Vertical slices may or may not be equal in numebr
% to the discretization level of variable X
% However, the equal case is taken up here

w=0.5; %vertical slice is an isosceles triangle
n=300; % Number of vertical slices
x=linspace(0,10,n);
mf='trimf';
umf.params=[2 5 9];
umf.y=trimf(x,umf.params);
lmf.params=[3 5 7];
lmf.y=trimf(x,lmf.params);
apex=lmf.y+w*(umf.y-lmf.y);
hold on

% The 2-D FOU
h1=area(x,umf.y);
h1.FaceColor=[0.75 0.75 0.75];
h2=area(x,lmf.y);
h2.FaceColor=[1 1 1];

%Building up the vertical slices. 
for i=1:length(x)
   y=linspace(lmf.y(i),umf.y(i),10); 
   vert=trimf(y,[lmf.y(i) apex(i) umf.y(i)]);
   xvals=x(i)*ones(10);
   plot3(xvals,y,vert);
end



