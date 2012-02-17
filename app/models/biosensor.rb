class Biosensor < ActiveRecord::Base

attr_accessible :specificity, :specificity_htm, :sensor_name, :sensor_name_htm, :sensor_type, :anal_tech, :iv_props, :organism, :fluorophore, :pub_med_id, :pi_name

  def Biosensor.load_data
file = File.open("#{Rails.root}/wolfData2.tsv", 'rb')
    while(line = file.gets)
      row = line.split("\t");
      #Biosensor.create(:specificity => row[0],:specificity_htm => row[1],:sensor_name => row[2],:sensor_name_htm => row[3],:sensor_type  => row[4],:anal_tech => row[5],:iv_props => row[6],:organism => row[6],:fluorophore => row[7],:pub_med_id => row[8],:pi_name => row[9])
      Biosensor.create(:specificity => row[0],:specificity_htm => row[1],:sensor_name => row[2],:sensor_name_htm => row[3],:sensor_type  => row[4],:anal_tech => row[5],:organism => row[6],:fluorophore => row[7],:pub_med_id => row[8],:pi_name => row[9])
    
    end
  end
end
