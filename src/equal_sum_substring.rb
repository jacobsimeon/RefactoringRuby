class String
  def sum
    each_char.inject(0) { |t, d| t += d.to_i }
  end

  def equal_sum_substring
    length.downto(1) do |limit|
      (0..(length - limit)).each do |offset|
        candidate = slice(offset, limit)
        next unless candidate.length.even?

        half_length = candidate.length / 2

        first_half = candidate[0...half_length]
        second_half = candidate[half_length...length]

        if(first_half.sum == second_half.sum)
          return candidate
        end
      end
    end

    ""
  end
end

