function [nextNode] = rouletteWheel(P)
    cumsumP = cumsum(P);
    cumsumP = cumsumP / max(cumsumP);  % Normalize the cumulative probabilities to ensure a valid range [0, 1]
    r = rand();

    nextNode = find(r <= cumsumP, 1);
end
