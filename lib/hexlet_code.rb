# frozen_string_literal: true

require_relative 'hexlet_code/version'

# HexletCode module helps to generate tags
module HexletCode
  autoload(:Tag, 'hexlet_code/tag.rb')
  autoload(:Form, 'hexlet_code/form.rb')

  def self.form_for(object, attributes = {}, &block)
    url  = attributes[:url] || '#'
    form = Form.new(object, url, block)
    form.to_html
  end
end
