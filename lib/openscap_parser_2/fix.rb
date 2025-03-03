# frozen_string_literal: true
require 'openscap_parser_2/xml_node'
require 'openscap_parser_2/subs'

module OpenscapParser
  class Fix < XmlNode
    include OpenscapParser::Subs

    def id
      @id ||= @parsed_xml&.attr('id')
    end

    def system
      @system ||= @parsed_xml&.attr('system')
    end

    def complexity
      @complexity ||= @parsed_xml&.attr('complexity')
    end

    def disruption
      @disruption ||= @parsed_xml&.attr('disruption')
    end

    def strategy
      @strategy ||= @parsed_xml['strategy']
    end

    def full_text(set_values)
      full_text_lines(set_values).join
    end

    def full_text_lines(set_values)
      map_child_nodes(set_values).map do |text_node|
        text_node.respond_to?(:text) ? text_node.text : ''
      end
    end

    def map_child_nodes(set_values = [])
      map_sub_nodes @parsed_xml.children, set_values
    end

    def to_h
      {
        id: id,
        system: system,
        complexity: complexity,
        disruption: disruption,
        strategy: strategy,
        text: text,
        subs: subs.map(&:to_h)
      }
    end
  end
end
