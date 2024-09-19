function plotting_key
    mode = input('please enter the mode \n 0 for normal choice \n 1 for inverse mode \n 2 for opt mode\n');
    switch mode
        case 0
             disp('you select mode 0');
        
            length_key = 0;
            while((length_key~=256)&&(length_key~=512)&&(length_key~=1024)&&(length_key~=2048)&&(length_key~=4096))
                length_key = input('Please enter the key 256 or 512 or 1024 or 2048 or 4096 : \n');
            end
            
            % INITIALISATION PART 1 ;     
            last_hash = Shake256('hello world', length_key/4);
            number_fig = 1;
             
             figure
             % PLOTTING PART  1
             % parcours_mst
             [booleanValue, lengthsquare] = toboolean_pad(last_hash);
             res = parcours_mst(reshape(booleanValue, lengthsquare,lengthsquare));
             hexValue = tohex(res(:));
             next_hash = Shake256(hexValue, length_key/4); 
             binhash = toboolean(next_hash);
             subplot(3,2,number_fig);
             number_fig = number_fig+1;
             stairs(binhash);
             ylim([0 1.2]);
             xlim([0 length_key+1]);
             title('MST Path');

             % parcours_mst_misorder
             [booleanValue, lengthsquare] = toboolean_pad(last_hash);
             res = parcours_mst_misorder(reshape(booleanValue, lengthsquare,lengthsquare));
             hexValue = tohex(res(:));
             next_hash = Shake256(hexValue, length_key/4); 
             binhash = toboolean(next_hash);
             subplot(3,2,number_fig);
             number_fig = number_fig+1;
             stairs(binhash);
             ylim([0 1.2]);
             xlim([0 length_key+1]);
             title('MST Misorder Path');


             % parcours_spt
             [booleanValue, lengthsquare] = toboolean_pad(last_hash);
             res = parcours_spt(reshape(booleanValue, lengthsquare,lengthsquare));
             hexValue = tohex(res(:));
             next_hash = Shake256(hexValue, length_key/4); 
             binhash = toboolean(next_hash);
             subplot(3,2,number_fig);
             number_fig = number_fig+1;
             stairs(binhash);
             ylim([0 1.2]);
             xlim([0 length_key+1]);
             title('SPT Path');

             
             % parcours_spt misorder
             [booleanValue, lengthsquare] = toboolean_pad(last_hash);
             res = parcours_spt_misorder(reshape(booleanValue, lengthsquare,lengthsquare));
             hexValue = tohex(res(:));
             next_hash = Shake256(hexValue, length_key/4); 
             binhash = toboolean(next_hash);
             subplot(3,2,number_fig);
             number_fig = number_fig+1;
             stairs(binhash);
             ylim([0 1.2]);
             xlim([0 length_key+1]);
             title('SPT Misorder Path');
             
             % parcours_simplify
             [booleanValue, lengthsquare] = toboolean_pad(last_hash);
             res = parcours_simplify(reshape(booleanValue, lengthsquare,lengthsquare));
             hexValue = tohex(res(:));
             next_hash = Shake256(hexValue, length_key/4); 
             binhash = toboolean(next_hash);
             subplot(3,2,number_fig);
             number_fig = number_fig+1;
             stairs(binhash);
             ylim([0 1.2]);
             xlim([0 length_key+1]);
             title('Simplify Path');

             % parcours_simplify_misorder
             [booleanValue, lengthsquare] = toboolean_pad(last_hash);
             res = parcours_simplify_misorder(reshape(booleanValue, lengthsquare,lengthsquare));
             hexValue = tohex(res(:));
             next_hash = Shake256(hexValue, length_key/4); 
             binhash = toboolean(next_hash);
             subplot(3,2,number_fig);
             number_fig = number_fig+1;
             stairs(binhash);
             ylim([0 1.2]);
             xlim([0 length_key+1]);
             title('Simplify Misorder Path');

             
             %%%%% PART 2 initialisation
             number_fig = 1;
             figure
             
             % PART2
             
             % parcours_bfs
             [booleanValue, lengthsquare] = toboolean_pad(last_hash);
             res = parcours_bfs(reshape(booleanValue, lengthsquare,lengthsquare));
             hexValue = tohex(res(:));
             next_hash = Shake256(hexValue, length_key/4); 
             binhash = toboolean(next_hash);
             subplot(3,2,number_fig);
             number_fig = number_fig+1;
             stairs(binhash);
             ylim([0 1.2]);
             xlim([0 length_key+1]);
             title('BFS Path');
             

             % parcours_bfs_misorder
             [booleanValue, lengthsquare] = toboolean_pad(last_hash);
             res = parcours_bfs_misorder(reshape(booleanValue, lengthsquare,lengthsquare));
             hexValue = tohex(res(:));
             next_hash = Shake256(hexValue, length_key/4); 
             binhash = toboolean(next_hash);
             subplot(3,2,number_fig);
             number_fig = number_fig+1;
             stairs(binhash);
             ylim([0 1.2]);
             xlim([0 length_key+1]);
             title('BFS Misorder Path');

             % parcours_dfs
             [booleanValue, lengthsquare] = toboolean_pad(last_hash);
             res = parcours_dfs(reshape(booleanValue, lengthsquare,lengthsquare));
             hexValue = tohex(res(:));
             next_hash = Shake256(hexValue, length_key/4); 
             binhash = toboolean(next_hash);
             subplot(3,2,number_fig);
             number_fig = number_fig+1;
             stairs(binhash);
             ylim([0 1.2]);
             xlim([0 length_key+1]);
             title('DFS Path');

             % parcours_dfs_misorder
             [booleanValue, lengthsquare] = toboolean_pad(last_hash);
             res = parcours_dfs_misorder(reshape(booleanValue, lengthsquare,lengthsquare));
             hexValue = tohex(res(:));
             next_hash = Shake256(hexValue, length_key/4); 
             binhash = toboolean(next_hash);
             subplot(3,2,number_fig);
             number_fig = number_fig+1;
             stairs(binhash);
             ylim([0 1.2]);
             xlim([0 length_key+1]);
             title('DFS Misorder Path');

             
             % parcours tritop
             [booleanValue, lengthsquare] = toboolean_pad(last_hash);
             res = parcours_tritop(reshape(booleanValue, lengthsquare,lengthsquare), 0.3);
             hexValue = tohex(res(:));
             next_hash = Shake256(hexValue, length_key/4); 
             binhash = toboolean(next_hash);
             subplot(3,2,number_fig);
             number_fig = number_fig+1;
             stairs(binhash);
             ylim([0 1.2]);
             xlim([0 length_key+1]);
             title('TriTop Path');


             % parcours_tritop_misorder
             [booleanValue, lengthsquare] = toboolean_pad(last_hash);
             res = parcours_tritop_misorder(reshape(booleanValue, lengthsquare,lengthsquare), 0.3);
             hexValue = tohex(res(:));
             next_hash = Shake256(hexValue, length_key/4); 
             binhash = toboolean(next_hash);
             subplot(3,2,number_fig);
             number_fig = number_fig+1;
             stairs(binhash);
             ylim([0 1.2]);
             xlim([0 length_key+1]);
             title('TriTop Misorder Path');
             
             %%%%% PART 3 initialisation
             number_fig = 1;
             figure

             % PART 3

             % parcours_hamilthonian2
             [booleanValue, lengthsquare] = toboolean_pad(last_hash);
             res = parcours_hamiltonian2(reshape(booleanValue, lengthsquare,lengthsquare));
             hexValue = tohex(res(:));
             next_hash = Shake256(hexValue, length_key/4); 
             binhash = toboolean(next_hash);
             subplot(4,2,number_fig);
             number_fig = number_fig+1;
             stairs(binhash);
             ylim([0 1.2]);
             xlim([0 length_key+1]);
             title('Ham Begin Path');

             % parcours_hamilthonian2_misorder
             [booleanValue, lengthsquare] = toboolean_pad(last_hash);
             res = parcours_hamiltonian2_misorder(reshape(booleanValue, lengthsquare,lengthsquare));
             hexValue = tohex(res(:));
             next_hash = Shake256(hexValue, length_key/4); 
             binhash = toboolean(next_hash);
             subplot(4,2,number_fig);
             number_fig = number_fig+1;
             stairs(binhash);
             ylim([0 1.2]);
             xlim([0 length_key+1]);
             title('Ham Beging Misorder Path');

             %parcours_hamilthonian1
             [booleanValue, lengthsquare] = toboolean_pad(last_hash);
             res = parcours_hamiltonian1(reshape(booleanValue, lengthsquare,lengthsquare));
             hexValue = tohex(res(:));
             next_hash = Shake256(hexValue, length_key/4); 
             binhash = toboolean(next_hash);
             subplot(4,2,number_fig);
             number_fig = number_fig+1;
             stairs(binhash);
             ylim([0 1.2]);
             xlim([0 length_key+1]);
             title('Ham Last Path');
             

             %parcours_hamilthonian1_misorder
             [booleanValue, lengthsquare] = toboolean_pad(last_hash);
             res = parcours_hamiltonian1_misorder(reshape(booleanValue, lengthsquare,lengthsquare));
             hexValue = tohex(res(:));
             next_hash = Shake256(hexValue, length_key/4); 
             binhash = toboolean(next_hash);
             subplot(4,2,number_fig);
             number_fig = number_fig+1;
             stairs(binhash);
             ylim([0 1.2]);
             xlim([0 length_key+1]);
             title('Ham  Last Misorder Path');

             
             %parcours_Eulerien
             [booleanValue, lengthsquare] = toboolean_pad(last_hash);
             res = parcours_Eulerien(reshape(booleanValue, lengthsquare,lengthsquare));
             hexValue = tohex(res(:));
             next_hash = Shake256(hexValue, length_key/4); 
             binhash = toboolean(next_hash);
             subplot(4,2,number_fig);
             number_fig = number_fig+1;
             stairs(binhash);
             ylim([0 1.2]);
             xlim([0 length_key+1]);
             title('Eulerien Tensor Path');
             
             
             %parcours_Eulerien_misorder
             [booleanValue, lengthsquare] = toboolean_pad(last_hash);
             res = parcours_Eulerien_misorder(reshape(booleanValue, lengthsquare,lengthsquare));
             hexValue = tohex(res(:));
             next_hash = Shake256(hexValue, length_key/4); 
             binhash = toboolean(next_hash);
             subplot(4,2,number_fig);
             number_fig = number_fig+1;
             stairs(binhash);
             ylim([0 1.2]);
             xlim([0 length_key+1]);
             title('Eulerien Misorder Path');
             
             % parcours_parcours_tarjan_rand
             [booleanValue, lengthsquare] = toboolean_pad(last_hash);
             res =  parcours_tarjan_rand(reshape(booleanValue, lengthsquare,lengthsquare));
             hexValue = tohex(res(:));
             next_hash = Shake256(hexValue, length_key/4); 
             binhash = toboolean(next_hash);
             subplot(4,2,number_fig);
             number_fig = number_fig+1;
             stairs(binhash);
             ylim([0 1.2]);
             xlim([0 length_key+1]);
             title('SCC Tarjan Path');

             % parcours_parcours_tarjan_rand_misorder
             [booleanValue, lengthsquare] = toboolean_pad(last_hash);
             res =  parcours_tarjan_rand_misorder(reshape(booleanValue, lengthsquare,lengthsquare));
             hexValue = tohex(res(:));
             next_hash = Shake256(hexValue, length_key/4); 
             binhash = toboolean(next_hash);
             subplot(4,2,number_fig);
             number_fig = number_fig+1;
             stairs(binhash);
             ylim([0 1.2]);
             xlim([0 length_key+1]);
             title('SCC Tarjan Misorder Path');

        case 1
             disp('you select mode 1');
            
            
        case 2
             disp('you select mode 2');
            
            
    end


end