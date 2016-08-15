require 'open-uri'
require 'json'

def generate_grid(grid_size)
  # TODO: generate random grid of letters
  (0...grid_size).map { 65.+(rand(25)).chr }
end

def run_game(attempt, grid, start_time, end_time)
  # TODO: runs the game and return detailed hash of result
  time = (end_time - start_time)
  score = (attempt.length - (end_time - start_time) / 5) * 100.to_i

  if translation?(attempt) && word_in_grid?(attempt, grid)
    hash_result(time, score, "well done", translation?(attempt))
  elsif !word_in_grid?(attempt, grid)
    hash_result(time, 0, "not in the grid")
  else
    hash_result(time, 0, "not an english word")
  end
end

def translation?(string)
  url = "http://api.wordreference.com/0.8/80143/json/enfr/#{string}"
  translation_json = open(url).read
  translation_hash = JSON.parse(translation_json)
  if translation_hash["Error"] == "NoTranslation"
    nil
  else
    translation_hash["term0"]["PrincipalTranslations"]["0"]["FirstTranslation"]["term"]
  end
end

def word_in_grid?(attempt, grid)
  attempt.upcase.split("").all? do |letter|
    grid.include?(letter)
    grid.delete(letter)
  end
end

def hash_result(time, score, message, translation = nil)
  {
    time: time,
    translation: translation,
    score: score,
    message: message
  }
end


