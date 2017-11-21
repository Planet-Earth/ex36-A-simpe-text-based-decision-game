# ex36.rb
# Exercise 36: Designing and Debugging
# Offering basic guidelines to follow when utilizing for-loops and while-loops
# Also providing tips on debugging that can help to solve problems within
# a program while creating a simple game


# Rules for If-Statements
# ------------------------- #
# 1. Every 'if-statement' must ahs an 'else'

# 2. If this 'else' should never run because it doesn't make sense, then you
# must use a 'die' function in the 'else' that prints out an error message and
# dies, just like ex35.rb did. This will find many errors.

# 3. Never nest 'if-statements' more than two deep and always try to do them
# one deep.

# 4. Treat 'if-statements' like paragraphs, where each 'i-elsif-else' grouping
# is like a set of sentences. Put blank lines before and after.

# 5. Your Boolean tests should be simple. If they are complex, move their
# calculations to variables earlier in your function and use a good name for
# the variable.
# ------------------------- #


# Rules for Loops
# ------------------------- #
# 1. Use a 'while-loop' only to loop forever, and that means probably never.
# This only applies to Ruby; other languages are different.

# 2. Use a 'for-loop' for all other kinds of loopingm, especially if there is
# a ficed or limited number of things to loop over.
# ------------------------- #


# Tips for Debugging
# ------------------------- #
# 1. Do not use a "debugger." A debugger is like doing a full-body scan on a
# sick person. You do not get any specific useful information, and you find a
# whole lot of information that doesn't help and is just confusing.

# 2. The best way to debug a progam is to use 'put' to print out the values
# of variables at points in the program to see where they go wrong.

# 3. Make sure parts of your programs work as you work on them. Do not write
# massive files of code before you try to run them. Code a little, run a
# little, fix a little.
# ------------------------- #

# The beginning of your game! Get crackin'!

# A module designed to focus around the Player's commands, actions, and
module Player
  name = "Empty"          # Player's name
  sex = "yes, please"     # Player's gender
  @location = "beginning"  # Player's current "room" location

  @inventory = ['sandwich']   # Item on player's person

  @objects = [['beginning', 'torch'],   # Different collectable items
              ['rubble', 'knob'],       # Each item respective to their room
              ['apothecary', 'potion'], # The first word in each sub-array in the room
              ['treasure', 'gold', 'sword']]  # Every word after the first are the items found in each room

  # Registry of rooms, mainly used for testing
  @room_registry = ["beginning", "rubble", "apothecary", "treasure", "guard", "eye", "test"]

# This method is designed to function as an interpreter for the user's input,
# allowing various commands to be entered and returned no matter where the
# user is within the game
# CURRENTLY: This is a hack of what it is suppose to be and is mainly used for
# testing various things
  def Player.input(input)
    words = input.split(' ')
    # input needs to be broken down and checked for multiple words for multi part arguments
    if words[0] == "help"
      puts "Interestly, there appears to be some sort of \"Help\" memory:"
      puts "Try \"inventory\" to check what you are currently in possession of."
      puts "If you want to check that status on yourself, you can also look\n your \"character\"."
    elsif words[0] == "look"
      # When "looking" at the room, the Player.location is called upon to call the Rooms.'method' to display the player's current location
      # puts "Calling method <#{@location}>" # Used to check if-flow
      Rooms.send(@location)

    elsif words[0] == "search"
      # Empty

    elsif words[0] == "goto"
    # goto is used to transport the player to other Rooms
    # Mainly used for debugging
      for i in @room_registry
        if i == words[1]
          Rooms.send(i)
        end
      end
      puts "Go where!?"
      user_input

    elsif words[0] == "get"
    # get is used to collect items found in Rooms
      if !words[1]; puts "Get what?"; user_input;
      elsif @objects.include?(words[1])
        # Need ary.index
        # Need ary.select
           # THIS ISN'T WORKING!!!!
        j = 0
        for i in @objects
          puts "======"
          puts @objects[j][0]
          puts " + "
          puts @objects[j][1]
          puts "\n" # Debugging
          if @objects[j][0] == @location && words[1] == @objects[j][1]
            puts "test"
            user_input
          end
          j += 1
        end
      end

    elsif words[0] == "unlock"
      # Empty

    elsif words[0] == "open"
      # Empty

    elsif words[0] == "use"
      # Empty

    elsif words[0] == "inventory"
    # 'inventory' used to display player's contents
      print "Inventory: "
      for i in @inventory
        print i.capitalize + " "
      end

    else
      puts "Huh!?"
    end

    input
  end

  # Used as a setter for Player.location
  # Method used to alter the "location" variable withinig Player
  def Player.set_location(input)
    @location = input
  end
end # End of module Player

# Descriptions need to be added
# Arguments need to added with regards to the various arguments (search, get, etc)
class Rooms
  # This is suppose to function as a beginning to the game; a simple room to
  # allow the player to become familiar with the commands
  def self.beginning
    Player.set_location("beginning")        #Defining player location

    puts "You find yourself within a large white void."
    puts "You can't move."
    puts "You aren't sure if you are currently seeing anthing."
    puts "But you know that you exist."
    puts "\nGive a thought and see if anything comes of it...\n"

    user_input
  end

  def self.rubble
    Player.set_location("rubble")           # Defining player location

    user_input
  end

  def self.apothecary
    Player.set_location("apothecary")       # Defining player location

    user_input
  end

  def self.treasure
    Player.set_location("treasure")         # Defining player location

    user_input
  end

  def self.guard
    Player.set_location("guard")            # Defining player location

    user_input
  end

  def self.eye
    Player.set_location("eye")              # Defining player location

    user_input
  end

  # A empty "room" to test various commands
  def self.test
    puts "*** TESTING GROUNDS ***\n"

    user_input
  end
end # End of class Rooms

def user_input
  print "> "
  Player.input($stdin.gets.chomp)
end

Rooms.beginning
