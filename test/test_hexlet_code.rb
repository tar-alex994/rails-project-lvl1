# frozen_string_literal: true

require "test_helper"

class TestHexletCode < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_tag_build_with_single_tag
    tag_name     = "input"
    attributes   = { type: "submit", value: "Save" }
    expected_tag = '<input type="submit" value="Save">'

    assert { HexletCode::Tag.build(tag_name, attributes) == expected_tag }
  end

  def test_tag_build_with_paried_tag
    expected_tag = '<label for="email">Email</label>'

    assert { (HexletCode::Tag.build("label", for: "email") { "Email" }) == expected_tag }
  end
end
