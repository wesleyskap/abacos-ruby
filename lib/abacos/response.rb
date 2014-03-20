module Abacos
  class Response
    def initialize(doc)
      @doc = doc
    end

    def success?
      @doc[:resultado_operacao][:tipo] == "tdreSucesso"
    end
  end
end
