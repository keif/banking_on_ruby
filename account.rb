class Account
    attr_reader :name
    attr_reader :balance
    def initialize(name, balance = 100)
      @name = name
      @balance = balance
    end

    private
    def pin
      @pin = 1234
    end
    def pin_error
      "Access denied: incorrect PIN."
    end

    public
    def display_balance(pin_number)
      isValidPin = pin_number === @pin

      puts isValidPin ? "Balance: $#{@balance}" : pin_error
    end
    def withdraw(pin_number, amount)
      isValidPin = pin_number === @pin ? "Withdrew #{amount}. New balance: $#{balance}." : pin_error
    end
  end