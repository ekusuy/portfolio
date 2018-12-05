class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.text :name,           null: false
      t.text :twitter_id
      t.string :twitter_icon
      t.string :twitter_url

      t.timestamps
    end
  end
end
