# frozen_string_literal: true

require 'openscap_parser_2/xml_node'
require 'oval/criterion'
require 'oval/extend_definition'

module Oval
  class Criteria < ::OpenscapParser::XmlNode
    def operator
      @operator ||= @parsed_xml['operator']
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

    def criteria_nodes
      @criteria_nodes ||= @parsed_xml.xpath('./criteria')
    end

    def criteria
      @criteria ||= criteria_nodes.map { |node| Criteria.new parsed_xml: node }
    end

    def criterion_nodes
      @criterion_nodes ||= @parsed_xml.xpath('./criterion')
    end

    def criterion
      @criterion ||= criterion_nodes.map { |node| Criterion.new parsed_xml: node }
    end

    def extend_definition_nodes
      @extend_definition_nodes ||= @parsed_xml.xpath('./extend_definition')
    end

    def extend_definition
      @extend_definition ||= extend_definition_nodes.map { |node| ExtendDefinition.new parsed_xml: node }
    end

    def to_h
      {
        :operator => operator,
        :negate => negate,
        :comment => comment,
        :applicability_check => applicability_check,
        :criteria => criteria.map(&:to_h),
        :criterion => criterion.map(&:to_h),
        :extend_definition => extend_definition.map(&:to_h),
      }
    end
  end
end
