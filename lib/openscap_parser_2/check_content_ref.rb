# frozen_string_literal: true

# RuleIdentifier interface as an object
module OpenscapParser
  class CheckContentRef < XmlNode
    def name
      @name ||= @parsed_xml&.attr('name')
    end

    def href
      @href ||= @parsed_xml&.attr('href')
    end

    def to_h
      {
        name: name,
        href: href
      }
    end
  end
end
