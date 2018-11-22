function Offspring = edge_crossover(Parents,XOVR)
%function to calculate offsprings usings edge crossover on parents
%page 72 and 73 in A.E. Eibens "Introduction to Evolutionary Computing"
Offspring = zeros(size(Parents,1)/2,size(Parents,2));
for j = 1:size(Offspring,1)
    couple = Parents(j:j+1,:);
    if rand < XOVR
        edge_table = construct_edge_table(couple);
        numbers_to_select_from = 1:length(couple(1,:));
        next = randperm(size(couple,2),1);
        numbers_to_select_from(next) = 0;
        Offspring_tmp = [next];
        while sum(numbers_to_select_from~=0)>0
            [next, edge_table,numbers_to_select_from]=make_selection_in_edge_table(next, edge_table,numbers_to_select_from);
            Offspring_tmp = [Offspring_tmp next];
        end 
    Offspring(j,:) = Offspring_tmp;
else
    Offspring(j,:) = Parents(randperm(2,1),:);
    end
end
end