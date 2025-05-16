class CreateSampleTags < ActiveRecord::Migration[7.2]
  def change
    create_table :sample_tags do |t|
      t.references :sample, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
