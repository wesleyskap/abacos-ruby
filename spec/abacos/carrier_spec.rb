require 'spec_helper'

describe Abacos::Carrier do
  describe ".all" do
    it "should return all carriers" do
      carriers = Abacos::Carrier.all
      carriers.last.name.should == "TRANSPO"
      carriers.first.id.should == 6
    end
  end
end
