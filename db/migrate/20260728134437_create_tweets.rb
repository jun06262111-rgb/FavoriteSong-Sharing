class CreateTweets < ActiveRecord::Migration[7.2]
  def change
    create_table :tweets do |t|
      t.string :music_name
      t.string :music_artist
      t.integer :music_year
      t.string :music_genre
      t.decimal :favorite_point
      t.text :review
      t.text :favorite_phrase
      t.string :favorite_time
      t.string :mv_url
      t.text :music_url

      t.timestamps
    end
  end
end
