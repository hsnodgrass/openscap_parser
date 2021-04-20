# frozen_string_literal: true

require 'openscap_parser_2/util'
require 'openscap_parser_2/xml_file'
require 'openscap_parser_2/rules'
require 'openscap_parser_2/profiles'
require 'openscap_parser_2/rule_references'
require 'openscap_parser_2/values'

# Mimics openscap-ruby Benchmark interface
module OpenscapParser
  class Benchmark < XmlNode
    include OpenscapParser::Util
    include OpenscapParser::Rules
    include OpenscapParser::RuleReferences
    include OpenscapParser::Profiles
    include OpenscapParser::Values

    def id
      @id ||= @parsed_xml['id']
    end

    def title
      @title ||= @parsed_xml&.xpath('title')&.text
    end

    def description
      @description ||= newline_to_whitespace(
        @parsed_xml.xpath('description') &&
          @parsed_xml.xpath('description').text || ''
      )
    end

    def version
      @version ||= @parsed_xml&.xpath('version')&.text
    end
  end
end
