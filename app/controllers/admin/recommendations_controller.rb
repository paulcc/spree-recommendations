class Admin::RecommendationsController < Admin::BaseController
  resource_controller
  before_filter :load_object, :only => [:selected, :available, :remove]
  
  belongs_to :product

  def selected
    @recommendations = @product.recommendations
  end
  
  def available
    if params[:q].blank?
      @available_recommendations = []
    else
      @available_recommendations = Product.find(:all, :conditions => ['lower(name) LIKE ?', "%#{params[:q].downcase}%"])
    end
    @available_recommendations.delete_if { |recommendation| @product.recommendations.include?(recommendation) }
    respond_to do |format|
      format.html
      format.js {render :layout => false}
    end

  end
 
  
  def remove
    @product.recommendations.delete(@recommendation)
    @product.save
    @recommendations = @product.recommendations
    render :layout => false
  end  
  
  def select
    @product = Product.find_by_param!(params[:product_id])
    recommendation = Product.find_by_permalink(params[:id])
    @product.recommendations << recommendation
    @product.save
    @recommendations = @product.recommendations
    render :layout => false
  end
end
