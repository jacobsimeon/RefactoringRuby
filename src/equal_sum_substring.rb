class FindEqualSumSubstring
  attr_accessor :target, :logger
  def initialize(target, logger)
    @logger = logger
    @target = target
  end

  def substrings(&block)
    target.substrings(&block)
  end

  def equal_sum_substring
    substrings.find do |s|
      logger.log(s)
      s.equal_sum_halves?
    end
  end
end

class String
  def halves
    half_length = length / 2
    [self[0...half_length], self[half_length...length]]
  end

  def sum
    each_char.inject(0) { |t, d| t += d.to_i }
  end

  def equal_sum_halves?
    length.even? && halves[0].sum == halves[1].sum
  end
end

class Logger
  attr_accessor :messages
  def initialize
    @messages = []
  end
  def log(message)
    sleep 0.1
    messages << message
  end
end
