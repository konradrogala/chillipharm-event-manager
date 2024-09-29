# frozen_string_literal: true

class Event
  def initialize(organizer:, name:, participiants: [])
    @organizer = organizer
    @name = name
    @participiants = participiants
  end

  def show
    puts "Organizer: #{@organizer}, Name: #{@name}, Participiants: #{@participiants}"
  end

  attr_reader :organizer, :name, :participiants
end
