function res = parcours_tritop_inv(in, percent)
    [W H] = size(in);
    
    % disp('value of n');
    % disp(n);
    [tritopXX, tritopYY] = index_tritop(W, H, percent);
    
    % PERMUTE OR NOT , HAVE A LOOK ON FILTERING FOR PERMUTE
    temp = tritopXX;
    tritopXX = tritopYY;
    tritopYY = temp;

%%%    disp('tritop NON filtered');
%%%    disp( [tritopXX; tritopYY]);
    
    tritopX = ones(1, W*H);
    tritopY = ones(1, W*H);

    % filtering verify W and H with plot
    p = 1;
    for i = 1:length(tritopXX)
        if (tritopXX(i)>=1)&&(tritopXX(i) <=H)&& (tritopYY(i)>=1)&&(tritopYY(i) <=W)
            tritopX(p) = tritopXX(i);
            tritopY(p) = tritopYY(i);
            p = p+1;

        end
    end
    % disp('number of p');
    %  disp(p);
%%%     disp('tritop filtered');
%%%     disp( [tritopX; tritopY]);
%%%     plot(tritopX, tritopY);
    
    i_permute = 1;
    j_permute = 1;
  
    for i = 1:length(tritopX)
  %          permuteIndexX = mod(tritopIndex(i)-1, W);  % no minus 1 for this
  %          permuteIndexY = floor((tritopIndex(i)-1)/W); % no minus 1 for this
  %          disp('value');
  %          disp(tritopIndex(i));
  %          disp([permuteIndexX+1 permuteIndexY+1])
  %          disp('here');
  %          disp([i_permute j_permute])
            res(tritopY(i), tritopX(i)) = in(i_permute, j_permute);
            % disp(in(permuteIndexX+1,permuteIndexY+1)); 
           
           j_permute = j_permute+1;
           if(j_permute == H+1)
                j_permute = 1;
                i_permute = i_permute+1;
           end
           

    end
    
   
end

function [x, y] = index_tritop(W, H, percent)
	%[H, W] = size(in);

	rng default;
	A = tril(sprand(H*W, H*W, percent), -1)~=0;
	G = digraph(A);
        [~,G] = toposort(G);
	I = toposort(G);
%%%	disp(I);
	

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