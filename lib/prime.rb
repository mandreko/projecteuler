require 'mathn'

class Integer
  def is_circular_prime?
    nums = self.to_s.chars.to_a
    nums.length.times do
      return false if (!nums.join().to_i.prime?)
      # "pop" digit off the front and rotate to the end
      nums.push nums[0]
      nums.shift
    end

  true

  end
end