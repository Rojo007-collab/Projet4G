function getting_key()
    nb_key = input('Please enter the number of key to generated \n');
    length_key = 0;
    while((length_key~=256)&&(length_key~=512)&&(length_key~=1024)&&(length_key~=2048)&&(length_key~=4096))
        length_key = input('Please enter the key 256 or 512 or 1024 or 2048 or 4096 : \n');
    end
    
    finished = false;
while ~finished
	mode = input('Enter the mode : \n 0  : for normal mode \n 1 : for inverse mode\n');
	choice = input('Enter the choice : \n1  : MST_Path         2  : MST_Path Misorder     3  : SPT_Path         4  : SPT_Path Misorder         \n5  : Simplify_Path        6  : Simplify_Path Misorder         7  : BFS_Path        8  : BFS_Path Misorder   \n9  : DFS_Path   10 : DFS_Path Misorder   11 : TriTOPOLOGIC_Path       12 : TriTOPOLOGIC_Path Misorder       \n13 : HamiltonianBegin_Path   14 : HamiltonianBegin_Path Misorder   15 : HamiltonianLast_Path   16 : HamiltonianLast_Path Misorder   \n17 : Eulerien_Path   18 : Eulerien_Path Misorder   19 : SCC Tarjan_Path   20 : SCC Tarjan_Path Misorder   \n');

    %arahana le fonction mba tsy anao affichage ????, mieux ,utiliser
    %file open and close  https://www.developpez.net/forums/d1620631/environnements-developpement/matlab/ajouter-lignes-fichier-texte/
    
    last_hash = Shake256('hello world', length_key/4);
  %  disp(next_hash);
    
    for i = 1 : nb_key
        next_hash = getting_key_with_parm(mode, choice, last_hash, length_key);
        disp(next_hash);
        last_hash = next_hash;
    end
        
end

end