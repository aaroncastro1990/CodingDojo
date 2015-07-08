class Cart
  attr_accessor :items, :base_price

  def initialize(items)
    @items = items || []
    @base_price = 8
  end

  def price
    return 0 if items.empty?
    total = 0
    groups = build_unique_groups
    balance(groups).each do |index, value|
      case value.size
        when 1
          total += base_price
        when 2
          total += (base_price * 2 * 0.95)
        when 3
          total += (base_price * 3 * 0.90)
        when 4
          total += (base_price * 4 * 0.8)
        when 5
         total += (base_price * 5 * 0.75)
      end
    end
    total
  end

  private

  def balance(groups)
    groups.each do |index, group|
      if group.size.eql?(5) and (groups[index + 1] && groups[index + 1].size.eql?(3))
        item = group.pop
        groups[index + 1].push(item)
      end
    end
    groups
  end

  def build_unique_groups(groups = {})  
    items.each do |item|
      cont = 0
      while(cont < items.size)
        if groups[cont]
          unless groups[cont].include?(item)
            groups[cont] << item
            break
          end
        else
          groups[cont] = [item]
          break
        end
        cont += 1
      end
    end
    groups
  end
end