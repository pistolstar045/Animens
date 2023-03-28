class CreateAnimeComments < ActiveRecord::Migration[6.1]
  def change
    create_table :anime_comments do |t|
      t.text :comment
      t.integer :customer_id
      t.integer :anime_id

      t.timestamps
    end
  end
end

