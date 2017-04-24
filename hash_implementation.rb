# -> key, value
# -> Hash the key -> number (hash_code)
# -> map that key to an index using a predictable formula has (hash_code / 100 )
# -> when looking up the

class MyHash
  STORAGE_SIZE = 100

  def initialize
    @buckets = []
  end

  def insert(k, v)
    index = map_key_to_index(k)

    bucket = find_or_initialize_bucket(index)
    bucket << [k, v]
  end

  def fetch(k)
    index = map_key_to_index(k)

    bucket = find_or_initialize_bucket(index)

    bucket.each do |k_v_pair|
      if k_v_pair[0] == k
        return k_v_pair[1]
      end
    end

    raise "Hash does not contain the key #{k}"
  end

  private

  attr_reader :buckets

  def map_key_to_index(k)
    hash_code = k.to_sym.object_id
    # ensures that the the index will be within the size of the storage (Division method)
    index = hash_code % STORAGE_SIZE
  end

  def find_or_initialize_bucket(index)
    buckets[index] ||= []
  end
end

hash = MyHash.new

hash.insert("k", "XXX XXX")

v = hash.fetch("e")

puts "THE VALUE is #{v}"
