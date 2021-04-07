require "administrate/engine"
require 'administrate/configuration'

module Administrate
  def self.warn_of_missing_resource_class
    ActiveSupport::Deprecation.warn(
      "Calling Field::Base.permitted_attribute without the option " +
      ":resource_class is deprecated. If you are seeing this " +
      "message, you are probably using a custom field type that" +
      "does this. Please make sure to update it to a version that " +
      "does not use a deprecated API",
    )
  end

  def self.warn_of_deprecated_option(name)
    ActiveSupport::Deprecation.warn(
      "The option :#{name} is deprecated. " +
      "Administrate should detect it automatically. " +
      "Please file an issue at " +
      "https://github.com/thoughtbot/administrate/issues " +
      "if you think otherwise.",
    )
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.reset
    @configuration = Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end
