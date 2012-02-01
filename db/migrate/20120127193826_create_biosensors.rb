class CreateBiosensors < ActiveRecord::Migration
  def self.up
    create_table :biosensors do |t|
      t.string :specificity
      t.string :specificity_htm
      t.string :sensor_name
      t.string :sensor_name_htm
      t.string :sensor_type
      t.string :anal_tech
      t.string :iv_props
      t.string :organism
      t.string :fluorophore
      t.string :pub_med_id
      t.string :pi_name

      t.timestamps
    end
  end

  def self.down
    drop_table :biosensors
  end
end
