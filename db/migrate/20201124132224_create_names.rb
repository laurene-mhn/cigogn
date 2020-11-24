class CreateNames < ActiveRecord::Migration[6.0]
  def change
    create_table :names do |t|
      t.string :name
      t.string :gender
      t.string :origin, array: true, default: []
      t.text :etymology
      t.text :meaning
      t.text :personality
      t.string :popularity
      t.string :astrology
      t.string :feast_day

      t.timestamps
    end
  end
end
