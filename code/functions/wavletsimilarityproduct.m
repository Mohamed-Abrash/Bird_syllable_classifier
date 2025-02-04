function score = wavletsimilarityproduct(x,y,wavelettype,waveletnr,Nshift)
    
    
    [c,l] = wavedec(x,4,"db3");
    %approx = appcoef(c,l,"db3");
    [cd1,cd2,cd3, cd4] = detcoef(c,l,[1 2 3 4]);
    
    [c2,l2] = wavedec(y,4,"db3");
    %approx = appcoef(c2,l2,"db3");
    [cd12,cd22,cd32, cd42] = detcoef(c2,l2,[1 2 3 4]);
    %Dot(tau)=dot(cd12,cd1)./(sqrt(dot(cd1,cd1))*sqrt(dot(cd12,cd12)));





    V = cd12';
    N = Nshift;
    
    % Create a matrix with N rows, each row is a copy of V
    M = repmat(V, N+1, 1);
    
    % Shift each row by its index, replace the shifted elements by zero
    for i = 1:N
        M(i, :) = circshift(M(i, :), [0, i]);
        M(i, 1:i) = 0;
    end
    
    % Drop the elements falling outside the matrix
    M = M(:, 1:length(V))';
    M = M./vecnorm(M);
    D1 = vecnorm(M - repmat(cd1./norm(cd1),1,N+1));
    
    
    V = cd1';
    N = Nshift;
    
    % Create a matrix with N rows, each row is a copy of V
    M = repmat(V, N+1, 1);
    
    % Shift each row by its index, replace the shifted elements by zero
    for i = 1:N
        M(i, :) = circshift(M(i, :), [0, i]);
        M(i, 1:i) = 0;
    end
    
    % Drop the elements falling outside the matrix
    M = M(:, 1:length(V))';
    M = M./vecnorm(M);

    D2 = vecnorm(M- repmat(cd12./norm(cd12),1,N+1));



    score = min([D1' ;D2']);
end