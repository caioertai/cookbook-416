class Router
  def initialize(controller)
    @controller = controller
    @running = true
  end

  def run
    puts "Welcome to the Cookbook"
    while @running
      display_menu
      user_input = gets.chomp.to_i
      print `clear`
      route_action(user_input)
    end
  end

  private

  def display_menu
    puts "Type a number:"
    puts "1. List recipes"
    puts "2. Add recipe"
    puts "3. Remove recipe"
    puts "0. Quit"
  end

  def route_action(user_input)
    case user_input
    when 1 then @controller.list_recipes
    when 2 then @controller.add_recipe
    when 3 then @controller.remove_recipe
    when 0 then @running = false
    end
  end
end
