require "items"
require "item_type"


class GildedRose
  attr_reader :items

  SULFURAS = "Sulfuras, Hand of Ragnaros"
  BRIE = "Aged Brie" 
  BACKSTAGE = "Backstage passes to a TAFKAL80ETC concert" 

  def initialize(items)
    @items = items
  end

  def update_quality
    items.each do |item|
      update_item(item)
    end
  end

  def update_item(item)
    if item.name == SULFURAS
      handle_sulfuras(item)
    elsif item.name == BRIE
      handle_aged_brie(item)
    elsif item.name == BACKSTAGE
      handle_backstage_passes(item)
    else
      handle_normal_item(item)
    end
  end
end




