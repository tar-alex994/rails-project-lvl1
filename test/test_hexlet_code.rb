# frozen_string_literal: true

require 'test_helper'

class TestHexletCode < Minitest::Test
  User = Struct.new(:name, :job, :gender, keyword_init: true)

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

    expected_tag    = "<form action=\"#\" method=\"post\">\n</form>"
    result_form_for = HexletCode.form_for user

    assert { result_form_for == expected_tag }
  end

  def test_form_for_with_url
    user = User.new(name: 'rob')
    url  = '/users'

    expected_tag    = "<form action=\"/users\" method=\"post\">\n</form>"
    result_form_for = HexletCode.form_for user, url: url

    assert { result_form_for == expected_tag }
  end

  def test_form_for_with_inputs
    user = User.new(name: 'rob', job: 'hexlet', gender: 'm')

    expected_tag    = file_fixture('form_for_with_inputs')
    result_form_for = HexletCode.form_for(user) do |f|
      f.input :name
      f.input :job, as: :text
    end

    assert { result_form_for == expected_tag }
  end

  def test_form_for_with_inputs_and_url
    user = User.new(name: 'rob', job: 'hexlet', gender: 'm')

    expected_tag    = file_fixture('form_for_with_inputs_and_url')
    result_form_for = HexletCode.form_for(user, url: '/users') do |f|
      f.input :name
      f.input :job, as: :text
    end

    assert { result_form_for == expected_tag }
  end

  def test_form_for_with_button
    user         = User.new(job: 'hexlet')
    expected_tag = file_fixture('form_for_with_button')

    result_form_for = HexletCode.form_for(user) do |f|
      f.input :name
      f.input :job
      f.submit
    end

    assert { result_form_for == expected_tag }
  end

  def test_form_for_errors
    user = User.new(name: 'rob', job: 'hexlet', gender: 'm')

    assert_raises NoMethodError do
      HexletCode.form_for(user, url: 'users') do |f|
        f.input :name
        f.input :job, as: :text
        f.input :age
      end
    end
  end
end
