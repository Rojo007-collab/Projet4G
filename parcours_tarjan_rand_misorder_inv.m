function res = parcours_tarjan_rand_misorder_inv(in)
    [W H] = size(in);
    
    % disp('value of n');
    % disp(n);
    [tarjan_randXX, tarjan_randYY] = index_tarjan_rand(W, H);
    
    % PERMUTE OR NOT , HAVE A LOOK ON FILTERING FOR PERMUTE
    temp = tarjan_randXX;
    tarjan_randXX = tarjan_randYY;
    tarjan_randYY = temp;

%%%    disp('tarjan_rand NON filtered');
%%%    disp( [tarjan_randXX; tarjan_randYY]);
    
    tarjan_randX = ones(1, W*H);
    tarjan_randY = ones(1, W*H);

    % filtering verify W and H with plot
    p = 1;
    for i = 1:length(tarjan_randXX)
        if (tarjan_randXX(i)>=1)&&(tarjan_randXX(i) <=H)&& (tarjan_randYY(i)>=1)&&(tarjan_randYY(i) <=W)
            tarjan_randX(p) = tarjan_randXX(i);
            tarjan_randY(p) = tarjan_randYY(i);
            p = p+1;

        end
    end
    % disp('number of p');
    %  disp(p);
    % disp('tarjan_rand filtered');
    % disp( [tarjan_randX; tarjan_randY]);
    % plot(tarjan_randX, tarjan_randY);

	% MISOREDRING ALGORITHM : 
	tempX = tarjan_randX;
	tempY = tarjan_randY;
	p = 1;
	for i=1:W  % misorder this boucle
		for j = 1:H % misorder this boucle
			indexx = (j-1)*H+i;
			tarjan_randX(indexx) = tempX(p);
			tarjan_randY(indexx) = tempY(p);
			p = p+1;
		end
    end
    % plot(tarjan_randX, tarjan_randY);

    
    i_permute = 1;
    j_permute = 1;
  
    for i = 1:length(tarjan_randX)
  %          permuteIndexX = mod(tarjan_randIndex(i)-1, W);  % no minus 1 for this
  %          permuteIndexY = floor((tarjan_randIndex(i)-1)/W); % no minus 1 for this
  %          disp('value');
  %          disp(tarjan_randIndex(i));
  %          disp([permuteIndexX+1 permuteIndexY+1])
  %          disp('here');
  %          disp([i_permute j_permute])
            res(tarjan_randY(i), tarjan_randX(i)) = in(i_permute, j_permute);
            % disp(in(permuteIndexX+1,permuteIndexY+1)); 
           
           j_permute = j_permute+1;
           if(j_permute == H+1)
                j_permute = 1;
                i_permute = i_permute+1;
           end
    end
end

function  [x,y] = index_tarjan_rand(W, H)
	[sommetX, sommetY] = generated_graph_rand(W, H);	
	% random delete
%%%    disp('LENGTH, ');
%%%    disp(length(sommetX));
	
	E = sparse(sommetY,sommetX, ones(1,length(sommetX)));
	c = tarjan(E);	
	
    [size1, size2] = size(c);
	%disp('size');
    %disp(size2);
    
    %disp('c');
    %disp(c);
    I = [];
    for i = 1:size2
        % disp('i');
        % disp(i);
        % disp(c{i});
        I = [I c{i}]; % concat all cells
    end

    % disp('I');
    % disp(I)
    % Index is at I : 
    x = ones(1, W*H);
    y = ones(1, W*H);
    for p = 1:W*H
            x(p) = mod(I(p)-1, W);
            y(p) = floor((I(p)-1)/W);
    end
    x = x+1;
    y = y+1;
    
end

function [sommetX, sommetY] = generated_graph_rand(W, H)

p = 1;
for i = 1:W
    for j = 1:H
        matrix(i,j) = p;
        p = p+1;
    end
end

sommet = reshape(matrix', 1, W*H);

%%% disp(sommet);
%%% disp('length sommet');
%%% disp(length(sommet));

%sommetX = zeros(1, 4*length(sommet));
%sommetY = zeros(1, 4*length(sommet));
p = 1;
for i = 1:length(sommet)
    abs= mod(sommet(i)-1, W);
    ord = floor((sommet(i)-1)/W);
    %disp([(sommet(i)-1) abs, ord]);
	
	r = mod(floor((rand(1,4)*100)),2);
	while (sum(r) ~= 1) 
		r = mod(floor((rand(1,4)*100)),2);
	end
	%disp('random choose grah');
	%disp(r);

    % add abs + 1
	if(r(1,1) == 1)
		sommetX(p) = sommet(i)-1;
		sommetY(p) = mod(ord, H)*W+mod(abs+1, W);
		p = p+1;
	end
   
    % add ord + 1 
	if(r(1,2) == 1)
		sommetX(p) = sommet(i)-1;
		sommetY(p) = mod(ord+1, H)*W+mod(abs,W);
		p = p+1;
	end

    % add abs - 1
	if(r(1,3) == 1)
		sommetX(p) = sommet(i)-1;
		sommetY(p) = mod(ord, H)*W+mod(abs-1, W);
		p = p+1;
	end		

    % add ord - 1 
	if(r(1,4) == 1)
		sommetX(p) = sommet(i)-1;
		sommetY(p) = mod(ord-1, H)*W+mod(abs,W);
		p = p+1;
	end
end

sommetX = sommetX+1;
sommetY = sommetY+1;

%clc
%%% disp([sommetX; sommetY]);
end

