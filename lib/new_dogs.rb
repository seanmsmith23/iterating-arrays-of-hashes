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
    small_dogs = dog_sizes(@dogs, :small)
    small_dog_names = dog_names(small_dogs)
  end

  def huge_dog
    huge_dogs = dog_sizes(@dogs, :huge)
    huge_dog_names = dog_names(huge_dogs)
  end

  def large_dog_names
    large_dogs = dog_sizes(@dogs, :large)
    names = dog_names(large_dogs)
    name_values = get_values(names)
  end

  def joes_large_dogs
    joes_dogs = sort_by_owner("Joe")
    joes_large_dogs = dog_sizes(joes_dogs, :large)
    joes_large_dogs_names = dog_names(joes_large_dogs)
    joes_large_dogs_names_values = get_values(joes_large_dogs_names)
    p joes_large_dogs_names_values
  end

  def dog_sizes(list, given_size)
    # Goes through @dogs array.
    # Creates new array with dogs that meet the given dog size.
    dogs_with_size = list.select do |dog|
      dog[:size] == given_size
    end
  end

  def dog_names(list)
    # Goes through an array of hashes.
    # Creates new array 'dog_names' containing just the ':name => value'
    #   for the list it is given.
    array_of_dog_names = []
    list.each do |dog|
      array_of_dog_names << dog.select { |key, value| key == :name }
    end
    array_of_dog_names
  end

  def get_values(list)
    # Takes the given list and returns an array containing only the values
    #   of each key.
    just_values = list.map { |item| item.values }
    just_values.flatten
  end

  def sort_by_owner(name)
    dog_owner = @dogs.select do |dog|
    dog[:owner][:name][:first] == name
    end
  end
end

