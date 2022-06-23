# frozen_string_literal: true

module HexletCode
  # FormContent responsible for the execution of the block.
  class FormContent
    attr_reader :content

    def initialize(object)
      @object  = object
      @content = +''
    end

    def input(field_name, **options)
      object_value = @object.public_send(field_name)
      @content << '  '

      @content << if options[:as] == :text
                    HexletCode::Tag.build('textarea', cols: '20', rows: '40',
                                                      name: field_name) { object_value }
                  else
                    HexletCode::Tag.build('input', name: field_name, type: 'text', value: object_value)
                  end

      @content << "\n"
      self
    end
  end
end
