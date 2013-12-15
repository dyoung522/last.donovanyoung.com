class ChinaAdventure < ActiveRecord::Base
  attr_accessible :content, :date, :title
  validates :title, :date, :content, presence: true

  default_scope order("date asc")
end
