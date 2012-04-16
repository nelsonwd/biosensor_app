class AddSensorTargetTypeToBiosensors < ActiveRecord::Migration
  def self.up
    add_column :biosensors, :sensor_target_type, :string
  end

  def self.down
    remove_column :biosensors, :sensor_target_type
  end
end
