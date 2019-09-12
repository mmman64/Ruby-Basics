=begin
    Here I wrote a method to load a YAML file that contains all the emoticons, followed by a method
    to retrieve the Japanese version of a Western emoticon, and finally, a method that takes a Japanese
    emoticon and retirieves the English meaning.
=end

require "yaml"

# construct a hash from the .yml file to lookup emojis/meanings
def load_library(file_path)
  emoji_sheet = YAML.load_file(file_path)
  japanese_meaning = {}
  western_to_japanese = {}
  emoji_sheet.each do |meaning, emojis|
    japanese_meaning[emojis.last] = meaning
    western_to_japanese[emojis.first] = emojis.last
  end
  hash = {"get_emoticon" => western_to_japanese, "get_meaning" => japanese_meaning}
end

# given a Western emoticon, a Japanese version is retrieved
def get_japanese_emoticon(file_path, emoticon)
  emoji_library = load_library(file_path)
  emoji_equivalent = emoji_library["get_emoticon"][emoticon]
  return "Sorry, that emoticon was not found" if emoji_equivalent.nil?
  emoji_equivalent
end

# given a Japanese emoticon, the meaning in English is retrieved
def get_english_meaning(file_path, emoticon)
  emoji_library = load_library(file_path)
  emoji_equivalent = emoji_library["get_meaning"][emoticon]
  return "Sorry, that emoticon was not found" if emoji_equivalent.nil?
  emoji_equivalent
end
