
# rubocop:disable Metrics/BlockLength
namespace :agenda_syncer do
  desc "Sync All Mentors Calendars"
  task sync_calendars: :environment do
    Mentor.all.includes(:calendar).find_each.map do |mentor|
      AgendaSyncer.new({
        mentor_id: mentor.id,
        calendar_id: mentor.calendar.id
      }).call
    end
  end
end
# rubocop:enable Metrics/BlockLength
