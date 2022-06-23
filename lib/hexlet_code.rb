# frozen_string_literal: true

require_relative 'hexlet_code/version'

# This module help to generate tags
module HexletCode
  autoload(:Tag, 'hexlet_code/tag.rb')
  autoload(:FormContent, 'hexlet_code/form_content')

  def self.form_for(object, attributes = {})
    url = attributes[:url] || '#'

    form_content = +''
    form_content = yield(FormContent.new(object)).content if block_given?

    Tag.build('form', action: url, method: 'post') { form_content.prepend("\n") }
  end
end
