require 'spec_helper'

describe Abacos::Shipping do
  describe ".find_all_by_cep_and_weight" do
    it "should return shipping name and price" do
      shipping = Abacos::Shipping.find_all_by_cep_and_weight('03333120', 7.09).first
      expect(shipping.name).to_not be_nil
      expect(shipping.price).to_not be_nil
    end
  end
end
