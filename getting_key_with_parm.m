function  next_hash = getting_key_with_parm(mode, choice, last_hash, length_bit)
		next_hash = '0';
        if mode == 0
    		% disp('normal mode');
            switch choice
                case 1
                    [booleanValue, lengthsquare] = toboolean_pad(last_hash);
                    res = parcours_mst(reshape(booleanValue, lengthsquare,lengthsquare));
                    hexValue = tohex(res(:));
                    next_hash = Shake256(hexValue, length_bit/4); 
				
                case 2  
				    [booleanValue, lengthsquare] = toboolean_pad(last_hash);
                    res = parcours_mst_misorder(reshape(booleanValue, lengthsquare,lengthsquare));
                    hexValue = tohex(res(:));
                    next_hash = Shake256(hexValue, length_bit/4); 

                case 3
                    [booleanValue, lengthsquare] = toboolean_pad(last_hash);
                    res = parcours_spt(reshape(booleanValue, lengthsquare,lengthsquare));
                    hexValue = tohex(res(:));
                    next_hash = Shake256(hexValue, length_bit/4); 				
                
                case 4 
                    [booleanValue, lengthsquare] = toboolean_pad(last_hash);
                    res = parcours_spt_misorder(reshape(booleanValue, lengthsquare,lengthsquare));
                    hexValue = tohex(res(:));
                    next_hash = Shake256(hexValue, length_bit/4); 

                 case 5 
                    [booleanValue, lengthsquare] = toboolean_pad(last_hash);
                    res =parcours_simplify(reshape(booleanValue, lengthsquare,lengthsquare));
                    hexValue = tohex(res(:));
                    next_hash = Shake256(hexValue, length_bit/4); 

                case 6 
                    [booleanValue, lengthsquare] = toboolean_pad(last_hash);
                    res = parcours_simplify_misorder(reshape(booleanValue, lengthsquare,lengthsquare));
                    hexValue = tohex(res(:));
                    next_hash = Shake256(hexValue, length_bit/4); 

                case 7 
                    [booleanValue, lengthsquare] = toboolean_pad(last_hash);
                    res = parcours_bfs(reshape(booleanValue, lengthsquare,lengthsquare));
                    hexValue = tohex(res(:));
                    next_hash = Shake256(hexValue, length_bit/4); 


                case 8 
                    [booleanValue, lengthsquare] = toboolean_pad(last_hash);
                    res = parcours_bfs_misorder(reshape(booleanValue, lengthsquare,lengthsquare));
                    hexValue = tohex(res(:));
                    next_hash = Shake256(hexValue, length_bit/4); 

                 case 9 
                    [booleanValue, lengthsquare] = toboolean_pad(last_hash);
                    res = parcours_dfs(reshape(booleanValue, lengthsquare,lengthsquare));
                    hexValue = tohex(res(:));
                    next_hash = Shake256(hexValue, length_bit/4); 

                case 10
                    [booleanValue, lengthsquare] = toboolean_pad(last_hash);
                    res = parcours_dfs_misorder(reshape(booleanValue, lengthsquare,lengthsquare));
                    hexValue = tohex(res(:));
                    next_hash = Shake256(hexValue, length_bit/4); 

                case 11
                    [booleanValue, lengthsquare] = toboolean_pad(last_hash);
                    res = parcours_tritop(reshape(booleanValue, lengthsquare,lengthsquare), 0.3);
                    hexValue = tohex(res(:));
                    next_hash = Shake256(hexValue, length_bit/4); 

				

                case 12
                    [booleanValue, lengthsquare] = toboolean_pad(last_hash);
                    res = parcours_tritop_misorder(reshape(booleanValue, lengthsquare,lengthsquare), 0.3);
                    hexValue = tohex(res(:));
                    next_hash = Shake256(hexValue, length_bit/4); 


               case 13
                    [booleanValue, lengthsquare] = toboolean_pad(last_hash);
                    res = parcours_hamiltonian2(reshape(booleanValue, lengthsquare,lengthsquare));
                    hexValue = tohex(res(:));
                    next_hash = Shake256(hexValue, length_bit/4); 

                case 14
                    [booleanValue, lengthsquare] = toboolean_pad(last_hash);
                    res = parcours_hamiltonian2_misorder(reshape(booleanValue, lengthsquare,lengthsquare));
                    hexValue = tohex(res(:));
                    next_hash = Shake256(hexValue, length_bit/4); 

                case 15 
                    [booleanValue, lengthsquare] = toboolean_pad(last_hash);
                    res = parcours_hamiltonian1(reshape(booleanValue, lengthsquare,lengthsquare));
                    hexValue = tohex(res(:));
                    next_hash = Shake256(hexValue, length_bit/4); 

                case 16 
                    [booleanValue, lengthsquare] = toboolean_pad(last_hash);
                    res = parcours_hamiltonian1_misorder(reshape(booleanValue, lengthsquare,lengthsquare));
                    hexValue = tohex(res(:));
                    next_hash = Shake256(hexValue, length_bit/4); 

                case 17 
                    [booleanValue, lengthsquare] = toboolean_pad(last_hash);
                    res = parcours_Eulerien(reshape(booleanValue, lengthsquare,lengthsquare));
                    hexValue = tohex(res(:));
                    next_hash = Shake256(hexValue, length_bit/4); 


                case 18 
                    [booleanValue, lengthsquare] = toboolean_pad(last_hash);
                    res = parcours_Eulerien_misorder(reshape(booleanValue, lengthsquare,lengthsquare));
                    hexValue = tohex(res(:));
                    next_hash = Shake256(hexValue, length_bit/4); 

                case 19 
                    [booleanValue, lengthsquare] = toboolean_pad(last_hash);
                    res = parcours_tarjan_rand(reshape(booleanValue, lengthsquare,lengthsquare));
                    hexValue = tohex(res(:));
                    next_hash = Shake256(hexValue, length_bit/4); 


                case 20 
                    [booleanValue, lengthsquare] = toboolean_pad(last_hash);
                    res = parcours_tarjan_rand_misorder(reshape(booleanValue, lengthsquare,lengthsquare));
                    hexValue = tohex(res(:));
                    next_hash = Shake256(hexValue, length_bit/4); 

            end
		end	



        if mode == 1
    		% disp('normal mode');
            switch choice
                case 1
                    [booleanValue, lengthsquare] = toboolean_pad(last_hash);
                    res = parcours_mst_inv(reshape(booleanValue, lengthsquare,lengthsquare));
                    hexValue = tohex(res(:));
                    next_hash = Shake256(hexValue, length_bit/4); 
				
                case 2  
				    [booleanValue, lengthsquare] = toboolean_pad(last_hash);
                    res = parcours_mst_misorder_inv(reshape(booleanValue, lengthsquare,lengthsquare));
                    hexValue = tohex(res(:));
                    next_hash = Shake256(hexValue, length_bit/4); 

                case 3
                    [booleanValue, lengthsquare] = toboolean_pad(last_hash);
                    res = parcours_spt_inv(reshape(booleanValue, lengthsquare,lengthsquare));
                    hexValue = tohex(res(:));
                    next_hash = Shake256(hexValue, length_bit/4); 				
                
                case 4 
                    [booleanValue, lengthsquare] = toboolean_pad(last_hash);
                    res = parcours_spt_misorder_inv(reshape(booleanValue, lengthsquare,lengthsquare));
                    hexValue = tohex(res(:));
                    next_hash = Shake256(hexValue, length_bit/4); 

                 case 5 
                    [booleanValue, lengthsquare] = toboolean_pad(last_hash);
                    res =parcours_simplify_inv(reshape(booleanValue, lengthsquare,lengthsquare));
                    hexValue = tohex(res(:));
                    next_hash = Shake256(hexValue, length_bit/4); 

                case 6 
                    [booleanValue, lengthsquare] = toboolean_pad(last_hash);
                    res = parcours_simplify_misorder_inv(reshape(booleanValue, lengthsquare,lengthsquare));
                    hexValue = tohex(res(:));
                    next_hash = Shake256(hexValue, length_bit/4); 

                case 7 
                    [booleanValue, lengthsquare] = toboolean_pad(last_hash);
                    res = parcours_bfs_inv(reshape(booleanValue, lengthsquare,lengthsquare));
                    hexValue = tohex(res(:));
                    next_hash = Shake256(hexValue, length_bit/4); 


                case 8 
                    [booleanValue, lengthsquare] = toboolean_pad(last_hash);
                    res = parcours_bfs_misorder_inv(reshape(booleanValue, lengthsquare,lengthsquare));
                    hexValue = tohex(res(:));
                    next_hash = Shake256(hexValue, length_bit/4); 

                 case 9 
                    [booleanValue, lengthsquare] = toboolean_pad(last_hash);
                    res = parcours_dfs_inv(reshape(booleanValue, lengthsquare,lengthsquare));
                    hexValue = tohex(res(:));
                    next_hash = Shake256(hexValue, length_bit/4); 

                case 10
                    [booleanValue, lengthsquare] = toboolean_pad(last_hash);
                    res = parcours_dfs_misorder_inv(reshape(booleanValue, lengthsquare,lengthsquare));
                    hexValue = tohex(res(:));
                    next_hash = Shake256(hexValue, length_bit/4); 

                case 11
                    [booleanValue, lengthsquare] = toboolean_pad(last_hash);
                    res = parcours_tritop_inv(reshape(booleanValue, lengthsquare,lengthsquare), 0.3);
                    hexValue = tohex(res(:));
                    next_hash = Shake256(hexValue, length_bit/4); 

				

                case 12
                    [booleanValue, lengthsquare] = toboolean_pad(last_hash);
                    res = parcours_tritop_misorder_inv(reshape(booleanValue, lengthsquare,lengthsquare), 0.3);
                    hexValue = tohex(res(:));
                    next_hash = Shake256(hexValue, length_bit/4); 


               case 13
                    [booleanValue, lengthsquare] = toboolean_pad(last_hash);
                    res = parcours_hamiltonian2_inv(reshape(booleanValue, lengthsquare,lengthsquare));
                    hexValue = tohex(res(:));
                    next_hash = Shake256(hexValue, length_bit/4); 

                case 14
                    [booleanValue, lengthsquare] = toboolean_pad(last_hash);
                    res = parcours_hamiltonian2_misorder_inv(reshape(booleanValue, lengthsquare,lengthsquare));
                    hexValue = tohex(res(:));
                    next_hash = Shake256(hexValue, length_bit/4); 

                case 15 
                    [booleanValue, lengthsquare] = toboolean_pad(last_hash);
                    res = parcours_hamiltonian1_inv(reshape(booleanValue, lengthsquare,lengthsquare));
                    hexValue = tohex(res(:));
                    next_hash = Shake256(hexValue, length_bit/4); 

                case 16 
                    [booleanValue, lengthsquare] = toboolean_pad(last_hash);
                    res = parcours_hamiltonian1_misorder_inv(reshape(booleanValue, lengthsquare,lengthsquare));
                    hexValue = tohex(res(:));
                    next_hash = Shake256(hexValue, length_bit/4); 

                case 17 
                    [booleanValue, lengthsquare] = toboolean_pad(last_hash);
                    res = parcours_Eulerien_inv(reshape(booleanValue, lengthsquare,lengthsquare));
                    hexValue = tohex(res(:));
                    next_hash = Shake256(hexValue, length_bit/4); 


                case 18 
                    [booleanValue, lengthsquare] = toboolean_pad(last_hash);
                    res = parcours_Eulerien_misorder_inv(reshape(booleanValue, lengthsquare,lengthsquare));
                    hexValue = tohex(res(:));
                    next_hash = Shake256(hexValue, length_bit/4); 

                case 19 
                    [booleanValue, lengthsquare] = toboolean_pad(last_hash);
                    res = parcours_tarjan_rand_inv(reshape(booleanValue, lengthsquare,lengthsquare));
                    hexValue = tohex(res(:));
                    next_hash = Shake256(hexValue, length_bit/4); 


                case 20 
                    [booleanValue, lengthsquare] = toboolean_pad(last_hash);
                    res = parcours_tarjan_rand_misorder_inv(reshape(booleanValue, lengthsquare,lengthsquare));
                    hexValue = tohex(res(:));
                    next_hash = Shake256(hexValue, length_bit/4); 

            end
		end

    
    
end

