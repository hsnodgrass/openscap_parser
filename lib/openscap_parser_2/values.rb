# frozen_string_literal: true

require 'openscap_parser_2/value'

module OpenscapParser
  module Values
    def self.included(base)
      base.class_eval do
        def value_objects
          @value_objects ||= value_nodes.map do |value_node|
            Value.new(parsed_xml: value_node)
          end
        end
        alias_method :values, :value_objects

        def value_nodes(xpath = './/Value')
          xpath_nodes(xpath)
        end
      end
    end
  end
end
