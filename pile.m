%code by sitraka 29/12/2017
%implementation d'une simple pile(pile non circulaire)
%Les paramètres d'entrée sont des nombres entiers initialisé dans un
%tableau possedant des valeurs zeros par defauts

classdef pile
   properties 
       fin = 1;
       taille_pile;
       value;
       tab;
   end
   
   methods 
       function obj = pile(taille)
           obj.taille_pile = taille+1;
           obj.tab = uint16(zeros(1,taille));
       end
       
       function obj = empiler(obj, number)
           if(obj.fin ~= obj.taille_pile)
                obj.tab(obj.fin) = number;
                obj.fin = mod(obj.fin,obj.taille_pile)+1;
           else
               disp('Erreur pile est pleine');
           end
       end
       
       function res = get_valeur(obj)
           res = obj.value;
       end
       
       function obj = depiler(obj)
           if(obj.fin ~= 1)
               obj.value = obj.tab(obj.fin-1);
               obj.fin = mod(obj.fin-2, obj.taille_pile)+1;
           else
               disp('Erreur pile vide');
           end
       end
       function res = est_vide(obj)
           res = obj.fin == 1;
       end
       function afficher(obj)
           disp('affichage pile');
          for i=1:obj.fin-1
              disp(obj.tab(i));
          end
       end
   end
    
end
