require 'spec_helper'

describe Abacos::Invoice do
  describe ".available" do
    xit "should list available invoices" do
      VCR.use_cassette('invoices_available') do
        Abacos::Invoice.available(chave_identificacao: ABACOS_CONFIG['token']).first.codigo_produto.should == '128929'
      end
    end
  end

  describe "#confirm!" do
    xit "should confirm the invoice" do
      VCR.use_cassette('invoices_confirm') do
        Abacos::Invoice.new(protocolo_nota_fiscal: 'AEE1C671-B328-42B9-A79E-F2FB73895D60').confirm!.should be_success
      end
    end
  end
end
