require "pry"
# require "find"

class FastqReader
  attr_reader :directory

  def initialize(directory)
    @directory = directory
  end

  def select_directory_files
    files = Dir.glob("#{@directory}/*.fastq")
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
    directory_data = select_directory_files.zip(percents_list)
  end

  def data_display
    percent_seq_over_30.each do |data|
      puts("Directory Name: #{data.first.split("/").first}")
      puts("File Name: #{data.first.split("/").last}")
      puts("Percent of sequences over 30 nucleotides long: #{data.last}")
      puts("\n")
    end
  end
end
