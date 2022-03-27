% network gen driver

N = 1500; % number of nodes
K = 15; % beginning edges
b = 0.10; % rewiring prob

PLOT = 1;

GIF = 0;
brange = [0 1];
bstep = 0.005;
bs = brange(1):bstep:brange(2);
%edges = linspace(30,60,16);
edges = linspace(15,45,31);

if PLOT
    h = network_gen_dd(N,K,b);
    dd = degree(h);
    subplot(1,2,1)
    plot(h)
    subplot(1,2,2)
    histogram(dd)
end

if GIF
    hold on
    b = bs(1);
    h = network_gen_dd(N,K,b);
    dd = degree(h);
    
    subplot(1,2,1)
    plot(h)
    subplot(1,2,2)

    histogram(dd, 'BinEdges', edges)
    ylim([0,200])
    title(b)

    gif('test.gif', 'overwrite', true)
    for i = 2:length(bs)
        b = bs(i);
        h = network_gen_dd(N,K,b);
        dd = degree(h);

        clf
        subplot(1,2,1)
        plot(h)
        subplot(1,2,2)

        histogram(dd,'BinEdges', edges)
        ylim([0,200])
        title(b)
        gif
    end

end
