
FactoryGirl.define do

  sequence :name do |n|
    "Item_#{n}"
  end

  factory :item do
    name 
    description "Random description"
    image_url "random_image.jpg"
  end


end
