class Integer
  def factorial_recursive
    self <= 1 ? 1 : self * (self - 1).factorial
  end
  def factorial_iterative
    f = 1; for i in 1..self; f *= i end; f
  end
  alias :factorial :factorial_iterative

  def factorial_sum
    digits = self.to_s.split(//)
    sum = 0
    digits.each do |i|
      sum = sum + i.to_i.factorial
    end
    sum
  end
end