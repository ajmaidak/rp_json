# frozen_string_literal: true

module RpJson
  class Lexer
    def self.tokens(string)
      tokens = []
      until string.empty?
        json_string, string = lex_string(string)
        unless json_string.nil?
          tokens.append(json_string)
          next
        end

        json_number, string = lex_number(string)
        unless json_number.nil?
          tokens.append(json_number)
          next
        end

        json_boolean, string = lex_bool(string)
        unless json_boolean.nil?
          tokens.append(json_boolean)
          next
        end

        json_null, string = lex_null(string)
        unless json_null.nil?
          tokens.append(nil)
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

    def self.lex_number(string)
      json_number = ''
      numbers = (0..9).map(&:to_s).append('-', 'e', '.')

      string.each_char do |c|
        if numbers.include?(c)
          json_number += c
        else
          break
        end
      end

      rest = string.delete_prefix(json_number)

      if json_number.empty?
        return nil, string
      end

      if json_number.include?('.')
        return json_number.to_f, rest
      end

      [json_number.to_i, rest]
    end

    def self.lex_bool(string)
      string_len = string.length

      if string_len >= TRUE_LEN && string.start_with?('true')
        return true, string.delete_prefix('true')
      elsif string_len >= FALSE_LEN && string.start_with?('false')
        return false, string.delete_prefix('false')
      end

      [nil, string]
    end

    def self.lex_null(string)
      string_len = string.length

      if string_len >= NULL_LEN && string.start_with?('null')
        return true, string.delete_prefix('null')
      end

      [nil, string]
    end
  end
end
