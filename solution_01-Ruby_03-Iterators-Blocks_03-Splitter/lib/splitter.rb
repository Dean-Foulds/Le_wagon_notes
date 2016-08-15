def size_splitter(array, size)
  array.sort.partition { |word| word.length == size }
end

def block_splitter(array)
  array.partition { |item| yield(item) }
end
