# frozen_string_literal: true

require 'active_support/inflector'
require_relative 'form/input'
require_relative 'form/text_input'
require_relative 'form/submit'

module HexletCode
  # Form class is responsible for creating and presenting forms
  class Form
    def initialize(object, url, block)
      @object        = object
      @url           = url
      @form_elements = []
      initialize_form_elements(block)
    end

    def initialize_form_elements(external_block)
      external_block&.call(self)
    end

    def input(field_name, options = {})
      field_value = @object.public_send(field_name)
      input_class = get_input_class(options[:as])
      @form_elements << input_class.new(field_name, field_value, options)
    end

    def submit(submit_text = 'Save')
      @form_elements << Submit.new(submit_text)
    end

    def to_html
      form_content = @form_elements.map(&:to_html).join
      HexletCode::Tag.build('form', action: @url, method: 'post') { form_content }
    end

    private

    def get_input_class(short_class_name)
      class_name = "#{short_class_name&.capitalize}Input"
      class_name.constantize
    end
  end
end
