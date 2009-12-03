require File.join(File.dirname(__FILE__),"..","spec_helper")
module Codebreaker
	describe Game do
		context "starting up" do
			before(:each) do
				@messenger=mock("messenger").as_null_object
				@game=Game.new(@messenger)
			end
			it "should send a welcome message " do
				@messenger.should_receive(:puts).with("Welcome to Codebreaker!")
				@game.start(%w[r g y c])
			end
			it "should prompt for a first guess" do
				@messenger.should_receive(:puts).with("Enter guess:")
				@game.start(%w[r g y c])
			end
		end
		context "marking a guess" do
			context "with all the 4 colors correct in the correct places" do
				it "should mark the guess with bbbb" do
					messenger=mock("messenger").as_null_object
					game=Game.new(messenger)
					game.start(%w[r g y c])
					messenger.should_receive(:puts).with("bbbb")
					game.guess(%w[r g y c])
				end
			end
			context "with all the 4 colors correct and 2 in correct places" do
				it "should mark the guess with bbww" do
					messenger=mock("messenger").as_null_object
					game=Game.new(messenger)
					game.start(%w[r g y c])
					messenger.should_receive(:puts).with("bbww")
					game.guess(%w[r g c y])
				end
			end
			context "with all the 4 colors correct and 1 in correct places" do
				it "should mark the guess with bwww" do
					messenger=mock("messenger").as_null_object
					game=Game.new(messenger)
					game.start(%w[r g y c])
					messenger.should_receive(:puts).with("bwww")
					game.guess(%w[y r g c])
				end
			end
		end
	end
end
