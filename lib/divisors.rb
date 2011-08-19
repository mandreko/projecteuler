class Integer
  def divisors()
    array = Array.new
    (1..Math.sqrt(self)).each { |divisor|
      if (self % divisor == 0)
        array << divisor
        array << (self/divisor)
      end
    }
    array.uniq
  end
  def divisors_proper()
    array = self.divisors
    array.delete(self)
    array
  end
  def is_abundant?()
    self.divisors_proper.inject(:+) > self
  end
end