module Abacos
  class Base
    attr_reader :response

    def self.ws=(ws)
      @ws = ws
    end

    def self.call(method, params)
      Response.new method, client.call(method, message: params)
    end

    def initialize(response)
      @response = response
    end

    def persisted?
      response.success?
    end

    private

    def self.client
      @client ||= Savon.client wsdl: "#{endpoint}/AbacosWS#{@ws}.asmx?wsdl", log: false do
        convert_request_keys_to :camelcase
      end
    end

    def self.endpoint
      Abacos.config[:endpoint]
    end
  end
end
