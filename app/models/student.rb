class Student < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :rutgers_class
end
