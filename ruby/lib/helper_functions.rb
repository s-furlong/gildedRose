def reached_quality_limit?(item)
  item.quality < 50
end
  
def quality_greater_than_zero?(item)
  item.quality > 0
end
  
def passed_sell_in?(item)
  item.sell_in < 0
end
  
def within_ten_days?(item)
  item.sell_in < 11
end
  
def within_five_days?(item)
  item.sell_in < 6
end