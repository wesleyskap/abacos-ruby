require 'spec_helper'

describe Abacos::Product do
  describe ".available" do
    it "should list available products" do
      VCR.use_cassette('products_available') do
        Abacos::Product.available(chave_identificacao: ABACOS_CONFIG['token']).first.codigo_barras.should == '9788578440275'
      end
    end

    it "should return an empty array when no data" do
      VCR.use_cassette('products_available_empty') do
        Abacos::Product.available(chave_identificacao: ABACOS_CONFIG['token2']).should be_empty
      end
    end
  end

  describe ".find_by_ean" do
    it "should find a product with external id" do
      Abacos::Product.find_by_ean("9788525045768").codigo_produto.should == "135004"
    end
  end
end
