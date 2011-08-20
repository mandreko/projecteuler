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
  
  def truncatable_left?
    self_str = self.to_s.chars.to_a
    
    (0..self_str.length-1).each do |i|
      #puts self_str.join
      if !self_str.join.to_i.prime?
        return false
      end
      self_str.shift
    end
    return true
  end
  
  def truncatable_right?
    self_str = self.to_s.chars.to_a
    
    (0..self_str.length-1).each do |i|
      #puts self_str.join
      if !self_str.join.to_i.prime?
        return false
      end
      self_str.pop
    end
    return true
  end
  
  def truncatable?
    self.truncatable_left? && self.truncatable_right?
  end
end