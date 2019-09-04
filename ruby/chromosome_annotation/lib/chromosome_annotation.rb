require "pry"

class ChromosomeAnnotation
  attr_reader :analyzing_coordinates_file,
              :chromosome_map_file

  def initialize(analyzing_coordinates_file, chromosome_map_file)
    @analyzing_coordinates_file = analyzing_coordinates_file
    @data_analyzing_coordinates = File.readlines(analyzing_coordinates_file)
    @chromosome_map_file = chromosome_map_file
    @data_chromosome_map_file = File.readlines(chromosome_map_file)
  end

  def analyzing_dictionary
    analyzing_data_dict = Hash.new(0)
    analyzing_data_grouper.each do |seq_pos|
      if analyzing_data_dict[seq_pos.first] != 0
        analyzing_data_dict[seq_pos.first] << seq_pos.last
      else
        analyzing_data_dict[seq_pos.first] = [seq_pos.last]
      end
    end
    analyzing_data_dict
  end

  def analyzing_data_grouper
    grouped_data = @data_analyzing_coordinates.each_slice(1).to_a
    seqname_postion = grouped_data.map do |seq_pos|
      seq_pos.first.gsub("\n",'').split("\t")
    end
  end

end
