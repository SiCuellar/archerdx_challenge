require "pry"
require "find"

class FastqReader
  attr_reader :directory

  def select_directory
    dic_name = gets.chomp
    # path = File.absolute_path(dic_name)
    # absolute_path no returning full file path
    files = Dir.glob("#{dic_name}/*.fastq")

    files.each do |file|
      binding.pry
    end

    # Dir.glob("#{path}/*.fastq") do |fastq_file|
    #   binding.pry
    # end
  end
end

# dic_name = gets.chomp
# path = "archerdx_challenge/ruby/fastq_reader/lib/fastq_directories/#{dic_name}"
# fastq_file_paths = []
# Find.find('path/to/search') do |path|
# fastq_file_paths << path if path =~ /.*\.fastq$/
# end
