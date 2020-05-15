# Models data and behavior of the
# main pieces your user are handling
class Recipe
  attr_reader :name, :description

  def initialize(name, description)
    @name = name
    @description = description
  end
end
