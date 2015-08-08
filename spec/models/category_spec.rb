require 'spec_helper'

describe Category do
  it { should have_many(:videos)}
  it { should validate_presence_of(:name) }

  it "saves itself" do
    category = Category.new(name: "comedies")
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

  it "does not save a video without a title" do
    video = Video.create(description: "a great video!")
    expect(Video.count).to eq(0)
  end

  it "does not save a video without a description" do
    video = Video.create(title: "monk")
    expect(Video.count).to eq(0)
  end

  describe "#recent_video" do
    it "returns the videos in the reverse chronical order by created at" do
      comedies = Category.create(name: "comedies")
      futurama = Video.create(title: "Futurama", description: "space travel!", category: comedies, created_at: 1.day.ago)
      south_park = Video.create(title: "South Park", description: "crazy kids!", category: comedies)
      expect(comedies.recent_videos).to eq([south_park,futurama])      
    end

    it "returns all the videos if there are less than 6 videos" do
      comedies = Category.create(name: "comedies")
      futurama = Video.create(title: "Futurama", description: "space travel!", category: comedies, created_at: 1.day.ago)
      south_park = Video.create(title: "South Park", description: "crazy kids!", category: comedies)
      expect(comedies.recent_videos.count).to eq(2)      
    end

    it "returns 6 videos if there are more than 6 videos" do
      comedies = Category.create(name: "comedies")
      7.times { Video.create(title: "foo", description: 'bar', category: comedies)}
      expect(comedies.recent_videos.count).to eq(6)
    end

    it "returns the most recent 6 videos" do
      comedies = Category.create(name: "comedies")
      6.times { Video.create(title: "foo", description: 'bar', category: comedies)}
      tonights_show = Video.create(title: "Tonigths show", description: "talking show", category: comedies, created_at: 1.day.ago)
      expect(comedies.recent_videos).not_to include(tonights_show)
    end


    it "returns an empty array if the category does not have any videos" do
      comedies = Category.create(name: "comedies")
      expect(comedies.recent_videos).to eq([])
  
    end
  end


end
