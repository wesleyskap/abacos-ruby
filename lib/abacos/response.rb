require 'forwardable'

module Abacos
  class Response
    include Enumerable
    extend Forwardable
    def_delegator :@rows, :each

    def initialize(doc)
      @doc = doc
      @rows = doc[:rows].values.first
    end

    def success?
      @doc[:resultado_operacao][:tipo] == "tdreSucesso"
    end
  end
end
