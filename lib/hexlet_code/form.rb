# frozen_string_literal: true

require_relative 'html_form_builder'

module HexletCode
  # Отвечает за выбор и создание нужного строителя формы
  class Form
    def self.build(object, url, block)
      define_form_view.new(object, url, block).render_form
    end

    def self.define_form_view
      HtmlFormBuilder
    end
  end
end
