module Abacos
  class Product < Base
    attr_reader :codigo_barras, :codigo_produto
    self.ws = "Produtos"

    def self.available(params)
      call(:produtos_disponiveis, params).map { |params| new params }
    end

    def self.find_by_ean(ean)
      execute("select codigo_produto = pros_ext_cod from abacos..tcom_proser with (nolock) where pros_bar = #{ean}").first
    end
  end
end
