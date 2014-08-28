function t = test_log(range,start_disp,end_disp,length_summer,total_length,num_years, d_y)
    clf;
    green = create_log_greenness(range,start_disp,end_disp,length_summer,total_length,num_years);
    plot(d_y,'b');
    hold on;
    D = max(d_y);
    C = min(d_y);
    A =0;
    B =1;
    gs = (((D-C)*(green-A)) / (B-A)) + C;
    gs = gs(:,1:total_length);
    hold on ;
    plot(gs,'r');
    t = gs;

