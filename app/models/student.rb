class Student < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :rutgers_class

  require 'csv'

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Student.create!(row.to_hash)
    end
  end


end
