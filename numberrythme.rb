# Lire le contenu original
filename = ARGV[0] + "_2.ly"
number = ARGV[1].to_i
nbmesuretext = ARGV[2].to_i
input = File.read(filename)

# Trouver et capturer le contenu de la section MvmntIVoiceI
section_match = input.match(/(MvmntIVoiceI\s*=\s*{)([^}]*)}/m)

if section_match
  opening = section_match[1]  # "MvmntIVoiceI = {"
  body = section_match[2]     # contenu entre accolades

  # Nettoyer chaque ligne : conserver les chiffres, supprimer commandes spécifiques
  cleaned_lines = body.lines.map do |line|
    line.gsub("?", "")
        .gsub(/\\AutoBarline|\\AutoEndMovementBarline/, "")
        .strip
    #line.gsub("?","").gsub(/\\AutoBarline|\\AutoEndMovementBarline|%?\d{1,2}|%?(\d|\d\.|[1-9][0-9]\.)/, "").strip

  end.reject { |line| line.empty? }
  mylength=cleaned_lines.join(" ").split(" ").length
  p "nombre notes: #{mylength}"
  x1=mylength / number
  mylines=(x1 * nbmesuretext) / number
  x2=nbmesuretext/number
  p "x #{number} mesures = #{mylength} notes x #{x2} = #{nbmesuretext} mesure"

  # Fusionner les lignes et remplacer a-f par "a"
  cleaned_result = (" "+cleaned_lines.join(" ")) * x2
  cleaned_result = cleaned_result.split(" ")
  cleaned_result.pop(x1)
  cleaned_result.append("c'1")
  cleaned_result = cleaned_result.join(" ")




  # Construire la section modifiée
  new_section = "#{opening} #{cleaned_result} }"

  # Remplacer l'ancienne section par la nouvelle dans tout le fichier
  #updated_content = input.sub(/MvmntIVoiceI\s*=\s*{[^}]*}/m, new_section)
  updated_content = input.sub(/(MvmntIVoiceI\s*=\s*{)([^}]*)}/m, new_section)

  # Réécriture du fichier
  File.write("second"+filename, updated_content)

  puts "✅ Section 'MvmntIVoiceI' modifiée avec succès dans '#{filename}'"
else
  puts "❌ La section 'MvmntIVoiceI' est introuvable dans le fichier."
end

