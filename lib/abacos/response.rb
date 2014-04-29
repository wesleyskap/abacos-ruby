require 'forwardable'

module Abacos
  class Response
    include Enumerable
    extend Forwardable
    def_delegators :@savon, :to_s

    def initialize(method, savon)
      @method = method
      @savon = savon
    end

    def each(&block)
      (doc.has_key?(:rows) ? doc[:rows].values.first : []).each &block
    end

    def success?
      (doc.has_key?(:tipo) ? doc : doc[:resultado_operacao])[:tipo] == "tdreSucesso"
    end

    private

    def doc
      @savon.body["#{@method}_response".to_sym]["#{@method}_result".to_sym]
    end
  end
end
