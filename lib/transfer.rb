require 'pry'
class Transfer
  # your code here
  attr_accessor :sender, :receiver, :status, :amount
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  def valid?
   # self.receiver.valid? && self.receiver.valid?
   sender.valid? && receiver.valid? 
  end
  def execute_transaction
    if self.sender.valid?
      @sender.balance -= self.amount
      @receiver.balance += self.amount
      @status = "complete"
    else
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      @sender.balance += self.amount
      @receiver.balance -= self.amount
      @status = "reversed"
    end
  end
end
