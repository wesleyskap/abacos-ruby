module Abacos
  class Product < Base
    self.ws = "Produtos"

    def self.available(params)
      call(:produtos_disponiveis, params).map { |params| new params }
    end

    def self.find_by_ean(ean)
      execute("select codigo_produto = pros_ext_cod from abacos..tcom_proser with (nolock) where pros_bar = #{ean}").first
    end

    def confirm!
      self.class.call(:confirmar_recebimento_produto, protocolo_produto: protocolo_produto)
    end
  end
end
