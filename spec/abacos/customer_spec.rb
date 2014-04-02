require 'spec_helper'

describe Abacos::Customer do
  describe ".create!" do
    it "should create a customer and return the response" do
      VCR.use_cassette('customer_success') do
        customer = Abacos::Customer.create!({ 'CPFouCNPJ' => '15436940000286', tipo_pessoa: 'tpeFisica', sexo: 'tseMasculino', nome: 'Ronaldo', telefone: '45225842', celular: '73495254', endereco: { logradouro: 'Rua Peri, 100', complemento_endereco: 'casa azul', bairro: 'Centro', municipio: 'Brasília', estado: 'SP', cep: '70675100' }}, { chave_identificacao: ABACOS_CONFIG['token'] })
        customer.should be_persisted
        customer.response.to_s.should start_with("<?xml version")
      end
    end
  end
end
