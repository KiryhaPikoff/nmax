require 'rspec'
require 'array'

RSpec.describe Array do

  sorted_data= [
    "92384238498230567",
    "327467263489",
    "327467263487",
    "327467263481",
    "3267457236",
    "329074623",
    "82933",
    "234",
    "0",
  ]

  it 'insert in the middle, num equals middle num' do
    val = "3267457236"
    expected_data = sorted_data.dup.insert 4, val
    expect(sorted_data.insert_bin val).to eql expected_data
  end

  it 'insert in the middle, num more than middle num' do
    val = "3267457237"
    expected_data = sorted_data.dup.insert 4, val
    expect(sorted_data.insert_bin val).to eql expected_data
    print expected_data
  end

end
