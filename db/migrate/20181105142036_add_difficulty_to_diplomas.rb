class AddDifficultyToDiplomas < ActiveRecord::Migration[5.2]
  def change
    remove_column :diplomas, :cost
    add_column :diplomas, :difficulty, :integer
  end
end
