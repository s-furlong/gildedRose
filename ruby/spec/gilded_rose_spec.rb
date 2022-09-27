require "gilded_rose"

normal_item = "foo"
aged_brie =  "Aged Brie"
sulfuras = "Sulfuras, Hand of Ragnaros"
backstage = "Backstage passes to a TAFKAL80ETC concert"

describe GildedRose do

  describe "#update_quality" do

    describe "normal items" do 
      it "does not change the name" do
        sell_in = 0
        quality = 0
        items = [Item.new(normal_item, sell_in, quality)]

        GildedRose.new(items).update_quality

        expect(items[0].name).to eq "foo"
      end

      it "degrades quality over time by one if not at sell in date" do
        sell_in = 10
        quality = 30
        items = [Item.new(normal_item, sell_in, quality)]

        GildedRose.new(items).update_quality

        expect(items[0].quality).to eq 29
      end

      it "decreases sell in date by one day" do
        sell_in = 10
        quality = 30
        items = [Item.new(normal_item, sell_in, quality)]
        GildedRose.new(items).update_quality
        expect(items[0].sell_in).to eq 9
      end

      it "degrades quality twice as fast if past the sell in date" do
        sell_in = 0
        quality = 50
        items = [Item.new(normal_item, sell_in, quality)]
        
        GildedRose.new(items).update_quality
        
        expect(items[0].quality).to eq 48
      end
  
      it "never allows quality to be negative" do
        sell_in = 3
        quality = 0
        items = [Item.new(normal_item, sell_in, quality)]
        
        GildedRose.new(items).update_quality

        expect(items[0].quality).to eq 0
      end
    end

  describe "Aged Brie" do 
    it "increases quality over time if name is Aged Brie" do
      sell_in = 3
      quality = 30
      items = [Item.new(aged_brie, sell_in, quality)]

      GildedRose.new(items).update_quality
      
      expect(items[0].quality).to eq 31
    end 
 
    it "never allows aged brie quality to increase over 50" do
      sell_in = 3
      quality = 50
      items = [Item.new(aged_brie, sell_in, quality)]
    
      GildedRose.new(items).update_quality

      expect(items[0].quality).to eq 50
    end
  end

  describe "Sulfuras" do
    it "remains at a quality level of 80" do
      items = [Item.new("Sulfuras, Hand of Ragnaros", 3, 30)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 80
    end
  end

  describe "backstage passes" do   
      it "never allows aged backstage passes to increase over 50" do
        sell_in = 3
        quality = 50
        items = [Item.new(backstage, sell_in, quality)]

        GildedRose.new(items).update_quality

        expect(items[0].quality).to eq 50
      end  
      
      it "allows back stage passes to increase by one more than 10 days before the concert" do
        sell_in = 11
        quality = 30
        items = [Item.new(backstage, sell_in, quality)]

        GildedRose.new(items).update_quality
        
        expect(items[0].quality).to eq 31
      end

      it "allows the backstage passes to increase by 2 in quality 10 to 6 days before the concert" do
        sell_in = 8
        quality = 30
        items = [Item.new(backstage, sell_in, quality)]

        GildedRose.new(items).update_quality

        expect(items[0].quality).to eq 32
      end
    
      it "allows the backstage passes to increase by 2 in quality 5 to 1 days before the concert" do
        sell_in = 3
        quality = 30
        items = [Item.new(backstage, sell_in, quality)]

        GildedRose.new(items).update_quality

        expect(items[0].quality).to eq 33
      end

      it "degrades the value of backstage passes to 0 when there are 0 days left before the concert" do
        sell_in = 0
        quality = 30
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 30)]

        GildedRose.new(items).update_quality
        
        expect(items[0].quality).to eq 0
      end
    end
  end
end
