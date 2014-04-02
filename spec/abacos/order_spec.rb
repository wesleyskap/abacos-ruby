require 'spec_helper'

describe Abacos::Order do
  describe ".create!" do
    it "should create an order and return the response" do
      VCR.use_cassette('order_success') do
        order = Abacos::Order.create!({ numero_do_pedido: '125325441', 'CPFouCNPJ' => '15436940000286', valor_pedido: 1025.4, data_venda: '31012014 12:34', transportadora: '2', canal: 'Internet', subcanal: 'Amazon', formas_de_pagamento: { dados_pedidos_forma_pgto: { forma_pagamento_codigo: 12, valor: 1025.4 }}, itens: { dados_pedidos_item: [{ codigo_produto: 261578, quantidade_produto: 11, preco_unitario: 39.9 }, { codigo_produto: 262654, quantidade_produto: 15, preco_unitario: 39.1 }]}}, { chave_identificacao: ABACOS_CONFIG['token'] })
        order.should be_persisted
        order.response.to_s.should start_with("<?xml version")
      end
    end
  end
end
