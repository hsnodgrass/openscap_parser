# frozen_string_literal: true

require 'openscap_parser_2/checks'

# RuleIdentifier interface as an object
module OpenscapParser
  class ComplexCheck < XmlNode
    include OpenscapParser::Checks

    def operator
      @operator ||= @parsed_xml&.attr('operator')
    end

    def to_h
      {
        operator: operator,
        checks: check_objects.map(&:to_h),
        complex_checks: complex_check_objects.map(&:to_h)
      }
    end
  end
end
