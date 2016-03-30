class CreateRutgersClasses < ActiveRecord::Migration
  def change
    create_table :rutgers_classes do |t|
      t.string :class_name

      t.timestamps null: false
    end
  end
end
