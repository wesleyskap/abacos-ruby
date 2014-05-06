module Abacos
  class Product < Base
    self.ws = "Produtos"
    self.resource_name = "produto"

    def self.find_by_ean(ean)
      execute("select codigo_produto = pros_ext_cod from abacos..tcom_proser with (nolock) where pros_bar = #{ean}").first
    end
  end
end
