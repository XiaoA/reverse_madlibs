def open_file(f)
  File.open(f, 'r') do |f|
    f.read.split
  end
end

nouns = open_file('noun.txt')
verbs = open_file('verb.txt')
adjectives = open_file('adjective.txt')


dictionary = {
  nouns: nouns,
  verbs: verbs,
  adjectives: adjectives
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

say "Give me a name."
name = STDIN.gets.chomp

say "Is #{name} male or female?"
gender = STDIN.gets.chomp.downcase

if gender == 'male'
  (nominative_pronoun = 'he') && (possessive_pronoun = 'his') && (objective_pronoun = 'him')
else
  (nominative_pronoun = 'she') && (possessive_pronoun = 'her') && (objective_pronoun = 'her')
end

contents.gsub!('NAME', name)
contents.gsub!('NOMINATIVE_PRONOUN', nominative_pronoun)
contents.gsub!('POSSESSIVE_PRONOUN', possessive_pronoun)
contents.gsub!('OBJECTIVE_PRONOUN', objective_pronoun)

contents.gsub!('NOUN').each do |noun|
  dictionary[:nouns].sample
end

contents.gsub!('VERB').each do |verb|
  dictionary[:verbs].sample
end

contents.gsub!('ADJECTIVE').each do |adjective|
  dictionary[:adjectives].sample
end

p contents.chomp

