class CreateRecommendations < ActiveRecord::Migration
  def self.up
    create_table :recommendations, {:id => false} do |t|
      t.references :product
      t.column :recommendation_product_id,     :integer, :null => false
    end
  end

  def self.down
    drop_table :recommendations
  end
end
