class Kompress
  ROOT = File.expand_path "#{File.dirname __FILE__}/.."
end

require "#{Kompress::ROOT}/lib/kompress/version"
require "#{Kompress::ROOT}/lib/kompress/kompress"
