k=File.read("second#{ARGV[0]}_2.ly")
p k
while k.include?("\n\n%Default Score Layout") do
   k=k.gsub("\n\n%Default Score Layout","\n%Default Score Layout")
end
while k.include?("\n\n}\n%Default Score Layout") do
   k=k.gsub("\n\n}\n%Default Score Layout","\n}\n%Default Score Layout")
end
File.write("second#{ARGV[0]}_2.ly",k)
