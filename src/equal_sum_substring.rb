class String
  def sum
    each_char.inject(0) { |t, d| t += d.to_i }
  end

  def halves
    half_length = length / 2
    [self[0...half_length], self[half_length...length]]
  end

  def equal_sum_halves?
    return false unless length.even?
    halves.first.sum == halves.last.sum
  end

  def equal_sum_substring
    each_substring.find { |sub| sub.equal_sum_halves? }.tap { |sub| puts sub }
  end

  def substrings
    each_substring.to_a
  end

  def each_substring(&block)
    Enumerator.new do |yielder|
      length.downto(1) do |limit|
        (0..(length - limit)).each do |offset|
          yielder.yield(slice(offset, limit))
        end
      end
      # always include an empty string
      yielder.yield(slice(0, 0))
    end
  end
end

