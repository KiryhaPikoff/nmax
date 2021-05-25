require 'rspec'
require 'hashes/simple_list'

RSpec.describe 'SimpleList' do

  def generate_ident(ord_number)
    ident_length = 32
    ident = "IDENT_#{ord_number}_"

    ident_length.times { ident  << (65 + rand(25)).chr }
    ident
  end

  def generate_val
     "VAL_#{rand(250)}"
  end

  it 'simple list fill' do
    hashtable_size = 10

    simple_list = Array.new(hashtable_size)
    20.times { | i |
      ident = generate_ident i
      simple_list.insert_simple(ident, generate_val) { | str |
        str.sum % hashtable_size - 3
      }
    }

    print "RESULT: #{simple_list}"
  end

  it 'simple list find' do
    hashtable_size = 10
    last_ident = ''
    simple_list = Array.new(hashtable_size)
    50.times { | i |
      ident = generate_ident i
      last_ident = ident
      simple_list.insert_simple(ident, generate_val) { | str |
        str.sum % hashtable_size - 3
      }
    }

    print "RESULT: #{simple_list}\n"

    t1 = Time.now
    val = simple_list.find_simple(last_ident) { | str |
        str.sum % hashtable_size - 3
    }
    puts("key: #{last_ident}\n")
    puts("found value: #{val}\n")
    t2 = Time.now
    delta = t2 - t1 # in seconds

    puts("delta = #{delta}")
  end
end