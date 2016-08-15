require 'nokogiri'
require 'open-uri'
require_relative "recipe"

class JamieOliver
  def search(ingredient)
    results = [] # Array of Recipe instances

    url = "http://www.jamieoliver.com/search/?s=#{ingredient}"
    html = Nokogiri::HTML(open(url))

    html.search('.recipe').each do |node|
      name = node.search('h2').text
      url = node.search('a').attr('href')
      cooking_time = node.search('.time').text.strip

      recipe = Recipe.new(name, nil)
      recipe.url = url
      recipe.cooking_time = cooking_time
      results << recipe
    end

    return results
  end

  def enrich(recipe)
    html = Nokogiri::HTML(open(recipe.url))
    description = html.search('.recipe-intro').text.strip
    recipe.description = description
  end
end
