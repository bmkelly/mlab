function f = run_data(data, y, num_times)
    
    %CCA 
    [A B r U V] = canoncorr(data,y);
    
    response = zeros(11,3+37);
    sum = 0;
    for j=1:37
        if(A(j)==0)
            sum= sum+1;
        end
    end
    %response(1,2) = sum;
    response(1,3) = r;
    response(1,4:end) = A;

    
    
    
    % SCCA
    options.RegType = 1;
    count =2;
    for i=.005:.005:num_times*.005
        options.RegX=i;
        W_x = LS_CCA(data', y', options);
        r = corrcoef(data*W_x, y);
        sum = 0;
        for j=1:37
            if(W_x(j)>-0.001 && W_x(j)<.001)
                sum= sum+1;
            end
        end
        x = count;
        count = count + 1;
        response(x,4:end) = W_x;
        response(x,3) = r(1,2);
        response(x,2)= sum;
        response(x,1)= i;
                
    end
    
    
    f = response;
   
    
    
    
    