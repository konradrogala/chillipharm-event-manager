# frozen_string_literal: true

require_relative '../event_operations'

module UserActions
  class Base
    include EventOperations

    def initialize(existed_events)
      @existed_events = existed_events
    end

    def navigation
      loop do
        show_navigation

        user_input = gets.chomp
        break if user_input == 'B'

        follow_navigation(user_input)
      end

      @existed_events
    end
  end
end
