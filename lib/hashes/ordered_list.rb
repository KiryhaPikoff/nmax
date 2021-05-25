require 'rinda/rinda'

class Array

  def insert_val(index, key, value)
    if self[index].nil?
      self[index] = Array(Rinda::Tuple.new([key, value]))
    else
      insert_binary_val(self[index], Rinda::Tuple.new([key, value]))
    end
  end

  def insert_binary(key, val)
    hash = yield key
    insert_val hash, key, val
  end

  def insert_binary_val(array, query)
    find = ->(start, finish) do
      len = finish - start + 1
      med = len / 2 + start

      return self if len == 0

      comp_res = query[0] <=> array[med][0]
=begin
        print "st=#{start}, fn=#{finish}, len=#{len}, med=#{med}, hash #{hash}, sh #{self[med]}, comprs: #{comp_res} & \n"
=end
      if comp_res == -1
        array.insert med + 1, query if len == 1 || len == 2
        find.call(med + 1, finish)
      elsif comp_res == 1
        if len == 1
          array.insert med, query
        else
          find.call(start, med - 1)
        end
      else
        array[med] = query
      end
    end

    last_index = array.length - 1
    find.call(0, last_index)

=begin
    puts "query = #{query}, hash = #{hash}\n"
    puts "#{self} \n"
    puts "========================================="
=end
  end

  def find_binary(key)
    hash = yield key
    arr = self[hash]

    find = ->(start, finish) do
      len = finish - start + 1
      med = len / 2 + start

      return -1 if len == 0
      return arr[med][1] if arr[med][0] == key

      comp = key <=> arr[med][0]

      return find.call(start, med - 1) if comp == -1
      return find.call(med + 1, finish) if comp == 1
    end

    last_index = arr.length - 1
    find.call(0, last_index)
  end

end

