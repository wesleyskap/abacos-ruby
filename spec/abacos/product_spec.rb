require 'spec_helper'

describe Abacos::Product do
  describe ".updated" do
    it "should list updated products" do
      VCR.use_cassette('products_updated') do
        Abacos::Product.updated(chave_identificacao: ABACOS_CONFIG['token']).first[:codigo_barras].should == '9788578440275'
      end
    end
  end
end
