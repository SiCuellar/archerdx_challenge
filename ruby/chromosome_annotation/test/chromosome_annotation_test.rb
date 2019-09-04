require "./lib/chromosome_annotation"
require "minitest/autorun"
require "minitest/pride"

class ChromosomeAnnotationTest < Minitest::Test
  def test_it_exists
    chromosome_annotation = ChromosomeAnnotation.new("coords_to_ann.txt","test_chromosome_map.gtf")
    assert_instance_of ChromosomeAnnotation, chromosome_annotation
  end

  def test_it_has_attributes
    chromosome_annotation = ChromosomeAnnotation.new("coords_to_ann.txt","test_chromosome_map.gtf")
    assert_equal "test_chromosome_map.gtf", chromosome_annotation.chromosome_map_file
    assert_equal "coords_to_ann.txt", chromosome_annotation.analyzing_coordinates_file
  end

  def test_it_can_group_analyzing_data
    chromosome_annotation = ChromosomeAnnotation.new("coords_to_ann.txt","test_chromosome_map.gtf")
    assert_equal ["chr3", "16636095"], chromosome_annotation.analyzing_data_grouper.first
  end

  def test_it_can_form_analyzing_data_into_dictionary
    chromosome_annotation = ChromosomeAnnotation.new("coords_to_ann.txt","test_chromosome_map.gtf")
    assert_equal [["16636095", "16638267", "16638259"]], chromosome_annotation.analyzing_dictionary.values
  end

  def test_it_can_grou_mapping_data
    chromosome_annotation = ChromosomeAnnotation.new("coords_to_ann.txt","test_chromosome_map.gtf")
    assert_equal "16636091", chromosome_annotation.mapping_data_grouper.first[3]
  end

  def test_form_mapping_data_dictionary
    chromosome_annotation = ChromosomeAnnotation.new("coords_to_ann.txt","test_chromosome_map.gtf")
    assert_equal ["chr3"], chromosome_annotation.mapping_dictionary.keys
    assert_equal "refFlat", chromosome_annotation.mapping_dictionary.values.first.first[0]
    assert_equal "16636091", chromosome_annotation.mapping_dictionary.values.first.first[2]
  end

  #Make the test Below in a better way
  def test_it_can_compare_both_dictionaries
    chromosome_annotation = ChromosomeAnnotation.new("coords_to_ann.txt","test_chromosome_map.gtf")
    assert_equal ["chr3"], chromosome_annotation.annotate.keys
    assert_equal "16636095", chromosome_annotation.annotate.values[0].first.first
  end

end
