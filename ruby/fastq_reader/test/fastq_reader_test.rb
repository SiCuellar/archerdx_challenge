require "./lib/fast_reader"
require "minitest/autorun"
require "minitest/pride"


class FastqReaderTest < Minitest::Test

  def setup
    path = ("./fastq_directories/read1/*")
    @fastq = FastqReader.new()
  end

  def test_it_exists
    assert_instance_of FastqReader, @fastq
  end

  def test_it_can_find_a_FastQ_file_in_directory
    assert_equal "Sample_R1.fastq", @fastq.select_directory
  end

  # Recursively find all FASTQ files in a directory
  # report each file name and the percent of sequences in that file that are greater than 30 nucleotides long.
end
