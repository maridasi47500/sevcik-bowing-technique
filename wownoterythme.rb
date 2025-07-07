# Read the input file
input = File.read(ARGV[0]+"_2.ly")

# Extract the relevant section
section = input[/MvmntIVoiceI\s*=\s*{([^}]*)}/m, 1]

# Split the section into lines and process each line
output = section.lines.map do |line|
  # Remove specific elements and numbers with points
  #line.gsub("?","").gsub().strip /\\AutoBarline|\\AutoEndMovementBarline|%?\d{1,2}|%?(\d|\d\.|[1-9][0-9]\.)/

  line.gsub("?","").gsub(/\\AutoBarline|\\AutoEndMovementBarline|%?\d{1,2}|%?(\d|\d\.|[1-9][0-9]\.)/, "").strip

end.reject { |line| line.empty? } # Remove empty lines

listresult = []
current = {}
prev = nil

output.each do |char|
  if prev && char != prev
    result << current.dup
    current.clear
  end
  current[char] ||= 0
  current[char] += 1
  prev = char
end

# Ajouter la dernière séquence
listresult << current unless current.empty?

# Affichage
listresult.each do |group|
  result << group.map { |k, v| "#{k}: #{v}" }.join("\n")
end



# Write the result to a new file
File.write("mesnotesrythmne.music", result)
p " notes were written succesfuly"

