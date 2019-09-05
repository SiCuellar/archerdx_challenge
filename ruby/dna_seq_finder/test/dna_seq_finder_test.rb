require "./lib/dna_seq_finder"
require "minitest/autorun"
require "minitest/pride"

class DnaSequenceFinderTest < Minitest::Test
  def test_it_exists
    dna_seq_finder = DnaSequenceFinder.new("sample_2.fasta")
    assert_instance_of DnaSequenceFinder, dna_seq_finder
  end

  def test_it_has_attributes
    dna_seq_finder = DnaSequenceFinder.new("sample_2.fasta")
    assert_instance_of DnaSequenceFinder, dna_seq_finder
  end

  def test_it_can_return_sequences_count
    dna_seq_finder = DnaSequenceFinder.new("sample_2.fasta")
    appearance_count = dna_seq_finder.sequences_count
    assert_equal 1, appearance_count["AGGC"]
    assert_equal 2, appearance_count["CGGC"]
  end

  def test_it_can_return_most_frequent_sequences
    dna_seq_finder = DnaSequenceFinder.new("sample_2.fasta")
    assert_equal [["CGGC", 2], ["AGGC", 1]], dna_seq_finder.most_frequent_seq(2)
  end

  def test_it_can_return_ten_most_frequent_sequences
    dna_seq_finder = DnaSequenceFinder.new("sample_4.fasta")
    assert_equal 10, dna_seq_finder.most_frequent_seq.count
  end

  #add testing to test that file has actually changed
  def test_it_can_write_to_existing_file
    dna_seq_finder = DnaSequenceFinder.new("sample.fasta")
    dna_seq_finder.file_update
  end
end
