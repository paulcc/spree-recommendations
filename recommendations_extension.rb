# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class RecommendationsExtension < Spree::Extension
  version "1.0"
  description "Add Recommendations to Products"
  url ""

  def activate
    Product.class_eval do
      has_and_belongs_to_many :recommendations, :class_name => "Product", :join_table => "recommendations" , :association_foreign_key => "recommendation_product_id"
    end
    
    # make the useful fn(s) available in Products
    ProductsHelper.module_eval do
      include RecommendationsHelper        # for finding recommendations to suggest
    end 
 
    # register Accessories product tab
    Admin::BaseController.class_eval do
      before_filter :add_recommendations_tab
      
      private
      def add_recommendations_tab
        @product_admin_tabs << {:name => t('recommendations'), :url => "selected_admin_product_recommendations_url"}
      end
    end
    
  end
end
