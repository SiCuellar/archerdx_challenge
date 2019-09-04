require "./lib/fast_reader"

puts "Welcome to the FastQ file reader!"
puts "please place directories needed for analysis in the fastq_reader directory."
puts "please type in the name of the Directory you wish to analyze"
directory = gets.chomp
data = FastqReader.new(directory)
data.data_display

puts "Thanks for using FastQ file reader"
