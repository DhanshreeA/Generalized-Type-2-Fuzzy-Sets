%Example of GT2FS with lmf and umf having the same peak.
x = 0:1:100; %universe of discourse
% support = (a,b) where a is left shoulder and b is right shoulder
% peak of triangular MF
% support and peak required to plot the trimf
umf.left=10; 
umf.right=90; 
umf.peak=50;
umf.support=[umf.left umf.right];
umf.y=trimf(x,[umf.left umf.peak umf.right]);
% umf.support(1) < lmf.support(1)
% umf.support(2) > lmf.support(2)
lmf.left=40;
lmf.right=70;
lmf.peak=50;
lmf.support=[lmf.left lmf.right];
lmf.y=trimf(x,[lmf.left lmf.peak lmf.right]);
%Plotting zSlice at Z0
z=zeros(1,length(x));
hold on
plot3(x,lmf.y,z);
plot3(x,umf.y,z);
% hold off;
zlevels=5; % ie zlevel number of zSlices, where Z0 is not counted because it is the FOU of the IT2 set. 
zSlices=ones(1,zlevels);

for i=1:zlevels
    zSlices(1,i)=i*(1/zlevels); %values of zlevels
end

%Plotting zSlices from Z1 to Zzlevels
for i=1:zlevels
    zmf(i).zvalues=zSlices(1,i)*ones(1, length(x)); %storing an array with the same zvalue for plot3
    zmf(i).umf.left=umf.left+(1*zSlices(1,i)); %changing support
    zmf(i).umf.right=umf.right-(1*zSlices(1,i));
    zmf(i).umf.peak=(umf.peak+lmf.peak)/2;
    zmf(i).umf.supp=[zmf(i).umf.left    zmf(i).umf.right];
    zmf(i).umf.y=trimf(x, [zmf(i).umf.left   zmf(i).umf.peak   zmf(i).umf.right]);
    zmf(i).lmf.left=lmf.left+(3*zSlices(1,i));
    zmf(i).lmf.right=lmf.right-(3*zSlices(1,i));
    zmf(i).lmf.peak=(umf.peak+lmf.peak)/2;
    zmf(i).lmf.supp=[zmf(i).lmf.left    zmf(i).lmf.right];
    zmf(i).lmf.y=trimf(x, [zmf(i).lmf.left   zmf(i).lmf.peak   zmf(i).lmf.right]);
    plot3(x,zmf(i).umf.y,zmf(i).zvalues)
    plot3(x,zmf(i).lmf.y,zmf(i).zvalues)
end
hold off


% % Defuzzification
% for i=1:zlevels
%     yl(i)=EKM(x,zmf(i).lmf.y,zmf(i).umf.y,-1);
%     yr(i)=EKM(x,zmf(i).lmf.y,zmf(i).umf.y,1);
% end
% sum1=0;
% for i=1:zlevels
%     sum1=sum1+(yl(i)+yr(i))*zSlices(1,i)*0.5;
% end
% sum1/(sum(zSlices))


