require './lib/calculator.rb'

describe Calculator do
  describe "#sum" do
    it "returns the sum of two numbers" do
      calculator = Calculator.new
      expect(calculator.sum(5, 2)).to eql(7)
    end

    it "returns the sum of more than two numbers" do
      calculator = Calculator.new
      expect(calculator.sum(2, 5, 7)).to eql(14)
    end
  end

  describe "#subtract" do
    it "returns value of first number minues second number" do
      calculator = Calculator.new
      expect(calculator.subtract(7, 5)).to eq(2)
    end

    it "returns value of first number subtracting followed numbers" do
      calculator = Calculator.new
      expect(calculator.subtract(7, 3, 1)).to eq(3)
    end
  end

  describe "#multiply" do
    it "returns the value of two numbers multiplied" do
      calculator = Calculator.new
      expect(calculator.multiply(2, 5)).to eq(10)
    end

    it "returns the value of two or more numbers multiplied" do
      calculator = Calculator.new
      expect(calculator.multiply(2, 5, 7)).to eq(70)
    end
  end
end
