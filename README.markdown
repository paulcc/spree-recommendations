h1. Spree Recommendations

h2. Intro

Adaptation of BDQ's accessories extension to give a similar notion of recommendations which can be set by the administrator

Defaults to a random set of (n = 3) items, drawing more from the product's taxon if insufficient recommendation entries are available

h2. Using this extension

No views included here: basically, you should be using some of your own short-detail product listing code for this.

Spree has a +shared/products+ partial, so you can feed in a list of recommendations to show, eg have something like
this on your product show page:

@
<%= render :partial => "shared/products.html.erb", :locals => {:products => random_recommendations(@products, 4), :taxon => @taxon } %>
@


h2. Future plans

* Adding a "customers also bought" method, derived by order analysis (soon)
* Tie into rating system?
* Frequent joint purchases?

