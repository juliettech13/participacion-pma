# National Policy Consultation 

This is the opensource code repository of the digital policy consultation tool that will serve as the backbone for policy consultations across several countries in Africa and beyond. It is a digital policy consultation across a nation as a Rails App with two key elements: (a) a ‘collaborative policy-writing’ tool (b) a Facebook messenger bot. The consultation will be live for a specified perod, after which the insight, feedback, and deliberation will be consolidated, integrated, and built into a revised citizen-driven national vision for ICT innovation and entrepreneurship.

## Work Flows

We have a [project board](https://github.com/i4policy/policy_consultation/projects/1) that is interacting with our [issues list](https://github.com/i4policy/policy_consultation/issues) and subsequent pull requests on those issues; the issues are labeled accordingly and associated with the [four milestones](https://github.com/i4policy/policy_consultation/milestones). 

When all the four milestones are completed, we will be ready to deploy the first national online policy consultation in Africa starting July 2nd.

## User Stories

##### User: innovation hub leaders, founders, employees, entrepreneurs, aspiring entrepreneurs, techies, programmers 
##### Admin: Office of Sub-Saharan Country 
##### Policy: Innovation and Entrepreneurship Policy Vision 

### Web App: 
We are going to modify a fork of Consul (information and documentation can be found below), a civic engagement tool developed by the city council of Madrid from 2015 onward. There are several tools in the Consul suite, however the one that we will be customizing and building off of for the consultation is the legislative processes and collaborative policy capability.

The core user story is as follows: 

* As a User, I want to see how the consultation works so that I know what I’m supposed to do.
* As a User, I want to interact with each sentence and section of the policy document so that I can provide my feedback without any minimum required input. 
* As a User, I want to see my tangible contribution so that I can feel proud of my contribution, share it, and encourage others to get involved. 
* As a User, I want to be able to remain anonymous to the admin with my contribution. 
* As a User, I want to be notified when the final version of the policy is released. 
* As an Admin, I want to be able to see all of the inputs from the consultation.
* As an Admin, I want to be able to respond and interact with specific pieces of feedback and deliberation so that I can get more clarity or provide further clarity. 
* As an Admin, I want to be able to publish the revised, final version of the policy to the platform for users to see.

Relevant Documentation Here: https://consul_docs.gitbooks.io/docs/content/en/

### Messenger Bot: 

This is in efforts to make the consultation as representative as possible, and cater to a larger part of the population by (a) hitting them on the mediums they are frequenting already and (b) catering to the part of the population that only has access to Free Basics. 

So if somebody doesn’t have access to go onto the web app and access the document that way they should be able to participate like so:

* As a User, I want to read the policy in a digestible, non-overwhelming format so that I can get a grip on each section. 
* As a User, I want to be able to provide my feedback on every section through the bot. 
* As a User, I want to be able to provide overall feedback on the policy document. 
* As an Admin, I want to be able to see all of the input from the bot interactions on my admin dashboard. 

We will use one of the Ruby wrappers or Rails libraries for messenger implementation to keep the stack consistent across the board. Will also be handy for the integration, because we want citizen input from the bot and citizen input from the app to essentially feed into the same db. 

Relevant Documentation Here: https://developers.facebook.com/docs/messenger-platform/introduction

We are using the following Ruby client to build the bot into the application: 

https://github.com/jgorset/facebook-messenger
