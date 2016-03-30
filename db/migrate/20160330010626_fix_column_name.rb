class FixColumnName < ActiveRecord::Migration
  def self.up
    rename_column :students, :class_id, :rutgers_class_id
  end
end
