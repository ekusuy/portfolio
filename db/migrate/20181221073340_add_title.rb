class AddTitle < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :title, :string, default: 'クリックしてタイトルをつけて下さい', null: false
  end
end
