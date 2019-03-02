class CreateFlights < ActiveRecord::Migration[5.2]
  def change
    create_table :flights do |t|
      t.string :code
      t.string :from
      t.string :to
      t.string :duration
      t.string :departure
      t.string :arrival

      t.timestamps
    end
  end
end
