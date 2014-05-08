module Abacos
  class Invoice < Base
    self.ws = "NotasFiscais"
    self.resource_name = "nota_fiscal"
    self.collection_name = "notas_fiscais"
  end
end
