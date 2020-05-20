# frozen_string_literal: true

require "test_helper"

module RpJson
  class RpJsonLexerTest < Minitest::Test
    def test_empty
      assert_equal([], Lexer.tokens(""))
    end

    def test_symbols
      assert_equal(['{', '}'], Lexer.tokens("{}"))
    end

    def test_string
      assert_equal(['{', 'foo', ':', 'bar', '}'], Lexer.tokens('{"foo":"bar"}'))
    end
  end
end
