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
  p current_user = get_user(messenger_id)
  legislation = Legislation.last

  case message.quick_reply

    when "USAGE_EXPLANATION"
      usage_explanation(message)

    when "START_CONSULTATION"
      start_consultation(message, current_user, legislation)

    #SECTION 1, CLAUSE 1, QUESTION 1
    when "S1_C1_Q1"
      question_one(message,section_id:1,clause_id:1)

    when "ANSWER_S1_C1_Q1"
      p message
      set_answer(message,section_id:1, clause_id:1, question_id:1, user_id: current_user.id)
      question_two(message, section_id:1, clause_id:1)

    #SECTION 1, CLAUSE 1, QUESTION 2
    when "ANSWER_S1_C1_Q2"
      p message
      set_answer(message,section_id:1, clause_id:1, question_id:2, user_id: current_user.id)
      next_clause(message, section_id:1, clause_id:2)

    #SECTION 1, CLAUSE 2, QUESTION 1 (4)
    when "S1_C2_Q1"
      question_one(message,section_id:1,clause_id:2)

    when "ANSWER_S1_C2_Q1"
      p message
      set_answer(message,section_id:1, clause_id:2, question_id:4, user_id: current_user.id)
      question_two(message, section_id:1, clause_id:2)

    #SECTION 1, CLAUSE 2, QUESTION 2 (5)
     when "ANSWER_S1_C2_Q2"
      p message
      set_answer(message,section_id:1, clause_id:2, question_id:5, user_id: current_user.id)
      next_section(message, section_id:2, clause_id:3)

    #SECTION 2, CLAUSE 1 (3), QUESTION 1 (7)
    when "S2_C3_Q1"
      p message
      question_one(message,section_id:2,clause_id:3)

    when "ANSWER_S2_C3_Q1"
      p message
      set_answer(message,section_id:2, clause_id:3, question_id:7, user_id: current_user.id)
      question_two(message, section_id:2, clause_id:3)

    #SECTION 2, CLAUSE 1 (3), QUESTION 2 (8)
    when "ANSWER_S2_C3_Q2"
      p message
      set_answer(message,section_id:2, clause_id:3, question_id:8, user_id: current_user.id)
      next_clause(message, section_id:2, clause_id:4)

    #SECTION 2, CLAUSE 2 (4), QUESTION 1 (10)
    when "S2_C4_Q1"
      p message
      question_one(message,section_id:2, clause_id:4)

    when "ANSWER_S2_C4_Q1"
      p message
      set_answer(message,section_id:2, clause_id:4, question_id:10, user_id: current_user.id)
      question_two(message, section_id:2, clause_id:4)

    #SECTION 2, CLAUSE 2 (4), QUESTION 2 (11)
    when "ANSWER_S2_C4_Q2"
      p message
      set_answer(message,section_id:2, clause_id:4, question_id:11, user_id: current_user.id)
      next_section(message, section_id:3, clause_id:5)

    #SECTION 3, CLAUSE 1 (5), QUESTION 1 (13)
    when "S3_C5_Q1"
      p message
      question_one(message, section_id:3, clause_id:5)

    when "ANSWER_S3_C5_Q1"
      p message
      set_answer(message,section_id:2, clause_id:5, question_id:13, user_id: current_user.id)
      question_two(message, section_id:3, clause_id:5)

    # SECTION 3, CLAUSE 1 (5), QUESTION 2 (14)
    when "ANSWER_S3_C5_Q2"
      p message
      set_answer(message,section_id:2, clause_id:5, question_id:14, user_id: current_user.id)
      next_clause(message, section_id:3, clause_id:6)

    #SECTION 3, CLAUSE 2 (6), QUESTION 1 (16)
    when "S3_C6_Q1"
      p message
      question_one(message,section_id:3,clause_id:6)

     when "ANSWER_S3_C6_Q1"
      p message
      set_answer(message,section_id:3, clause_id:6, question_id:16, user_id: current_user.id)
      question_two(message, section_id:3, clause_id:6)

    #SECTION 3, CLAUSE 2 (6), QUESTION 2 (17)
     when "ANSWER_S3_C6_Q2"
      p message
      set_answer(message, section_id:3, clause_id:6, question_id:17, user_id: current_user.id)
      #TO DO: METHOD TO FINISH SURVEY

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

# INTRO AND GOODBYE MESSAGES

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

#NAVIGATION

def start_consultation(message, user, legislation)
  consultation = Consultation.find_or_create_by(user: user, legislation: legislation)

  message.typing_on
  message.reply(
    text: "Awesome ! Let's start with the overall aim of the policy vision."
  )
  message.typing_on
  message.reply(
    text: "This is a sample summary of the first clause in the first section with the main points. Make it short and sweet to frame the goal of the policy.",
    quick_replies:[
      {
        content_type: "text",
        title: "Got it!",
        payload: "S1_C#{consultation.id}_Q1"
      }
    ]
  )
end


def next_clause(message,section_id:,clause_id:)
  message.typing_on
  message.reply(
    text: "This is a sample text that gives the overall aim of clause #{clause_id} of section #{section_id}. It's probably better to send an image of the clause here in order to avoid a super lengthy message.",
    quick_replies:[
      {
        content_type: "text",
        title: "Got it!",
        payload: "S#{section_id}_C#{clause_id}_Q1"
      }
    ]
  )

end

def next_section(message, section_id:, clause_id:)
  message.typing_on
  message.reply(
    text: "This is a sample text that gives the overall aim of section #{section_id}.",
    quick_replies:[
      {
        content_type: "text",
        title: "Got it!",
        payload: "S#{section_id}_C#{clause_id}_Q1"
      }
    ]
  )
end

# Question messages

def question_one(message, clause_id:, section_id:)
  # need to ID the question
  message.typing_on
  message.reply(
    text: "On a scale of 1 to 5, do you feel that this policy is representative of your views ? 1 means that it is not at all representative, while 5 means it is completely representative.",
    quick_replies: ["1","2","3","4","5"].map do |number|
      {
        content_type: "text",
        title: "#{number}",
        payload: "ANSWER_S#{section_id}_C#{clause_id}_Q1"
      }
    end
  )
end

def question_two(message, clause_id:, section_id:)
  message.typing_on
  message.reply(
    text: "Next question. Using the same scale, do you feel that this pushes the future of Nigeria ICT in the right direction ?",
    quick_replies: ["1","2","3","4","5"].map do |number|
      {
        content_type: "text",
        title: "#{number}",
        payload: "ANSWER_S#{section_id}_C#{clause_id}_Q2"
      }
    end
  )
end


# User methods
def get_user(messenger_id)
  user = User.find_by(messenger_id: messenger_id)

  # If user does not exist, create new
  user = create_new_user(messenger_id) unless user

  user
end

# TO DO: how do we set valid e-mail and password through Messenger (as these are
# required fields to create a new user b/c of Devise). Method below sets a dummy
# e-mail and password based on the user's unique Messenger ID.

def create_new_user(messenger_id)
  user = User.new(messenger_id: messenger_id)
  # Get user info from Messenger User Profile API
  url = "https://graph.facebook.com/v2.6/#{messenger_id}?fields=first_name,last_name&access_token=#{ENV["ACCESS_TOKEN"]}"
  user_data = api_call(url)
  # Store user's name
  user.first_name = user_data["first_name"]
  user.last_name = user_data["last_name"]
  user.email = "#{messenger_id}@mail.com"
  user.password = "#{messenger_id}"

  user.save!
end

def api_call(url)
  require 'json'
  require 'open-uri'
  user_data = JSON.parse(open(url).read)
end

def set_answer(message, section_id:, clause_id:, question_id:, user_id:)
  section = Section.where(id: section_id).first
  clause = Clause.where(id: clause_id).first
  @answer = Answer.new(question_id: question_id, user_id: user_id, content: message.text)
  @answer.question.clause.id = clause.id
  @answer.question.clause.section.id = section.id
  @answer.save!
end
