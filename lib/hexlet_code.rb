# frozen_string_literal: true

require_relative 'hexlet_code/version'

module HexletCode
  # This class help to build tags.
  class Tag
    SINGLE_TAGS = %w[br input img link source].freeze

    def self.build(tag_name, attributes = {}, &block)
      tag_elements = open_tag(tag_name, attributes)

      unless SINGLE_TAGS.include?(tag_name)
        tag_elements << yield if block
        tag_elements << "</#{tag_name}>"
      end

      tag_elements.join
    end

    def self.open_tag(tag_name, attributes)
      tag_attributes = attributes.each.with_object(+'') do |(key, value), str|
        str.concat(" #{key}=\"#{value}\"")
      end

      ['<'] << tag_name << tag_attributes << '>'
    end
  end
end
