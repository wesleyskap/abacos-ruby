require 'spec_helper'

describe Abacos::Stock do
  describe ".available" do
    it "should list available stocks" do
      VCR.use_cassette('stocks_available') do
        Abacos::Stock.available(chave_identificacao: ABACOS_CONFIG['token_stocks']).first.codigo_produto.should == '128929'
      end
    end
  end

  describe "#confirm!" do
    it "should confirm the stock" do
      VCR.use_cassette('stocks_confirm') do
        Abacos::Stock.new(protocolo_estoque: '8b09848d-556f-4658-9fd6-b7cf335e0294').confirm!.should be_success
      end
    end
  end

  describe ".find_by_sku" do
    it 'should find a stock by sku' do
      Abacos::Stock.find_by_sku("128258").value.should_not be_nil
    end
  end
end
