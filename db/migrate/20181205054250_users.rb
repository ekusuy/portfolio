class Users < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.text      :name,          null: false
      t.text      :twitter_id,    null: false
      t.string    :twitter_icon,  null: false
      t.string    :twitter_url,   null: false
      t.datetime  :created_at,    null: false
      t.datetime  :updated_at
    end
  end
end
