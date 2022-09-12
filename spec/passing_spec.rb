puts "Loading passing_spec.rb"

RSpec.describe "A passing spec" do
  it "passes" do
    expect(1).to eq(1)
  end
end
