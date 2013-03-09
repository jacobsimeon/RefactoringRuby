class String
  def sum
    each_char.inject(0) { |t, d| t += d.to_i }
  end

  def halves
    half_length = length / 2
    [self[0...half_length], self[half_length...length]]
  end

  def equal_sum_substring
    length.downto(1) do |limit|
      (0..(length - limit)).each do |offset|
        candidate = slice(offset, limit)
        next unless candidate.length.even?

        if(candidate.halves.first.sum == candidate.halves.last.sum)
          return candidate
        end
      end
    end

    ""
  end
end

