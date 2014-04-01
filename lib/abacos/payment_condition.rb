module Abacos
  class PaymentCondition < Base
    attr_reader :id, :name

    def self.find_all_by_cnpj(cnpj)
      execute("select id = tcom_conpag.conp_cod, name = rtrim(tcom_conpag.conp_nom) from abacos..tgen_entbas, abacos..tcom_clifor, abacos..tcom_crcpag, abacos..tcom_conpag where tgen_entbas.entb_cod = tcom_clifor.entb_cod and tcom_clifor.clif_cod = tcom_crcpag.clif_cod and tcom_crcpag.conp_cod = tcom_conpag.conp_cod and tgen_entbas.entb_cgc = '#{cnpj}' order by tcom_conpag.conp_nom")
    end
  end
end
