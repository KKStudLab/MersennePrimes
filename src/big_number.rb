class BigNumber
  attr_reader :array

  def initialize(array)
    @array = array
  end

  def *(other)
    result = BigNumber.new([0])
    tmp_number = BigNumber.new(@array)
    other.array.each do |e|
      result += tmp_number if e != 0
      tmp_number = BigNumber.new tmp_number.array.clone.unshift(0)
    end
    result
  end

  def size
    @array.length
  end

  def +(other)
    result = []
    tmp = 0
    biggest_by_length = other.size > size ? other.array : @array
    less_by_length = other.size > size ? @array : other.array
    i = 0
    while i < less_by_length.length
      result << ((@array[i] + other.array[i] + tmp) % 2)
      tmp = (@array[i] + other.array[i] + tmp) / 2
      i += 1
    end
    while i < biggest_by_length.length
      result << ((biggest_by_length[i] + tmp) % 2)
      tmp = (biggest_by_length[i] + tmp) / 2
      i += 1
    end
    result << tmp if tmp > 0
    BigNumber.new(result)
  end

  def to_s
    @array.join
  end


end