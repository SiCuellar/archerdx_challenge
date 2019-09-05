require "./lib/fastq_reader"

puts "Welcome to the FastQ file reader!"
puts "please place directories needed for analysis in the fastq_reader directory."
puts "please type in the name of the Directory you wish to analyze"
puts "\n"
directory = gets.chomp
puts "\n"

data = FastqReader.new(directory)
if data.data_display == []
  puts "Invalid File"
else
  data.data_display
end

puts "Thanks for using FastQ file reader"
