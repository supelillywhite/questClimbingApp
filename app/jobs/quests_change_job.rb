class QuestsChangeJob < ApplicationJob
  queue_as :default

  def perform(quest)
    NOTIFIER.ping "This is from my job"
    quests = Quest.all
    quests.each do |x|
    	x.title = "bill"
    end
    p quests
  end
end
