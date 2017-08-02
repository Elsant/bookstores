class CreateBookstorages < ActiveRecord::Migration[5.1]
  def change
    create_table :bookstorages do |t|
      t.references :bookstore, foreign_key: true
      t.references :book, foreign_key: true
      t.integer :quantity, default: 0, null: false

      t.timestamps
    end
  end
end
