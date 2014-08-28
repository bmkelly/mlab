function [A B r U V] = plot_smoothed_error_canoncorr(x,y)
    clf;
    [A B r U V] = canoncorr(x,y);
    err = ((x-repmat(mean(x),length(y),1))*A)/B + repmat(mean(y),length(y),1);
    hold on
    plot(medfilt2(y,[101 1]),'b')
    plot(medfilt2(err,[101 1]),'r')
    legend('y-vector','CCA aprox')