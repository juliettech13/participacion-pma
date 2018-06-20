class MessengerController < Messenger::MessengerController
  def webhook
    #logic here
    Bot.on :message do |message|
      message.reply(text: 'Hello, human!')
    end
    render nothing: true, status: 200
  end
end
