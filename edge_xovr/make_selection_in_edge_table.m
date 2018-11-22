function [next,updated_edge_table,new_numbers_to_select_from] = make_selection_in_edge_table(initial,edge_table,numbers_to_select_from)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

updated_edge_table = (edge_table ~= initial).*edge_table;
possible_nexts = updated_edge_table(initial,:);
possible_nexts(possible_nexts == 0) = [];
length_next_in_edge_table =[];
counts = count_for_doubles(possible_nexts);
for j=1:length(possible_nexts)
    selected_row = updated_edge_table(possible_nexts(j),:);
    tmp_counts = count_for_doubles(selected_row);
    tmp_counts = tmp_counts(:,2);
    amount_doubles = sum(tmp_counts == 2)/2;
    len=sum(updated_edge_table(possible_nexts(j),:)~=0)-amount_doubles;
    length_next_in_edge_table = [length_next_in_edge_table;possible_nexts(j),len];
end

if sum(possible_nexts) == 0
    tmp_numbers_to_select_from = numbers_to_select_from;
    tmp_numbers_to_select_from(find(tmp_numbers_to_select_from == 0)) = [];
    next = tmp_numbers_to_select_from(randperm(length(tmp_numbers_to_select_from),1));

elseif sum(counts(:,2)==2)>0
    next = counts(find(counts(:,2)==2),1);
    next = next(1);
        
else
    [minimum,min_id] = min(length_next_in_edge_table(:,2));
    next = length_next_in_edge_table(min_id,1);
end
numbers_to_select_from(next) = 0;
new_numbers_to_select_from = numbers_to_select_from;
end

