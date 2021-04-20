# frozen_string_literal: true

require 'openscap_parser_2/xml_node'

module Oval
  class State < ::OpenscapParser::XmlNode
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

    def children
      @children ||= parsed_xml.children
    end

    def children_hash # rubocop:disable Metrics/AbcSize
      h = {}
      children.each do |data|
        ch = {}
        chtype = data.name
        ch[:text] = data.text unless data.text.strip.empty?
        data.attribute_nodes.each do |node|
          ch[node.name.to_sym] = node.value
        end
        h[chtype.to_sym] = ch unless ch.empty?
      end
      h
    end

    def to_h
      h = {
        id: id,
        type: type,
        version: version,
        comment: comment
      }
      h.merge(children_hash)
    end
  end
end
