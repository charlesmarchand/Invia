class AddUrlToStudies < ActiveRecord::Migration[5.2]
  def change
    add_column :studies, :url, :string
  end
end
