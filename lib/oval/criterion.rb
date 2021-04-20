# frozen_string_literal: true

require 'openscap_parser_2/xml_node'

module Oval
  class Criterion < ::OpenscapParser::XmlNode
    def test_ref
      @test_ref ||= @parsed_xml['test_ref']
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
        :test_ref => test_ref,
        :negate => negate,
        :comment => comment,
        :applicability_check => applicability_check,
      }
    end
  end
end
