# frozen_string_literal: true

require "test_helper"

class RpJsonTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil(::RpJson::VERSION)
  end

  def test_it_does_something_useful
    assert(true)
  end

  def test_empty_object
    assert_equal(RpJson.parse('{}'), {})
  end

  def test_basic_object
    assert_equal(RpJson.parse('{"foo":"bar"}'), { "foo" => "bar" })
  end

  def test_basic_number
    assert_equal(RpJson.parse('{"foo":1}'), { "foo" => 1 })
  end

  def test_empty_array
    assert_equal(RpJson.parse('{"foo":[]}'), { "foo" => [] })
  end

  def test_basic_array
    assert_equal(RpJson.parse('{"foo":[1,2,"three"]}'), { "foo" => [1, 2, "three"] })
  end
end
