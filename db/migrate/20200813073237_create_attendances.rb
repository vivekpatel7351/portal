class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.references :student, index: true
      t.references :subject, index: true
      t.datetime :date
      t.boolean :status

      t.timestamps
    end
  end
end
