# frozen_string_literal: true

require 'openscap_parser_2/xml_node'

module Oval
  class Affected < ::OpenscapParser::XmlNode
    def family
      @family ||= @parsed_xml['family']
    end

    def platform_nodes
      @platform_nodes ||= @parsed_xml.xpath('./platform')
    end

    def platforms
      @platforms||= platform_nodes.map(&:text)
    end

    def product_nodes
      @product_nodes ||= @parsed_xml.xpath('./product')
    end

    def products
      @products ||= product_nodes.map(&:text)
    end

    def to_h
      {
        :family => family,
        :platforms => platforms,
        :products => products,
      }
    end
  end
end
