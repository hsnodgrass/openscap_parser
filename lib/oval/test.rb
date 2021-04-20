# frozen_string_literal: true

require 'openscap_parser_2/xml_node'

module Oval
  class Test < ::OpenscapParser::XmlNode
    def id
      @id ||= @parsed_xml['id']
    end

    def type
      @type ||= @parsed_xml.name
    end

    def version
      @version ||= @parsed_xml['version']
    end

    def comment
      @comment ||= @parsed_xml['comment']
    end

    def check_existence
      @check_existence ||= @parsed_xml['check_existence']
    end

    def check
      @check ||= @parsed_xml['check']
    end

    def state_operator
      @state_operator ||= @parsed_xml['state_operator']
    end

    def deprecated
      @deprecated ||= @parsed_xml['deprecated']
    end

    def object_ref
      @object_ref ||= @parsed_xml&.at_xpath('./object')&.attr('object_ref')
    end

    def state_ref
      @state_ref ||= @parsed_xml&.at_xpath('./state')&.attr('state_ref')
    end

    def to_h
      {
        id: id,
        type: type,
        version: version,
        comment: comment,
        check_existence: check_existence,
        check: check,
        state_operator: state_operator,
        deprecated: deprecated,
        object_ref: object_ref,
        state_ref: state_ref
      }
    end

    private

    def find_object_ref
      @parsed_xml&.at_xpath('./object')&.attr('object_ref')
    end
  end
end
