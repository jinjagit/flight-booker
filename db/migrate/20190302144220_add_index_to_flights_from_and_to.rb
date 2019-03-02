class AddIndexToFlightsFromAndTo < ActiveRecord::Migration[5.2]
  def change
    def change
      add_index :flights, :from
      add_index :flights, :to
    end
  end
end
