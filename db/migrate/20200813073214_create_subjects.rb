class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :name
      t.references :standard, index: true

      t.timestamps
    end
  end
end
