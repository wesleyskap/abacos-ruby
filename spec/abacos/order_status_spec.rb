require 'spec_helper'

describe Abacos::OrderStatus do
  describe "#confirm!" do
    it "should confirm the order status" do
      VCR.use_cassette('order_statuses_confirm') do
        Abacos::OrderStatus.new(protocolo_status_pedido: 'D82ECD41-D31C-47EF-83D8-941337ED4ADF').confirm!.should be_success
      end
    end
  end
end
