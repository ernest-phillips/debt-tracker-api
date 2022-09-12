RSpec.describe 'String' do
  it "checks for inclusion of 'foo'" do
    expect("food").to include('foo')
  end

  it "checks for inclusion of 'bar'" do
    expect("food").to include('bar') # failure
  end

  it "checks for inclusion of 'baz'" do
    expect("bazzy").to include('baz')
  end

  it "checks for inclusion of 'foobar'" do
    expect("food").to include('foobar') # failure
  end
end