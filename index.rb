def get_frequencies (file_path)
  frequencies = Hash.new(0)

  File.foreach(file_path) do |line|
    words = line.downcase.scan(/\b[а-яa-z]+(?=[\s.,?!:;]|$)/i)
    words.each { |word| frequencies[word] += 1 }
  end

  frequencies
end

print "[file path]: "
file_path = gets.chomp

if File.exist?(file_path)
  frequencies = get_frequencies(file_path)
  
  puts
  frequencies.sort_by { |word, count| -count }.each do |word, count|
    puts "#{ word } - #{ count }"
  end
else
  puts "file not found..."
end