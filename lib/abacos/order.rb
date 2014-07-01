module Abacos
  class Order < Base
    attr_reader :response
    self.ws = "Pedidos"

    def self.create!(*params, chave_identificacao:)
      create :inserir_pedido, { chave_identificacao: chave_identificacao }.merge(lista_de_pedidos: params.map { |param| { dados_pedidos: param }})
    end

    def self.confirm_payment!(*params, chave_identificacao:)
      call :confirmar_pagamentos_pedidos, { chave_identificacao: chave_identificacao }.merge(lista_de_pagamentos: params.map { |param| { dados_pgto_pedido: param }})
    end

    def self.statuses(chave_identificacao:)
      call(:status_pedido_disponiveis, { chave_identificacao: chave_identificacao }).map { |params| OrderStatus.new params }
    end

    def self.exist?(*ids, chave_identificacao:)
      {}.tap do |hash|
        call(:pedido_existe, { chave_identificacao: chave_identificacao, lista_de_numeros_de_pedidos: { 'string' => ids }}).each { |data| hash[data[:numero_do_pedido]] = OrderData.new data }
      end
    end
  end
end
