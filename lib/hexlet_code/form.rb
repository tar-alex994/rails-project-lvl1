# frozen_string_literal: true

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
      @form_elements << Input.new(field_name, field_value, options)
    end

    def submit(submit_text = 'Save')
      @form_elements << Submit.new(submit_text)
    end

    def to_html
      form_content = @form_elements.map(&:to_html).join
      HexletCode::Tag.build('form', action: @url, method: 'post') { form_content.prepend("\n") }
    end
  end

  # Input class is responsible for creating and presenting inputs
  class Input
    def initialize(field_name, field_value, options)
      @field_name  = field_name
      @field_value = field_value
      @options     = options
    end

    def to_html
      html = html_label
      html << if @options[:as] == :text
                html_textarea
              else
                html_input
              end
    end

    private

    def html_label
      html = +'  '
      html << HexletCode::Tag.build('label', for: @field_name) { @field_name.capitalize.to_s }
      html << "\n"
    end

    def html_input
      html_options = @options.except(:as)
      html_options.merge!(name: @field_name, type: 'text', value: @field_value)
      html = +'  '
      html << HexletCode::Tag.build('input', html_options)
      html << "\n"
    end

    def html_textarea
      html_options          = @options.except(:as)
      html_options[:cols] ||= '20'
      html_options[:rows] ||= '40'
      html_options[:name]   = @field_name
      html = +'  '
      html << HexletCode::Tag.build('textarea', html_options) { @field_value }
      html << "\n"
    end
  end

  # Submit class is responsible for creating and presenting submits
  class Submit
    def initialize(submit_text)
      @submit_text = submit_text
    end

    def to_html
      html = +'  '
      html << HexletCode::Tag.build('input', name: 'commit', type: 'submit', value: @submit_text)
      html << "\n"
    end
  end
end
