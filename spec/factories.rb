Factory.define :post do |post|
    post.title "test factory girl"
    post.content "fake data"
end

Factory.define :category do |category|
    category.name "category abc"
    category.description "fake data"
end