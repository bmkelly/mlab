% Takes some parameters and returns a logrithmic function that simulates
% how an average greenness score ocilates between two extremes, the high
% extreme over the summer and a low extreme over the rest of the year.

% range = how long the log function is (from 0-1)
% start_disp = at what x value should the first summer begin
% end_disp = how long should the last sequence of 0's be
% length_summer = how long should the summers last (how long between 0-1,
% and 1-0
% total_length = how long is the data going on for (x-range)
% num_years = how many cycles should we perform (how many summers)

function f = create_log_greenness(range,start_disp,end_disp,length_summer,total_length,num_years)

    %first must calculate how long the non-summer time period is
    hold = total_length-(start_disp+end_disp);
    hold = hold - (range*2+length_summer)*num_years;
    length_winter = hold/(num_years-1);
    %winter is defined as: not-summer so summer+winter = year_length
    
    f = zeros(1,total_length);
    forward = create_log(range);
    backward = create_reverse_log(range);
    for i=1:num_years;
        year_disp = int64(((i-1)*(range*2+length_summer+length_winter)))+start_disp;
        for j=1:range;
            f(year_disp+j)=forward(j);
        end
        for j=1:length_summer;
            f(year_disp+range+j)=1;
        end
        for j=1:range;
            f(year_disp+range+length_summer+j)=backward(j);
        end    
    end
end

% This creates a graph that completes the log curve from 1 - range. (0,0)-(range,1)

function f = create_log(range)

	A=1/(range/4);
	f = zeros(1,range);
	for i=1:range;
        f(i)=1/(1+10^(-1*A*(i-range/2)));
    end
    
    
end

% Creates the reverse graph of create_log

function f = create_reverse_log(range)
    hold = create_log(range);
    f = zeros(1,range);
    for i=1:range;
        f(i)=hold(range-i+1);
    end
    
end 


 
    