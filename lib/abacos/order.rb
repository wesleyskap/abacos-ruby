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
      call :status_pedido_disponiveis, { chave_identificacao: chave_identificacao }
    end
  end
end
