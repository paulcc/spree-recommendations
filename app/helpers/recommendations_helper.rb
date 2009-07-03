module RecommendationsHelper

  # grab a random list of recommendations (default = 3), augmented with (different) products from the same taxon
  # assume everything is in at least one taxon
  def random_recommendations(product, count = 3)
    recs = product.recommendations.active.sort_by(&:rand).take(count)
    rest = product.taxons.first.products.active.reject {|p| p == product}.sort_by(&:rand).take(count - recs.count)
    recs + rest
  end

end
