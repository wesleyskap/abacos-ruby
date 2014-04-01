require 'spec_helper'

describe Abacos::PaymentMethod do
  describe ".all" do
    it "should return all payment methods" do
      payment_methods = Abacos::PaymentMethod.all
      payment_methods.last.name.should == "VISA"
      payment_methods.first.id.should == 3
    end
  end
end
