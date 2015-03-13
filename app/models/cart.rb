class Cart
  attr_reader :data

  def initialize(input_data)
    @data = input_data || Hash.new
  end

  def add_item(item)
    data[item.id.to_s] ||= 0
    data[item.id.to_s] += 1
  end

  def item_quantity(item)
    data[item.id.to_s]
  end

  def count_total
    data.values.sum
  end

  def display_items
    data.map{ |k,v| [Item.find(k.to_i), v] }
  end
end