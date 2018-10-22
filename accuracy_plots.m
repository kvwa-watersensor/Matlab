%Script to plot the sensor accuracy%
h = 0;
v = [1:400];
for i = 1:400
    dh = (76*v(i))/(7.6 + 2*v(i));
    c = (dh^(1/6))/0.009;
    f = c*sqrt(dh*sin(0.29/360*2*pi))*(v(i)*76);
    h(i) = f/(1000)^3;
end

%Datarange 0-10/200-350/   
for i =1:10
    a(i) = 0;
    l = (200 + (i-1)*10);
    for j=1:10
        k = l+j;
        dh = (76*l)/(7.6 + 2*l);
        c = (dh^(1/6))/0.009;
        f = c*sqrt(dh*sin(0.29/360*2*pi))*(l*76);
        a(k-1) = f/(1000)^3;
    end
  end

%Datarange 350-40:
dh = (76*350)/(7.6 + 2*350);
c = (dh^(1/6))/0.009;
f = c*sqrt(dh*sin(0.29/360*2*pi))*(350*76);
a(350:400) = f/(1000)^3;
%Datarange 10-65
dh = (76*10)/(7.6 + 2*10);
c = (dh^(1/6))/0.009;
f = c*sqrt(dh*sin(0.29/360*2*pi))*(10*76);
a(10:65) = f/(1000)^3;
%Datarange 65-122
dh = (76*65)/(7.6 + 2*65);
c = (dh^(1/6))/0.009;
f = c*sqrt(dh*sin(0.29/360*2*pi))*(65*76);
a(65:122) = f/(1000)^3;
%Datarange 122-180
dh = (76*122)/(7.6 + 2*122);
c = (dh^(1/6))/0.009;
f = c*sqrt(dh*sin(0.29/360*2*pi))*(122*76);
a(122:180) = f/(1000)^3;
%Datarange 180-200
dh = (76*180)/(7.6 + 2*180);
c = (dh^(1/6))/0.009;
f = c*sqrt(dh*sin(0.29/360*2*pi))*(180*76);
a(180:199) = f/(1000)^3;

%Calculate error deviation.
acc=h-a;

%Generate vector scalable plots

p = figure;

plot(v,h,v,a);
title("Sensor Accuracy Plots")
xlabel('Flow Depth /mm') 
ylabel('Flow /m3/s') 
legend({'Continuous Flow','Sensor Output'},'Location','northwest')


set(p,'Units','Inches');

pos = get(p,'Position');

set(p,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])

print(p,'sensor_accuracy','-dpdf','-r0')


e = figure;

plot(v,acc);
title("Sensor Output Deviation from Flow")
xlabel('Flow Depth /mm')  
ylabel('Flow Inaccuracy /m3/s') 


set(e,'Units','Inches');

pos = get(e,'Position');

set(e,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])

print(e,'sensor_inacuracy','-dpdf','-r0')

