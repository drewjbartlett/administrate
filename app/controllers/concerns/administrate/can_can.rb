module Administrate
  module CanCan
    if Object.const_defined?("CanCan")
      extend ActiveSupport::Concern

      included do
        load_and_authorize_resource

        rescue_from ::CanCan::AccessDenied do |exception|
          flash[:alert] = "Access Denied"
          redirect_to root_path
        end

        def find_resource(param)
          resource_class.default_scoped.find(param)
        end

        def scoped_resource
          super.accessible_by(current_ability)
        end

        def authorize_resource(resource)
          raise CanCan::AccessDenied unless show_action?(params[:action], resource)
        end

        def show_action?(action, resource)
          if ["show", :show].include?(action)
            action = :read
          end
          can? action.to_sym, resource
        end

        def current_ability
          @current_ability ||= Ability.new(current_account)
        end
      end
    end
  end
end
