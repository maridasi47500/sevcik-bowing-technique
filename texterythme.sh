
ruby numberrythme.rb "scores/$1" "$3" "$4"
ruby wownote.rb "scores/$1"
ruby deletelines.rb "scores/$1"
cp "scores/second$1_2.ly" automne.rythme
ruby wowrythme.rb
ruby wownoterythme.rb "scores/$1"
cp automne.rythme rythme.automne


ruby wowmusic.rb "$2" "$3" "$4"
cat rythme.automne
frescobaldi c.ki
