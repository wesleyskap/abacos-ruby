module Abacos
  class Stock < Base
    self.ws = "Produtos"
    self.resource_name = "estoque"

    def self.find_by_sku(sku)
      execute("select value = sal.salp_qtf_dis from abacos..tcom_proser pro with (nolock) left join abacos..test_salpro sal with (nolock) on pro.pros_cod = sal.pros_cod where pro.pros_ext_cod = '#{sku}'").first
    end
  end
end
