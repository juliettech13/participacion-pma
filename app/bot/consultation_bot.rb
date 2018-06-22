include Facebook::Messenger
Facebook::Messenger::Subscriptions.subscribe(access_token: ENV["ACCESS_TOKEN"])


## PLEASE SEE chatbot_mapping_reference for some inspiration

# to handle messages

Bot.on :message do |message|
  # this is too define what happens on message
  # here is sample text to test out
  message.typing_on

  message.reply(
  text: Question.find(1).content,
  quick_replies: [
    {
      content_type: 'text',
      title: 'Yo',
      payload: 'YES'
    },
     {
      content_type: 'text',
      title: 'No',
      payload: 'NO'
    }
  ]
)
end

Bot.on :postback do |postback|
  # this for postbacks on the webhook, which is mostly what we'll be working with

  #should trigger the start of a consultation
  # i.e.: start_consultation(postback)
end

## Messenger bot logic with methods

# have a method to execute our consultation

def start_consultation postback
  # set_answer(@user)

  # should create a new user object
  # should create a new consultation object
  # get_started
end

# get started menu

def get_started
  # displays instructions and introduction
  # displays a menu of the sections with a get started button (can choose
  # a specific section or get started defaults to section one)
  section_read(@section)
end

# this loops through the selected section with each clause being shown followed by the question method

def section_read
  # loop through the clauses of the selected section
  # ask question series after each clause
  # post responses as Answer object?
    ask_questions(clause)
end


# consultation questions and answers

def initialize_question
  #not sure if this can be one method or separate methods for questioning
  #initialize the consultation of a clause

  answer = postback.payload

  case answer
  when "OPTION 1"
    # i.e. Answer.new(content: answer)
    ask_next_question
  when "OPTION 2"
    puts 'Ask zeroth question'
    ask_next_question
  else
    puts "Not a valid response!"
    ask_next_question
  end
end

def ask_next_question
  # to go to the next question in the sequence
end

def legislation_feedback
  # to provide Feedback.new for the legislation at end of consultation
end

def done
  #potentially, if we need
end

private

# sample create user function

def create_new_user(messenger_id)
  @user = User.new(messenger_id: messenger_id)
  #should we add messenger_id to the users table so that we can distinguish which are messenger and which are webapp?

  # Get user info from Messenger User Profile API
  url = "https://graph.facebook.com/v2.6/#{messenger_id}?fields=first_name,last_name,gender&access_token=#{ENV["ACCESS_TOKEN"]}"
  user_data = api_call(url)

  # Store user's info
  @user.save
end

def set_answer user
  user_id = user.id
  @answer = Answer.where(user_id: user_id).first
  # If answer does not exist, create new
  create_new_answer(user_id) unless @answer
end

