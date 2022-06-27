# frozen_string_literal: true

require_relative 'input'

# TextInput class is responsible for creating and presenting textarea
class TextInput < Input
  def to_html
    html_label + HexletCode::Tag.build('textarea', html_options) { @field_value }
  end

  private

  def html_options
    { cols: '20', rows: '40', name: @field_name }.merge(@options)
  end
end
