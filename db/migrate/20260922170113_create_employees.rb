class CreateEmployees < ActiveRecord::Migration[8.0]
  def change
    create_table :employees do |t|
      t.references :employer, null: false, foreign_key: true
      t.string :name, null: false
      t.string :external_ref

      t.timestamps
    end
    add_index(:employees,[:external_ref, :employer_id], unique: true)
  end
end
