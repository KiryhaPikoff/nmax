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
      comp_result = num <=> values.last
      unless comp_result == -1
        values.insert_bin num
        values = values[0..passed_number_count]
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

