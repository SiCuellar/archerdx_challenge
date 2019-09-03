require "pry"
require "find"

class FastqReader
  attr_reader :directory

  def initialize(directory)
    @directory = directory
  end

  def select_directory_files
    files = Dir.glob("#{@directory}/*.fastq")
  end

  def number_of_sequences
    num_seq_list = select_directory_files.map do |file|
      file_data = File.readlines(file)
      num_seq = file_data.each_slice(4).to_a.count
    end
    directory_data = select_directory_files.zip(num_seq_list)
  end

  def percent_seq_over_30
    select_directory_files.map do |file|
      file_data = File.readlines(file)
      num_seq = file_data.each_slice(4).to_a.count
      binding.pry
    end
  end


end
