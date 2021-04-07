module Administrate
  module DeviseHelper
    define_method "current_account" do
      eval("current_#{Administrate.configuration.devise_resource_name}")
    end
  end
end
