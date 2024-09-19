function res = parcours_bfs_inv(in)
    [W H] = size(in);
    
    % disp('value of n');
    % disp(n);
    [bfsXX, bfsYY] = index_bfs(W, H);
    
    % PERMUTE OR NOT , HAVE A LOOK ON FILTERING FOR PERMUTE
    temp = bfsXX;
    bfsXX = bfsYY;
    bfsYY = temp;

%%%    disp('bfs NON filtered');
%%%    disp( [bfsXX; bfsYY]);
    
    bfsX = ones(1, W*H);
    bfsY = ones(1, W*H);

    % filtering verify W and H with plot
    p = 1;
    for i = 1:length(bfsXX)
        if (bfsXX(i)>=1)&&(bfsXX(i) <=H)&& (bfsYY(i)>=1)&&(bfsYY(i) <=W)
            bfsX(p) = bfsXX(i);
            bfsY(p) = bfsYY(i);
            p = p+1;

        end
    end
    % disp('number of p');
    %  disp(p);

%%%     disp('bfs filtered');
%%%     disp( [bfsX; bfsY]);
%%%     plot(bfsX, bfsY);
    
    i_permute = 1;
    j_permute = 1;
  
    for i = 1:length(bfsX)
  %          permuteIndexX = mod(bfsIndex(i)-1, W);  % no minus 1 for this
  %          permuteIndexY = floor((bfsIndex(i)-1)/W); % no minus 1 for this
  %          disp('value');
  %          disp(bfsIndex(i));
  %          disp([permuteIndexX+1 permuteIndexY+1])
  %          disp('here');
  %          disp([i_permute j_permute])
            res(bfsY(i), bfsX(i)) = in(i_permute, j_permute);
            % disp(in(permuteIndexX+1,permuteIndexY+1)); 
           
           j_permute = j_permute+1;
           if(j_permute == H+1)
                j_permute = 1;
                i_permute = i_permute+1;
           end
           

    end
    
    

end

function [indexX, indexY] = index_bfs(W, H)
    [sommetX, sommetY] = generated_graph(W, H);
    names = cellstr(string(1:W*H));
    G = graph(sommetX,sommetY,[], names);
    
    res_bfs = bfsearch(G, 1)';
    % disp('bfs');
    % disp(res_bfs);
	% plot(G);
	
	% translate to indice the matrix A
	A = res_bfs;
    indexX = ones(1, W*H);
    indexY = ones(1, W*H);
    p = 1;
    for mvt = 1:W*H
            indexX(p) = mod(A(mvt)-1, W);
            indexY(p) = floor((A(mvt)-1)/W);
            p = p+1;
        
    end
    indexX = indexX+1;
    indexY = indexY+1;
end


function [sommetX, sommetY] = generated_graph(W, H)

p = 1;
for i = 1:W
    for j = 1:H
        matrix(i,j) = p;
        p = p+1;
    end
end

sommet = reshape(matrix', 1, W*H);

% disp(sommet);
% disp('length sommet');
% disp(length(sommet));

sommetX = zeros(1, 4*length(sommet));
sommetY = zeros(1, 4*length(sommet));
p = 1;
for i = 1:length(sommet)
    abs= mod(sommet(i)-1, W);
    ord = floor((sommet(i)-1)/W);
    % disp([(sommet(i)-1) abs, ord]);



    % add abs + 1
    sommetX(p) = sommet(i)-1;
    sommetY(p) = mod(ord, H)*W+mod(abs+1, W);
    p = p+1;

   
    % add ord + 1 
    sommetX(p) = sommet(i)-1;
    sommetY(p) = mod(ord+1, H)*W+mod(abs,W);
    p = p+1;

    % add abs - 1
    sommetX(p) = sommet(i)-1;
    sommetY(p) = mod(ord, H)*W+mod(abs-1, W);
    p = p+1;
     
    % add ord - 1 
    sommetX(p) = sommet(i)-1;
    sommetY(p) = mod(ord-1, H)*W+mod(abs,W);
    p = p+1;
    
end

sommetX = sommetX+1;
sommetY = sommetY+1;

% clc
% disp([sommetX; sommetY]);
end