class Account
  attr_reader :name
  attr_reader :balance
  def initialize(name, balance = 100, pin = "1234")
    @name = name
    @balance = balance
    @pin = pin
  end
  
  private
  def funds_check(amount)
    @balance - amount >= 0
  end
  def funds_insufficient
    "Action denied: Insufficient funds."
  end
  def pin_check(pin_number)
    pin_number === @pin
  end
  def pin_error
    "Access denied: incorrect PIN."
  end

  public
  def deposit(pin_number, amount)
    if pin_check(pin_number)
      @balance += amount
      puts "Deposited $#{amount}. New balance: $#{@balance}."
    else
      puts pin_error
    end
  end
  def display_balance(pin_number)
    puts pin_check(pin_number) ? "Balance: $#{@balance}" : pin_error
  end
  def withdraw(pin_number, amount)
    if pin_check(pin_number)
      if funds_check(amount)
        @balance -= amount
        puts "Withdrew $#{amount}. New balance: $#{@balance}."
      else
        puts funds_insufficient
      end
    else
      puts pin_error
    end
  end
end
  
valid_pin = "1234"
checking_account = Account.new("HUX", 10000000)
checking_account.withdraw(valid_pin, 100)
checking_account.deposit(valid_pin, 100)
checking_account.display_balance(valid_pin)
checking_account.withdraw(valid_pin, 100)
checking_account.withdraw("0987", 100)
checking_account.withdraw(valid_pin, 10000000)
