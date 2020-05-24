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

    def test_int_number
      assert_equal(['{', 'foo', ':', 8, '}'], Lexer.tokens('{"foo": 8}'))
    end

    def test_float_number
      assert_equal(['{', 'foo', ':', 8.1, '}'], Lexer.tokens('{"foo": 8.1}'))
    end

    def test_scientific_number
      assert_equal(['{', 'foo', ':', 1.2e10, '}'], Lexer.tokens('{"foo": 1.2e10}'))
    end

    def test_boolean
      assert_equal(['{', 'foo', ':', true, '}'], Lexer.tokens('{"foo":true}'))
      assert_equal(['{', 'foo', ':', false, '}'], Lexer.tokens('{"foo":false}'))
    end
  end
end
