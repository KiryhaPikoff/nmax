require "nmax/version"
require "nmax/nmax"
require 'big_number'
require 'array'

module Nmax
  class Error < StandardError; end

  def self.print_result(started_at, values)
    values.each { |val| print "Result: #{val}\n" unless val.empty? }
    print "\nIt's took #{Time.now - started_at} sec."
  end

  def self.find_nmax(nmax_count)
    passed_number_count = 0

    Thread.new do
      while true
        sleep 1
        print "#{Time.now}: Numbers passed: #{passed_number_count}\n"
      end
    end

    started_at = Time.now

    values = Array.new(1, "")

    until $stdin.eof? do
      num = $stdin.readline.strip
      next if num.empty?
      passed_number_count += 1
      slice_to = nmax_count - 1
      if passed_number_count <= nmax_count
        values.insert passed_number_count, num
        slice_to = passed_number_count
      else
        comp_result = num <=> values.last
        values.insert_bin num unless comp_result == -1
      end
      values = values[0..slice_to]

      if passed_number_count == nmax_count
        values = values.sort { |a, b| a <=> b }.reverse
      end
    end

    print_result(started_at, values)
    print("\n Passed: #{passed_number_count}\n")
  end

  nmax_count = ARGV[0].to_i
  unless nmax_count.nil? || nmax_count.zero?
    find_nmax nmax_count
  end
end

