class FindEqualSumSubstring
  attr_accessor :target
  def initialize(target)
    @target = target
  end

  def length
    target.length
  end

  def slice(offset, limit)
    target.slice(offset, limit)
  end

  def equal_sum_substring
    substrings.find { |s| s.equal_sum_halves? }
  end

  def substrings(&block)
    target.substrings(&block)
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
