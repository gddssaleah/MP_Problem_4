ho = input('Input initial height in m: ');
vo = input('Input initial velocity in m/s: ');
theta = input('Input angle in degrees with respect to +x: ');
ax = input('Input acceleration in x-direction in m/s2: ');
ay = input('Input acceleration in y-direction in m/s2: ');

%printing error message:
if ay == 0 
    disp('ERROR! acceleration in y-axis cannot be zero')
else
    %computing for the parameters of the projectile motion:
     %computing for vox&voy and vfy&vfx:
        vox = vo*cosd(theta);
        voy = vo*sind(theta);
        vfx = (vox + 2*ax)^(1/2);
        vfy = (voy + 2*ay)^(1/2);
     %computing for time at the end of the projection:
        num = (-voy - (voy*voy - 2*ay*ho)^(1/2)); 
        time = num/ay; 
    %establishing equations for plotting  
     t = linspace(0,time);
     if t > 0 
         x = -vox.*t + 0.5.*ax.*t.*t;
         y = voy.*t + 0.5.*-ay.*t.*t;
     elseif t<=0
         q = (voy + (voy*voy - 2*ay*ho)^(1/2))/ay;
         i = linspace(0,q);
         x = -vox.*i + 0.5.*ax.*i.*i;
         y = voy.*i + 0.5.*-ay.*i.*i;
     end
 plot(x,y, '-.g', 'linewidth',1); hold on; grid on;
 xlabel('distance in meters');
 ylabel('height in meters');
 title('Graph of the Projectile Motion');
end 