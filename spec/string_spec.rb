require_relative "spec_helper.rb"

describe FindEqualSumSubstring do
  description = <<-DESC
    Finding the length of the longest contiguous substring of a
    given string of numbers where the sum of the first
    half of numbers is equal to the sum of the second.
  DESC

  describe description do
    def equal_sum_substring_in(string)
      @logger = MockLogger.new
      FindEqualSumSubstring.new(string, @logger).equal_sum_substring
    end

    it "finds the needle when the entire string is a match" do
      # 123321
      equal_sum_substring_in("123321").must_equal("123321")
    end

    it "finds the needle when it is directly in the center of the string" do
      # 456654
      equal_sum_substring_in("123456654999").must_equal("456654")
    end

    it 'finds the needle when it is not located in the center' do
      test_string = "986561517416921217551395112759219257312"

      actual_result = equal_sum_substring_in(test_string)
      expected_result = "865615174169212175513951127592192573"

      actual_result.must_equal expected_result
    end

    it 'finds the needle when it is located close to the end' do
      # 2222
      equal_sum_substring_in("18882322225").must_equal("2222")
    end

    it 'return an empty string when no match is found' do
      equal_sum_substring_in("123456").must_equal("")
    end

    it "logs each candidate" do
      equal_sum_substring_in("123")
      @logger.messages.must_equal ["123", "12", "23", "1", "2", "3", ""]
    end
  end

end

behavior_of "a logger" do
  it "responds to :log" do
    subject.must_respond_to :archive_candidate
  end
end

describe MockLogger do
  subject { MockLogger.new }
  must_behave_like "a logger"
end

describe Logger do
  subject { Logger.new }
  must_behave_like "a logger"
end
