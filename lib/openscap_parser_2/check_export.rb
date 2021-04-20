# frozen_string_literal: true

# RuleIdentifier interface as an object
module OpenscapParser
  class CheckExport < XmlNode
    def export_name
      @export_name ||= @parsed_xml&.attr('export-name')
    end

    def value_id
      @value_id ||= @parsed_xml&.attr('value-id')
    end

    def to_h
      {
        export_name: export_name,
        value_id: value_id
      }
    end
  end
end
