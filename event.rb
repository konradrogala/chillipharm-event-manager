# frozen_string_literal: true

class Event
  class ParticipantLimitReachedError < StandardError; end

  def initialize(organizer:, name:, participants_limit:, participiants: [])
    @organizer = organizer
    @name = name
    @participiants = participiants
    @participants_limit = participants_limit
  end

  def add_participant(participant)
    raise ParticipantLimitReachedError if @participiants.size >= @participants_limit.to_i

    @participiants << participant
  end

  attr_reader :organizer, :name, :participiants, :participants_limit
end
