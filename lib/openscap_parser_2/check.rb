# frozen_string_literal: true

require 'openscap_parser_2/check_import'
require 'openscap_parser_2/check_export'
require 'openscap_parser_2/check_content_ref'

# RuleIdentifier interface as an object
module OpenscapParser
  class Check < XmlNode
    def system
      @system ||= @parsed_xml&.attr('system')
    end

    def check_import_node
      @check_import_node ||= @parsed_xml&.at_xpath('check-import')
    end

    def check_export_node
      @check_export_node ||= @parsed_xml&.at_xpath('check-export')
    end

    def check_content_ref_node
      @check_content_ref_node ||= @parsed_xml&.at_xpath('check-content-ref')
    end

    def check_import
      @check_import ||= OpenscapParser::CheckImport.new(parsed_xml: check_import_node)
    end

    def check_export
      @check_export ||= OpenscapParser::CheckExport.new(parsed_xml: check_export_node)
    end

    def check_content_ref
      @check_content_ref ||= OpenscapParser::CheckContentRef.new(parsed_xml: check_content_ref_node)
    end

    def to_h
      {
        system: system,
        check_import: check_import.to_h,
        check_export: check_export.to_h,
        check_content_ref: check_content_ref.to_h
      }
    end
  end
end
