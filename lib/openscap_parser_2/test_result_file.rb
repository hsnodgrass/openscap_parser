# frozen_string_literal: true
require 'openscap_parser_2/xml_file'
require 'openscap_parser_2/benchmarks'
require 'openscap_parser_2/test_results'

module OpenscapParser
  # A class to represent an XmlFile which contains a <TestResult /> Xccdf type
  class TestResultFile < XmlFile
    include ::OpenscapParser::Benchmarks
    include ::OpenscapParser::TestResults
  end
end
