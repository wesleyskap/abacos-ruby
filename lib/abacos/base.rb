module Abacos
  class Base
    attr_reader :response

    def self.ws=(service)
      @service = service
    end

    def self.call(method, params)
      Response.new method, ws.call(method, message: params)
    end

    def self.create(method, params)
      new response: call(method, params)
    end

    def self.execute(query)
      db.execute(query).map { |params| new params }
    end

    def initialize(params)
      params.each { |key, value| instance_variable_set "@#{key}", value }
    end

    def persisted?
      response.success?
    end

    private

    def self.ws
      @ws ||= Savon.client wsdl: "#{endpoint}/AbacosWS#{@service}.asmx?wsdl", log: false do
        convert_request_keys_to :camelcase
      end
    end

    def self.db
      @db ||= TinyTds::Client.new(Hash[Abacos.config['db'].map{ |k, v| [k.to_sym, v] }])
    end

    def self.endpoint
      Abacos.config['ws']['endpoint']
    end
  end
end
