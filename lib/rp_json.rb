# frozen_string_literal: true

require 'rp_json/version'
require 'rp_json/lexer'
require 'rp_json/parser'

module RpJson
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
end
