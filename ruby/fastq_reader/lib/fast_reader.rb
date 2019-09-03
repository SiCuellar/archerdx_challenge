require "pry"
require "find"

class FastqReader
  attr_reader :directory

  def initialize(directory)
    @directory = directory
    # binding.pry
  end

  def select_directory
    files = Dir.glob("#{@directory}/*.fastq")
    # binding.pry
    files.each do |file|
      print file
    end
  end
end



# Dir.glob("#{path}/*.fastq") do |fastq_file|
#   binding.pry
# end

# dic_name = gets.chomp
# path = "archerdx_challenge/ruby/fastq_reader/lib/fastq_directories/#{dic_name}"
# fastq_file_paths = []
# Find.find('path/to/search') do |path|
# fastq_file_paths << path if path =~ /.*\.fastq$/
# end
