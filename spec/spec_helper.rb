require 'rubygems'
require 'bundler/setup'
require 'abacos'
require 'pry'

RSpec.configure do |config|
end

Abacos.config! token: File.read('spec/token').strip, sandbox: true
