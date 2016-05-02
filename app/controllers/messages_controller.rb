class MessagesController < ApplicationController
  before_action :client

  def callback
    signature = request.env['HTTP_X_LINE_CHANNELSIGNATURE']
    unless client.validate_signature(request.body.read, signature)
      error 400 do 'Bad Request' end
    end

    receive_request = Line::Bot::Receive::Request.new(request.env)

    receive_request.data.each { |message|
      case message.content
      when Line::Bot::Message::Text
        client.send_text(
          to_mid: message.from_mid,
          text: message.content[:text],
        )
      end
    }

    "OK"
  end

  private

  def client
    @client ||= Line::Bot::Client.new do |config|
      config.channel_id = Figaro.env.line_channel_id
      config.channel_secret = Figaro.env.line_channel_secret
      config.channel_mid = Figaro.env.line_channel_mid
    end
  end
end
