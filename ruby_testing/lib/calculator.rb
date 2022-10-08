class Calculator

  def sum(*x)
    x.sum
  end

  def subtract(*x)
    x.reduce(:-)
  end

  def multiply(*x)
    x.reduce(:*)
  end

end
