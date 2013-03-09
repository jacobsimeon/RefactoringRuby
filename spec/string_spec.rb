require_relative "spec_helper.rb"

describe String do
  description = <<-DESC
    Finding the length of the longest contiguous substring of a
    given string of numbers where the sum of the first
    half of numbers is equal to the sum of the second.
  DESC

  describe description do
    it "finds the needle when the entire string is a match" do
      # 123231 => 6
      result = "123231".equal_sum_substring.length
      result.must_equal(6)
    end

    it "finds the needle when it is directly in the center of the string" do
      # 456654 => 6
      result = "123456654999"
      result.must_equal(6)
    end

    it 'finds the needle when it is not located in the center' do
      # 865615174169212175513951127592192573 => 36
      result = "986561517416921217551395112759219257312".equal_sum_substring.length
      result.must_equal(36)
    end

    it 'finds the needle when it is located close to the end' do
      # 2222
      result = "18882322225".equal_sum_substring.length
      result.must_equal(4)
    end

    it 'handles zero' do
      # "" => 0
      result = "123456".equal_sum_substring.length
      result.must_equal(0)
    end
  end

  describe "listing of all substrings" do
    it "lists all substrings from longest to shortest" do
      "1234".substrings.must_equal([
        "1234",
        "123", "234",
        "12", "23", "34",
        "1", "2", "3", "4",
        ""
      ])
    end
end

