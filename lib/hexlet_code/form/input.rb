# frozen_string_literal: true

# Input class is responsible for creating and presenting inputs
class Input
  def initialize(field_name, field_value, options)
    @field_name  = field_name
    @field_value = field_value
    @options     = options.except(:as)
  end

  def to_html
    html_label + HexletCode::Tag.build('input', html_options)
  end

  private

  def html_label
    HexletCode::Tag.build('label', for: @field_name) { @field_name.capitalize.to_s }
  end

  def html_options
    { name: @field_name, type: 'text', value: @field_value }.merge(@options)
  end
end
