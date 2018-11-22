function edge_table = construct_edge_table(Parents)
P1 = Parents(1,:);
P2 = Parents(2,:);
edge_table = zeros(length(P1),4);
for i=1:length(P1)
    index_in_P1 = find(P1 == i);
    index_in_P2 = find(P2 == i);
    if index_in_P1 == 1
        edge_table(i,1) = P1(2);
        edge_table(i,2) = P1(length(P1));
    elseif index_in_P1 == length(P1)
        edge_table(i,1) = P1(1);
        edge_table(i,2) = P1(length(P1)-1);
    else
        edge_table(i,1) = P1(index_in_P1-1);
        edge_table(i,2) = P1(index_in_P1+1);
    end
    
    if index_in_P2 == 1
        edge_table(i,3) = P2(2);
        edge_table(i,4) = P2(length(P2));
    elseif index_in_P2 == length(P2)
        edge_table(i,3) = P2(1);
        edge_table(i,4) = P2(length(P2)-1);
    else
        edge_table(i,3) = P2(index_in_P2-1);
        edge_table(i,4) = P2(index_in_P2+1);
    end
end
end

