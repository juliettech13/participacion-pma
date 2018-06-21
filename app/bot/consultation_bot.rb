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
end

## Written Commands
# 'skip' - skip to the next section
# 'done' - skip to the end and provide feedback on full policy
# 'menu' - go back to the menu of the sections

## Welcome

# Welcome {first_name} to the consultation for the National ICT Innovation and Entrepreneurship Policy Vision. Message me anytime to continue, your input matters!
# Action: Get Started [button]


## Overview
# The vision intends to create a unifying policy vision for transforming Nigeria's economy and accelerating economic growth. The vision is composed of an introduction and four chapters, and you are invited to feedback on specific policy recommendations, on chapters, on the introduction and on the entire policy.

# You will be able to interact with each section and sub-section, if you want to get an overview of the policy at any time type ‘menu’. All of your input on each section is saved as you go. You will be asked two questions before having the opportunity to provide a suggested revision. Write ‘skip’ if you ever want to skip to the next section.
# Action: See Overview [button]

# Menu
# Introduction
# Section 1
# Section 2
# Section 3
# Section 4


## Example

# Introduction (1 of 2): Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.

# Question 1: Do you feel this is representative of your views?
# Options: Yes, No
# Question 2: Does this push the future of Nigeria ICT in the right direction?
# Options: Definitely, Yes, Somewhat, No
# Question 3: Please provide your suggested revision?
# *NLP, we can capture the data of numbers with Facebook built-in NLP


## Action: written response

# Section Review
# **If it is the last sub-section in the section,

# Please provide your general feedback on Section 1: Digital Infrastructure.
# Action: written response


## Policy Review
# Please provide us your overall feedback on the National ICT Innovation and Entrepreneurship Policy Vision.”
# Action: written response


## Completion
# Thank you for your time and participation, blah blah blah.
