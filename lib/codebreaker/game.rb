module Codebreaker
  class Game
		def initialize(messenger)
			@messenger=messenger
		end

		def start(code_or_generator)
			@code=code_or_generator.respond_to?(:code) ?
				code_or_generator.code : code_or_generator
			@messenger.puts "Welcome to Codebreaker!"
			@messenger.puts "Enter guess:"
		end
		def guess(guess)
			result=[nil,nil,nil,nil]
			guess.each_with_index do |peg,index|
				if @code[index]==peg
					result[index]="b"
				elsif @code.include?(peg)
					result[@code.index(peg)] ||= "w"
				end
			end
			@messenger.puts result.compact.sort.join
		end
	end
end
