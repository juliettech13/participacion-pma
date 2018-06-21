include Facebook::Messenger
Facebook::Messenger::Subscriptions.subscribe(access_token: ENV["ACCESS_TOKEN"])

Bot.on :message do |message|
  message.typing_on

  message.reply(
  text: Question.find(1).content ,
  quick_replies: [
    {
      content_type: 'text',
      title: 'Yes',
      payload: 'HARMLESS'
    },
     {
      content_type: 'text',
      title: 'No',
      payload: 'HARMLESS'
    }
  ]
)



