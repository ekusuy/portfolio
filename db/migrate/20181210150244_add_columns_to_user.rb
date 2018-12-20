class AddColumnsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :text, null: false
    add_column :users, :twitter_id, :text, null: false
    add_column :users, :twitter_icon, :string
    add_column :users, :twitter_url, :string, null:false
  end
end
