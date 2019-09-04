require "pry"
# require "find"

class FastqReader
  attr_reader :directory

  def initialize(directory)
    @directory = directory
  end

  def select_directory_files
    directories = Dir.glob("**/*.fastq")
    files = directories.find_all { |path| path.include?(@directory) }
  end

  def percent_seq_over_30
    percents_list = select_directory_files.map do |file|
      sequences = grouped_sequences(file)
      above_30_count = 0
      sequences.each do |sequence|
        if sequence[1].length > 30
          above_30_count +=1
        end
      end
      percent = above_30_count.to_f/sequences.count.to_f * 100.0
    end
    directory_data = select_directory_files.zip(percents_list)
  end

  def grouped_sequences(file)
    file_data = File.readlines(file)
    sequences = file_data.each_slice(4).to_a
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
