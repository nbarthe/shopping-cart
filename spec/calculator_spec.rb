require 'calculator'
require 'json'

describe Calculator do
  describe "#payment" do
    it "returns the sum the customer needs to pay" do
    calculator = Calculator.new
    expect(calculator.payment("AP1","LN1","HP1","HP1")).to eq(JSON.generate("179"))
    end
  end
end
