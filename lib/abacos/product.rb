module Abacos
  class Product < Base
    attr_reader :codigo_produto
    self.ws = "Produtos"

    def self.updated(params)
      call :produtos_disponiveis, params
    end

    def self.find_by_ean(ean)
      execute("select codigo_produto = products.PROS_EXT_COD from abacos..TCOM_PROSER products with (nolock) where products.PROS_BAR = 9788525045768").first
    end

    def initialize(params)
      @codigo_produto = params['codigo_produto']
    end
  end
end
