# frozen_string_literal: true

require 'openscap_parser_2/xml_node'

module Oval
  class Object < ::OpenscapParser::XmlNode
    def id
      @id ||= parsed_xml['id']
    end

    def type
      @type ||= parsed_xml.name
    end

    def version
      @version ||= parsed_xml['version']
    end

    def comment
      @comment ||= parsed_xml['comment']
    end

    def deprecated
      @deprecated ||= parsed_xml['deprecated']
    end

    def children
      @children ||= parsed_xml&.children
    end

    def children_hash(parent_hash, child_nodes) # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
      child_nodes.each do |data|
        ch = {}
        chtype = data.name
        ch[:text] = data.text unless data&.text&.nil? || data&.text&.strip&.empty?
        data.attribute_nodes.each do |node|
          ch[node.name.to_sym] = node.value
        end
        parent_hash[chtype.to_sym] = ch
      end
    end

    def to_h
      h = {
        id: id,
        type: type,
        version: version,
        comment: comment,
        deprecated: deprecated
      }
      children_hash(h, children)
      h
    end
  end
end
