# frozen_string_literal: true

module HexletCode
  # Tag help to generate tags.
  module Tag
    SINGLE_TAGS = %w[br input img link source].freeze

    def self.build(tag_name, attributes = {})
      tag_elements = open_tag(tag_name, attributes)

      unless SINGLE_TAGS.include?(tag_name)
        tag_elements << yield if block_given?
        tag_elements << "</#{tag_name}>"
      end

      tag_elements.join
    end

    def self.open_tag(tag_name, attributes)
      tag_attributes = attributes.each.with_object(+'') do |(key, value), str|
        str.concat(" #{key}=\"#{value}\"") if value
      end

      ['<'] << tag_name << tag_attributes << '>'
    end
  end
end
