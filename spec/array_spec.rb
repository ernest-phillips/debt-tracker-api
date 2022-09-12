RSpec.describe 'Array' do
  it "checks for inclusion of 1" do
    expect([1, 2]).to include(1)
  end

  it "checks for inclusion of 2" do
    expect([1, 2]).to include(2)
  end

  it "checks for inclusion of 3" do
    expect([1, 2]).to include(3) # failure
  end
end
