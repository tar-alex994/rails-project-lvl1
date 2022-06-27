# frozen_string_literal: true

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
