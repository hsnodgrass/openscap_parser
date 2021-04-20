# frozen_string_literal: true

require 'openscap_parser_2/xml_node'

module Oval
  class ExtendDefinition < ::OpenscapParser::XmlNode
    def definition_ref
      @definition_ref ||= @parsed_xml['definition_ref']
    end

    def negate
      @negate ||= @parsed_xml['negate']
    end

    def comment
      @comment ||= @parsed_xml['comment']
    end

    def applicability_check
      @applicability_check ||= @parsed_xml['applicability_check']
    end

    def to_h
      {
        :definition_ref => definition_ref,
        :negate => negate,
        :comment => comment,
        :applicability_check => applicability_check,
      }
    end
  end
end
