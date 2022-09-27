require "helper_functions"

def handle_sulfuras(item)
  item.quality = 80
end

def handle_aged_brie(item)
  if reached_quality_limit?(item)
    increase_quality(item)
  end
  decrease_sell_in(item)
  if passed_sell_in?(item) && reached_quality_limit?(item)
    increase_quality(item)
  end 
end
  
def handle_backstage_passes(item)
  if reached_quality_limit?(item)
    increase_quality(item)
    if within_ten_days?(item) && reached_quality_limit?(item)
      increase_quality(item)
    end
    if within_five_days?(item) && reached_quality_limit?(item)
      increase_quality(item)
    end
  end
  decrease_sell_in(item)
  if passed_sell_in?(item)
    decrease_to_quality_to_zero(item)
  end
end
  
def handle_normal_item(item)
  if quality_greater_than_zero?(item)
     decrease_quality(item)
  end
  decrease_sell_in(item)
  if passed_sell_in?(item) && quality_greater_than_zero?(item)
     decrease_quality(item)
  end
end



def increase_quality(item)
  item.quality = item.quality + 1
end

def decrease_quality(item)
  item.quality = item.quality - 1
end

def decrease_to_quality_to_zero(item)
  item.quality = 0 
end

def decrease_sell_in(item)
  item.sell_in = item.sell_in - 1
end
