# frozen_string_literal: true

module RpJson
  class Lexer
    JSON_QUOTE = '"'
    JSON_WHITESPACE = [' ', '\t', '\b', '\n', '\r']
    FALSE_LEN = 'false'.length
    TRUE_LEN = 'true'.length
    NULL_LEN = 'null'.length

    def self.tokens(string)
      tokens = []
      string.each_char do
        json_string, string = lex_string(string)
        unless json_string.nil?
          tokens.append(json_string)
          next
        end
      end
    end

    def self.lex_string(string)
      json_string = ''

      if string.first == JSON_QUOTE
        string = string.drop(1)
      else
        return nil, string
      end

      string.each_char do |c|
        if c == JSON_QUOTE
          return json_string, string.drop(json_string.length + 1)
        else
          json_string += c
        end
      end

      raise('expected end-of-string quote')
    end
  end
end
