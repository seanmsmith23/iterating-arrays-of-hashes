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
  def find_by_owner(name)
    arr = []
    @dogs.each do |hash|
      if hash[:owner][:name][:first] == name || hash[:owner][:name][:last] == name || "#{hash[:owner][:name][:first]} #{hash[:owner][:name][:last]}" == name
        arr.push(hash.select {|k,v| k == :name})
      end
    end
    arr
  end

  def to_s
    # "Joe owns: Fido, Yapper, and Bruiser\nSarah owns: Tank and Beast\nAndrew owns: Harleigh and Trixie"
    string = ""
    joe_dogs = []
    sarah_dogs = []
    andrew_dogs = []
    @dogs.each do |hash|
      if hash[:owner][:name][:first] == "Joe"
        joe_dogs.push(hash[:name])
      end
      if hash[:owner][:name][:first] == "Sarah"
        sarah_dogs.push(hash[:name])
      end
      if hash[:owner][:name][:first] == "Andrew"
        andrew_dogs.push(hash[:name])
      end
    end
    string = "Joe owns: #{joe_dogs[0]}, #{joe_dogs[1]}, and #{joe_dogs[2]}\nSarah owns: #{sarah_dogs[0]} and #{sarah_dogs[1]}\nAndrew owns: #{andrew_dogs[0]} and #{andrew_dogs[1]}"
  end

  def average_owners
    arr = []
    @dogs.each do |hash|
      if hash[:owner][:owner_quality] == AVERAGE
        unless arr.include?("#{hash[:owner][:name][:first]} #{hash[:owner][:name][:last]}")
          arr.push("#{hash[:owner][:name][:first]} #{hash[:owner][:name][:last]}")
        end
      end
    end
    arr
  end

  def owners
    arr = []
    @dogs.each do |hash|
      unless arr.include?("#{hash[:owner][:name][:first]} #{hash[:owner][:name][:last]}")
        arr.push("#{hash[:owner][:name][:first]} #{hash[:owner][:name][:last]}")
      end
    end
    arr
  end

  def small_dogs
    arr = []
    @dogs.each do |hash|
      arr.push(hash) if hash[:size] == :small
    end
    arr
  end

  def huge_dog
    hugedog = nil
    @dogs.each do |hash|
      if hash[:size] == :huge
        hugedog = hash.select {|k,v| k == :name}
      end
    end
    hugedog
  end

  def large_dog_names
    arr = []
    @dogs.each do |hash|
      arr.push(hash[:name]) if hash[:size] == :large
    end
    arr
  end

  def joes_large_dogs
    arr = []
    @dogs.each do |hash|
      arr.push(hash[:name]) if hash[:size] == :large && hash[:owner] == {
      :name => {:first => "Joe", :last=> "Smith"},
      :owner_quality => EXCELLENT
      }
    end
    arr
  end

  def sizes
    arr = []
    @dogs.each do |hash|
      unless arr.include?(hash[:size])
        arr.push(hash[:size])
      end
    end
    arr
  end


end

