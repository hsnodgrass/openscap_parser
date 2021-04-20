# frozen_string_literal: true

module Oval
  class OvalObject
    attr_reader :type, :namespaces

    def initialize(parsed_xml: nil, type: nil)
      @parsed_xml = parsed_xml
      @type = type
    end

    def id
      @id ||= @parsed_xml['id']
    end

    def namespace
      @namespace ||= @parsed_xml.namespace
    end

    def version
      @version ||= @parsed_xml['version']
    end

    def comment
      @comment ||= @parsed_xml['comment']
    end

    def deprecated
      @deprecated ||= @parsed_xml['deprecated']
    end

    def children
      @children ||= @parsed_xml&.children
    end

    def children_hash(parent_hash, child_nodes) # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
      child_nodes.each do |data|
        ch = {}
        chtype = data.name
        ch[:text] = data.text unless data&.text&.nil? || data&.text&.strip&.empty?
        data.attribute_nodes.each do |node|
          ch[node.name.to_sym] = node.value
        end
        sub_ch = {}
        children_hash(sub_ch, data.children) unless data&.children&.empty?
        sub_ch.each do |k, v|
          ch[k] = v unless v.empty? || v.nil?
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
        deprecated: deprecated,
        namespace: namespace
      }
      children_hash(h, children)
      h
    end
  end
end
