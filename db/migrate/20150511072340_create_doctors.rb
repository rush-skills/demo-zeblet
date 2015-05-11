class CreateDoctors < ActiveRecord::Migration
  def change
    create_table :doctors do |t|
      t.string :name
      t.references :clinic, index: true, foreign_key: true
      t.string :specialization
      t.string :experience
      t.string :title
      t.string :photo

      t.timestamps null: false
    end
  end
end
