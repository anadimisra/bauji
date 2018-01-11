Feature: Job Posts

Scenario: Maximum years of experience should be greater than minimum years when adding job post
Given "I am publishing a new job post for DevOps Coach in Bangalore"
When "I choose 4 years minimum experience"
Then "The maximum years of experience should be 5 years or more"