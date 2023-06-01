function [ colony ] = createColony( graph, colony , antNo, tau, eta, alpha,  beta)

nodeNo = graph.n;

for i = 1 : antNo
    
    initial_node = 9; %Initial node
    colony.ant(i).tour(1) = initial_node;
    
    for j = 2 : nodeNo % to choose the rest of nodes 
               currentNode =  colony.ant(i).tour(end);
               
               P_allNodes = tau( currentNode , :  ) .^ alpha .* eta( currentNode , :  )  .^ beta;
               P_allNodes(colony.ant(i).tour) = 0 ;  % assing 0 to all the nodes visited so far
               % Add a small constant to prevent NaN values
               P_allNodes = P_allNodes + eps;
               P = P_allNodes ./ sum(P_allNodes);
               
               nextNode = rouletteWheel(P); 
               colony.ant(i).tour = [  colony.ant(i).tour , nextNode ];
    end
    
    % complete the tour 
    colony.ant(i).tour = [ colony.ant(i).tour , colony.ant(i).tour(1)];
end

end