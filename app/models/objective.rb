class Objective < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :assignment

  require 'csv'

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Objective.create!(row.to_hash)
    end
  end
end
