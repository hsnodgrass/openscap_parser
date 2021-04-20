# frozen_string_literal: true

require 'openscap_parser_2/xml_file'
require 'oval/definition_result'
require 'oval/definition'
require 'oval/state'
require 'oval/test'
require 'oval/object'
require 'oval/variable'

module OpenscapParser
  class OvalReport < XmlFile
    def definition_results
      @definition_results ||= definition_result_nodes.map { |node| ::Oval::DefinitionResult.new parsed_xml: node }
    end

    def definition_result_nodes(xpath = './oval_results/results/system/definitions/definition')
      xpath_nodes(xpath)
    end

    def definitions
      @definitions ||= definition_nodes.map { |node| Oval::Definition.new parsed_xml: node }.sort_by(&:id)
    end

    def definition_nodes(xpath = './/oval_definitions/definitions/definition')
      xpath_nodes(xpath)
    end

    def tests
      @tests ||= test_nodes.map { |node| Oval::Test.new parsed_xml: node }.sort_by(&:id)
    end

    def test_nodes(xpath = './/oval_definitions/tests/*')
      xpath_nodes(xpath)
    end

    def objects
      @objects ||= object_nodes.map { |node| Oval::Object.new parsed_xml: node }.sort_by(&:id)
    end

    def object_nodes(xpath = './/oval_definitions/objects/*')
      xpath_nodes(xpath)
    end

    def states
      @states ||= state_nodes.map { |node| Oval::State.new parsed_xml: node }.sort_by(&:id)
    end

    def state_nodes(xpath = './/oval_definitions/states/*')
      xpath_nodes(xpath)
    end

    def variables
      @variables ||= variable_nodes.map { |node| Oval::Variable.new parsed_xml: node }.sort_by(&:id)
    end

    def variable_nodes(xpath = './/oval_definitions/variables/*')
      xpath_nodes(xpath)
    end

    private

    def oval_object_factory
      @oval_object_factory ||= Oval::OvalObjectFactory.new
    end
  end
end
