module Abacos
  class Price < Base
    self.ws = "Produtos"
    self.resource_name = "preco"
    
    def self.find_by_sku_and_table(sku, table)
      execute("select list_value = prol_val_pre, sell_value = prol_val_prepro from abacos..tcom_proser pro with (nolock) join abacos..tcom_prolis lis with (nolock) on pro.pros_cod = lis.pros_cod and lis.lisp_cod = #{table} where pro.pros_ext_cod = '#{sku}'").first
    end
  end
end
