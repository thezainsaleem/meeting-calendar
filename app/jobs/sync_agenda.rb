# frozen_string_literal: true

class SyncAgenda
  include Sidekiq::Worker
  sidekiq_options retry: true

  def perform(options = {})
    AgendaSyncer.new(options).call
  end
end
