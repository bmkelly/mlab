function f = least_squares_log_greenness(x)
    range = floor(x(1));
    start_disp = floor(x(2));
    end_disp = floor(x(3));
    length_summer = floor(x(4));
    %load data
    data = csvread('C:\Users\Kelly\Desktop\2 left tree\combo-left_new.csv',2,0);
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
    f = sum((d_y-gs').^2);
    
    %penalize
    %if range >80
    
    %    f = f*5;
    %end
    
    
    
    