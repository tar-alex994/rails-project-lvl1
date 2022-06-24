# frozen_string_literal: true

# Виртуальный класс, который задает API для строителей форм в разных форматах
class FormBuilder
  def initialize(object, url, block)
    @object       = object
    @url          = url
    @block        = block
    @form_content = +''
  end

  def render_form; end
  def input; end
  def submit; end
end
