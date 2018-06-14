%% Draw the electrode coordinate
    figure;
    N_chan = 62;
    
    plot(200*circleX,200*circleY,'k','LineWidth',2);
    axis off;
    hold on;
    plot(200*NoseX,200*NoseY,'k','LineWidth',2);
    plot(200*LearX,200*LearY,'k','LineWidth',2);
    plot(200*RearX,200*RearY,'k','LineWidth',2);
    
    %example
    for i=1:29
        plot([EleLoc(3,2) EleLoc(34,2)],[EleLoc(3,1) EleLoc(34,1)],'k');
    end

    for nchan = 1:N_chan
        plot(EleLoc(nchan,2),EleLoc(nchan,1),'r.','MarkerSize',19);
    end
    
    hold off;
        