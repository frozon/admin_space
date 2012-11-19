require 'admin_space/route'
require 'rails/engine'

module AdminSpace
  def self.setup
    yield self
  end

  class Engine < ::Rails::Engine
  end
end
