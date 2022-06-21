


class Cell
    def initialize (state = 'sleeping')
        @state = state
    end

    def state
        @state
    end
end

def grid
    grid = Array.new(6) {Array.new(6) {Cell.new}}
    # grid = [Cell.new] * 6
end

def neighbour_state(vertical , horizontal)
    return grid[vertical][(horizontal + 1)].state
end