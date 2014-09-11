require 'spec_helper'

describe Abacos::Price do
  describe ".available" do
    it "should list available prices" do
      VCR.use_cassette('prices_available') do
        Abacos::Price.available(chave_identificacao: ABACOS_CONFIG['token_prices']).first.codigo_produto.should == '128929'
      end
    end
  end

  describe "#confirm!" do
    it "should confirm the price" do
      VCR.use_cassette('prices_confirm') do
        Abacos::Price.new(protocolo_preco: 'AEE1C671-B328-42B9-A79E-F2FB73895D60').confirm!.should be_success
      end
    end
  end

  describe ".find_by_sku_and_table" do
    it 'should return the price by the sku and table' do
      price = Abacos::Price.find_by_sku_and_table '2', 1
      expect(price.list_value).to_not be_nil
      expect(price.sell_value).to_not be_nil
    end
  end
end
