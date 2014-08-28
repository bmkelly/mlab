function f = test_opti(x)
    clf;
    range = floor(x(1));
    start_disp = floor(x(2));
    end_disp = floor(x(3));
    length_summer = floor(x(4));
     %load data
    data = csvread('C:\Users\Kelly\Desktop\2 left tree\combo-left.csv',2,0);
    d_y = data(:,2);
    total_length = length(d_y);
    num_years = 4;
    %create log of greenness
    green = create_log_greenness(range,start_disp,end_disp,length_summer,total_length,num_years);
    
    %normalize to greenness data
    D = max(d_y);
    C = min(d_y);
    A =0;
    B =1;
    gs = (((D-C)*(green-A)) / (B-A)) + C;
    gs = gs(:,1:total_length);
    
    %find the least_squares dif
    ls_val = sum((d_y-gs').^2)
    f = gs';
    plot(d_y,'b')
    hold on
    plot(gs,'r')
    