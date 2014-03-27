require 'spec_helper'

describe Abacos::Inventory do
  describe ".updated" do
    xit "should list updated products" do
      VCR.use_cassette('products_updated') do
        Abacos::Inventory.updated(chave_identificacao: @config['token']).first[:codigo_barras].should == '9788578440275'
      end
    end
  end
end
