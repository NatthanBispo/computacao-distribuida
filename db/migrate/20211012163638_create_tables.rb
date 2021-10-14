class CreateTables < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.integer :api_id
      t.string :imdb_id
      t.string :title
      t.text :overview
      t.string :poster_path

      t.belongs_to :favorites
      t.belongs_to :watch_laters
      t.belongs_to :watcheds
      t.timestamps
    end

    create_table :favorites do |t|
      t.belongs_to :user
      t.timestamps
    end

    create_table :watch_laters do |t|
      t.belongs_to :user
      t.timestamps
    end

    create_table :watcheds do |t|
      t.belongs_to :user
      t.timestamps
    end

    create_table :favorites_movies do |t|
      t.belongs_to :movie
      t.belongs_to :favorite
    end

    create_table :movies_watch_laters do |t|
      t.belongs_to :movie
      t.belongs_to :watch_later
    end

    create_table :movies_watcheds do |t|
      t.belongs_to :movie
      t.belongs_to :watched
    end
  end
end
