module Abacos
  class Order < Base
    self.ws = "Pedidos"

    def self.create!(*params)
      call :inserir_pedido, lista_de_pedidos: params.map { |param| { dados_pedidos: param }}
    end
  end
end
