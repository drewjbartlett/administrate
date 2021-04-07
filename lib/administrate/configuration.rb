module Administrate
  class Configuration
    attr_accessor :devise_resource_name

    def initialize
      @devise_resource_name ||= 'user'
    end
  end
end
