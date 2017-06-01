require 'rails_helper'

RSpec.describe "item API calls" do
  it "can respond with all items" do
    create_list(:item, 3)
    db_item = Item.first
    last_db_item = Item.last
    get '/api/v1/items'


    items = JSON.parse(response.body)
    item = items.first
    item_2 = items.last

    expect(response).to be_success
    expect(item["name"]).to eq(db_item.name)
    expect(item["description"]).to eq(db_item.description)
    expect(item["image_url"]).to eq(db_item.image_url)
    expect(item["created_at"]).to eq(nil)
    expect(item["updated_at"]).to eq(nil)

    expect(item_2["name"]).to eq(last_db_item.name)
    expect(item_2["description"]).to eq(last_db_item.description)
    expect(item_2["image_url"]).to eq(last_db_item.image_url)
    expect(item_2["created_at"]).to eq(nil)
    expect(item_2["updated_at"]).to eq(nil)
  end
end




# When I send a GET request to `/api/v1/items`
# I receive a 200 JSON response containing all items
# And each item has an id, name, description, and image_url but not the created_at or updated_at
#
# When I send a GET request to `/api/v1/items/1`
# I receive a 200 JSON response containing the id, name, description, and image_url but not the created_at or updated_at
#
# When I send a DELETE request to `/api/v1/items/1`
# I receive a 204 JSON response if the record is successfully deleted
#
# When I send a POST request to `/api/v1/items` with a name, description, and image_url
# I receive a 201 JSON  response if the record is successfully created
# And I receive a JSON response containing the id, name, description, and image_url but not the created_at or updated_at
