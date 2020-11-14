class Owner

  @@all = []

  def initialize(name, species = 'human')
    @name = name 
    @species = species
    @@all << self 
  end
  
  def name
    @name.dup.freeze
  end

  def species 
    @species.dup.freeze 
  end 

  def say_species 
    p "I am a #{@species}."
  end 

  def self.all 
    @@all 
  end 

  def self.count 
    self.all.count 
  end 

  def self.reset_all
    @@all = []
  end 

  def cats 
    Cat.all.select {|cat| cat.owner == self}
  end 

  def dogs 
    Dog.all.select {|dog| dog.owner == self}
  end 

  def buy_cat(name)
    cat = Cat.new(name, self)
  end 

  def buy_dog(name)
    dog = Dog.new(name, self)
  end 

  def walk_dogs
    self.dogs.each {|dog| dog.mood = 'happy'}
  end 

  def feed_cats 
    self.cats.each {|cat| cat.mood = 'happy'}
  end 

  def sell_pets 
    self.cats.each do |cat|
      cat.mood = 'nervous' 
      cat.owner = ()
    end 
    self.dogs.each  do |dog| 
      dog.mood = 'nervous'
      dog.owner = ()
    end 
  end 

  def list_pets
    kitties = self.cats.count 
    doggies = self.dogs.count 
    p "I have #{doggies} dog(s), and #{kitties} cat(s)."
  end


end