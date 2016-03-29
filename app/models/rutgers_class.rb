class RutgersClass < ActiveRecord::Base
  extend FriendlyId
  friendly_id :class_name, use: :slugged
end
