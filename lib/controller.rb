# Logic behind user actions
# Axis between the other pieces

require_relative "recipe"
require_relative "view"

class Controller
  def initialize(cookbook, view = View.new)
    @cookbook = cookbook
    @view = view
  end

  def remove_recipe
    # ASK COOKBOOK for the recipes
    recipes = @cookbook.all
    # ASK VIEW to display them
    @view.display_recipes(recipes)
    # ASK VIEW for a recipe index
    chosen_index = @view.ask_for_index
    # ASK COOKBOOK to remove it
    @cookbook.remove(chosen_index)
  end

  def list_recipes
    # ASK COOKBOOK for the recipes
    recipes = @cookbook.all
    # ASK VIEW to display them
    @view.display_recipes(recipes)
  end

  def add_recipe
    # ASK VIEW for a name
    recipe_name = @view.ask_for_text("name")
    # ASK VIEW for a description
    recipe_description = @view.ask_for_text("description")
    # ASK MODEL for a recipe instance
    new_recipe = Recipe.new(recipe_name, recipe_description)
    # ASK REPO to store the recipe instance
    @cookbook.add(new_recipe)
  end
end
