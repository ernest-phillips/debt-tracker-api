class CreateLoans < ActiveRecord::Migration[7.0]
  def change
    create_table :loans do |t|
      t.string :name
      t.bigint :balance
      t.bigint :min_payment
      t.bigint :interest
      t.text :description
      t.references :user, null: false, foreign_key: true
      t.references :creditor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
