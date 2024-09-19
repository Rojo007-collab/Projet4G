function res = parcours_spt(in)
    [W H] = size(in);
    
    % disp('value of n');
    % disp(n);
    [sptXX, sptYY] = index_spt(W, H);
    
    % PERMUTE OR NOT , HAVE A LOOK ON FILTERING FOR PERMUTE
    temp = sptXX;
    sptXX = sptYY;
    sptYY = temp;

 %%%   disp('spt NON filtered');
 %%%   disp( [sptXX; sptYY]);
    
    sptX = ones(1, W*H);
    sptY = ones(1, W*H);

    % filtering verify W and H with plot
    p = 1;
    for i = 1:length(sptXX)
        if (sptXX(i)>=1)&&(sptXX(i) <=H)&& (sptYY(i)>=1)&&(sptYY(i) <=W)
            sptX(p) = sptXX(i);
            sptY(p) = sptYY(i);
            p = p+1;

        end
    end
    % disp('number of p');
    %  disp(p);
%%%     disp('spt filtered');
%%%     disp( [sptX; sptY]);
%%%     plot(sptX, sptY);
    
    i_permute = 1;
    j_permute = 1;
  
    for i = 1:length(sptX)
  %          permuteIndexX = mod(sptIndex(i)-1, W);  % no minus 1 for this
  %          permuteIndexY = floor((sptIndex(i)-1)/W); % no minus 1 for this
  %          disp('value');
  %          disp(sptIndex(i));
  %          disp([permuteIndexX+1 permuteIndexY+1])
  %          disp('here');
  %          disp([i_permute j_permute])
            res(i_permute, j_permute) = in(sptY(i),sptX(i));
            % disp(in(permuteIndexX+1,permuteIndexY+1)); 
           
           j_permute = j_permute+1;
           if(j_permute == H+1)
                j_permute = 1;
                i_permute = i_permute+1;
           end
    end
end

function [x,y] = index_spt(W, H)
    [sommetX, sommetY] = generated_graph(W, H);
    names = cellstr(string(1:W*H));
    G = graph(sommetX,sommetY,[], names);

    % do spt
    T = shortestpathtree(G,'all',1); %begin by 1
    % T_toextract = str2num(T.Edges{:,:});
    % str2nu+m, get all data with repeat
    %disp(T);
    %% disp(T.Edges);
    T_mat=table2array(T.Edges);
    [size1, size2] = size(T_mat);
    
    %%TT = str2num(T_mat);
    %% disp('size1');
    %% disp(size1);

    %% disp('size2');
    %% disp(size2);
    
    %%str2num
    last_i = -1;
    index = [];
    
    selected_index = (-1)*ones(1, W*H);
    %% disp(selected_index);
    %% disp('selected_index 1');
    %% disp(selected_index(1,1));
    I = (-1)*ones(1, W*H);
    p = 1;
    for i = size1:-1:1
        for j = size2:-1:1
           %  disp('ito le index mipetaka');
           myindex = T_mat{i,j};
           %% disp(str2num(myindex));
           if(selected_index(str2num(myindex)) == -1)
           
                % insert
                I(p) = str2num(T_mat{i,j});
                % mark it as 1
                selected_index(str2num(T_mat{i,j})) = 1;
                p = p+1;
           end
           %% disp(T_mat{i,j});
       end
    end
    
    %% disp(I)
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


function [sommetX, sommetY] = generated_graph(W, H)

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

sommetX = zeros(1, 4*length(sommet));
sommetY = zeros(1, 4*length(sommet));
p = 1;
for i = 1:length(sommet)
    abs= mod(sommet(i)-1, W);
    ord = floor((sommet(i)-1)/W);
    %%%% disp([(sommet(i)-1) abs, ord]);

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

%clc
%%%disp([sommetX; sommetY]);
end