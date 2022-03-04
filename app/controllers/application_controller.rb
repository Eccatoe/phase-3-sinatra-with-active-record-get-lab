class ApplicationController < Sinatra::Base

  set :default_content_type, 'application/json'

  get '/bakeries' do
    Bakery.all.to_json
  end

  get '/bakeries/:id' do
    bakery=Bakery.find(params[:id])
    bakery.to_json(include: :baked_goods)
  end

  get '/baked_goods/by_price' do
    ol=BakedGood.order(:price).reverse
    ol.to_json
  end

  get '/baked_goods/most_expensive' do
    most=BakedGood.all.max_by{|b| b.price}
    most.to_json
  end

end
