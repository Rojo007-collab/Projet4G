function plotting_matrix_reordering()

    length_key = 0;
    while((length_key~=256)&&(length_key~=512)&&(length_key~=1024)&&(length_key~=2048)&&(length_key~=4096))
        length_key = input('Please enter the key 256 or 512 or 1024 or 2048 or 4096 : ');
    end
    
    switch  length_key
        case 256
            W = 16;
            H = 16;
            
        case 512  
            W = 23;
            H = 23;
        case 1024
            W = 32;
            H = 32;
        case 2048 
            W = 46;
            H = 46;
        case 4096 
            W = 64;
            H = 64;
    end
    
% fill the matrix 1 2 3 ...
p = 1;
for i = 1:W
    for j = 1:H
        matrix(i,j) = p;
        p = p+1;
    end
end

finished = false;
while ~finished
	mode = input('Enter the mode : \n 0  : for normal mode \n 1 : for inverse mode\n');
	choice = input('Enter the choice : \n1  : MST_Path         2  : MST_Path Misorder     3  : SPT_Path         4  : SPT_Path Misorder         \n5  : Simplify_Path        6  : Simplify_Path Misorder         7  : BFS_Path        8  : BFS_Path Misorder   \n9  : DFS_Path   10 : DFS_Path Misorder   11 : TriTOPOLOGIC_Path       12 : TriTOPOLOGIC_Path Misorder       \n13 : HamiltonianBegin_Path   14 : HamiltonianBegin_Path Misorder   15 : HamiltonianLast_Path   16 : HamiltonianLast_Path Misorder   \n17 : Eulerien_Path   18 : Eulerien_Path Misorder   19 : SCC Tarjan_Path   20 : SCC Tarjan_Path Misorder   \n');
    if mode == 0
		disp('normal mode');
	    switch choice
        case 1
			disp(matrix);
			matrix_scrambled = parcours_bfs(matrix);
			disp('matrix after the BFS path');
			disp(matrix_scrambled);
			[HopPointNumber, LinearityLineNumber] = evaluate_linearity_patterns(matrix, matrix_scrambled)
            plotting_patterns(matrix_scrambled);
        case 2  
			disp(matrix);
			matrix_scrambled = parcours_bfs_misorder(matrix);
			disp('matrix after the BFS Misorder path');
			disp(matrix_scrambled);
			[HopPointNumber, LinearityLineNumber] = evaluate_linearity_patterns(matrix, matrix_scrambled)
            plotting_patterns(matrix_scrambled);
        case 3
			disp(matrix);
			matrix_scrambled = parcours_dfs(matrix);
			disp('matrix after the DFS path');
			disp(matrix_scrambled);
			[HopPointNumber, LinearityLineNumber] = evaluate_linearity_patterns(matrix, matrix_scrambled)
            plotting_patterns(matrix_scrambled);
		
        case 4 
			disp(matrix);
			matrix_scrambled = parcours_dfs_misorder(matrix);
			disp('matrix after the DFS Misorder path');
			disp(matrix_scrambled);
			[HopPointNumber, LinearityLineNumber] = evaluate_linearity_patterns(matrix, matrix_scrambled)
            plotting_patterns(matrix_scrambled);
        case 5 
			disp(matrix);
			matrix_scrambled = parcours_hamiltonian2(matrix);
			disp('matrix after the HamilthonianBegin path');
			disp(matrix_scrambled);
			[HopPointNumber, LinearityLineNumber] = evaluate_linearity_patterns(matrix, matrix_scrambled)
            plotting_patterns(matrix_scrambled);		
        case 6 
			disp(matrix);
			matrix_scrambled = parcours_hamiltonian2_misorder(matrix);
			disp('matrix after the HamilthonianBegin Misorder path');
			disp(matrix_scrambled);
			[HopPointNumber, LinearityLineNumber] = evaluate_linearity_patterns(matrix, matrix_scrambled)
            plotting_patterns(matrix_scrambled);

        case 7 
		    disp(matrix);
			matrix_scrambled = parcours_hamiltonian1(matrix);
			disp('matrix after the HamilthonianLast path');
			disp(matrix_scrambled);
			[HopPointNumber, LinearityLineNumber] = evaluate_linearity_patterns(matrix, matrix_scrambled)
            plotting_patterns(matrix_scrambled);		

        case 8 
		    disp(matrix);
			matrix_scrambled = parcours_hamiltonian1_misorder(matrix);
			disp('matrix after the HamilthonianLast Misorder path');
			disp(matrix_scrambled);
			[HopPointNumber, LinearityLineNumber] = evaluate_linearity_patterns(matrix, matrix_scrambled)
            plotting_patterns(matrix_scrambled);		

        case 9 
			disp(matrix);
			matrix_scrambled = parcours_Eulerien(matrix);
			disp('matrix after the Eulerien path');
			disp(matrix_scrambled);
			[HopPointNumber, LinearityLineNumber] = evaluate_linearity_patterns(matrix, matrix_scrambled)
            plotting_patterns(matrix_scrambled);            
        case 10
			disp(matrix);
			matrix_scrambled = parcours_Eulerien_misorder(matrix);
			disp('matrix after the Eulerien Misorder path');
			disp(matrix_scrambled);
			[HopPointNumber, LinearityLineNumber] = evaluate_linearity_patterns(matrix, matrix_scrambled)
            plotting_patterns(matrix_scrambled);            		
        case 11
			disp(matrix);
			matrix_scrambled = parcours_tarjan_rand(matrix);
			disp('matrix after the SCC Tarjan path');
			disp(matrix_scrambled);
			[HopPointNumber, LinearityLineNumber] = evaluate_linearity_patterns(matrix, matrix_scrambled)
            plotting_patterns(matrix_scrambled);            
		    
        case 12
			disp(matrix);
			matrix_scrambled = parcours_tarjan_rand_misorder(matrix);
			disp('matrix after the SCC Tarjan Misorder path');
			disp(matrix_scrambled);
			[HopPointNumber, LinearityLineNumber] = evaluate_linearity_patterns(matrix, matrix_scrambled)
            plotting_patterns(matrix_scrambled);            
		
        case 13
			disp(matrix);
			matrix_scrambled = parcours_tritop(matrix, 0.3);
			disp('matrix after Tri Topologic path');
			disp(matrix_scrambled);
			[HopPointNumber, LinearityLineNumber] = evaluate_linearity_patterns(matrix, matrix_scrambled)
            plotting_patterns(matrix_scrambled);            
		    
        case 14
			disp(matrix);
			matrix_scrambled = parcours_tritop_misorder(matrix, 0.3);
			disp('matrix after Tri Topologic Misorder path');
			disp(matrix_scrambled);
			[HopPointNumber, LinearityLineNumber] = evaluate_linearity_patterns(matrix, matrix_scrambled)
            plotting_patterns(matrix_scrambled);            
		 
        case 15 
			disp(matrix);
			matrix_scrambled = parcours_mst(matrix);
			disp('matrix after Minimum Spanning Tree path');
			disp(matrix_scrambled);
			[HopPointNumber, LinearityLineNumber] = evaluate_linearity_patterns(matrix, matrix_scrambled)
            plotting_patterns(matrix_scrambled);   	
        case 16 
			disp(matrix);
			matrix_scrambled = parcours_mst_misorder(matrix);
			disp('matrix after Minimum Spanning Tree Misorder path');
			disp(matrix_scrambled);
			[HopPointNumber, LinearityLineNumber] = evaluate_linearity_patterns(matrix, matrix_scrambled)
            plotting_patterns(matrix_scrambled);   	
		
        case 17 
		    disp(matrix);
			matrix_scrambled = parcours_spt(matrix);
			disp('matrix after Shortest Path Tree');
			disp(matrix_scrambled);
			[HopPointNumber, LinearityLineNumber] = evaluate_linearity_patterns(matrix, matrix_scrambled)
            plotting_patterns(matrix_scrambled);	
        case 18 
		    disp(matrix);
			matrix_scrambled = parcours_spt_misorder(matrix);
			disp('matrix after Shortest Path Tree Misorder');
			disp(matrix_scrambled);
			[HopPointNumber, LinearityLineNumber] = evaluate_linearity_patterns(matrix, matrix_scrambled)
            plotting_patterns(matrix_scrambled);	
        case 19 
			disp(matrix);
			matrix_scrambled = parcours_simplify(matrix);
			disp('matrix after Simplify path');
			disp(matrix_scrambled);
			[HopPointNumber, LinearityLineNumber] = evaluate_linearity_patterns(matrix, matrix_scrambled)
            plotting_patterns(matrix_scrambled); 
		case 20 
			disp(matrix);
			matrix_scrambled = parcours_simplify_misorder(matrix);
			disp('matrix after Simplify Misorder path');
			disp(matrix_scrambled);
			[HopPointNumber, LinearityLineNumber] = evaluate_linearity_patterns(matrix, matrix_scrambled)
            plotting_patterns(matrix_scrambled); 
		
		end
	end
	
	%% other if mode
    if mode == 1
		disp('inverse mode');
	    switch choice
        case 1
			disp(matrix);
			matrix_scrambled = parcours_bfs_inv(matrix);
			disp('matrix after the BFS Inv path');
			disp(matrix_scrambled);
			[HopPointNumber, LinearityLineNumber] = evaluate_linearity_patterns(matrix, matrix_scrambled)
            plotting_patterns(matrix_scrambled);
        case 2  
			disp(matrix);
			matrix_scrambled = parcours_bfs_misorder_inv(matrix);
			disp('matrix after the BFS Misorder Inv path');
			disp(matrix_scrambled);
			[HopPointNumber, LinearityLineNumber] = evaluate_linearity_patterns(matrix, matrix_scrambled)
            plotting_patterns(matrix_scrambled);
        case 3
			disp(matrix);
			matrix_scrambled = parcours_dfs_inv(matrix);
			disp('matrix after the DFS Inv path');
			disp(matrix_scrambled);
			[HopPointNumber, LinearityLineNumber] = evaluate_linearity_patterns(matrix, matrix_scrambled)
            plotting_patterns(matrix_scrambled);
		
        case 4 
			disp(matrix);
			matrix_scrambled = parcours_dfs_misorder_inv(matrix);
			disp('matrix after the DFS Misorder Inv path');
			disp(matrix_scrambled);
			[HopPointNumber, LinearityLineNumber] = evaluate_linearity_patterns(matrix, matrix_scrambled)
            plotting_patterns(matrix_scrambled);
        case 5 
			disp(matrix);
			matrix_scrambled = parcours_hamiltonian2_inv(matrix);
			disp('matrix after the HamilthonianBegin Inv path');
			disp(matrix_scrambled);
			[HopPointNumber, LinearityLineNumber] = evaluate_linearity_patterns(matrix, matrix_scrambled)
            plotting_patterns(matrix_scrambled);		
        case 6 
			disp(matrix);
			matrix_scrambled = parcours_hamiltonian2_misorder_inv(matrix);
			disp('matrix after the HamilthonianBegin Misorder Inv path');
			disp(matrix_scrambled);
			[HopPointNumber, LinearityLineNumber] = evaluate_linearity_patterns(matrix, matrix_scrambled)
            plotting_patterns(matrix_scrambled);

        case 7 
		    disp(matrix);
			matrix_scrambled = parcours_hamiltonian1_inv(matrix);
			disp('matrix after the HamilthonianLast Inv path');
			disp(matrix_scrambled);
			[HopPointNumber, LinearityLineNumber] = evaluate_linearity_patterns(matrix, matrix_scrambled)
            plotting_patterns(matrix_scrambled);		

        case 8 
		    disp(matrix);
			matrix_scrambled = parcours_hamiltonian1_misorder_inv(matrix);
			disp('matrix after the HamilthonianLast Misorder Inv path');
			disp(matrix_scrambled);
			[HopPointNumber, LinearityLineNumber] = evaluate_linearity_patterns(matrix, matrix_scrambled)
            plotting_patterns(matrix_scrambled);		

        case 9 
			disp(matrix);
			matrix_scrambled = parcours_Eulerien_inv(matrix);
			disp('matrix after the Eulerien path Inv');
			disp(matrix_scrambled);
			[HopPointNumber, LinearityLineNumber] = evaluate_linearity_patterns(matrix, matrix_scrambled)
            plotting_patterns(matrix_scrambled);            
        case 10
			disp(matrix);
			matrix_scrambled = parcours_Eulerien_misorder_inv(matrix);
			disp('matrix after the Eulerien Misorder Inv path');
			disp(matrix_scrambled);
			[HopPointNumber, LinearityLineNumber] = evaluate_linearity_patterns(matrix, matrix_scrambled)
            plotting_patterns(matrix_scrambled);            		
        case 11
			disp(matrix);
			matrix_scrambled = parcours_tarjan_rand_inv(matrix);
			disp('matrix after the SCC Tarjan Inv path');
			disp(matrix_scrambled);
			[HopPointNumber, LinearityLineNumber] = evaluate_linearity_patterns(matrix, matrix_scrambled)
            plotting_patterns(matrix_scrambled);            
		    
        case 12
			disp(matrix);
			matrix_scrambled = parcours_tarjan_rand_misorder_inv(matrix);
			disp('matrix after the SCC Tarjan Misorder Inv path');
			disp(matrix_scrambled);
			[HopPointNumber, LinearityLineNumber] = evaluate_linearity_patterns(matrix, matrix_scrambled)
            plotting_patterns(matrix_scrambled);            
		
        case 13
			disp(matrix);
			matrix_scrambled = parcours_tritop_inv(matrix, 0.3);
			disp('matrix after Tri Topologic Inv path');
			disp(matrix_scrambled);
			[HopPointNumber, LinearityLineNumber] = evaluate_linearity_patterns(matrix, matrix_scrambled)
            plotting_patterns(matrix_scrambled);            
		    
        case 14
			disp(matrix);
			matrix_scrambled = parcours_tritop_misorder_inv(matrix, 0.3);
			disp('matrix after Tri Topologic Misorder Inv path');
			disp(matrix_scrambled);
			[HopPointNumber, LinearityLineNumber] = evaluate_linearity_patterns(matrix, matrix_scrambled)
            plotting_patterns(matrix_scrambled);            
		 
        case 15 
			disp(matrix);
			matrix_scrambled = parcours_mst_inv(matrix);
			disp('matrix after Minimum Spanning Tree Inv path');
			disp(matrix_scrambled);
			[HopPointNumber, LinearityLineNumber] = evaluate_linearity_patterns(matrix, matrix_scrambled)
            plotting_patterns(matrix_scrambled);   	
        case 16 
			disp(matrix);
			matrix_scrambled = parcours_mst_misorder_inv(matrix);
			disp('matrix after Minimum Spanning Tree Misorder Inv path');
			disp(matrix_scrambled);
			[HopPointNumber, LinearityLineNumber] = evaluate_linearity_patterns(matrix, matrix_scrambled)
            plotting_patterns(matrix_scrambled);   	
		
        case 17 
		    disp(matrix);
			matrix_scrambled = parcours_spt_inv(matrix);
			disp('matrix after Shortest Path Tree Inv');
			disp(matrix_scrambled);
			[HopPointNumber, LinearityLineNumber] = evaluate_linearity_patterns(matrix, matrix_scrambled)
            plotting_patterns(matrix_scrambled);	
        case 18 
		    disp(matrix);
			matrix_scrambled = parcours_spt_misorder_inv(matrix);
			disp('matrix after Shortest Path Tree Misorder Inv');
			disp(matrix_scrambled);
			[HopPointNumber, LinearityLineNumber] = evaluate_linearity_patterns(matrix, matrix_scrambled)
            plotting_patterns(matrix_scrambled);	
        case 19 
			disp(matrix);
			matrix_scrambled = parcours_simplify_inv(matrix);
			disp('matrix after Simplify Inv path ');
			disp(matrix_scrambled);
			[HopPointNumber, LinearityLineNumber] = evaluate_linearity_patterns(matrix, matrix_scrambled)
            plotting_patterns(matrix_scrambled); 
		case 20 
			disp(matrix);
			matrix_scrambled = parcours_simplify_misorder_inv(matrix);
			disp('matrix after Simplify Misorder Inv path');
			disp(matrix_scrambled);
			[HopPointNumber, LinearityLineNumber] = evaluate_linearity_patterns(matrix, matrix_scrambled)
            plotting_patterns(matrix_scrambled); 
		
		end
	end
		
end

end


