function tau = updatePhromone(tau, colony)
    antNo = length(colony.ant(:));

    for i = 1 : antNo % for each ant
        tour = colony.ant(i).tour;
        tourLength = length(tour);

        for j = 1 : tourLength - 1 % for each node in the tour
            currentNode = tour(j);
            nextNode = tour(j + 1);

            tau(currentNode, nextNode) = tau(currentNode, nextNode) + 1 / colony.ant(i).fitness;
            tau(nextNode, currentNode) = tau(nextNode, currentNode) + 1 / colony.ant(i).fitness;
        end
    end
end
