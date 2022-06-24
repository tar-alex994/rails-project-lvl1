# frozen_string_literal: true

require_relative 'hexlet_code/version'

# This module help to generate tags
module HexletCode
  autoload(:Tag, 'hexlet_code/tag.rb')
  autoload(:Form, 'hexlet_code/form.rb')

  def self.form_for(object, attributes = {}, &block)
    url = attributes[:url] || '#'
    Form.build(object, url, block)
  end
end
