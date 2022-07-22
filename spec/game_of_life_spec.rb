# Any live cell with <2 neighbours dies
# Any live cell with >3 neighbours dies
# Any live cell with 2 or 3 neighbours lives
# Any sleeping cell wih 3 neighbours comes to life

# build a class, have idea of state, compare in D

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

  it 'can be sleeping... zzz ' do
    cell = Cell.new('sleeping')
    expect(cell.state).to eq('sleeping')
  end

  it 'can be alive!' do
    cell = Cell.new('alive')
    expect(cell.state).to eq('alive')
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

# describe "we've gotten to neighbours" do
#   before "create the world" do 
#     @world = Grid.new
#   end

#   it 'cell 1 can see the state of cell 2' do
#     expect(@world.neighbour_state_east(0,0)).to eq(@world.grid[0][1].state)
#   end

#   it 'last cell sees the right border' do
#     expect(@world.neighbour_state_east(0,5)).to eq("border")
#   end

#   it 'the second cell sees the first cell' do
#     expect(@world.neighbour_state_west(0,1)).to eq(@world.grid[0][0].state)
#   end

#   it 'the top left cell sees the left border' do
#     expect(@world.neighbour_state_west(0,0)).to eq("border")
#   end

#   it 'the right hand border exists... ' do
#     expect(@world.neighbour_state_east(0, -2)).to eq("border")
#   end

#   it 'the right hand border has not run away yet... ' do
#     expect(@world.neighbour_state_east(1, -2)).to eq("border")
#   end

#   it 'the right hand border is really stubborn... ' do
#     expect(@world.neighbour_state_east(6, -2)).to eq("border")
#   end

#   it 'the bottom border is on top of the world... ' do
#     expect(@world.neighbour_state_south(-2, 0)).to eq("border")
#   end
  
  # it 'the cell can see north' do
  #   expect(@world.neighbour_state_north(2,4)).to eq(@world.grid[1][4].state)
  # end

  # it 'the cell can see north east' do
  #   expect(@world.neighbour_state_north_east(1,2)).to eq(@world.grid[0][3].state)
  # end

  # it 'the cell can see east' do
  #   expect(@world.neighbour_state_north_east(4,4)).to eq(@world.grid[4][5].state)
  # end

  # it 'the cell can see south east' do
  #   expect(@world.neighbour_state_south_east(3,4)).to eq(@world.grid[4][5].state)
  # end
  
  # it 'the cell can see south' do
  #   expect(@world.neighbour_state_south(4,3)).to eq(@world.grid[5][3].state)
  # end

  # it 'the cell can see south west' do
  #   expect(@world.neighbour_state_south_west(2,2)).to eq(@world.grid[3][1].state)
  # end

  # it 'the cell can see west' do
  #   expect(@world.neighbour_state_south(5,0)).to eq(@world.grid[5][6].state)
  # end

  # it 'the cell can see north west' do
  #   expect(@world.neighbour_state_west(2,3)).to eq(@world.grid[1][2].state)
  # end
# end

describe "number of awake neighbours" do
  before "create the world" do 
    @world = Grid.new
  end
  it "outputs 0 when there are no living neighbours" do
    expect(@world.living_neighbour_count(2,2)).to eq(0)
  end

  it "outputs 1 when there is only 1 living neighbour" do

  end
end

