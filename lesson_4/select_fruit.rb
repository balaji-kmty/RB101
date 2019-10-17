def select_fruit (produce_hash)
  keys = produce_hash.keys
  counter = 0
  fruit_hash = {}

  loop do
    break if counter == keys.size

    current_key = keys[counter]
    current_value = produce_hash[current_key]
    if current_value == 'Fruit'
      fruit_hash[current_key] = current_value
    end

    counter += 1
  end
  fruit_hash
end

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

select_fruit(produce)
