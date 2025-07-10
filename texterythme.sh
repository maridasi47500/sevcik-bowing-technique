
ruby numberrythme.rb "$1" "$3" "$4"
ruby wownote.rb "$1"
ruby deletelines.rb "$1"
cp "second$1_2.ly" automne.rythme
ruby wowrythme.rb
ruby wownoterythme.rb "$1"
cp automne.rythme rythme.automne


ruby wowmusic.rb "$2" "$3" "$4"
cat rythme.automne
frescobaldi c.ki
