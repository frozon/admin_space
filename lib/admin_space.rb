require 'admin_space/route'
require 'rails/engine'
require 'admin_space/version'

module AdminSpace
  def self.setup
    yield self
  end

  class Engine < ::Rails::Engine
  end
end
