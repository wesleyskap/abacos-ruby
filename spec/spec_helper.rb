require 'rubygems'
require 'bundler/setup'
require 'abacos'
require 'pry'
require 'vcr'
require 'webmock'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock
end

RSpec.configure do |config|
end

ABACOS_CONFIG = YAML.load_file("spec/config.yml")
Abacos.config! 'ws' => ABACOS_CONFIG['ws'], 'db' => ABACOS_CONFIG['db']
