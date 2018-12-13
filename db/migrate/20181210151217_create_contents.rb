class CreateContents < ActiveRecord::Migration[5.2]
  def change
    create_table :contents do |t|
      t.references :user, foreign_key: true
      t.bigint :position, null: false
      t.string :amazon_link
      t.string :amazon_img

      t.timestamps
    end
  end
end
