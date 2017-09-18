gem 'remedy'

require 'remedy'

include Remedy
user_input = Interaction.new

user_input.loop do |key|
  puts key
end