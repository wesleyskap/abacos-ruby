require "savon"
require "abacos/base"
require "abacos/inventory"
require "abacos/order"
require "abacos/product"

module Abacos
  def self.config!(config)
    @config = config
  end

  def self.config
    @config
  end
end
