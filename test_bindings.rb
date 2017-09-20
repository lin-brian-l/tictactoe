require 'remedy'
include Remedy

def check_input(key, coordinate)
  valid_input = ["up", "down", "left", "right"]
  valid_range = (0..2).to_a

  if !valid_input.include?(key.to_s)
    puts "nope"
  else
    if key.to_s == "down" && valid_range.include?(coordinate[0]+1)
      coordinate[0] += 1
      p coordinate
    elsif key.to_s == "up" && valid_range.include?(coordinate[0]-1)
      coordinate[0] -= 1
      p coordinate
    elsif key.to_s == "left" && valid_range.include?(coordinate[1]-1)
      coordinate[1] -= 1
      p coordinate
    elsif key.to_s == "right" && valid_range.include?(coordinate[1]+1)
      coordinate[1] += 1
      p coordinate
    else
      puts "you done f'd up"
    end
  end
end

def loop_user_input
  coordinate = [0,0]
  taken_coordinates = []
  user_input = Interaction.new
  user_input.loop do |key|
    puts key
    check_input(key, coordinate)
  end
end

loop_user_input
