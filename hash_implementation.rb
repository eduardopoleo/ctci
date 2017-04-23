# -> key, value
# -> Hash the key -> number (hash_code)
# -> map that key to an index using a predictable formula has (hash_code / 100 )
# -> when looking up the

class MyHash
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
    index = hash_code % 100
  end

  def find_or_initialize_bucket(index)
    buckets[index] ||= []
  end
end

hash = MyHash.new

hash.insert("k", "XXX XXX")

v = hash.fetch("e")

puts "THE VALUE is #{v}"
