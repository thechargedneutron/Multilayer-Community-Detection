function [] = matrix_of_montage(base_x, base_y)

load('ANT_Coordinates.mat');
plot(200*circleX + base_x,200*circleY + base_y,'k','LineWidth',2);
plot(200*NoseX + base_x,200*NoseY + base_y,'k','LineWidth',2);
plot(200*LearX + base_x,200*LearY + base_y,'k','LineWidth',2);
plot(200*RearX + base_x,200*RearY + base_y,'k','LineWidth',2); 
%example
for nchan = 1:62
    plot(EleLoc(nchan,1)+base_x,EleLoc(nchan,2)+base_y,'r.','MarkerSize',1);
end