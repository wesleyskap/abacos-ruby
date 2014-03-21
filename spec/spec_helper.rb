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

Abacos.config! YAML.load_file("spec/config.yml")
