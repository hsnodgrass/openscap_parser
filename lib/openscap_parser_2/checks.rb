# frozen_string_literal: true

require 'openscap_parser_2/check'
require 'openscap_parser_2/complex_check'

module OpenscapParser
  # Methods related to parsing checks
  module Checks
    def self.included(base)
      base.class_eval do
        def check_objects
          @check_objects ||= check_nodes.map do |check_node|
            Check.new(parsed_xml: check_node)
          end
        end
        alias_method :checks, :check_objects

        def complex_check_objects
          @complex_check_objects ||= check_nodes('complex-check').map do |node|
            ComplexCheck.new(parsed_xml: node)
          end
        end
        alias_method :complex_checks, :complex_check_objects

        def check_nodes(xpath = 'check')
          xpath_nodes(xpath)
        end
      end
    end
  end
end
