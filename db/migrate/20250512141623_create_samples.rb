class CreateSamples < ActiveRecord::Migration[7.2]
  def change
    create_table :samples do |t|
      t.string :name
      t.integer :bpm
      t.string :key
      t.string :source
      t.boolean :private
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
