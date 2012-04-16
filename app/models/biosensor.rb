class Biosensor < ActiveRecord::Base

attr_accessible :specificity, :specificity_htm, :sensor_name, :sensor_name_htm, :sensor_type, :anal_tech, :iv_props, :organism, :fluorophore, :pub_med_id, :pi_name, :sensor_target_type

  def Biosensor.load_data
#file = File.open("#{Rails.root}/wolfData2.tsv", 'rb')
file = File.open("#{Rails.root}/biosensors4-9-2012.csv", 'rb')
    while(line = file.gets)
      row = line.split("\t");
      Biosensor.create(:sensor_target_type => row[0], :specificity => row[1],:specificity_htm => row[2],:sensor_name => row[3],:sensor_name_htm => row[4],:sensor_type  => row[5],:anal_tech => row[6], :iv_props => row[7], :organism => row[8],:fluorophore => row[9],:pub_med_id => row[10],:pi_name => row[11].strip)
    
    end
  end
end
