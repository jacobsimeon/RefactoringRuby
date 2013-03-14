class FindEqualSumSubstring
  def initialize(target)
    @target = target
  end

  def equal_sum_substring
    @target.length.downto(1) do |limit|
      (0..(@target.length - limit)).each do |offset|
        candidate = @target.slice(offset, limit)
        next unless candidate.length.even?

        half_length = candidate.length / 2

        first_half = candidate[0...half_length]
        second_half = candidate[half_length...@target.length]

        first_half_sum = first_half.each_char.inject(0) { |t, d| t += d.to_i }
        second_half_sum = second_half.each_char.inject(0) { |t, d| t += d.to_i }

        if(first_half_sum == second_half_sum)
          return candidate
        end
      end
    end

    ""
  end
end

