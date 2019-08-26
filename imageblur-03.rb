class Image
  attr_reader :array

  def initialize(array)
    @array = array
  end


  def blur(distance = 1)
	ones_coordinates = find_ones
    result = final_transform(ones_coordinates, distance)
    output_image
  end

  def find_ones
    coordinates = []

    array.each_index do |row|
      subarray = array[row]
      subarray.each_index do |col|
        if array[row][col] == 1
          coordinates.push([row, col])
        end
      end
    end
    coordinates
  end

  def output_image
  puts "\n"
    array.each_index do |row|
      subarray = array[row]
      subarray.each_index do |col|
          print array[row][col]
      end
      puts
    end
  end

  def transform_neighbors(one_coordinate, distance)
    x = one_coordinate[0]
    y = one_coordinate[1]

    #up
    for i in 1..distance do
      new_y = y + i
      array[x][new_y] = 1
    end

    #right
    for i in 1..distance do
      new_x = x + i
      array[new_x][y] = 1
    end

    #down
    for i in 1..distance do
      new_y = y - i
      array[x][new_y] = 1
    end

    #left
    for i in 1..distance do
      new_x = x - i
      array[new_x][y] = 1
    end


  end

  def final_transform(ones_coordinates, distance)
    for one_coordinate in ones_coordinates do
	  transform_neighbors(one_coordinate, distance)
	end
  end


end

image = Image.new([
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 1, 0, 1, 0, 0, 0, 0, 0],
  [0, 0, 1, 0, 0, 0, 1, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 1, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
])
image.output_image

ones_coordinates =  image.find_ones # => [[2, 1], [3, 0], [4, 3]]

result_image = image.blur(2)

