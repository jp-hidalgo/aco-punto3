function [colony] = createColony(graph, colony, antNo, tau, eta, alpha, beta)
    nodeNo = graph.n;

    for i = 1 : antNo
        initial_node = 9; % Initial node
        colony.ant(i).tour(1) = initial_node;

        for j = 2 : nodeNo % to choose the rest of nodes
            currentNode = colony.ant(i).tour(end);

            % Find neighbors with a distance less than 10
            neighborNodes = find(graph.edges(currentNode, :) <= 10);

            % Remove visited nodes from the neighborNodes array
            visitedNodes = colony.ant(i).tour;
            neighborNodes = setdiff(neighborNodes, visitedNodes);

            % Calculate probabilities for neighbor nodes
            P_allNodes = tau(currentNode, neighborNodes) .^ alpha .* eta(currentNode, neighborNodes) .^ beta;
            % Add a small constant to prevent NaN values
            P = P_allNodes ./ sum(P_allNodes);

            nextNode = rouletteWheel(P);
            colony.ant(i).tour = [colony.ant(i).tour, neighborNodes(nextNode)];
        end

        % Complete the tour by selecting the final node as 17
        colony.ant(i).tour = [colony.ant(i).tour, 17];
    end
end
