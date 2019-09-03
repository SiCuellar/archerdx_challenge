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

    select_directory_files.each do |file|
      file_data = File.readlines(file)
      binding.pry
    end

    # file_data.each_slice(4).to_a
  end
end
