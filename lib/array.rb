require 'big_number'

class Array

  def insert_bin(query)
    find = ->(start, finish) do
      len = finish - start + 1
      med = len / 2 + start

      return self if len == 0

      comp_res = query <=> self[med]
      if comp_res == -1
        self.insert med, query if len == 1
        find.call(med + 1, finish)
      elsif comp_res == 1
        if len == 1
          self.insert med, query
        else
          find.call(start, med - 1)
        end
      else
        self.insert med, query
      end
    end

    last_index = self.length - 1
    find.call(0, last_index)
  end
end