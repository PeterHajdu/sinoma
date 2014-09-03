require 'rubygems'
require 'ruby-notify-my-android'

class Sinoma

  def initialize( event_source, api_key )
    @event_source = event_source
    @api_key = api_key
  end

  def start
    loop do
      while ( line = @event_source.gets ) do
        send_notification line
      end
    end
  end

  private
  def send_notification( message )
    NMA.notify do | notification |
      notification.description = message
      notification.apikey = @api_key
    end
  end

end

