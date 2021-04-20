# frozen_string_literal: true

require 'oval/objects/oval_object'

module Oval
  class SidSidObject < OvalObject
    def trustee_sid
      @trustee_sid ||= @parsed_xml.at_xpath('./trustee_sid')
    end

    def to_h
      sup_h = super
      h = {
        :trustee_sid_operation => trustee_sid['operation'],
        :trustee_sid_value => trustee_sid.text
      }
      sup_h.merge(h)
    end
  end
end
