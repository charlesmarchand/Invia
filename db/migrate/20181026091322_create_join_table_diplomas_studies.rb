class CreateJoinTableDiplomasStudies < ActiveRecord::Migration[5.2]
  def change
    create_join_table :studies, :diplomas
  end
end
