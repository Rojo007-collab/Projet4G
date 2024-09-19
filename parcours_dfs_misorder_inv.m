function res = parcours_dfs_misorder_inv(in)
    [W H] = size(in);
    
    % disp('value of n');
    % disp(n);
    [dfsXX, dfsYY] = index_dfs(W, H);
    
    % PERMUTE OR NOT , HAVE A LOOK ON FILTERING FOR PERMUTE
    temp = dfsXX;
    dfsXX = dfsYY;
    dfsYY = temp;

%%%    disp('dfs NON filtered');
%%%    disp( [dfsXX; dfsYY]);
    
    dfsX = ones(1, W*H);
    dfsY = ones(1, W*H);

    % filtering verify W and H with plot
    p = 1;
    for i = 1:length(dfsXX)
        if (dfsXX(i)>=1)&&(dfsXX(i) <=H)&& (dfsYY(i)>=1)&&(dfsYY(i) <=W)
            dfsX(p) = dfsXX(i);
            dfsY(p) = dfsYY(i);
            p = p+1;

        end
    end
    % disp('number of p');
    %  disp(p);
    % disp('dfs filtered');
    % disp( [dfsX; dfsY]);
    % plot(dfsX, dfsY);
	
	% MISOREDRING ALGORITHM : 
	tempX = dfsX;
	tempY = dfsY;
	p = 1;
	for i=1:W  % misorder this boucle
		for j = 1:H % misorder this boucle
			indexx = (j-1)*H+i;
			dfsX(indexx) = tempX(p);
			dfsY(indexx) = tempY(p);
			p = p+1;
		end
    end
    % plot(dfsX, dfsY);
    
    i_permute = 1;
    j_permute = 1;
  
    for i = 1:length(dfsX)
  %          permuteIndexX = mod(dfsIndex(i)-1, W);  % no minus 1 for this
  %          permuteIndexY = floor((dfsIndex(i)-1)/W); % no minus 1 for this
  %          disp('value');
  %          disp(dfsIndex(i));
  %          disp([permuteIndexX+1 permuteIndexY+1])
  %          disp('here');
  %          disp([i_permute j_permute])
            res(dfsY(i), dfsX(i)) = in(i_permute, j_permute);
            % disp(in(permuteIndexX+1,permuteIndexY+1)); 
           
           j_permute = j_permute+1;
           if(j_permute == H+1)
                j_permute = 1;
                i_permute = i_permute+1;
           end
           

    end
    
    

end


function [indexX, indexY] = index_dfs(W, H)
	[sommetX, sommetY] = generated_graph(W, H);
    names = cellstr(string(1:W*H));
    G = graph(sommetX,sommetY,[], names);
    
    res_dfs = dfsearch(G, 1)';
    % disp('dfs');
    % disp(res_dfs);
	% plot(G);
	
	% translate to indice the matrix A
	A = res_dfs;
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

