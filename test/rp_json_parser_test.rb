# frozen_string_literal: true

require "test_helper"

module RpJson
  class RpJsonParserTest < Minitest::Test
    def test_parser
      json = '{"foo": [1, 2, {"bar": 2}]}'
      tokens = Lexer.tokens(json)
      assert_equal(Parser.parse(tokens), { "foo" => [1, 2, { "bar" => 2 }] })
    end
  end
end
