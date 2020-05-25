# frozen_string_literal: true

module RpJson
  class Parser
    def self.parse_array(tokens)
      json_array = []

      t = tokens.first

      if t == JSON_RIGHTBRACKET
        return [json_array, tokens.drop(1)]
      end

      loop do
        json, tokens = parse(tokens)
        json_array.append(json)

        t = tokens.first
        if t == JSON_RIGHTBRACKET
          return [json_array, tokens.drop(1)]
        elsif t != JSON_COMMA
          raise 'Expected comma after object in array'
        else
          tokens.drop(1)
        end
      end

      raise 'exepected end-of-array braket'
    end

    def self.parse_object(tokens)
      json_object = {}

      t = tokens.first

      if t == JSON_RIGHTBRACE
        return json_object, tokens.drop(1)
      end

      loop do
        json_key = tokens.first

        if json_key.is_a?(String)
          tokens = tokens.drop(1)
        else
          raise "Expected string key, got: #{json_key}"
        end

        if tokens.first != JSON_COLON
          raise "Expected colon after key in object, got: #{tokens.first}"
        end

        json_value, tokens = parse(tokens.drop(1))

        json_object[json_key] = json_value

        t = tokens.first

        if t == JSON_RIGHTBRACE
          return json_object, tokens.drop(1)
        elsif t != JSON_COMMA
          raise 'Expected comma after pair in object, got: #{t}'
        end

        tokens = tokens.drop(1)
      end

      raise 'Expected end-of-object brace'
    end

    def self.parse(tokens)
      t = tokens.first

      if t == JSON_LEFTBRACKET
        parse_array(tokens.drop(1))
      elsif t == JSON_LEFTBRACE
        parse_object(tokens.drop(1))
      else
        [t, tokens.drop(1)]
      end
    end
  end
end
