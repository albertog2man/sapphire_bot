require 'discordrb'

require_relative 'sapphire_bot/logger'

Discordrb::LOGGER = LOGGER = SapphireBot::Logger.new

begin
  require "#{Dir.pwd}/config"
rescue => e
  LOGGER.log_exception e
  exit
end

require_relative 'sapphire_bot/version'

require_relative 'sapphire_bot/helpers'
require_relative 'sapphire_bot/shortener'
require_relative 'sapphire_bot/shorten_text'
require_relative 'sapphire_bot/stats'

Dir["#{File.dirname(__FILE__)}/sapphire_bot/commands/*.rb"].each { |file| require file }
Dir["#{File.dirname(__FILE__)}/sapphire_bot/events/*.rb"].each { |file| require file }

require_relative 'sapphire_bot/base'
