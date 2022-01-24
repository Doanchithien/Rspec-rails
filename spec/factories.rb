Factory.define :post do |post|
    post.id "1"
    post.title "test post"
    post.content "fake data"
end

Factory.define :category do |category|
    category.id "1"
    category.name "test category"
    category.description "fake data"
end

Factory.define :invalid_post, :parent => :post do |post|
    post.title nil
end

Factory.define :invalid_category, :parent => :category do |category|
    category.name nil
end
  