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

  if message.quick_reply
    commands = message.quick_reply.split('/')
  else
    commands = []
  end

  case commands.first

    when "USAGE_EXPLANATION"
      usage_explanation(message)

    when "START_CONSULTATION"
      start_consultation(message, current_user, legislation)

    when "SHOW_QUESTION"
      show_question(message, options: commands.last)

    when "ANSWER"
      p message
      options = commands.last
      ids = options.split(',')
      consultation_id, section_id, clause_id, question_index = ids

      set_answer(message, user_id: current_user.id, clause_id: clause_id, question_index: question_index)

      if last_question?(clause_id, question_index)
        if last_clause?(section_id, clause_id)
          # TO DO if last_section? => finish survey
          next_section(message, consultation_id: consultation_id, section_id: section_id.to_i + 1)
        else
          next_clause(message, consultation_id: consultation_id, clause_id: clause_id.to_i + 1, section_id: section_id)
        end
      else
        question_index = question_index.to_i + 1
        ids = [consultation_id, clause_id, section_id, question_index]
        show_question(message, options: ids.join(','))
      end

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
  ids = [consultation.id, 1, 1, 1]

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
        payload: "SHOW_QUESTION/#{ids.join(',')}"
      }
    ]
  )
end

def next_clause(message, consultation_id:, section_id:, clause_id:)
  ids = [consultation_id, section_id, clause_id, 1]

  message.typing_on
  message.reply(
    text: "This is a sample text that gives the overall aim of clause #{clause_id} of section #{section_id}. It's probably better to send an image of the clause here in order to avoid a super lengthy message.",
    quick_replies:[
      {
        content_type: "text",
        title: "Got it!",
        payload: "SHOW_QUESTION/#{ids.join(',')}"
      }
    ]
  )

end

def next_section(message, consultation_id:, section_id:)
  ids = [consultation_id, section_id, 1, 1]

  message.typing_on
  message.reply(
    text: "This is a sample text that gives the overall aim of section #{section_id}.",
    quick_replies:[
      {
        content_type: "text",
        title: "Got it!",
        payload: "SHOW_QUESTION/#{ids.join(',')}"
      }
    ]
  )
end

# Question messages

def show_question(message, options:)
  ids = options.split(',')
  consultation_id, section_id, clause_id, question_index = ids
  clause = Clause.find(clause_id)

  message.typing_on
  message.reply(
    text: clause.questions[question_index.to_i - 1].content
  )

  if question_index == "1"
    text = "On a scale of 1 to 5, do you feel that this policy is representative of your views ? 1 means that it is not at all representative, while 5 means it is completely representative."
  else
    text = "Next question. Using the same scale, do you feel that this pushes the future of Nigeria ICT in the right direction ?"
  end

  message.reply(
    text: text,
    quick_replies: ["1","2","3","4","5"].map do |number|
      {
        content_type: "text",
        title: number,
        payload: "ANSWER/#{options}"
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

def set_answer(message, user_id:, clause_id:, question_index:)
  clause = Clause.find(clause_id)
  question = clause.questions[question_index.to_i - 1]

  answer = Answer.new(question: question, user_id: user_id, content: message.text)

  answer.save
end

def last_question?(clause_id, question_index)
  clause = Clause.find(clause_id)
  clause_question_count = clause.questions.count

  if clause_question_count == question_index.to_i
    true
  else
    false
  end
end

def last_clause?(section_id, clause_id)
  section = Section.find(section_id)
  clause = Clause.find(clause_id)

  if section.clauses.last == clause
    true
  else
    false
  end
end
