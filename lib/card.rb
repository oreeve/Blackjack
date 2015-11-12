class Card
  attr_reader :suit, :value
  # SUITS = ['♦', '♣', '♠', '♥']
  # RANKS = [2,3,4,5,6,7,8,9,10,'J','Q','K','A']

  def initialize(suit, value)
    @suit = suit
    @value = value
  end

  def type
      if @value == 'A'
        return 'Ace'
      elsif @value == 'K' || @value == 'Q' || @value == 'J'
        return 'Face'
      else
        return 'Number'
      end
    end
end
