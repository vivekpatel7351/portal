class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.integer :roll_number
      t.references :standard, index: true

      t.timestamps
    end
  end
end
