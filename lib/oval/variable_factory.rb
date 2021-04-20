# frozen_string_literal: true

require 'nokogiri'
require 'oval/objects/oval_object'
require 'oval/objects/registry_object'
require 'oval/objects/sid_sid_object'
require 'oval/objects/userright_object'

module Oval
  class VariableFactory
    def build(xml: nil)
      if xml.children.empty?
        Oval::SimpleVariable.new(parsed_xml: xml)
      else
        Oval::ComplexVariable.new(parsed_xml: xml)
      end
    end
  end
end
