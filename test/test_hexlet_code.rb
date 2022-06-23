# frozen_string_literal: true

require 'test_helper'

class TestHexletCode < Minitest::Test
  User = Struct.new(:name, :job, keyword_init: true)

  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_tag_build_with_single_tag
    tag_name     = 'input'
    attributes   = { type: 'submit', value: 'Save' }
    expected_tag = '<input type="submit" value="Save">'

    assert { HexletCode::Tag.build(tag_name, attributes) == expected_tag }
  end

  def test_tag_build_with_paried_tag
    expected_tag = '<label for="email">Email</label>'

    assert { (HexletCode::Tag.build('label', for: 'email') { 'Email' }) == expected_tag }
  end

  def test_form_for_without_url
    user = User.new(name: 'rob')

    expected_tag    = '<form action="#" method="post"></form>'
    form_for_result = HexletCode.form_for user

    assert { form_for_result == expected_tag }
  end

  def test_form_for_with_url
    user = User.new(name: 'rob')
    url  = '/users'

    expected_tag    = '<form action="/users" method="post"></form>'
    form_for_result = HexletCode.form_for user, url: url

    assert { form_for_result == expected_tag }
  end
end
