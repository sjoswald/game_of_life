# Any live cell with <2 alive neighbours dies
# Any live cell with >3 alive neighbours dies
# Any live cell with 2 or 3 alive neighbours lives
# Any sleeping cell wih 3 neighbours comes to life

# --------------- NEXT STEP IDEAS ----------------
# Start cycle again

class Cell
    def initialize (state = 'sleeping')
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
        @grid.each_index { |i| @grid[i][-1].state["sleeping"] = "border"}
        @grid << Array.new(7) {Cell.new("border")}
    end

    def starting_state(*positions)
        positions.each do |place|
          @grid[place[0]][place[1]].state["sleeping"] = "alive"
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
        return neighbour_states.count('alive')
    end

    def assign_future_state(y, x)
        if @grid[y][x].state == "border"
            @new_state = "border"
        elsif living_neighbour_count(y,x) == 3
            @new_state = "alive"
        elsif living_neighbour_count(y,x) == 2 && @grid[y][x].state == "alive"
            @new_state = "alive"
        else
            @new_state = "sleeping"
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
end



