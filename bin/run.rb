require_relative '../config/environment'

test = TwitterAdapter.new
test.call_twitter #<---runs search and stores into tweets
test.add_answer_to_table

# binding.pry
# determine_emotion
