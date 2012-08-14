class ChinaAdventure < ActiveRecord::Base
  attr_accessible :content, :date, :title
  validates :title, :date, :content, presence: true
end
