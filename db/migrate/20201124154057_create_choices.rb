class CreateChoices < ActiveRecord::Migration[6.0]
  def change
    create_table :choices do |t|
      t.boolean :accepted
      t.references :user, null: false, foreign_key: true
      t.references :name, null: false, foreign_key: true

      t.timestamps
    end
  end
end
