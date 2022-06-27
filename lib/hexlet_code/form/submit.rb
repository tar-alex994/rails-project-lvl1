# frozen_string_literal: true

# Submit class is responsible for creating and presenting submits
class Submit
  def initialize(submit_text)
    @submit_text = submit_text
  end

  def to_html
    HexletCode::Tag.build('input', name: 'commit', type: 'submit', value: @submit_text)
  end
end
