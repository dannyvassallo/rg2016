class AddAssignmentIdToObjectives < ActiveRecord::Migration
  def change
    add_column :objectives, :assignment_id, :integer
  end
end
