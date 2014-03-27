require 'abacos/response'

module Abacos
  class Base
    def self.ws=(ws)
      @ws = ws
    end

    def self.call(method, params)
      Response.new client.call(method, message: params).body["#{method}_response".to_sym]["#{method}_result".to_sym]
    end

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
