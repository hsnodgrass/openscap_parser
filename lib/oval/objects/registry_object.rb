# frozen_string_literal: true

require 'oval/objects/oval_object'

module Oval
  class RegistryObject < OvalObject
    def hive
      @hive ||= @parsed_xml&.at_xpath('./hive')&.text
    end

    def name
      @name ||= @parsed_xml&.at_xpath('./name')&.text
    end

    def key_operation
      @key_operation ||= @parsed_xml&.at_xpath('./key')&.attr('operation')
    end

    def key
      @key ||= @parsed_xml&.at_xpath('./key')&.text
    end

    def to_h
      sup_h = super
      h = {
        hive: hive,
        name: name,
        key_operation: key_operation,
        key: key
      }
      sup_h.merge(h)
    end
  end
end
