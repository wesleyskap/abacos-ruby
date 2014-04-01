module Abacos
  class Order < Base
    attr_reader :response
    self.ws = "Pedidos"

    def self.create!(*params, chave_identificacao:)
      new call(:inserir_pedido, { chave_identificacao: chave_identificacao }.merge(lista_de_pedidos: params.map { |param| { dados_pedidos: param }}))
    end

    def initialize(response)
      @response = response
    end
  end
end
