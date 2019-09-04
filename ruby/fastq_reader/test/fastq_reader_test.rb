require "./lib/fastq_reader"
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
    assert_equal ["fastq_directories/read1/Sample_R1.fastq"], fastq.select_directory_files
  end

  def test_it_can_filter_non_fastq_files_out
    dir_name = ("read2")
    fastq = FastqReader.new(dir_name)
    assert_equal ["fastq_directories/read2/Sample_R2.fastq"], fastq.select_directory_files
  end

  def test_it_can_return_percentage_of_sequences_over_30
    dir_name = ("read3")
    fastq = FastqReader.new(dir_name)
    assert_equal [["fastq_directories/read3/sample_2.fastq", 25.0], ["fastq_directories/read3/sample.fastq",50.0]], fastq.percent_seq_over_30
  end

  def test_it_can_return_clean_data
    dir_name = ("read3")
    fastq = FastqReader.new(dir_name)
    assert_equal [["fastq_directories/read3/sample_2.fastq", 25.0], ["fastq_directories/read3/sample.fastq", 50.0]], fastq.data_display
  end
end
