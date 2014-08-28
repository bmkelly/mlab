function f = plot_rainbow(resp,t_str,plot_num)
    %figure
    subplot(3,2,plot_num)
    hold on
    s = size(resp);
    nt = s(1);
    cc = hsv(nt+15);
    for i = 2:nt
        
        plot(resp(i,4:end),'color',cc(i,:));
        
    end
    N = nt;
    Legend=cell(N,1);
    for iter=1:N
        Legend{iter}=strcat(num2str(iter));
    end
    legend(Legend)
    title(strcat(t_str , ': increasing penalty on filter importance'));
    hold off