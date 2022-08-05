# Any live cell with <2 1 neighbours dies
# Any live cell with >3 1 neighbours dies
# Any live cell with 2 or 3 1 neighbours lives
# Any 0 cell wih 3 neighbours comes to life

# --------------- NEXT STEP IDEAS ----------------
# Start cycle again

class Cell
    def initialize (state = '0')
        @state = state
        @future_state = ""
    end

    def state
        @state
    end

    def future_state
        @future_state
    end

end

class Grid
    attr_accessor :grid
    def initialize
        @grid = Array.new(6) {Array.new(7) {Cell.new}}
        @grid.each_index { |i| @grid[i][-1].state["0"] = "border"}
        @grid << Array.new(7) {Cell.new("border")}
    end

    def starting_state(*positions)
        positions.each do |place|
          @grid[place[0]][place[1]].state["0"] = "1"
        end
    end

    def living_neighbour_count(vertical , horizontal)
        neighbour_states = []
        neighbour_states << @grid[vertical - 1][horizontal].state
        neighbour_states << @grid[vertical - 1][horizontal + 1].state
        neighbour_states << @grid[vertical][horizontal + 1].state
        neighbour_states << @grid[vertical + 1][horizontal + 1].state
        neighbour_states << @grid[vertical + 1][horizontal].state
        neighbour_states << @grid[vertical + 1][horizontal - 1].state
        neighbour_states << @grid[vertical][horizontal - 1].state
        neighbour_states << @grid[vertical - 1][horizontal - 1].state
        return neighbour_states.count('1')
    end

    def assign_future_state(y, x)
        if @grid[y][x].state == "border"
            @new_state = "border"
        elsif living_neighbour_count(y,x) == 3
            @new_state = "1"
        elsif living_neighbour_count(y,x) == 2 && @grid[y][x].state == "1"
            @new_state = "1"
        else
            @new_state = "0"
        end
        @grid[y][x].future_state[@grid[y][x].future_state] = @new_state
    end

    def looper
        @grid.each_index do | row | 
            @grid[row].each_index do | cell | 
                assign_future_state(row,cell)
            end
        end
    end

    def change_states
        @grid.each_index do | row | 
            @grid[row].each_index do | cell | 
                @grid[row][cell].state[@grid[row][cell].state] = @grid[row][cell].future_state
            end
        end
    end

    def display_states
        @grid.each_index do | row | 
            @grid[row].each_index do | cell | 
                if @grid[row][cell].state == "border"
                print "\n"   
              else
                print @grid[row][cell].state + " " 
              end
            end
        end
    end

    
end

class PlayingTheGame
    def new_game(*positions)
        @grid = Grid.new
        @grid.starting_state(*positions)
        @grid.display_states()
    end

    def turn
        @grid.looper()
        @grid.change_states()
        @grid.display_states()
        puts "Press enter to keep playing, else type 'n'"
        if gets.downcase == "\n"
            turn()
        end
    end

    def playing_the_game(*positions)
        new_game(*positions)
        turn()
    end
end

if __FILE__ == $0
    PlayingTheGame.new.playing_the_game([2,2], [2,3], [3,2], [3,3], [4,4], [4,5],[5,4],[5,5])
end