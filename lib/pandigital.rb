class Integer
  def pandigital?
    pandigital = true
    (1..self.to_s.length).each do |i|
      pandigital = pandigital && self.to_s.include?(i.to_s)
    end
    pandigital
  end
end