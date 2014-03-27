module Abacos
  class Order < Base
    self.ws = "Pedidos"

    def self.create!(*params, chave_identificacao:)
      new call(:inserir_pedido, { chave_identificacao: chave_identificacao }.merge(lista_de_pedidos: params.map { |param| { dados_pedidos: param }}))
    end
  end
end
