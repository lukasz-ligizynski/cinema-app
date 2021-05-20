class CreateCinemaHalls < ActiveRecord::Migration[6.1]
  def change
    create_table :cinema_halls do |t|
      t.integer :size

      t.timestamps
    end
  end
end
