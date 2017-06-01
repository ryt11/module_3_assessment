RSpec.describe "Best Buy API Consumption" do
  it "user can find stores within 25 miles of them" do
    visit '/'
    fill_in "search[paramaters]", with: "80202"
    click_on "Search"
    expect(current_path).to eq('/search')
    expect(page).to have_content("16 Total Stores")

  end
end
