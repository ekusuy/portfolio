class Contents < ActiveRecord::Migration[5.2]
  def change
    create_table :contents do |t|
      t.bigint    :user_id,       null: false
      t.bigint    :position,      null: false
      t.string    :amazon_link
      t.string    :amazon_img
      t.datetime  :created_at,    null: false
      t.datetime  :updated_at
    end
  end
end
