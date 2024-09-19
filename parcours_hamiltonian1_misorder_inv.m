function res = parcours_hamiltonian1_misorder_inv(in)
    [W H] = size(in);
    
    % disp('value of n');
    % disp(n);
    [hamiltonian1XX, hamiltonian1YY] = index_hamiltonian1(W, H);
    
    % PERMUTE OR NOT , HAVE A LOOK ON FILTERING FOR PERMUTE
    temp = hamiltonian1XX;
    hamiltonian1XX = hamiltonian1YY;
    hamiltonian1YY = temp;

%%%    disp('hamiltonian1 NON filtered');
%%%    disp( [hamiltonian1XX; hamiltonian1YY]);
    
    hamiltonian1X = ones(1, W*H);
    hamiltonian1Y = ones(1, W*H);

    % filtering verify W and H with plot
    p = 1;
    for i = 1:length(hamiltonian1XX)
        if (hamiltonian1XX(i)>=1)&&(hamiltonian1XX(i) <=H)&& (hamiltonian1YY(i)>=1)&&(hamiltonian1YY(i) <=W)
            hamiltonian1X(p) = hamiltonian1XX(i);
            hamiltonian1Y(p) = hamiltonian1YY(i);
            p = p+1;

        end
    end
    % disp('number of p');
    %  disp(p);
    % disp('hamiltonian1 filtered');
    % disp( [hamiltonian1X; hamiltonian1Y]);
    % plot(hamiltonian1X, hamiltonian1Y);
	
	% MISOREDRING ALGORITHM : 
	tempX = hamiltonian1X;
	tempY = hamiltonian1Y;
	p = 1;
	for i=1:W  % misorder this boucle
		for j = 1:H % misorder this boucle
			indexx = (j-1)*H+i;
			hamiltonian1X(indexx) = tempX(p);
			hamiltonian1Y(indexx) = tempY(p);
			p = p+1;
		end
    end
    %plot(hamiltonian1X, hamiltonian1Y);
    
    i_permute = 1;
    j_permute = 1;
  
    for i = 1:length(hamiltonian1X)
  %          permuteIndexX = mod(hamiltonian1Index(i)-1, W);  % no minus 1 for this
  %          permuteIndexY = floor((hamiltonian1Index(i)-1)/W); % no minus 1 for this
  %          disp('value');
  %          disp(hamiltonian1Index(i));
  %          disp([permuteIndexX+1 permuteIndexY+1])
  %          disp('here');
  %          disp([i_permute j_permute])
            res(hamiltonian1Y(i), hamiltonian1X(i)) = in(i_permute, j_permute);
            % disp(in(permuteIndexX+1,permuteIndexY+1)); 
           
           j_permute = j_permute+1;
           if(j_permute == H+1)
                j_permute = 1;
                i_permute = i_permute+1;
           end
    end
end


%code by sitraka 18/03/2024
function [x, y] = index_hamiltonian1(H, W)
   % a = [1 2 3 4;5 6 7 8; 9 10 11 12;13 14 15 16;17 18 19 20;21 22 23 24]
   % res = a;
   % b = [1 2 3 4 5 6;7 8 9 10 11 12;13 14 15 16 17 18;19 20 21 22 23 24]
   %  d = [1 2 3 4 5;6 7 8 9 10;11 12 13 14 15;16 17 18 19 20;21 22 23 24 25]
   % [H, W] = size(a);
   
%%%   disp(W);
%%%   disp(H);
   
   listpath = (-1)*ones(1,W*H);
   selectedpath = (-1)*ones(1,W*H);

   for i = 1:W*H
        selectedpath(i) = i; 
   end    
%%%   disp('selected path');   
%%%   disp(selectedpath);
   max = W*H;
   min = 1;
   for i = W:-1:1
       for j = H:-1:1
            % selected hamiltonian path by random number between min and
            % max
            r = floor((max-min).*rand(1,1) + min);
            listpath(max) = selectedpath(r);
%%%            disp('random r');
%%%            disp(r);
            max = max-1;            
            for k= r:1:max
                selectedpath(k) = selectedpath(k+1);
            end
            
%%%           disp('selected path');   
%%%           disp(selectedpath);

           
%%%           disp('list path');   
%%%           disp(listpath);
           
%           demand = input("continue or not");
           
       end
   end

   indexX = (-1)*ones(1, W*H);
   indexY = (-1)*ones(1, W*H);

   % for matlab , we need to inverse the coordinate
   for mvt = 1:W*H
       index = listpath(mvt);
       
       indexY(mvt) = mod(index-1,W);
       indexX(mvt) = floor((index-1)/W);
       
       % PermuteIndexY = mod(index-1, W);
       % PermuteIndexX = floor((index-1)/W);

       % disp('permute')
       % disp(indexX)
       % disp(indexY)
       
       
      % disp('with')
      % disp(PermuteIndexX)
      % disp(PermuteIndexY)
       
             
      % res(indexX+1, indexY+1) =   a(PermuteIndexX+1, PermuteIndexY+1);
       
      % disp(res);
      % demand = input("continue or not");
       
   end
   x = indexX+1;
   y = indexY+1;    
   
end


