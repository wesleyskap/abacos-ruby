require "savon"
require "tiny_tds"
require "abacos/base"
require "abacos/inventory"
require "abacos/order"
require "abacos/payment_condition"
require "abacos/payment_method"
require "abacos/product"
require "abacos/response"

module Abacos
  def self.config!(config)
    @config = config
  end

  def self.config
    @config
  end
end
