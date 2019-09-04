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

  def mapping_data_grouper
    multi_chromosome_data = @data_chromosome_map_file.each_slice(1).to_a
    multi_chromosome_data.map do |chromosome_data|
      chromosome_data.first.gsub("\n",'').split("\t")
    end
  end

  def mapping_dictionary
    mapping_data_dict = Hash.new(0)
    mapping_data_grouper.each do |chromosome_data|
      if mapping_data_dict[chromosome_data.first] != 0
        mapping_data_dict[chromosome_data.shift] << chromosome_data
      else
        mapping_data_dict[chromosome_data.shift] = [chromosome_data]
      end
    end
    mapping_data_dict
  end

  def annotate
    complementary_data_set = Hash.new(0)
    analyzing_dictionary.map do |key,value|
      complementary_data_set[key] = range_data_comparison(mapping_dictionary[key],value)
    end
    complementary_data_set
  end

  def range_data_comparison(specific_chromosome_mapping_data, wanted_coords)
    matching = []
    wanted_coords.each do |coord|
      ranges = specific_chromosome_mapping_data.map do |chrom_data|
        range = (chrom_data[2].to_i)..(chrom_data[3].to_i)
        if range.include?(coord.to_i)
            matching << [coord, chrom_data]
        end
      end
    end
    matching
  end

  def create_annotated_file
    File.open("annotated.txt", "w") do |file|
      file.write("add my annoate method here")
    end
  end
end
