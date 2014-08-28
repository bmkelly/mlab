function [A B r U V] = plot_error_canoncorr(x,y)
    clf;
    [A B r U V] = canoncorr(x,y);
    err = ((x-repmat(mean(x),length(y),1))*A)/B + repmat(mean(y),length(y),1);
    hold on
    plot(y,'b')
    plot(err,'r')
    legend('y-vector','CCA aprox')