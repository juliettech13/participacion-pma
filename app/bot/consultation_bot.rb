include Facebook::Messenger
Facebook::Messenger::Subscriptions.subscribe(access_token: ENV["ACCESS_TOKEN"])


# Settings for chatbot presentation page - adds a description and a Get Started button
Facebook::Messenger::Profile.set({
  greeting: [
    {
      locale: 'default',
      text: "National ICT Innovation and Entrepreneurship Policy Vision wants to give citizens the chance to participate and shape national economic policy."
    }
  ],
  get_started: {
      payload: "GET_STARTED"
  }

}, access_token: ENV['ACCESS_TOKEN'])

Bot.on :message do |message|
  puts "--message"
  p message
  messenger_id = message.sender["id"]
  p current_user = User.where(messenger_id: messenger_id).first

  case message.quick_reply

    when "USAGE_EXPLANATION"
      usage_explanation(message)

    when "START_CONSULTATION"
      start_consultation(message)

    when "QUESTION_1"
      question_one(message)

    when "ANSWER_QUESTION_ONE"
      question_two(message)

    when "ANSWER_QUESTION_TWO_INTRO"
      transition(message)

    when "ANSWER_QUESTION_TWO"
      next_section(message)

  end

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
    text: "We need your help to create and shape a unifying policy vision for transforming Nigeria's economy and accelerating economic growth. Your input matters!",
    quick_replies:[
      {
        content_type: 'text',
        title: "I want to help",
        payload: 'USAGE_EXPLANATION'
      }
    ]
  )
end

def usage_explanation(message)
  message.typing_on
  message.reply(
  text: "The vision is composed of an introduction and four chapters, and you are invited to feedback on each part, on specific policy recommendations, and on the entire policy."
  )
  message.typing_on
  message.reply(
    text: "You will be able to interact with each section and sub-section, if you want to get an overview of the policy at any time type ‘menu’. All of your input on each section is saved as you go. You will be asked two questions before having the opportunity to provide a suggested revision. Write ‘skip’ if you ever want to skip to the next section.",
    quick_replies:[
      {
        content_type: "text",
        title: "I'm ready",
        payload: 'START_CONSULTATION'
      }
    ]
  )
end

def start_consultation(message)
  message.typing_on
  message.reply(
    text: "Awesome ! Let's start with the overall aim of the policy vision."
  )
  message.typing_on
  message.reply(
    text: "This is a sample summary of the intro with the main points. Make it short and sweet to frame the goal of the policy.",
    quick_replies:[
      {
        content_type: "text",
        title: "Got it!",
        payload: 'QUESTION_1'
      },
      {
        content_type: "text",
        title: "Tell me more",
        payload: 'DETAIL_POLICY_INTRO'
      }
    ]
  )
end

def transition(message)
  message.typing_on
  message.reply(
    text: "Cool! FYI, with these first simple responses, you just helped shape policy on a national level. Pretty cool, right?",
    quick_replies: [
      {
        content_type: 'text',
        title: "Let's keep going!",
        payload: "END_TRANSITION"
      }
    ]
  )
  message.typing_on
  message.reply(
    text: "Let's get into the details of the policy. This is where your input matters the most !"
  )
  section_one(message)
end

def section_one(message)
  message.typing_on
  message.reply(
    text: "The policy is composed of 3 main sections. Let's go over each one together to get things going in the right direction."
  )
  message.typing_on
  message.reply(
    text: "This is a sample text that gives the overall aim of section 1.",
    quick_replies:[
      {
        content_type: "text",
        title: "Got it!",
        payload: 'QUESTION_1'
      },
      {
        content_type: "text",
        title: "Tell me more",
        payload: 'DETAIL_SECTION_ONE'
      }
    ]
  )
end

# Question messages

def question_one(message)
  message.typing_on
  message.reply(
    text: "On a scale of 1 to 5, do you feel that this policy is representative of your views ? 1 means that it is not at all representative, while 5 means it is completely representative.",
    quick_replies:[
      {
        content_type: "text",
        title: "1",
        payload: 'ANSWER_QUESTION_ONE'
      },
      {
        content_type: "text",
        title: "2",
        payload: 'ANSWER_QUESTION_ONE'
      },
      {
        content_type: "text",
        title: "3",
        payload: 'ANSWER_QUESTION_ONE'
      },
      {
        content_type: "text",
        title: "4",
        payload: 'ANSWER_QUESTION_ONE'
      },
      {
        content_type: "text",
        title: "5",
        payload: 'ANSWER_QUESTION_ONE'
      }
    ]
  )
end

def question_two(message)
  message.typing_on
  message.reply(
    text: "Next question. Using the same scale, do you feel that this pushes the future of Nigeria ICT in the right direction ?",
    quick_replies:[
      {
        content_type: "text",
        title: "1",
        payload: 'ANSWER_QUESTION_TWO'
      },
      {
        content_type: "text",
        title: "2",
        payload: 'ANSWER_QUESTION_TWO'
      },
      {
        content_type: "text",
        title: "3",
        payload: 'ANSWER_QUESTION_TWO'
      },
      {
        content_type: "text",
        title: "4",
        payload: 'ANSWER_QUESTION_TWO'
      },
      {
        content_type: "text",
        title: "5",
        payload: 'ANSWER_QUESTION_TWO'
      }
    ]
  )
end

def question_two_intro(message)
  message.typing_on
  message.reply(
    text: "Next question. Using the same scale, do you feel that this pushes the future of Nigeria ICT in the right direction ?",
    quick_replies:[
      {
        content_type: "text",
        title: "1",
        payload: 'ANSWER_QUESTION_TWO_INTRO'
      },
      {
        content_type: "text",
        title: "2",
        payload: 'ANSWER_QUESTION_TWO_INTRO'
      },
      {
        content_type: "text",
        title: "3",
        payload: 'ANSWER_QUESTION_TWO_INTRO'
      },
      {
        content_type: "text",
        title: "4",
        payload: 'ANSWER_QUESTION_TWO_INTRO'
      },
      {
        content_type: "text",
        title: "5",
        payload: 'ANSWER_QUESTION_TWO_INTRO'
      }
    ]
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
