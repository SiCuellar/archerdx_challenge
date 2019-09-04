require "pry"

class DnaSequenceFinder
  def initialize(fasta_file_name)
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

  def most_frequent_seq
    sequences_count.sort_by do |seq_info|
      seq_info.last
    end.reverse
  end
end
