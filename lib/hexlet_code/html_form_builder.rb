# frozen_string_literal: true

require_relative 'form_builder'
require_relative 'tag'

# Этот класс создает html форму
class HtmlFormBuilder < FormBuilder
  def render_form
    render "\n"
    create_a_form_content
    HexletCode::Tag.build('form', action: @url, method: 'post') { @form_content }
  end

  def create_a_form_content
    # Вызывается блок, который передавался в метод HexletCode.form_for
    # В блок передается сам объект HtmlFormBuilder у которого реализованы методы input, submit
    @block&.call(self)
  end

  def input(field_name, **options)
    render_label(field_name)
    render_input(field_name, options[:as])
  end

  def submit(text = 'Save')
    render '  '
    render HexletCode::Tag.build('input', name: 'commit', type: 'submit', value: text)
    render "\n"
  end

  def render_input(field_name, field_type)
    render '  '
    field_value = @object.public_send(field_name)
    render(
      if field_type == :text
        HexletCode::Tag.build('textarea', cols: '20', rows: '40', name: field_name) { field_value }
      else
        HexletCode::Tag.build('input', name: field_name, type: 'text', value: field_value)
      end
    )
    render "\n"
  end

  def render_label(field_name)
    render '  '
    render HexletCode::Tag.build('label', for: field_name) { field_name.capitalize.to_s }
    render "\n"
  end

  def render(string)
    @form_content << string
  end
end
