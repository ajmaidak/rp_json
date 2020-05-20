# frozen_string_literal: true

module RpJson
  class Lexer
    JSON_QUOTE = '"'
    JSON_WHITESPACE = [' ', '\t', '\b', '\n', '\r']
    FALSE_LEN = 'false'.length
    TRUE_LEN = 'true'.length
    NULL_LEN = 'null'.length
    JSON_COMMA = ','
    JSON_COLON = ':'
    JSON_LEFTBRACKET = '['
    JSON_RIGHTBRACKET = ']'
    JSON_LEFTBRACE = '{'
    JSON_RIGHTBRACE = '}'
    JSON_SYNTAX = [JSON_COMMA, JSON_COLON, JSON_LEFTBRACKET, JSON_RIGHTBRACKET,
                   JSON_LEFTBRACE, JSON_RIGHTBRACE]

    def self.tokens(string)
      tokens = []
      until string.empty?
        json_string, string = lex_string(string)
        unless json_string.nil?
          tokens.append(json_string)
          next
        end

        c = string[0]
        if JSON_WHITESPACE.include?(c)
          string = string.delete_prefix(c)
        elsif JSON_SYNTAX.include?(c)
          tokens.append(c)
          string = string.delete_prefix(c)
        else
          raise("Unexpected character: #{c}")
        end
      end
      tokens
    end

    def self.lex_string(string)
      json_string = ''

      if string.start_with?(JSON_QUOTE)
        string = string.delete_prefix(JSON_QUOTE)
      else
        return nil, string
      end

      string.each_char do |c|
        if c == JSON_QUOTE
          return json_string, string.delete_prefix(json_string + JSON_QUOTE)
        else
          json_string += c
        end
      end

      raise("expected end-of-string quote: #{json_string}")
    end
  end
end
