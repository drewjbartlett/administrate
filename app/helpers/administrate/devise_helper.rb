module Administrate
  module DeviseHelper
    define_method "current_account" do
      warden.authenticate(scope: Administrate.configuration.devise_resource_name.to_sym)
    end
  end
end
