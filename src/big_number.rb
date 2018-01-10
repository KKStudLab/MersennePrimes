class BigNumber

  # Allow to access an array

  attr_reader :array

  # Constructor for class objects
  # Params:
  # @array should be an instance of Array.class

  def initialize(array)
    raise Exception if array.class != Array.class
    @array = array
  end

  # Overriding of * operator for multiplication
  # of 2 BigNumbers
  # Params:
  # @other should be an instance of BigNumber.class
  # Retuns:
  # result an instance of BigNumber.class

  def *(other)
    return nil unless other.class == BigNumber.class
    result = BigNumber.new [0]
    tmp_number = BigNumber.new @array
    other.array.each do |e|
      result += tmp_number if e != 0
      tmp_number = BigNumber.new tmp_number.array.clone.unshift(0) # aliased left push for array
    end
    result
  end

  def size
    @array.length
  end

  # Overriding of * operator for addition
  # of 2 BigNumbers
  # Params:
  # @other should be an instance of BigNumber.class
  # Retuns:
  # result an instance of BigNumber.class

  # TODO: method works but need refactor

  def +(other)
    return nil unless other.class == BigNumber.class
    result = []
    tmp = 0
    biggest_by_length = other.size > size ? other.array : @array
    less_by_length = other.size > size ? @array : other.array
    i = 0
    while i < less_by_length.length
      result << ((@array[i] + other.array[i] + tmp) % 2) # aliased push for array
      tmp = (@array[i] + other.array[i] + tmp) / 2
      i += 1
    end
    while i < biggest_by_length.length
      result << ((biggest_by_length[i] + tmp) % 2)
      tmp = (biggest_by_length[i] + tmp) / 2
      i += 1
    end
    result << tmp if tmp > 0
    BigNumber.new result
  end

  # To string method returns a string
  # representation of object

  def to_s
    @array.join
  end

  #TODO: overriding -, /, % methods

end