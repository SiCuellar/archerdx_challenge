require "./lib/dna_seq_finder"
require "minitest/autorun"
require "minitest/pride"

class DnaSequenceFinderTest < Minitest::Test
  def test_it_exists
    dna_seq_finder = DnaSequenceFinder.new
    assert_instance_of DnaSequenceFinder, dna_seq_finder
  end

  def test_it_can_return_sequences_count
    dna_seq_finder = DnaSequenceFinder.new
    appearance_count = dna_seq_finder.sequences_count("sample_2.fasta")
    assert_equal 1, appearance_count["AGGC"]
    assert_equal 2, appearance_count["CGGC"]
  end

  def test_it_can_return_most_frequent_sequences
    dna_seq_finder = DnaSequenceFinder.new
    # assert_equal "something", dna_seq_finder.most_frequent_seq
  end

end
