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

    def self.all_active_by_cnpj(cnpj)
      execute("select bas.ENTB_CGC,ENTB_NOM_RAZ,selo=marp_nom,pros_cod=pro.PROS_COD,pros_bar=pro.PROS_BAR,pro.PROS_EXT_COD,pros_nom=PROS_NOM,preco_capa=lis.PROL_VAL_PRE,pod=liv.LIVP_CHR_SN_POD from ABACOS..TGEN_ENTBAS bas with (nolock) inner join ABACOS..TCOM_CLIFOR cli with (nolock) on bas.ENTB_COD=cli.entb_cod inner join ABACOS..TCOM_FORMAR fo  with (nolock) on fo.FORM_COD=(select top 1 FORM_COD from ABACOS..TCOM_FORMAR xx with (nolock) where xx.FORM_CHR_SN_PAD='S' and xx.CLIF_COD=cli.CLIF_COD) inner join ABACOS..TCOM_PROSER pro with (nolock) on pro.MARP_COD=fo.marp_cod inner join ABACOS..TCOM_PROLIS lis with (nolock) on pro.PROS_COD=lis.PROS_COD and lis.LISP_COD=1 inner join ABACOS..TCOM_MARPRO mar with (nolock) on pro.MARP_COD=mar.MARP_cod inner join ABACOS..TCOM_LIVPRO liv with (nolock) on pro.PROS_COD=liv.pros_cod where bas.ENTB_CGC='#{cnpj}' AND liv.LIVP_CHR_SN_POD = 'S'")
    end
  end
end
