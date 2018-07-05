require "rubygems"
require "brice"

IRB.conf[:AUTO_INDENT] = true
IRB.conf[:USE_READLINE] = true
IRB.conf[:LOAD_MODULES] = [] unless IRB.conf.key?(:LOAD_MODULES)
unless IRB.conf[:LOAD_MODULES].include?("irb/completion")
  IRB.conf[:LOAD_MODULES] << "irb/completion"
end

Brice.init

def reload(filename)
  $".delete(filename + ".rb")
  require(filename)
end
