module NumberGenerator
	extend ActiveSupport::Concern

	NUMBER_LENGTH  = 9
  NUMBER_LETTERS = false
  NUMBER_PREFIX  = 'n'

  included do
    before_validation :generate_number, on: :create
    validates :number, presence: true, uniqueness: true
  end

  def self.by_number(number)
    where(number: number)
  end

  def generate_number(options = {})
    options[:length] ||= NUMBER_LENGTH
    options[:letters] ||= NUMBER_LETTERS
    options[:prefix] ||= NUMBER_PREFIX

    possible = (0..9).to_a
    possible += ('a'..'z').to_a if options[:letters]

    self.number ||= loop do
      # Make a random number.
      random = "#{options[:prefix]}#{(0...options[:length]).map { possible.sample }.join}"
      # Use the random  number if no other order exists with it.
      if self.class.exists?(number: random)
        # If over half of all possible options are taken add another digit.
        options[:length] += 1 if self.class.count > (10**options[:length] / 2)
      else
        break random
      end
    end
  end
end