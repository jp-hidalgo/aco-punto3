function [] = drawPhromone(tau, graph)
    maxTau = max(tau(:));
    minTau = min(tau(:));

    tau_normalized = (tau - minTau) ./ (maxTau - minTau) + eps;

    for i = 1 : graph.n - 1
        for j = i + 1 : graph.n
            x1 = graph.node(i).x;
            y1 = graph.node(i).y;

            x2 = graph.node(j).x;
            y2 = graph.node(j).y;

            X = [x1, x2];
            Y = [y1, y2];

            plot(X, Y, 'color', [0, 0, 0], 'lineWidth', 10 .*  1)
            hold on;
        end
    end

    for i = 1 : graph.n
        X = [graph.node(:).x];
        Y = [graph.node(:).y];
        plot(X, Y, 'ok', 'MarkerSize', 10, 'MarkerEdgeColor', 'r', 'MarkerFaceColor', [1 .6 .6])
    end

    title('All Pheromones')
    box on
    hold off;
end
