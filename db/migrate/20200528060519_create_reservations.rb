class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.string :name
      t.string :from
      t.string :to
      t.string :doj
      t.string :time
      t.string :person
    end
  end
end
