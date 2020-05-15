# I/O
# Talks to the user
# Display and gets info
class View
  def display_recipes(recipes)
    recipes.each_with_index do |recipe, index|
      puts "#{index + 1}. #{recipe.name} - #{recipe.description}"
    end
  end

  def ask_for_index
    puts "What's the number?"
    gets.chomp.to_i - 1
  end

  def ask_for_text(input_name)
    puts "What's the #{input_name}?"
    return gets.chomp
  end
end
