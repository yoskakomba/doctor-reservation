class AddPatientIdToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :patient_id, :integer
  end
end
