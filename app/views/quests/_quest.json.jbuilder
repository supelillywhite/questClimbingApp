json.extract! quest, :id, :title, :description, :picture, :gear, :created_at, :updated_at
json.url quest_url(quest, format: :json)
