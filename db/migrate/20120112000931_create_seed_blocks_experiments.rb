class CreateSeedBlocksExperiments < ActiveRecord::Migration
  def change
    create_table :experiments do |t|
      t.string :conversion_event
      t.string :name
      t.string :delivery_url
      t.string :traffic_group
      t.boolean :active, :default => true

      t.timestamps
    end
  end
end
