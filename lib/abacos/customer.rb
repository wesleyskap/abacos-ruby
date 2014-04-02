module Abacos
  class Customer < Base
    attr_reader :response
    self.ws = "Clientes"

    def self.create!(*params, chave_identificacao:)
      create :cadastrar_cliente, { chave_identificacao: chave_identificacao }.merge(lista_de_clientes: params.map { |param| { dados_clientes: param }})
    end
  end
end
