require 'etc'
require 'big_number'

counter = 0
loop do
  counter += 1
  print "#{counter}\n"
  break if counter > 5
end

=begin

proc_count = Etc.nprocessors * 2
need_gen   = 1_000_000
n_digits   = 15

num_count = 0

Thread.new do
  while true
    sleep 1
    print "#{Time.now}: Generated: #{num_count}\n"
  end
end

t1 = Time.now

threads = []
proc_count.times do
  threads << Thread.new do
    arr = []
    (need_gen / proc_count).times do
      num = ""
      (rand(n_digits) + 1).times do
        num << rand(10).to_s
      end
      arr << num
      num_count += 1
    end
    Thread.current[:result] = arr
  end
end

threads.each { |thread| thread.join }

file = File.new("../1kk.txt", "a:UTF-8")
threads.each do |thread|
  thread[:result].each do |number|
    file.print "#{number}\n"
  end
end
file.close

t2 = Time.now
print "Generated #{num_count} numbers, it's took #{t2 - t1} sec."
=end
