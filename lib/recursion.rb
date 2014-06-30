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

    @found = []
  end

  def small_dogs
    small_list = recursive_search(@dogs, :first)
    p small_list
  end

  def recursive_search(items_to_check, key_to_find)
    @found
    puts "Beginning work on a #{items_to_check.class}, which contains #{items_to_check.inspect}"
    if items_to_check.is_a?(Array)
      puts  "Recrusing into the elements of the following array: #{items_to_check.inspect}"
      items_to_check.each { |element| recursive_search(element, key_to_find) if element.is_a?(Hash) || element.is_a?(Array) }
    elsif items_to_check.is_a?(Hash)
      puts "Checking to see if #{items_to_check} a #{items_to_check.class} contains #{key_to_find}"
      if items_to_check.key?(key_to_find)
        puts "Key found. Selecting out appropriate keys"
        @found << items_to_check.select { |key, value| key == key_to_find }
      else
        puts "Key not found. Looking in #{items_to_check} a #{items_to_check.class}."
        items_to_check.each_pair { |key, value| recursive_search(value, key_to_find) if value.is_a?(Hash) || value.is_a?(Array) }
      end
    end
    @found
  end

end