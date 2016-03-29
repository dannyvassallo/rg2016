class AddColumnToRutgersClasses < ActiveRecord::Migration
  def change
    add_column :rutgers_classes, :slug, :string
  end
end
