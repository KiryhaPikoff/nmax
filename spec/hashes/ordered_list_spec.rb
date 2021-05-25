require 'rspec'
require 'hashes/ordered_list'

RSpec.describe 'OrderedList' do

  def generate_ident(ord_number)
    ident_length = 32
    ident = "IDENT_#{ord_number}_"

    ident_length.times { ident  << (65 + rand(25)).chr }
    ident
  end

  def generate_val
    "VAL_#{rand(250)}"
  end

  it 'ordered list fill' do
    hashtable_size = 10

    ordered_list = Array.new(1)
    50.times { | i |
      ident = generate_ident i
      ordered_list.insert_binary(ident, generate_val) { | str |
        str.sum % hashtable_size
      }
    }

    print "RESULT: #{ordered_list}"

  end

  it 'ordered list find' do
    hashtable_size = 10

    last_ident = ''
    ordered_list = Array.new(1)
    50.times { | i |
      ident = generate_ident i
      last_ident = ident
      ordered_list.insert_binary(ident, generate_val) { | str |
        str.sum % hashtable_size
      }
    }

    print "RESULT: #{ordered_list}\n"


    t1 = Time.now
    val = ordered_list.find_binary(last_ident) { | str |
      str.sum % hashtable_size
    }
    puts("key: #{last_ident}\n")
    puts("found value: #{val}\n")
    t2 = Time.now
    delta = t2 - t1 # in seconds

    puts("delta = #{delta}")
  end
end