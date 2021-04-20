# frozen_string_literal: true

# RuleReference interface as an object
module OpenscapParser
  class RuleReference < XmlNode
    def href
      @href ||= @parsed_xml&.attr('href')
    end

    def label
      @label ||= @parsed_xml&.text
    end
  end
end
