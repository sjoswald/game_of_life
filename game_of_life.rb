# Any live cell with <2 neighbours dies
# Any live cell with >3 neighbours dies
# Any live cell with 2 or 3 neighbours lives
# Any sleeping cell wih 3 neighbours comes to life

# build a class, have idea of state, compare in D

# --------------- NEXT STEP IDEAS ----------------
# Change alive to awake :-)
# Look in all 8 directions for friends 
#   - What happens when you are an edge cell? - possibly set a dead cell default?
# Count of living neighbours
# Log if state should change
# Change all states at once
# Start cycle again

class Cell
    def initialize (state = 'sleeping')
        @state = state
    end

    def state
        @state
    end
end

class Grid

    attr_accessor :grid


    def initialize
        @grid = Array.new(6) {Array.new(7) {Cell.new}}
        @grid.each_index { |i| @grid[i][-1].state["sleeping"] = "border"}
        @grid << Array.new(7) {Cell.new("border")} # Error was becasue line 29 was looking for "sleeping" but this line creates border.
    end

    def neighbour_state_north(vertical , horizontal)
        return @grid[vertical - 1][(horizontal)].state
    end
    
    def neighbour_state_north_east(vertical , horizontal)
        return @grid[vertical - 1][(horizontal + 1)].state
    end
    
    def neighbour_state_east(vertical , horizontal)
        return @grid[vertical][(horizontal + 1)].state
    end
    
    def neighbour_state_south_east(vertical , horizontal)
        return @grid[vertical + 1][(horizontal + 1)].state
    end
    
    def neighbour_state_south(vertical , horizontal)
        return @grid[vertical + 1][(horizontal)].state
    end
    
    def neighbour_state_south_west(vertical , horizontal)
        return @grid[vertical - 1][(horizontal - 1)].state
    end
    
    def neighbour_state_west(vertical , horizontal)
        return @grid[vertical][(horizontal - 1)].state
    end
    
    def neighbour_state_north_west(vertical , horizontal)
        return @grid[vertical - 1][(horizontal - 1)].state
    end
end


