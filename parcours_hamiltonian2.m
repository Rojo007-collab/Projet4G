function res = parcours_hamiltonian2(in)
    [W H] = size(in);
    
    % disp('value of n');
    % disp(n);
    [hamiltonian2XX, hamiltonian2YY] = index_hamiltonian2(W, H);
    
    % PERMUTE OR NOT , HAVE A LOOK ON FILTERING FOR PERMUTE
    temp = hamiltonian2XX;
    hamiltonian2XX = hamiltonian2YY;
    hamiltonian2YY = temp;

%%%    disp('hamiltonian2 NON filtered');
%%%    disp( [hamiltonian2XX; hamiltonian2YY]);
    
    hamiltonian2X = ones(1, W*H);
    hamiltonian2Y = ones(1, W*H);

    % filtering verify W and H with plot
    p = 1;
    for i = 1:length(hamiltonian2XX)
        if (hamiltonian2XX(i)>=1)&&(hamiltonian2XX(i) <=H)&& (hamiltonian2YY(i)>=1)&&(hamiltonian2YY(i) <=W)
            hamiltonian2X(p) = hamiltonian2XX(i);
            hamiltonian2Y(p) = hamiltonian2YY(i);
            p = p+1;

        end
    end
    % disp('number of p');
    %  disp(p);
%%%     disp('hamiltonian2 filtered');
%%%     disp( [hamiltonian2X; hamiltonian2Y]);
%%%     plot(hamiltonian2X, hamiltonian2Y);
    
    i_permute = 1;
    j_permute = 1;
  
    for i = 1:length(hamiltonian2X)
  %          permuteIndexX = mod(hamiltonian2Index(i)-1, W);  % no minus 1 for this
  %          permuteIndexY = floor((hamiltonian2Index(i)-1)/W); % no minus 1 for this
  %          disp('value');
  %          disp(hamiltonian2Index(i));
  %          disp([permuteIndexX+1 permuteIndexY+1])
  %          disp('here');
  %          disp([i_permute j_permute])
            res(i_permute, j_permute) = in(hamiltonian2Y(i),hamiltonian2X(i));
            % disp(in(permuteIndexX+1,permuteIndexY+1)); 
           
           j_permute = j_permute+1;
           if(j_permute == H+1)
                j_permute = 1;
                i_permute = i_permute+1;
           end
    end
end


%code by sitraka 18/03/2024
function [x, y] = index_hamiltonian2(H, W)
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
            % selected hamiltonian path by random number between min and
            % max
            r = floor((max-min).*rand(1,1) + min);
            listpath(min) = selectedpath(r);
%%%            disp('random r');
%%%            disp(r);
            for k= r-1:-1:min
                selectedpath(k+1) = selectedpath(k);
            end
            min = min+1;            
            
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


