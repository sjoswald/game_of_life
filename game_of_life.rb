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

# $grid = Array.new(7) {Array.new(7) {Cell.new}}
$grid = Array.new(6) {Array.new(7) {Cell.new}}
$grid << Array.new(7) {Cell.new("border")}

$grid.each_index { |i| $grid[i][-1].state["sleeping"] = "border"}
# $grid[-1].each_index { |i| $grid[i].state["sleeping"] = "border"}

def neighbour_state(vertical , horizontal)
    return $grid[vertical][(horizontal + 1)].state
end