# Lire le contenu original
filename = ARGV[0] + "_2.ly"
number = ARGV[1].to_i
nbmesuretext = ARGV[2].to_i
nbmesure=ARGV[1].to_i
nbmesuretext=ARGV[2].to_i

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
  cleaned_result = (" "+cleaned_lines.join(" ")) * (x2 - 1)
  notes = cleaned_lines.join(" ")
  regex = /(\d{2}\:\d{2}:\d{2}|\d{2}\:\d{2})/ # original
  # or
  regex = /(?<!AutoBarline|staccato|tuplet|partial|AutoEndMovementBarline|downbow|upbow)((aes|ais|bes|bis|ces|cis|des|dis|ees|eis|fes|fis|ges|gis|a|b|c|d|e|f|g)'*)(\d+)?(\.)?(?![a-z])/

  
  string = '12:01, 12:02, 12:03:04, 12:05'
  
  p notes
  p notes.scan(regex).last
  res = []
  mynotes = []
  notes.scan(/\d+/) do |c|
    mynotes << c
  end
  mysum=mynotes.map{|h|(1.to_f/h.to_f).rationalize}
  p mysum
  mysum1=mysum.sum / nbmesure
  def msum(arr,m)
      i=0
      sum=0
      arr.each do |e| 
          p e
          sum+=e
          i+=1
          break if sum>m

      end
      return arr.take(i)
  end

  notestoadd=[]
  notes.scan(regex) do |c|
    res << [c, $~.offset(0)[0]]
    p [c, $~.offset(0)[0]]
    notestoadd << $~.offset(0)[0]+c[0].to_s.length+c[2].to_s.length
  end
  
  res.inspect # => [["a", 0], ["a", 2]]
  somearr=msum(mysum, mysum1)
  somenote=notestoadd.take(somearr.length)
  p somearr
  p somenote

  cleaned_result << " "
  if nbmesure > 1
      cleaned_result << notes[0..(somenote[-1])]
  end
  cleaned_result = cleaned_result.split(" ")
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

