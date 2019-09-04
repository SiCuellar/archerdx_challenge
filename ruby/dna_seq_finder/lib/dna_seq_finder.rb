require "pry"

class DnaSequenceFinder
  def sequences_count(fasta_file_name)
    data = File.readlines(fasta_file_name)

    sequence_appearance_count = Hash.new(0)
    sequence_grouper(data).each do |sequence|
      sequence_appearance_count[sequence] += 1
    end
    @sequence_appearance_count
  end

  def sequence_grouper(data)
    grouped_data = data.each_slice(2).to_a
    sequences = grouped_data.map do |seq|
      seq.last.gsub("\n",'')
    end
  end

  def most_frequent_seq
    binding.pry

  end
end
