# Any live cell with <2 neighbours dies
# Any live cell with >3 neighbours dies
# Any live cell with 2 or 3 neighbours lives
# Any 0 cell wih 3 neighbours comes to life

require_relative '../game_of_life.rb'

describe 'creates a grid' do
  world = Grid.new
  it 'creates a 6 x 6 grid with a border line at right and bottom :) ' do
    expect(world.grid.length).to eq(7)
  end
end

describe "A cell with different states" do
  it 'exists as a cell class' do
    cell = Cell.new
    expect(cell).to be_a_kind_of(Cell)
  end

  it 'can be 0... zzz ' do
    cell = Cell.new('0')
    expect(cell.state).to eq('0')
  end

  it 'can be 1!' do
    cell = Cell.new('1')
    expect(cell.state).to eq('1')
  end

  it 'can ride the board/er' do
    cell = Cell.new('border')
    expect(cell.state).to eq('border')
  end

  it 'has a cell in each slot of the grid' do
    world = Grid.new
    expect(world.grid[0][0]).to be_a_kind_of(Cell)
  end
end

describe "awaking the cells!" do
  before do
    @world = Grid.new
  end
    
  it "can assign a starting cell to be 1" do
    @world.starting_state([0,0])
    expect(@world.grid[0][0].state).to eq('1')
  end

  it "can can count the number of 1 cells" do
    @world.starting_state([0,0])
    count = 0
    the_earth_is_flat = @world.grid.flatten
    the_earth_is_flat.each { |cell| cell.state == "1" ? count += 1 : count}
    expect(count).to eq(1)
  end

  it "can can count multiple 1 cells" do
    @world.starting_state([0,0], [0,1], [0,2])
    count = 0
    the_earth_is_flat = @world.grid.flatten
    the_earth_is_flat.each { |cell| cell.state == "1" ? count += 1 : count}
    expect(count).to eq(3)
  end
end

describe "number of awake neighbours" do
  before do
    @world = Grid.new
  end

  it "outputs 0 when there are no living cells" do
    expect(@world.living_neighbour_count(2,2)).to eq(0)
  end

  it "outputs 2 when there are 2 living neighbours" do
    @world.starting_state([0,0], [0,1], [0,2])
    expect(@world.living_neighbour_count(0,1)).to eq(2)
  end

  it "outputs 8 when there are 8 living neighbours" do
    @world.starting_state([1,1], [1,2], [1,3], [2,1], [2,3],[3,1], [3,2], [3,3], [4,4])
    expect(@world.living_neighbour_count(2,2)).to eq(8)
  end

  it "outputs 0 when there are 0 living neighbours" do
    @world.starting_state([0,0], [2,2], [0,5])
    expect(@world.living_neighbour_count(0,0)).to eq(0)
  end
end

  describe "State swapping rules" do
    before do
      @world = Grid.new
    end

    it "stays asleep when it doesn't have 3 1 neighbours" do
      expect(@world.grid[1][1].state).to eq("0")
      expect(@world.assign_future_state(1,1)).to eq('0')
    end

    it "wakes up if there are 3 living neighbours" do
      @world.starting_state([0,1], [0,2], [1,0])
      expect(@world.grid[1][1].state).to eq("0")
      expect(@world.assign_future_state(1,1)).to eq('1')
    end

    it "stays asleep if there are 2 living neighbours" do
      @world.starting_state([0,1], [0,2])
      expect(@world.grid[1][1].state).to eq("0")
      expect(@world.assign_future_state(1,1)).to eq('0')
    end

    it "stays awake if there are 2 living neighbours" do
      @world.starting_state([0,1], [1,1], [0,2])
      expect(@world.grid[1][1].state).to eq("1")
      expect(@world.assign_future_state(1,1)).to eq('1')
    end

    it "stays awake if there are 2 living neighbours" do
      @world.starting_state([0,1], [1,1], [0,2], [0,0])
      expect(@world.grid[1][1].state).to eq("1")
      expect(@world.assign_future_state(1,1)).to eq('1')
    end

    it "should always stay as a border cell" do
      @world.starting_state([0,1], [1,1], [0,2], [0,0])
      expect(@world.grid[6][6].state).to eq("border")
      expect(@world.assign_future_state(6,6)).to eq('border')
    end
  end


  describe "looper" do
    before do
      @world = Grid.new
    end

    it "populates future states for all cells" do
      @world.starting_state([0,0], [0,2], [2,0])
      @world.looper()
      count = 0
      the_earth_is_flat = @world.grid.flatten
      the_earth_is_flat.each { |cell| cell.future_state == "1" ? count += 1 : count}
      expect(count).to eq(1)
    end

    it "updates cell state" do
      @world.starting_state([0,0], [0,2], [2,0])
      @world.looper()
      @world.change_states()
      count = 0
      the_earth_is_flat = @world.grid.flatten
      the_earth_is_flat.each { |cell| cell.state == "1" ? count += 1 : count}
      expect(count).to eq(1)
    end
  end