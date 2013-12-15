class ChinaAdventure < ActiveRecord::Base
  validates :title, :date, :content, presence: true
  default_scope order("date asc")
end
