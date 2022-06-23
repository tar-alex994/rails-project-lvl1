# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'hexlet_code'

require 'minitest/autorun'
require 'minitest-power_assert'

def file_fixture(fixture_name)
  File.read("#{__dir__}/fixtures/#{fixture_name}.html")
end
