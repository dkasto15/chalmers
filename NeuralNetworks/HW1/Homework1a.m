nbrOfBits = 100; 
nbrOfTrials = 10^5;

N = zeros(nbrOfBits, 1);
W = zeros(nbrOfBits);
pVec = [12, 20, 40, 60, 80, 100];
pError = zeros(length(pVec), 1);

w_ii_zero = false; % Toggle whether w_ii should be equal to zero or not

for p = pVec
    nbrOfPErrors = 0;
    for trial = 1:nbrOfTrials
        randomPatternsVec = randi(2, nbrOfBits, p);
        randomPatternsVec(randomPatternsVec == 2) = -1;
        feedPatternInd = randi(p, 1); 
        feedPattern = randomPatternsVec(:, feedPatternInd);
        
        cInd = randi(nbrOfBits, 1, 1); % pick a random i
        sum_cInd = 0;
        for j=1:nbrOfBits
            if j ~= cInd || ((j == cInd) && (~w_ii_zero))
                for mu = [1:feedPatternInd-1, feedPatternInd+1:p]
                    sum_cInd = sum_cInd + randomPatternsVec(cInd, mu) *...
                        randomPatternsVec(j, mu) *...
                        randomPatternsVec(j, feedPatternInd);
                end
            end
        end
        C_i_nu = -randomPatternsVec(cInd, feedPatternInd) * 1 / nbrOfBits * sum_cInd;
        nbrOfPErrors = nbrOfPErrors + double(C_i_nu > 1);
    end
    pError(pVec == p) = nbrOfPErrors / nbrOfTrials; 
end
