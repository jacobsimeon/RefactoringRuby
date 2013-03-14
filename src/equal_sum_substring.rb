class FindEqualSumSubstring
  attr_accessor :target, :logger

  def initialize(target, logger)
    @target = target
    @logger = logger
  end

  def equal_sum_substring
    substrings.find do |candidate|
      logger.archive_candidate candidate
      candidate.equal_sum_halves?
    end
  end

  private
  def length
    target.length
  end

  def slice(offset, limit)
    target.slice(offset, limit)
  end

  def substrings(&block)
    Enumerator.new do |yielder|
      length.downto(1) do |limit|
        (0..(length - limit)).each do |offset|
          candidate = slice(offset, limit)
          yielder.yield candidate
        end
      end
      # always include an empty string
      yielder.yield(slice(0, 0))
    end.each(&block)
  end
end

class String
  def halves
    half_length = length.even? ? length / 2 : (length + 1) / 2
    [self[0...half_length], self[half_length...length]]
  end

  def equal_sum_halves?
    length.even? && halves[0].sum == halves[1].sum
  end

  def sum
    each_char.inject(0) { |t, d| t += d.to_i }
  end
end

class Logger
  def archive_candidate(message)
    sleep 3
  end
end

