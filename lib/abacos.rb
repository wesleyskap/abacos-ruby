require "savon"
require "tiny_tds"
require "abacos/base"
require "abacos/carrier"
require "abacos/customer"
require "abacos/inventory"
require "abacos/invoice"
require "abacos/order"
require "abacos/order_data"
require "abacos/order_status"
require "abacos/payment_condition"
require "abacos/payment_method"
require "abacos/price"
require "abacos/product"
require "abacos/response"
require "abacos/stock"
require "abacos/shipping"

module Abacos
  def self.config!(config)
    @config = config
  end

  def self.config
    @config
  end
end
