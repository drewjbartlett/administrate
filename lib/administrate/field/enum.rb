require_relative "base"

module Administrate
  module Field
    class Enum < Field::Base
      def to_s
        data&.humanize
      end

      def html_options
        options[:html] || {}
      end
    end
  end
end
