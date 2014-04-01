module Abacos
  class PaymentCondition < Base
    attr_reader :id, :name

    def self.all
      execute("select id = conp_cod, name = rtrim(conp_nom) from abacos..tcom_conpag order by conp_nom")
    end
  end
end
