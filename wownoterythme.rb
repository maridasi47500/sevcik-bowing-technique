# Read the input file
require 'json'
input = File.read(ARGV[0]+"_2.ly")

# Extract the relevant section
section = input[/MvmntIVoiceI\s*=\s*{([^}]*)}/m, 1]

# Split the section into lines and process each line
output = section.lines.map do |line|
  # Remove specific elements and numbers with points
  #line.gsub("?","").gsub().strip /\\AutoBarline|\\AutoEndMovementBarline|%?\d{1,2}|%?(\d|\d\.|[1-9][0-9]\.)/

  line.gsub("?","").gsub(/\\staccato|\\AutoBarline|\\AutoEndMovementBarline|%?\d{1,2}|%?(\d|\d\.|[1-9][0-9]\.)/, "").strip

end.join(" ").split(" ").reject { |line| line.empty? } # Remove empty lines

listresult = []
current = {}
prev = nil
 p output
  p "output"

output.each do |char|
  if prev && char != prev
    listresult << current.dup
    current.clear
  end
  current[char] ||= 0
  current[char] += 1
  prev = char
end

# Ajouter la dernière séquence
listresult << current unless current.empty?

# Affichage
somelist=[]
listresult.each do |group|
  #result << group.map { |k, v| "#{k}: #{v}" }.join("\n")
  somelist << group.map { |k, v| "#{v}" }.join(" ")
  #p group
  #if group.is_a?(String) and group.include?("{")
  #  hey=JSON.parse(group.gsub("=>",":")).invert[1]
  #  p hey
  #  somelist << hey#.map { |k, v| "#{v}" }.join("\n")
  #elsif group.is_a?(String)
  #  hey = group.split(" ").join("\n")#.map { |k, v| "#{v}" }.join("\n")
  #  p hey
  #  somelist << hey#.map { |k, v| "#{v}" }.join("\n")

  #else
  #  hey =  group.keys().join("\n") #.map { |k, v| "#{v}" }.join("\n")
  #  p hey
  #  somelist << hey#.map { |k, v| "#{v}" }.join("\n")
  #  p "vfbn,"
  #end
end



# Write the result to a new file
p "some list"
p somelist.join(" ")
File.write("mesnotesrythme.music", somelist.join(" "))
p " notes were written succesfuly"

