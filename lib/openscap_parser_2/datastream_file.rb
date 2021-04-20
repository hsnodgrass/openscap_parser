# frozen_string_literal: true
require 'openscap_parser_2/xml_file'
require 'openscap_parser_2/benchmarks'

module OpenscapParser
  # A class to represent a datastream (-ds.xml) XmlFile
  class DatastreamFile < XmlFile
    include OpenscapParser::Benchmarks

    def valid?
      return true if @parsed_xml.root.name == 'data-stream-collection' && namespaces.keys.include?('xmlns:ds')

      false
    end
  end
end
