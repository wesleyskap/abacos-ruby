require 'spec_helper'

describe Abacos::PaymentCondition do
  describe ".find_all_by_cnpj" do
    it "should return all payment conditions" do
      payment_conditions = Abacos::PaymentCondition.all
      payment_conditions.last.name.should == "A VISTA"
      payment_conditions.first.id.should == 12
    end
  end
end
