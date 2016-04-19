class CreateDoctors < ActiveRecord::Migration
  def change
    create_table :doctors do |t|
      t.string :doctorname
      t.string :email
      t.timestamps
    end
  end
end
