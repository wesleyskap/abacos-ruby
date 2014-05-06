module Abacos
  class Base
    attr_reader :response

    def self.available(params)
      call(:"#{resource_name}s_disponiveis", params).map { |params| new params }
    end

    def confirm!
      self.class.call(:"confirmar_recebimento_#{self.class.resource_name}", :"protocolo_#{self.class.resource_name}" => send("protocolo_#{self.class.resource_name}"))
    end

    def self.ws=(service)
      @service = service
    end

    def self.resource_name=(resource_name)
      @resource_name = resource_name
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
      params.each do |key, value|
        instance_variable_set "@#{key}", value
        define_singleton_method(key) { instance_variable_get "@#{key}" }
      end
    end

    def persisted?
      response.success?
    end

    private

    def self.resource_name
      @resource_name
    end

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
