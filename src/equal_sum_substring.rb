class FindEqualSumSubstring
  attr_accessor :target
  def initialize(target)
    @target = target
  end

  def equal_sum_substring
    target.length.downto(1) do |limit|
      (0..(target.length - limit)).each do |offset|
        candidate = target.slice(offset, limit)
        next unless candidate.length.even?

        first_half_sum = candidate.halves[0].each_char.inject(0) { |t, d| t += d.to_i }
        second_half_sum = candidate.halves[1].each_char.inject(0) { |t, d| t += d.to_i }

        if(first_half_sum == second_half_sum)
          return candidate
        end
      end
    end

    ""
  end
end

class String
  def halves
    half_length = length / 2
    [self[0...half_length], self[half_length...length]]
  end
end
