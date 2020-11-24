class CreateFilters < ActiveRecord::Migration[6.0]
  def change
    create_table :filters do |t|
      t.string :gender
      t.string :origin, array: true, default: []
      t.string :astrology, array: true, default: []
      t.string :start_with
      t.string :end_with
      t.string :length, array: true, default: []
      t.string :popularity, array: true, default: []
      t.boolean :hyphenated_name, default: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
