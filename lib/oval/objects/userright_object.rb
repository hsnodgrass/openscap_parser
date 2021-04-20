# frozen_string_literal: true

require 'oval/objects/oval_object'

module Oval
  class UserRightObject < OvalObject
    def userright
      @userright ||= @parsed_xml.at_xpath('./userright')
    end

    def to_h
      sup_h = super
      h = {
        :userright_operation => userright['operation'],
        :userright_value => userright.text
      }
      sup_h.merge(h)
    end
  end
end
