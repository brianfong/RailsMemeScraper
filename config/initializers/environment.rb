def user_agent
    "Reddit::Scraper v0.0.4 (https://github.com/brianfong/RedditScraper)"
end

logger = Logger.new(STDOUT)
logger.level = Logger::DEBUG