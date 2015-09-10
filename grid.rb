require './ship'
# require './position'

class Grid
  def initialize
    @ships = []
    @grid = []
    @hits = []
  end

  def has_ship_on?(x, y)
    @ships.each do |ship|
      return ship if ship.covers?(x, y)
    end
    false
  end

  def place_ship(ship, x, y, across)
    ship.place(x, y, across)
    unless @ships.any?{|s| s.overlaps_with?(ship)}
      @ships << ship
    else
      false
    end
  end

  def fire_at(x, y)
      ship = has_ship_on?(x,y)
      if ship
      ship.fire_at(x,y)
    else
      false
    end
# if has_ship_on?(x, y) && !@hits.include?([x, y])
#   @hits << [x, y]
#   return true
  end

  def display
    display_header
    display_line
    ("A".."J").each_with_index do |l, i|
      y = i+1
      line = l + " |"
      (1..10).each do |x|
        ship = has_ship_on?(x, y)
        line << if ship && ship.hit_on?(x, y)
                  " X |"
                elsif ship
                  " O |"
                else
                  "   |"
                end
      end
      puts line
    end
    display_line
  end

  private def display_header
    puts "    1   2   3   4   5   6   7   8   9   10"
  end

  private def display_line
    puts "  -----------------------------------------"
  end
  #   e_coord = "   |"
  #   o_coord = " O |"
  #   h_coord = " X |"
  #
  #   left_col = ["A |", "B |", "C |", "D |", "E |", "F |", "G |", "H |", "I |", "J |"]
  #   puts"    1   2   3   4   5   6   7   8   9   10"
  #   print"  -----------------------------------------"
  #   10.times do |a|
  #   print "\n"
  #   print left_col[a]
  #   10.times do |b|
  #     if has_ship_on?(b+1, a+1) && @hits.include?([b+1, a+1])
  #       print h_coord
  #     elsif has_ship_on?(b+1, a+1)
  #       print o_coord
  #     else
  #       print e_coord
  #     end
  #   end
  # end
  # puts"\n  -----------------------------------------"
  # end

  def sunk?
    return false if @ships == []
    @ships.all?{|ship| ship.sunk?}
    # return false if @ships.empty?
    # all_sunk = true
    # @ships.each do |ship|
    # all_sunk = false if !ship.sunk?
    # break if all_sunk == false
    # end
    # all_sunk
  end
  #
  #   return false if @ships == []
  #   @ships.each do |s|
  #     return false unless s.sunk
  #   end
  #   true
  # end

  # def sunk?
  #     return false if @ships.length < 1
  #     @ships.all? { |ship| ship.sunk? }
  #   end











end
