require "pry"
class CashRegister
  
  attr_writer :items   
  attr_accessor :discount , :total

  

  def initialize(discount = 0)
    @discount = discount 
    @total = 0
    @item_arr = []
  end

  def add_item(title , price , q = 1) 
    self.total = price * q + total
    item = {title: title , price: price , quantity: q}
    @item_arr << item
  end

  def items
    result = []
    
    @item_arr.each do |item|
      item[:quantity].times do |i|
        result << item[:title]
      end 
    end

    result
  end

  def apply_discount
    case discount
      when  0
          "There is no discount to apply."
      else 
        applied = 1 - ( discount * 0.01)
        self.total = (applied * total).to_i
       "After the discount, the total comes to $#{self.total}."
    end
  end 

  def void_last_transaction
    @item_arr.pop
    
    if @item_arr.length == 0 
     self.total = 0.0
    else
    self.total = @item_arr.sum {|i| i[:price] * i[:quantity]}
    end
  end 
end