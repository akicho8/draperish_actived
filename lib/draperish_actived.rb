require 'active_decorator'
require 'rails/railtie'

module DraperishActived
  class Railtie < Rails::Railtie
    config.after_initialize do |app|
      Pathname.glob(Rails.root.join("app/decorators/**/*decorator.rb")) do |file|
        file.basename(".*").to_s.classify.constantize.extend DrapperCompat
      end
    end
  end
end

ActiveDecorator::Helpers.module_eval do
  remove_method :method_missing

  def helpers
    ActiveDecorator::ViewContext.current
  end

  alias h helpers

  def source
    self
  end

  def model
    self
  end
end

Object.class_eval do
  def decorate
    ActiveDecorator::Decorator.instance.decorate(self)
    self
  end
end

Object.class_eval do
  def decorate_by(decorator_class)
    unless decorator_class === self
      extend decorator_class
      extend ActiveDecorator::Helpers
    end
    self
  end
end

module DraperishActived::DrapperCompat
  def new(object)
    object.decorate_by(self)
  end

  alias decorate new
end

module PaginatingDecorator
  def self.new(object)
    object
  end
end