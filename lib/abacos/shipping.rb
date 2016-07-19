module Abacos
  class Shipping < Base
    attr_reader :price, :name

    def self.find_all_by_cep_and_weight cep, weight
      execute("SELECT name=SE.SERE_NOM, price=round(min(fr.FREP_VAL_COB)*1.035,2) FROM ABACOS.dbo.tcom_locent lo WITH (NOLOCK) INNER JOIN ABACOS.dbo.TCOM_FREPES fr WITH (NOLOCK) ON lo.LOCE_COD=fr.LOCE_COD INNER JOIN ABACOS.dbo.TCOM_SERENT se WITH (NOLOCK) ON lo.SERE_COD=se.SERE_COD WHERE  '#{cep}' BETWEEN lo.LOCE_CEP_INI AND lo.LOCE_CEP_FIM AND fr.FREP_PES_MAX >= #{weight} AND se.TRAN_COD=1 AND se.SERE_COD IN (1,2,3) AND fr.FREP_VAL_COB>0 GROUP BY SE.SERE_NOM ORDER BY price ASC")
    end
  end
end
