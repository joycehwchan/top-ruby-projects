require './lib/caesar_cipher.rb'


describe "#caesar_cipher" do
  it "matches given example" do
    expect(caesar_cipher("What a string!", 5)).to eq('Bmfy f xywnsl!')
  end

  it "works with small negative shift" do
    expect(caesar_cipher('Ee', -5)).to eq('Zz')
  end

  it "works with large shift" do
    expect(caesar_cipher('Hello, World!', 75)).to eql('Ebiil, Tloia!')
  end
end
