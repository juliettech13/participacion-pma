include Facebook::Messenger
Facebook::Messenger::Subscriptions.subscribe(access_token: ENV["ACCESS_TOKEN"])

# Message variables

chatbot_description = "National ICT Innovation and Entrepreneurship Policy Vision wants to give citizens the chance to participate and shape national economic policy."

# Settings for chatbot presentation page - adds a description and a Get Started button
Facebook::Messenger::Profile.set({
  greeting: [
    {
      locale: 'default',
      text: chatbot_description
    }
  ],
  get_started: {
      payload: "GET_STARTED"
  }

}, access_token: ENV['ACCESS_TOKEN'])

Bot.on :message do |message|
  # this is too define what happens on message
  # here is sample text to test out
  # puts "--message"
  # p message
  # messenger_id = message.sender["id"]
  # current_user = get_user(messenger_id)

end

Bot.on :postback do |postback|
  # greet the current user when clicking on 'Get Started button'
  if postback.payload == "GET_STARTED"
    puts "--postback"
    p postback
    greet_current_user(postback)
  end
end

# Message methods

def greet_current_user(postback)
  messenger_id = postback.sender["id"]
  p current_user = User.where(messenger_id: messenger_id).first
  postback.reply(
    text: "Welcome #{current_user.first_name} to the consultation for the National ICT Innovation and Entrepreneurship Policy Vision."
  )
  sleep(1)
  postback.reply(
    attachment:{
      type: 'template',
      payload: {
        template_type: 'button',
        text: "We need your help to create and shape a unifying policy vision for transforming Nigeria's economy and accelerating economic growth. Your input matters!",
        buttons: [
          {type: 'postback', title:"Let's go!", payload: 'START_CONSULTATION'}
        ]
      }
    }
  )
end

# User methods

def get_user(messenger_id)
  @user = User.where(messenger_id: messenger_id).first
  # If user does not exist, create new
  create_new_user(messenger_id) unless @user
end

def create_new_user(messenger_id)
  @user = User.new(messenger_id: messenger_id)
  # Get user info from Messenger User Profile API
  url = "https://graph.facebook.com/v2.6/#{messenger_id}?fields=first_name,last_name&access_token=#{ENV["ACCESS_TOKEN"]}"
  user_data = api_call(url)
  # Store user's name
  @user.first_name = user_data["first_name"]
  @user.last_name = user_data["last_name"]
  @user.email = "#{messenger_id}@mail.com"
  @user.password = "#{messenger_id}"
  @user
  @user.save!
end

def api_call(url)
  require 'json'
  require 'open-uri'
  user_data = JSON.parse(open(url).read)
end
