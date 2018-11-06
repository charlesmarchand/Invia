class AddUrlToSchools < ActiveRecord::Migration[5.2]
  def change
    add_column :schools, :difficulty, :integer
    add_column :schools, :url, :string
    add_column :schools, :cost, :integer
  end
end
