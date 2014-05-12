module Abacos
  class Base
    attr_reader :response

    def self.available(params)
      call(:"#{collection_name}_disponiveis", params).map { |params| new params }
    end

    def confirm!
      self.class.call(:"confirmar_recebimento_#{self.class.resource_name}", :"protocolo_#{self.class.resource_name}" => send("protocolo_#{self.class.resource_name}"))
    end

    class << self
      %w(ws resource_name collection_name).each do |attribute|
        define_method "#{attribute}=" do |param|
          instance_variable_set "@#{attribute}", param
        end

        define_method "#{attribute}" do
          instance_variable_get "@#{attribute}"
        end
      end

      def collection_name
        @collection_name ||= "#{resource_name}s"
      end
    end

    def self.call(method, params)
      Response.new method, api.call(method, message: params)
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

    def self.api
      @api ||= Savon.client wsdl: "#{endpoint}/AbacosWS#{ws}.asmx?wsdl", log: Abacos.config['log'] do
        convert_request_keys_to :camelcase
      end
    end

    def self.db
      TinyTds::Client.new(Hash[Abacos.config['db'].map{ |k, v| [k.to_sym, v] }])
    end

    def self.endpoint
      Abacos.config['ws']['endpoint']
    end
  end
end
