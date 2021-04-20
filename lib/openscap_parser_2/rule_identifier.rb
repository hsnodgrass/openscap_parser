# frozen_string_literal: true

# RuleIdentifier interface as an object
module OpenscapParser
  class RuleIdentifier < XmlNode
    def label
      @label ||= @parsed_xml&.text
    end

    def system
      @system ||= @parsed_xml&.attr('system')
    end

    def controlURI # rubocop:disable Naming/MethodName
      @controlURI ||= @parsed_xml&.attr('controlURI') # rubocop:disable Naming/VariableName
    end

    def to_h
      {
        label: label,
        system: system,
        controlURI: controlURI
      }
    end
  end
end
