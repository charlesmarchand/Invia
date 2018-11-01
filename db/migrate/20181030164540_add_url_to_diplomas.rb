class AddUrlToDiplomas < ActiveRecord::Migration[5.2]
  def change
    add_column :diplomas, :url, :string
  end
end
