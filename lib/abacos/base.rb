require 'abacos/response'

module Abacos
  class Base
    def self.ws=(ws)
      @ws = ws
    end

    def self.call(method, params = {})
      Response.new client.call(method, message: { chave_identificacao: token }.merge(params)).body["#{method}_response".to_sym]["#{method}_result".to_sym]
    end

    def self.client
      @client ||= Savon.client wsdl: "#{endpoint}/AbacosWS#{@ws}.asmx?wsdl" do
        convert_request_keys_to :camelcase
      end
    end

    def self.endpoint
      "http://200.201.203.131:#{port}/abacoswebsvc"
    end

    def self.token
      Abacos.config[:token]
    end

    def self.port
      Abacos.config[:sandbox] ? "8034" : "8046"
    end
  end
end
