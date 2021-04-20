# frozen_string_literal: true

require 'nokogiri'
require 'oval/objects/oval_object'
require 'oval/objects/registry_object'
require 'oval/objects/sid_sid_object'
require 'oval/objects/userright_object'

module Oval
  class OvalObjectFactory
    def build(xml: nil)
      type = xml&.name
      case type
      when 'registry_object'
        Oval::RegistryObject.new(parsed_xml: xml, type: type)
      when 'sid_sid_object'
        Oval::SidSidObject.new(parsed_xml: xml, type: type)
      when 'userright_object'
        Oval::UserRightObject.new(parsed_xml: xml, type: type)
      else
        Oval::OvalObject.new(parsed_xml: xml, type: type)
      end
    end
  end
end
