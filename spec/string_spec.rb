require_relative "spec_helper.rb"

describe String do
  describe '#equal_sub_substring' do
    it 'handles the first test case' do
      result = "123231".equal_sum_substring.length
      result.must_equal(6)
    end

    it 'handles the second test case' do
      result = "986561517416921217551395112759219257312".equal_sum_substring.length
      result.must_equal(36)
    end

    it 'handles another test case' do
      result = "18882322225".equal_sum_substring.length
      result.must_equal(4)
    end

    it 'handles zero' do
      result = "123456".equal_sum_substring.length
      result.must_equal(0)
    end
  end
end