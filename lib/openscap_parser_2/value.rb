# frozen_string_literal: true

module OpenscapParser
  class Value < XmlNode
    def id
      @id ||= parsed_xml&.attr('id')
    end

    def operator
      @operator ||= parsed_xml&.attr('operator')
    end

    def type
      @type ||= parsed_xml&.attr('type')
    end

    def title
      @title ||= parsed_xml&.at_xpath('./title')&.text
    end

    def description
      @description ||= parsed_xml&.at_xpath('./description')&.text
    end

    def value
      @value ||= parsed_xml&.at_xpath('./value')&.text
    end

    def to_h
      {
        id: id,
        operator: operator,
        type: type,
        title: title,
        description: description,
        value: value
      }
    end
  end
end
