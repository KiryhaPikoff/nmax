require 'rinda/rinda'

class Array

  def insert_simple(key, value)
    hash = yield key
    if self[hash].nil?
      self[hash] = Array(Rinda::Tuple.new([key, value]))
    else
      self[hash] << Rinda::Tuple.new([key, value])
    end

=begin
    puts "query = #{query}, hash = #{hash}\n"
    puts "#{self} \n"
    puts "========================================="
=end
  end

  def find_simple(key)
    hash = yield key
    self[hash].filter do |kval|
      return kval[1] if kval[0] == key
    end
  end

end
