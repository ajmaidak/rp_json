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
    assert_equal({}, RpJson.parse('{}'))
  end

  def test_basic_object
    assert_equal({ "foo" => "bar" }, RpJson.parse('{"foo":"bar"}'))
  end

  def test_basic_number
    assert_equal({ "foo" => 1 }, RpJson.parse('{"foo":1}'))
  end

  def test_empty_array
    assert_equal({ "foo" => [] }, RpJson.parse('{"foo":[]}'))
  end

  def test_basic_array
    assert_equal({ "foo" => [1, 2, "three"] }, RpJson.parse('{"foo":[1,2,"three"]}'))
  end

  def test_nested_object
    assert_equal({ "foo" => { "bar" => 2 } }, RpJson.parse('{"foo":{"bar":2}}'))
  end

  def test_true
    assert_equal({ "foo" => true }, RpJson.parse('{"foo":true}'))
  end

  def test_false
    assert_equal({ "foo" => false }, RpJson.parse('{"foo":false}'))
  end

  def test_null
    assert_equal({ "foo" => nil }, RpJson.parse('{"foo":null}'))
  end

  def test_basic_whitespace
    assert_equal({ "foo" => [1, 2, "three"] }, RpJson.parse('{ "foo" : [1, 2, "three"] }'))
  end

  # taken from: https://github.com/ruby/ruby/blob/master/test/json/json_parser_test.rb
  def test_parse_simple_arrays
    assert_equal([], RpJson.parse('[]'))
    assert_equal([], RpJson.parse('  [  ] '))
    assert_equal([nil], RpJson.parse('[null]'))
    assert_equal([false], RpJson.parse('[false]'))
    assert_equal([true], RpJson.parse('[true]'))
    assert_equal([-23], RpJson.parse('[-23]'))
    assert_equal([23], RpJson.parse('[23]'))
    assert_equal([0.23], RpJson.parse('[0.23]'))
    assert_equal([0.0], RpJson.parse('[0e0]'))
    assert_equal([""], RpJson.parse('[""]'))
    assert_equal(["foobar"], RpJson.parse('["foobar"]'))
    assert_equal([{}], RpJson.parse('[{}]'))
  end
end
