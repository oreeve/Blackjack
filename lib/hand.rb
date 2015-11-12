
class Hand

  attr_reader :cards

  def initialize(deck)
    @score = 0
    @cards = []
    @deck = deck
    2.times do
      @cards << deck.deal
    end
  end

  def hit
    @cards << @deck.deal
  end

  def score
    @score = 0
    @cards.each do |card|
        if card.to_i != 0
          @score += card.to_i
        elsif card.include?('A')
          if @score >= 11
            @score += 1
          else
            @score += 11
          end
        else
          @score += 10
        end
    end
    return @score
  end

end
