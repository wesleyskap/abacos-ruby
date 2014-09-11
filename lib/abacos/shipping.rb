module Abacos
  class Shipping < Base
    attr_reader :price, :name

    def self.find_all_by_cep_and_weight cep, weight
      execute("select name = SE.SERE_NOM, price = round(min(fr.FREP_VAL_COB)*1.10, 2) from abacos..tcom_locent lo with (nolock) inner join abacos..TCOM_FREPES fr with (nolock) on lo.LOCE_COD=fr.LOCE_COD inner join abacos..TCOM_SERENT se with (nolock) on lo.SERE_COD=se.SERE_COD where '#{cep}' between LOCE_CEP_ini and loce_cep_fim and FREP_PES_MAX  >= #{weight} group by SE.SERE_NOM")
    end
  end
end


