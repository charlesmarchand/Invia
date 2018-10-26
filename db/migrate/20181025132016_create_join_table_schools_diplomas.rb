class CreateJoinTableSchoolsDiplomas < ActiveRecord::Migration[5.2]
  def change
    create_join_table :schools, :diplomas
  end
end
