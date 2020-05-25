# frozen_string_literal: true

require "test_helper"

module RpJson
  class RpJsonParserTest < Minitest::Test
    def test_parse_array
      json = '{ "foo": [1, 2] }'
      tokens = Lexer.tokens(json)
      assert_equal({ "foo" => [1, 2] }, Parser.parse(tokens)[0])
    end

    def test_parser_object
      json = '{"foo": {"bar": 2}}'
      tokens = Lexer.tokens(json)
      assert_equal({ "foo" => { "bar" => 2 } }, Parser.parse(tokens)[0])
    end

    def test_parser_object_and_array
      json = '{"foo": [1, 2, {"bar": 2}]}'
      tokens = Lexer.tokens(json)
      assert_equal({ "foo" => [1, 2, { "bar" => 2 }] }, Parser.parse(tokens)[0])
    end
  end
end
