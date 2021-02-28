class String
  include Comparable

  def <=>(other_num)
    length_sub = self.length - other_num.length
    if length_sub.positive?
      1
    elsif length_sub.negative?
      -1
    else
      self.comp_by_chars other_num
    end
  end

  def comp_by_chars(other_num)
    int_length_in_chars = 30
    compared_digits_count = 0
    result = 0
    loop do
      take_from = compared_digits_count
      s1i = self[take_from, int_length_in_chars].to_i
      s2i = other_num[take_from, int_length_in_chars].to_i
      sub = s1i - s2i
      if sub.positive?
        result = 1
      elsif sub.negative?
        result = -1
      end
      compared_digits_count += int_length_in_chars
      break if compared_digits_count >= self.length || result != 0
    end
    result
  end
end