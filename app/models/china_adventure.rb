class ChinaAdventure < ActiveRecord::Base
  attr_accessible :content, :date, :title
  validates :title, :date, :content, presense: true
  validates :date, length: { is: 8 }, numericality: { only_integer: true }
end
