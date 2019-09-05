require "./lib/chromosome_annotation"

puts "Welcome to the Chromosome Annotator!"
puts "please place directories needed for analysis in the input_files directory."
puts "please type in the name of the file with the coordinates you wish to analyze"
puts "\n"
analyzing_coords_file = gets.chomp
puts "\n"
puts "please type in the name of the file with the Chromosome Map (.gtf file) you wish to analyze"
chrom_map_file = gets.chomp
puts "\n"

annotator = ChromosomeAnnotation.new(analyzing_coords_file, chrom_map_file)
annotator.create_annotated_file

puts "Your file can be found in the Annotated_Files directory "
puts "Thanks for using Chromosome Annotator file maker!"

#must add safe guards incase there is a wrong file added
