# frozen_string_literal: true

require 'openscap_parser_2/xml_node'
require 'oval/criteria'
require 'oval/metadata'
require "oval/reference"

module Oval
  class Definition < ::OpenscapParser::XmlNode
    def id
      @id ||= @parsed_xml['id']
    end

    def version
      @version ||= @parsed_xml['version']
    end

    def klass
      @klass ||= @parsed_xml['class']
    end

    def deprecated
      @deprecated ||= @parsed_xml['deprecated']
    end

    def metadata
      @metadata ||= Metadata.new parsed_xml: @parsed_xml.at_xpath("./metadata")
    end

    def criteria
      if @criteria
        @criteria
      else
        Criteria.new parsed_xml: @parsed_xml.at_xpath('./criteria') if @parsed_xml.at_xpath('./criteria')
      end
    end

    def to_h
      h = {
        :id => id,
        :version => version,
        :klass => klass,
        :deprecated => deprecated,
        :metadata => metadata.to_h
      }
      h[:criteria] = criteria.to_h if criteria.respond_to?(:to_h)
      h
    end
  end
end
