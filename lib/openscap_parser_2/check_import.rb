# frozen_string_literal: true

module OpenscapParser
  class CheckImport < XmlNode
    def import_name
      @import_name ||= @parsed_xml&.attr('import-name')
    end

    def to_h
      { import_name: import_name }
    end
  end
end
