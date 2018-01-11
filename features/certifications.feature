Feature: when an admin logins to view certifications they should be able to view a list of all certifications and certification details which include list of all workshops

Scenario: Admin user
Given I am admin user
When I log in to bauji
Then I should be allowed to view list of all certifications
And I should be allowed to view all workshops of each of the certifications