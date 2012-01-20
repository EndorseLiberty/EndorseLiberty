class AddActivationDateToExperiments < ActiveRecord::Migration
  def change
    add_column :experiments, :activation_date, :datetime
    change_column :experiments, :active, :boolean, :default => false
  end
end
