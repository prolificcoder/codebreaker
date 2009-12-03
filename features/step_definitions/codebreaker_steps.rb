def messenger
	@messeger ||=StringIO.new
end

def game
	@game ||=Codebreaker::Game.new(messenger)
end

def messages_should_include(message)
	messenger.string.split("\n").should include(message)
end

def fixnum_from(string) 
	string.scan(/\d/).join.to_i
end
Given /^I am not yet playing$/ do
end

When /^I start a new game$/ do
	game.start(%w[r g y c])
end

Given /^the secret code is (. . . .)$/ do|code|
	game.start(code.split)
end

When /^I guess (. . . .)$/ do |code|
	game.guess(code.split)
end

When /^I should see "([^\"]*)"$/ do |message|
	messages_should_include(message)
end

Then /^the mark should be (.*)$/ do |mark|
	messages_should_include(mark)
end

Given /^6 colors$/ do
end

Given /^4 positions$/ do
end

When /^I play (.*) games$/ do |number|
		fixnum_from(number).times do
			game.start
		end
	end
end

Then /^each color should appear between 1500 and 1800 times in each position$/ do
			  pending # express the regexp above with the code you wish you had
end

Then /^each color should appear no more than once in each secret code$/ do
				  pending # express the regexp above with the code you wish you had
end

