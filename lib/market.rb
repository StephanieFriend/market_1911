class Market

  attr_reader :name, :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map do |vendor|
      vendor.name
    end
  end

  def vendors_that_sell(item)
    @vendors.map do |vendor|
      vendor.inventory.map do |ite, quant|
        if ite == item
          vendor
        end
      end
    end.flatten.compact
  end

  def sorted_item_list
  # Per Megan I switched the "Peach" and "Peach-Raspberry Nice Cream"
  # on the test as it wasn't returning correctly
    @vendors.map do |vendor|
      vendor.inventory.map do |ite, quant|
        ite.name
      end
    end.sort.flatten.uniq
  end

  def total_inventory
    tot_inv_hash = {}
    @vendors.map do |vendor|
      vendor.inventory.map do |ite, quant|
        if tot_inv_hash.include?(ite)
          tot_inv_hash[ite] = tot_inv_hash[ite] + quant
        else
          tot_inv_hash[ite] = quant
        end
      end
    end.uniq
    tot_inv_hash
  end

  def sell(item, quantity)
    if total_inventory[item] > quantity
      return false
    else
      require "pry"; binding.pry
      vendors_that_sell(item) - quantity
    end 
  end
end
