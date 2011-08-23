class Integer

  def triangular
    self * (self + 1) / 2
  end
  def pentagonal
    self * (3 * self - 1) / 2
  end

  def hexagonal
    self * (2 * self - 1)
  end

end