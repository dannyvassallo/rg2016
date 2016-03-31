class Assignment < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  has_many :student_assignments
  has_many :students, through: :student_assignments
  has_many :objectives
end
