module Abacos
  class Product < Base
    self.ws = "Produtos"

    def self.updated(params)
      call :produtos_disponiveis, params
    end
  end
end
