# frozen_string_literal: true

require 'openscap_parser_2/complex_check'
require 'openscap_parser_2/rule_identifier'
require 'openscap_parser_2/rule_references'
require 'openscap_parser_2/fixes'
require 'openscap_parser_2/xml_file'

# Mimics openscap-ruby Rule interface
module OpenscapParser
  class Rule < XmlNode
    include OpenscapParser::Util
    include OpenscapParser::RuleReferences
    include OpenscapParser::Fixes
    include OpenscapParser::Checks

    def id
      @id ||= parsed_xml['id']
    end

    def selected
      @selected ||= parsed_xml['selected']
    end

    def role
      @role ||= parsed_xml['role']
    end

    def severity
      @severity ||= parsed_xml['severity']
    end

    def title
      @title ||= parsed_xml&.at_css('title')&.text
    end

    def description
      @description ||= newline_to_whitespace(
        parsed_xml&.at_css('description')&.text || ''
      )
    end

    def rationale
      @rationale ||= newline_to_whitespace(
        parsed_xml&.at_css('rationale')&.text || ''
      )
    end

    def rule_reference_nodes(xpath = 'reference')
      rule_reference_nodes_old(xpath)
    end
    alias rule_reference_nodes_old rule_reference_nodes

    def rule_identifier
      @rule_identifier ||= RuleIdentifier.new(parsed_xml: identifier_node)
    end
    alias identifier rule_identifier

    def identifier_node
      @identifier_node ||= parsed_xml.at_xpath('ident')
    end

    def complex_check_node
      @complex_check_node ||= parsed_xml.at_xpath('complex-check')
    end

    def complex_check
      @complex_check ||= find_complex_check
    end

    def to_h
      {
        id: id,
        selected: selected,
        role: role,
        severity: severity,
        title: title,
        description: description,
        rationale: rationale,
        identifier: rule_identifier.to_h,
        complex_check: complex_check.to_h,
        checks: check_objects.map(&:to_h)
      }
    end

    private

    def find_complex_check
      return nil if complex_check_node.nil?

      ComplexCheck.new parsed_xml: complex_check_node
    end
  end
end
