function res = parcours_Eulerien(in)
    [W H] = size(in);
    
    % disp('value of n');
    % disp(n);
    [EulerienXX, EulerienYY] = index_Eulerien(W, H);
    
    % PERMUTE OR NOT , HAVE A LOOK ON FILTERING FOR PERMUTE
    temp = EulerienXX;
    EulerienXX = EulerienYY;
    EulerienYY = temp;

%%%    disp('Eulerien NON filtered');
%%%    disp( [EulerienXX; EulerienYY]);
    
    EulerienX = ones(1, W*H);
    EulerienY = ones(1, W*H);

    % filtering verify W and H with plot
    p = 1;
    for i = 1:length(EulerienXX)
        if (EulerienXX(i)>=1)&&(EulerienXX(i) <=H)&& (EulerienYY(i)>=1)&&(EulerienYY(i) <=W)
            EulerienX(p) = EulerienXX(i);
            EulerienY(p) = EulerienYY(i);
            p = p+1;

        end
    end
    % disp('number of p');
    %  disp(p);
%%%     disp('Eulerien filtered');
%%%     disp( [EulerienX; EulerienY]);
%%%     plot(EulerienX, EulerienY);
    
    i_permute = 1;
    j_permute = 1;
  
    for i = 1:length(EulerienX)
  %          permuteIndexX = mod(EulerienIndex(i)-1, W);  % no minus 1 for this
  %          permuteIndexY = floor((EulerienIndex(i)-1)/W); % no minus 1 for this
  %          disp('value');
  %          disp(EulerienIndex(i));
  %          disp([permuteIndexX+1 permuteIndexY+1])
  %          disp('here');
  %          disp([i_permute j_permute])
            res(i_permute, j_permute) = in(EulerienY(i),EulerienX(i));
            % disp(in(permuteIndexX+1,permuteIndexY+1)); 
           
           j_permute = j_permute+1;
           if(j_permute == H+1)
                j_permute = 1;
                i_permute = i_permute+1;
           end
    end
end

% copy by : parcoursEulerien1 in parcoursEulerienPile
function [x,y] = index_Eulerien(W, H)
    M = W;
    N = H;
    % [M, N, K]= size(g);
    parc_g = logical(zeros(M,N));
    %initialisation des resultats 
	% res will be all index
    res = uint16(zeros(M*N,2));
    
    %disp(parc_g);
    px = pile(M*N);
    py = pile(M*N);
    px = px.empiler(1);
    py = py.empiler(1);
    
    p = 1;
    while ~px.est_vide()
        px = px.depiler();
        x = px.get_valeur();
        py = py.depiler();
        y = py.get_valeur();
        res(p,1) = x;
        res(p,2) = y;
       % disp('x');
       % disp(x);
       % disp('y');
       % disp(y);
        parc_g(x,y) = true;
        p = p+1;
        %tester les cas suivants s'ils ne debordent pas et si false empiler
        % tester (x-1,y-1) puis (x-1,y) puis (x-1,y+1)
        % tester (x,y-1) puis (x,y+1)
        % tester (x+1,y-1) puis (x+1,y) puis (x+1,y+1)
        if((x-1>=1)&&(x-1<=M)&&(y-1>=1)&&(y-1<=N)) % test (x-1,y-1)
            %traitement mais verifier d'abord si non parcourus
            if(parc_g(x-1,y-1) == false)
                    px = px.empiler(x-1);
                    py = py.empiler(y-1);
                    parc_g(x-1,y-1) = true;
            end
        end
        
        if ((x-1>=1)&&(x-1<=M)&&(y>=1)&&(y<=N)) %test (x-1,y)
            %traitement mais verifier d'abord si non parcourus
            if(parc_g(x-1,y) == false)
                    px = px.empiler(x-1);
                    py = py.empiler(y); 
                    parc_g(x-1,y) = true;
            end   
        end
        
        if ((x-1>=1)&&(x-1<=M)&&(y+1>=1)&&(y+1<=N)) % test (x-1,y+1)
            %traitement mais verifier d'abord si non parcourus
            if(parc_g(x-1,y+1) == false)
                    px = px.empiler(x-1);
                    py = py.empiler(y+1);  
                    parc_g(x-1,y+1) = true;
            end 
        end
        
        if ((x>=1)&&(x<=M)&&(y-1>=1)&&(y-1<=N)) %test (x,y-1)
            %traitement mais verifier d'abord si non parcourus
            if(parc_g(x,y-1) == false)
                    px = px.empiler(x);
                    py = py.empiler(y-1);   
                    parc_g(x,y-1) = true;
            end            
        end
        
        if ((x>=1)&&(x<=M)&&(y+1>=1)&&(y+1<=N)) %test (x,y+1)
            %traitement mais verifier d'abord si non parcourus
            if(parc_g(x,y+1) == false)
                    px = px.empiler(x);
                    py = py.empiler(y+1);    
                    parc_g(x,y+1) = true;
            end            
        end
        
        if ((x+1>=1)&&(x+1<=M)&&(y-1>=1)&&(y-1<=N)) %test (x+1,y-1)
            %traitement mais verifier d'abord si non parcourus
            if(parc_g(x+1,y-1) == false)
                    px = px.empiler(x+1);
                    py = py.empiler(y-1);  
                    parc_g(x+1,y-1) = true;
            end            
        end
        
        if ((x+1>=1)&&(x+1<=M)&&(y>=1)&&(y<=N)) %test (x+1,y)
            %traitement mais verifier d'abord si non parcourus
            if(parc_g(x+1,y) == false)
                    px = px.empiler(x+1);
                    py = py.empiler(y);  
                    parc_g(x+1,y) = true;
            end
        end
        
        if((x+1>=1)&&(x+1<=M)&&(y+1>=1)&&(y+1<=N)) %test (x+1,y+1)
            %traitement mais verifier d'abord si non parcourus
            if(parc_g(x+1,y+1) == false)
                    px = px.empiler(x+1);
                    py = py.empiler(y+1);     
                    parc_g(x+1,y+1) = true;
            end            
        end
    %end for boucle while
    end
	
	
   % disp('resultat');
   % ADD BY ME
   x = res(:,1)';
   y = res(:,2)';
      
end
