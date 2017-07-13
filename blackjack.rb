class Cards
  attr_accessor :value
  def initialize(value)
  @value = ["A", "K","Q","J","2", "3", "4", "5", "6", "7","8", "9","10","A", "K","Q","J","2", "3", "4", "5", "6", "7","8", "9","10","A", "K","Q","J","2", "3", "4", "5", "6", "7","8", "9","10","A", "K","Q","J","2", "3", "4", "5", "6", "7","8", "9","10"].shuffle
  end
end

class PlayerOne
  attr_accessor :cards, :playerOneHand
  def initialize
    @cards = []
  end
  def playerOneScore
    playerOneHand = 0
    @cards.each do |card|
      playerOneHand += card
    end
    @playerOneHand = playerOneHand
  end
end
  #hand is first card then everytime they push another card is added until the player says stop or busts(>21)
  #final score added

  #Create an value
  # hand = 0

#if Ace 11 || 1

#if value is <= 21
#prints "Do you want to Hit?"
#else puts "BUST!!"

#if get.chomp == "yes"
## Hit the Card
## else "no" Dealer Turn
# puts "Your current points are #{hand}!"


class Dealer
  attr_accessor :cards , :dealerHand
  def initialize
    @cards = []
  end
  def dealerScore
    dealerHand = 0
    @cards.each do |card|
      dealerHand += card
    end
    @dealerHand = dealerHand
  end
end

cardOne = Cards.new(1)

# give dealer Cards
dealer = Dealer.new()
player = PlayerOne.new()
2.times do |i|
  puts "hello"
  currentCard = cardOne.value.shift
  case currentCard
    when "A"
      puts "You have an ACE 11? or 1? input only a number"
      currentCard = gets.chomp.to_i
    when "K" || "Q" || "J" || "10"
      currentCard = 10
    else
      currentCard = currentCard.to_i
  end
  puts "currentCard: #{currentCard}"
  dealer.cards << currentCard

  currentCard = cardOne.value.shift
  case currentCard
    when "A"
      puts "You have an ACE 11? or 1? input only a number"
      currentCard = gets.chomp.to_i
    when "K" || "Q" || "J" || "10"
      currentCard = 10
    else
      currentCard = currentCard.to_i
  end
  puts "currentCard: #{currentCard}"
  player.cards << currentCard
end

puts dealer.cards.to_s
puts player.cards.to_s
dealer.dealerScore()
puts "Dealer Score: #{dealer.dealerScore}"
player.playerOneScore()
puts "Player Score: #{player.playerOneScore}"


hit = "hit"

while hit == "hit" && player.playerOneScore <= 21
  print "Your current score is: #{player.playerOneScore}. Would you like to (hit/stay)?"
  hit = gets.chomp
  if hit == "hit"
    currentCard = cardOne.value.shift
    case currentCard
      when "A"
        puts "You have an ACE 11? or 1? input only a number"
        currentCard = gets.chomp.to_i
      when "K" || "Q" || "J" || "10"
        currentCard = 10
      else
        currentCard = currentCard.to_i
    end
    "Player Hand : #{player.cards.push(currentCard)}"
  elsif hit == "stay"
    puts "Your current score is: #{player.playerOneScore}."
    puts "Dealer Score: #{dealer.dealerScore}"

    while dealer.dealerScore < player.playerOneScore && dealer.dealerScore < 17
      currentCard = cardOne.value.shift
      case currentCard
        when "A"
          puts "You have an ACE 11? or 1? input only a number"
          currentCard = gets.chomp.to_i
        when "K" || "Q" || "J" || "10"
          currentCard = 10
        else
          currentCard = currentCard.to_i
      end
      dealer.cards.push(currentCard)
    end
      if dealer.dealerScore > player.playerOneScore && dealer.dealerScore <= 21
        puts "DEALER WINS WITH #{dealer.dealerScore} "
      else
        puts "Player WINS WITH #{player.playerOneScore}"
      end
  end
end

if player.playerOneScore > 21
  puts "BUST at #{player.playerOneScore}! DEALER WINS WITH #{dealer.dealerScore} "
end
