require "savon"
require "abacos/base"
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
