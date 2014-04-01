module Abacos
  class Carrier < Base
    attr_reader :id, :name

    def self.all
      execute("select id = tran_cod, name = rtrim(entb_nom_fan) from abacos..tgen_transp, abacos..tgen_entbas where tgen_transp.entb_cod = tgen_entbas.entb_cod order by entb_nom_fan")
    end
  end
end
