class AddTimestampsToReservations < ActiveRecord::Migration[6.0]
  def change
    add_column :reservations, :created_at, :datetime
  end
end
