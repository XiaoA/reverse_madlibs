# coding: utf-8
def open_file(f)
  File.open(f, 'r') do |f|
    f.read.split
  end
end

名字 = open_file('名字.txt')
名詞 = open_file('名詞.txt')
動詞 = open_file('動詞.txt')
形容詞 = open_file('形容詞.txt')


dictionary = {
  names: 名字,
  nouns: 名詞,
  verbs: 動詞,
  adjectives: 形容詞
}

def say(msg)
  puts("=> #{msg}")
end

def exit_with(msg)
  say msg
  exit
end

def get_input(word) 
  say "Give me a #{word}"
  STDIN.gets.chomp
end

exit_with("No input file!") if ARGV.empty?
exit_with("File does not exist!") if !File.exists?(ARGV[0])

contents = File.open(ARGV[0], 'r') do |f|
  f.read
end

contents.gsub!('名字').each do |name|
  dictionary[:names].sample
end

contents.gsub!('名詞').each do |noun|
  dictionary[:nouns].sample
end

contents.gsub!('動詞').each do |verb|
  dictionary[:verbs].sample
end

contents.gsub!('形容詞').each do |adjective|
  dictionary[:adjectives].sample
end

p contents.chomp

