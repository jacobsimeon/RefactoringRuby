class String
  def equal_sum_halves?
    return false unless length.even?

    half_length = length / 2
    self[0...half_length].sum == self[half_length...length].sum
  end

  def sum
    each_char.inject(0) { |t, d| t += d.to_i }
  end

  def each_substring &block
    Enumerator.new do |y|
      length.downto(1) do |limit|
        (0..(length - limit)).each do |offset|
          y.yield slice(offset, limit)
        end
      end
      y.yield slice(0, 0)
    end.each(&block)
  end

  def equal_sum_substring
    each_substring.find { |sub| sub.equal_sum_halves? }
  end
end

