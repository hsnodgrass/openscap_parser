# frozen_string_literal: true

require 'openscap_parser_2/xml_node'
require 'oval/affected'
require 'oval/reference'

module Oval
  class Metadata < ::OpenscapParser::XmlNode
    def title
      @title ||= @parsed_xml&.at_xpath('./title')&.text
    end

    def description
      @description ||= @parsed_xml&.at_xpath('./description')&.text
    end

    def affected_nodes
      @affected_nodes ||= @parsed_xml&.xpath('./affected')
    end

    def affected
      @affected ||= affected_nodes&.map { |node| Affected.new parsed_xml: node }
    end

    def reference_nodes
      @reference_nodes ||= @parsed_xml&.xpath('./reference')
    end

    def references
      @references ||= reference_nodes&.map { |node| Reference.new parsed_xml: node }
    end

    def to_h
      {
        title: title,
        description: description,
        affected: affected.map(&:to_h),
        references: references.map(&:to_h)
      }
    end
  end
end
