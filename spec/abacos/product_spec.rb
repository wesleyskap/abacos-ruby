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
        Abacos::Product.available(chave_identificacao: ABACOS_CONFIG['token_no_products']).should be_empty
      end
    end

    it "should work when there is only a product" do
      VCR.use_cassette('products_available_one') do
        Abacos::Product.available(chave_identificacao: ABACOS_CONFIG['token_one_product']).size.should == 1
      end
    end
  end

  describe ".find_by_ean" do
    it "should find a product with external id" do
      product = Abacos::Product.find_by_ean("9788525045768")
      product.codigo_produto.should == "135004"
      product.weight.should == 0.502
    end
  end

  describe "#confirm!" do
    it "should confirm the product" do
      VCR.use_cassette('products_confirm') do
        Abacos::Product.new(protocolo_produto: 'A832B556-2B47-4437-B5A6-E41B93C1892D').confirm!.should be_success
      end
    end
  end
end
