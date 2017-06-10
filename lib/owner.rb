require 'pry'
class Owner

@@all = []
@@count = 0

attr_reader :species, :pets
attr_accessor :name

def initialize(species)
  @name = "unnamed human"
  @species = species
  @pets = {:fishes => [], :dogs => [], :cats => []}
  @@count += 1
  @@all << self
end

# Class methods

def self.all
  @@all
end

def self.all=(all_pets)
  @@all = all_pets
end

def self.reset_all
  self.all = []
  self.count = 0
end

def self.count
  @@count
end

def self.count=(number)
  @@count = number
end

# Instance methods

def say_species
  "I am a #{self.species}."
end

def buy_fish(fish_name)
  new_fish = Fish.new(fish_name)
  @pets[:fishes] << new_fish
end

def buy_cat(cat_name)
  new_cat = Cat.new(cat_name)
  @pets[:cats] << new_cat
end

def buy_dog(dog_name)
  new_dog = Dog.new(dog_name)
  @pets[:dogs] << new_dog
end

def walk_dogs
  @pets[:dogs].each { |dog| dog.mood = "happy" }
end

def play_with_cats
  @pets[:cats].each { |cat| cat.mood = "happy" }
end

def feed_fish
  @pets[:fishes].each { |fish| fish.mood = "happy" }
end

def sell_pets
  @pets.each do |_pet_type, pet_list|
    pet_list.each do |pet|
      # binding.pry
      pet.mood = "nervous"
    end
  end

  @pets = {:fishes => [], :dogs => [], :cats => []}
end

def list_pets
  "I have #{@pets[:fishes].length} fish, #{@pets[:dogs].length} dog(s), and #{@pets[:cats].length} cat(s)."
end

def pets= (pet_list)
  @pets = pet_list
end




end # of Owner class
