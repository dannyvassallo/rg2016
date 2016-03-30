class RutgersClass < ActiveRecord::Base
  extend FriendlyId
  friendly_id :class_name, use: :slugged

  has_many :students, dependent: :destroy
end
