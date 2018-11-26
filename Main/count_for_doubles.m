function result = count_for_doubles(array)
result = [];
for i = 1:length(array)
    result = [result; array(i),sum(array == array(i))];
end 
end

