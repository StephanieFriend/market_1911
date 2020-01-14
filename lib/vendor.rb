class Vendor

  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = {}
  end

  def stock(item, quantity)
    if @inventory.include?(item)
      @inventory[item] = @inventory[item] + quantity
    else
      @inventory[item] = quantity
    end
  end

  def check_stock(item)
    if @inventory[item] == nil
      return 0
    else
      @inventory[item]
    end 
  end
end
