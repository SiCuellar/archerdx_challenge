require "./lib/dna_seq_finder"

puts "Welcome to the DNA sequence finder!"
puts "please place files needed for analysis in the fasta_files directory."
puts "please type in the name of the file you wish to analyze"
puts "\n"
file = gets.chomp
puts "\n"

dna_seq_finder = DnaSequenceFinder.new(file)
dna_seq_finder.file_update

puts "your file has been updated"
puts "Thanks for using DNA sequence finder!"
