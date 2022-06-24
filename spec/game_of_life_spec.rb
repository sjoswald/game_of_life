# Any live cell with <2 neighbours dies
# Any live cell with >3 neighbours dies
# Any live cell with 2 or 3 neighbours lives
# Any sleeping cell wih 3 neighbours comes to life

# build a class, have idea of state, compare in D

require_relative '../game_of_life.rb'

describe 'creates a grid' do
  it 'creates a 6 x 6 grid with a border line at right and bottom :) ' do
    expect($grid.length).to eq(7)
  end
end

describe "we've gotten to neighbours!" do
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
    expect($grid[0][0]).to be_a_kind_of(Cell)
  end

  it 'cell 1 can see the state of cell 2' do
    expect(neighbour_state(0,0)).to eq($grid[0][1].state)
  end

  it 'the end is in sight... ' do
    expect(neighbour_state(0, -2)).to eq("border")
  end

  it 'the end is in sight... ' do
    expect(neighbour_state(1, -2)).to eq("border")
  end

  it 'the end is in sight... ' do
    expect(neighbour_state(6, -2)).to eq("border")
  end

  it 'the bottom is in sight... ' do
    expect(neighbour_state(-1, 0)).to eq("border")
  end

end

