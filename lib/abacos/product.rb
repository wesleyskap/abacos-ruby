module Abacos
  class Product < Base
    self.ws = "Produtos"
    self.resource_name = "produto"

    def self.find_by_ean(ean)
      execute("select codigo_produto = pros_ext_cod, weight = pros_pes from abacos..tcom_proser with (nolock) where pros_bar = #{ean}").first
    end

    def self.find_by_sku(sku)
      execute("select ean = pros_bar, weight = pros_pes from abacos..tcom_proser with (nolock) where pros_ext_cod = '#{sku}'").first
    end
  end
end
