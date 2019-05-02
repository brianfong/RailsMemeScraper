# require 'rails'
require 'shotgun'
require 'faraday'
require 'json'
require 'pry'
require 'net/https'
require 'open-uri'
require 'logger'
require 'pg'
require 'uri'
require 'fileutils'
require 'mini_magick'
require 'health_check'


desc "Fetch Memes"
task :memes => :environment do


  # Move to config/initalizers/
  logger = Logger.new(STDOUT)
  logger.level = Logger::INFO

  def user_agent
    "Reddit::Scraper v0.0.4 (https://github.com/brianfong/RedditScraper)"
  end
  # end config/init..

  # Move to config/init..
  Faraday.default_connection = Faraday.new(options = {:headers=>{:user_agent => user_agent }})

  conn = Faraday.default_connection
  # End to config/init..

  # TODO: Once you have this all in the database, you can then fetch with query params before_id/after_id depending on how you want to loop
  response = conn.get 'https://www.reddit.com/r/memes/.json?limit=100'
  parsed_json = JSON.parse(response.body.to_json)

  # When in debug; write out the full thing; otherwise we'll skip it
  logger.debug parsed_json

  JSON.parse(parsed_json)['data']['children'].each do |child|

    @meme = Meme.new()

    name      = child['data']['name']
    title     = child['data']['title']
    author    = child['data']['author']
    url       = child['data']['url']
    permalink = child['data']['permalink']
    #stickied  = child['data']['stickied']

    # @meme.save
    @meme.update_attributes(:name => name, :title => title, :author => author, :url => url, :permalink => permalink)
      #, :stickied => stickied)
  end

end

