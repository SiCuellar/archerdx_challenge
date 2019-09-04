require "pry"

class DnaSequenceFinder
  def initialize(fasta_file_name)
    @fasta_file_name = fasta_file_name
    @data = File.readlines(fasta_file_name)
  end

  def sequences_count
    sequence_appearance_count = Hash.new(0)
    sequence_grouper.each do |sequence|
      sequence_appearance_count[sequence] += 1
    end
    sequence_appearance_count
  end

  def sequence_grouper
    grouped_data = @data.each_slice(2).to_a
    sequences = grouped_data.map do |seq|
      seq.last.gsub("\n",'')
    end
  end

  def most_frequent_seq(range = 10)
    true_range = range - 1
    sequences_count.sort_by do |seq_info|
      seq_info.last
    end.reverse[0..true_range]
  end

  #Must add safegaurd so File_update isn't run on the same file multiple times
  def file_update
    File.open(@fasta_file_name, "a") do |file|
        file.puts "\n"
        file.puts "Most Frequent Sequences"
      most_frequent_seq(range = 10).each do |seq|
        file.puts "Sequence Count: #{seq.last}"
        file.puts "Sequence: #{seq.first}"
        file.puts "\n"
      end
    end
  end
end
