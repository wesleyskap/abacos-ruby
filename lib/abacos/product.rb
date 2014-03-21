module Abacos
  class Product < Base
    self.ws = "Produtos"

    def self.updated
      call :produtos_disponiveis
    end
  end
end
