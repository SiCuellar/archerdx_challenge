require "pry"
# require "find"

class FastqReader
  attr_reader :directory

  def initialize(directory)
    @directory = directory
    @directory_data = []
  end

  def select_directory_files
    files = Dir.glob("#{@directory}/*.fastq")
  end

  def number_of_sequences
    num_seq_list = select_directory_files.map do |file|
      file_data = File.readlines(file)
      num_seq = file_data.each_slice(4).to_a.count
    end
    # binding.pry
    @directory_data << select_directory_files.zip(num_seq_list)
  end

  def percent_seq_over_30
    percents_list = select_directory_files.map do |file|

      file_data = File.readlines(file)
      sequences = file_data.each_slice(4).to_a
      above_30_count = 0

      sequences.map do |sequence|
        if sequence[1].length > 30
          above_30_count +=1
        end
      end

      num_seq = sequences.count
      percent = above_30_count.to_f/num_seq.to_f * 100.0
    end
    @directory_data << select_directory_files.zip(percents_list)
  end
end
