Factory.define :post do |post|
    post.id "1"
    post.title "test factory girl"
    post.content "fake data"
end

Factory.define :category do |category|
    category.id "1"
    category.name "category abc"
    category.description "fake data"
end