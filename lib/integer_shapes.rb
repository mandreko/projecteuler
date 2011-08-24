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

  def triangle?
    self == Triangular.take_while {|x| x <= self }.max
  end
  def pentagonal?
    (Math.sqrt(24 * self + 1) + 1) % 6 == 0
  end
end

Triangular = Enumerator.new {|x, i = 0|
  loop {
    x << (i += 1).triangular
  }
}

Pentagonal = Enumerator.new {|x, i = 0|
  loop {
    x << (i += 1).pentagonal
  }
}

Hexagonal = Enumerator.new {|x, i = 0|
  loop {
    x << (i += 1).hexagonal
  }
}