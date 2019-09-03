require "./lib/fast_reader"
require "minitest/autorun"
require "minitest/pride"


class FastqReaderTest < Minitest::Test

  def test_it_exists
    dir_name = ("read1")
    fastq = FastqReader.new(dir_name)
    assert_instance_of FastqReader, fastq
  end

  def test_it_can_find_a_FastQ_files_in_directory
    dir_name = ("read1")
    fastq = FastqReader.new(dir_name)
    assert_equal ["read1/Sample_R1.fastq"], fastq.select_directory_files
  end

  def test_it_can_filter_non_fastq_files_out
    dir_name = ("read2")
    fastq = FastqReader.new(dir_name)
    assert_equal ["read2/Sample_R2.fastq"], fastq.select_directory_files
  end

  def test_it_can_return_numer_of_sequences_in_partucular_file
    dir_name = ("read3")
    fastq = FastqReader.new(dir_name)
    assert_equal 2, fastq.number_of_sequences
  end


  # report each file name and the percent of sequences in that file that are greater than 30 nucleotides long.
end
