module Abacos
  class PaymentMethod < Base
    attr_reader :id, :name

    def self.all
      execute("select id = forp_cod, name = rtrim(forp_nom) from abacos..tcom_forpag order by forp_nom")
    end
  end
end
