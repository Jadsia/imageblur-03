class Image
  attr_reader :array

  def initialize(array)
    @array = array
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
    array.each_index do |row|
      subarray = array[row]
      subarray.each_index do |col|
          print array[row][col]
      end
      puts
    end
  end

  def blur(distance, one_coordinate)
    x = one_coordinate.first
    y = one_coordinate.second

    top = [x-1, y], [x-2, y]
    bottom = [x+1, y], [x+2, y]
    left = [x, y-1], [x, y-2]
    right = [x, y+1], [x, y-2]

    array[top.first][top.second] = 1
    array[bottom.first][bottom.second] = 1
    array[left.first][left.second] = 1
    array[right.first][right.second] = 1
  end

  def final_transform(ones_coordinates)
    for one_coordinate in ones_coordinates do
	   blur(one_coordinate)
	  end
  end

end

image = Image.new([
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 1, 0, 0, 1, 0, 0, 0, 0, 0],
  [0, 0, 1, 0, 0, 0, 1, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 1, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
])
image.output_image

ones_coordinates =  image.find_ones # => [[2, 1], [3, 0], [4, 3]]

result_image = image.blur(ones_coordinates)



