class Dogs
  POOR      = (0..5).to_a.sample
  AVERAGE   = (6..10).to_a.sample
  EXCELLENT = (11..15).to_a.sample

  def initialize
    joe   = {
      :name => {:first => "Joe", :last=> "Smith"},
      :owner_quality => EXCELLENT
    }
    sarah = {
      :name => {:first => "Sarah", :last => "Darnum"},
      :owner_quality => AVERAGE
    }
    andrew = {
      :name => {:first => "Andrew", :last => "Beter"},
      :owner_quality => AVERAGE
    }

    @dogs = [
      {name: "Fido",     size: :large,  owner: joe},
      {name: "Yapper",   size: :small,  owner: joe},
      {name: "Bruiser",  size: :large,  owner: joe},
      {name: "Tank",     size: :huge,   owner: sarah},
      {name: "Beast",    size: :large,  owner: sarah},
      {name: "Harleigh", size: :medium, owner: andrew},
      {name: "Trixie",   size: :small,  owner: andrew}
    ]
  end

  # only edit below this line

  def small_dogs
    dogs_by_size(:small)
  end

  def huge_dog
    huge_dog = dogs_by_size(:huge)
    name = dog_names(huge_dog)
  end

  def large_dog_names
    large_dogs = []
    names = dog_names(dogs_by_size(:large))
    names.each { |dog| large_dogs << dog.values }
    large_dogs.flatten
  end

  def joes_large_dogs
    large_dogs = dogs_by_size(:large)
    joes_dogs = dogs_by_owner("Joe")
    joes_large = joes_dogs & large_dogs
    dog_names(joes_large).collect{ |dog| dog.values}.flatten
  end

  def sizes
    sizes = @dogs.map { |dog| dog.select{ |k,v| k == :size }.values}
    sizes.uniq.flatten
  end

  def owners
    owner_names(@dogs)
  end

  def average_owners
    average = @dogs.keep_if { |dog| dog[:owner][:owner_quality] == AVERAGE}
    owner_names(average)
  end

  def to_s
    owner_hash = @dogs.group_by{ |dog| dog[:owner][:name][:first]}
    string = ''
    p owner_hash

  end

  def dogs_by_size(size)
    list = []
    @dogs.each do |dog|
      if dog[:size] == size
        list << dog
      end
    end
    list
  end

  def owner_names(input)
    names = input.map { |dog| dog[:owner][:name][:first] + ' ' + dog[:owner][:name][:last] }
    names.uniq
  end

  def dog_names(list_of_dogs)
    names = []
    list_of_dogs.each do |dog|
      names << dog.select{ |key, value| key == :name}
    end
    names
  end

  def dogs_by_owner(name)
    list = []
    @dogs.each do |dog|
      if dog[:owner][:name][:first] == name
        list << dog
      end
    end
    list
  end

end

