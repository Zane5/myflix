require 'spec_helper'

describe Category do
  it "saves itself" do
    category = Category.new(name: "comdies")
    category.save
    expect(Category.first).to eq(category)
  end

  it "has many videos" do
    comedies = Category.create(name: "comedies")
    south_park = Video.create(title: "South Park", description: "Funny video!", category: comedies) 
    futurama = Video.create(title: "Furturama", description: "Space travel!", category: comedies) 
    expect(comedies.videos).to include(futurama, south_park)
  end

  it "belongs to category" do
    dramas = Category.create(name: "dramas")
    monk = Video.create(title: "monk", description: "a great video!", category: dramas)
    expect(monk.category).to eq(dramas)
  end
end
