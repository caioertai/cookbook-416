require "csv"

require_relative "recipe"

class Cookbook
  def initialize(csv_path)
    @recipes = []
    @csv_path = csv_path
    load_csv
  end

  def add(new_recipe)
    # new_recipe # => an instance of Recipe
    @recipes << new_recipe
    update_csv
  end

  def all
    @recipes
  end

  def remove(index)
    @recipes.delete_at(index)
    update_csv
  end

  private

  def update_csv
    CSV.open(@csv_path, "wb") do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description]
      end
    end
  end

  def load_csv
    CSV.foreach(@csv_path) do |row|
      name = row[0]
      description = row[1]
      @recipes << Recipe.new(name, description)
    end
  end
end
