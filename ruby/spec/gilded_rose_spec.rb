require "gilded_rose"

describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "foo"
    end

    it "degrades quality over time by one if not at sell by date" do
      items = [Item.new("foo", 10, 50)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 49
    end
    
  end

end
