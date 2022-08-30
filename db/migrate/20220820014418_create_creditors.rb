class CreateCreditors < ActiveRecord::Migration[7.0]
  def change
    create_table :creditors do |t|
      t.string :name, null: false
      t.string :url

      t.timestamps
    end
  end
end
