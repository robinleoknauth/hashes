# EASY

# Define a method that, given a sentence, returns a hash of each of the words as
# keys with their lengths as values. Assume the argument lacks punctuation.
def word_lengths(str)
  words = str.delete(";:.,!?").split(" ")
  word_hash = Hash.new(0)
  words.each do |word|
    word_hash[word] = word.length
  end
  word_hash
end

# Define a method that, given a hash with integers as values, returns the key
# with the largest value.
def greatest_key_by_val(hash)
  hash.max_by { |_k, v| v }[0]
end

# Define a method that accepts two hashes as arguments: an older inventory and a
# newer one. The method should update keys in the older inventory with values
# from the newer one as well as add new key-value pairs to the older inventory.
# The method should return the older inventory as a result. march = {rubies: 10,
# emeralds: 14, diamonds: 2} april = {emeralds: 27, moonstones: 5}
# update_inventory(march, april) => {rubies: 10, emeralds: 27, diamonds: 2,
# moonstones: 5}
def update_inventory(older, newer)
  newer.each do |k, _v|
    older[k] = newer[k]
  end
  older
end

# Define a method that, given a word, returns a hash with the letters in the
# word as keys and the frequencies of the letters as values.
def letter_counts(word)
  counter_hash = Hash.new(0)
  word.chars.each do |letter|
    counter_hash[letter] += 1
  end
  counter_hash
end

# MEDIUM

# Define a method that, given an array, returns that array without duplicates.
# Use a hash! Don't use the uniq method.
def my_uniq(arr)
  uniq_hash = Hash.new(false)
  arr.each { |el| uniq_hash[el] = true }
  uniq_hash.keys
end

# Define a method that, given an array of numbers, returns a hash with "even"
# and "odd" as keys and the frequency of each parity as values.
def evens_and_odds(numbers)
  result_hash = { even: 0, odd: 0 }
  numbers.each do |i|
    if i.even?
      result_hash[:even] += 1
    else
      result_hash[:odd] += 1
    end
  end
  result_hash
end

# Define a method that, given a string, returns the most common vowel. If
# there's a tie, return the vowel that occurs earlier in the alphabet. Assume
# all letters are lower case.
def most_common_vowel(string)
  vowels = "aeiou"
  result_hash = Hash.new(0)
  string.chars.each do |letter|
    if vowels.include?(letter.downcase)
      result_hash[letter] += 1
    end
  end
  max_count_vowel = result_hash.values.max
  vowels.chars.each do |letter|
    return letter if result_hash[letter] == max_count_vowel
  end
end

# HARD

# Define a method that, given a hash with keys as student names and values as
# their birthday months (numerically, e.g., 1 corresponds to January), returns
# every combination of students whose birthdays fall in the second half of the
# year (months 7-12). students_with_birthdays = { "Asher" => 6, "Bertie" => 11,
# "Dottie" => 8, "Warren" => 9 }
# fall_and_winter_birthdays(students_with_birthdays) => [ ["Bertie", "Dottie"],
# ["Bertie", "Warren"], ["Dottie", "Warren"] ]
def fall_and_winter_birthdays(students)
  right_students = students.select { |_student, month| month > 6 }.keys
  solution = []
  right_students.each_index do |i|
    ((i + 1)...right_students.length).each do |idx|
      solution << [right_students[i], right_students[idx]]
    end
  end
  solution
end

# Define a method that, given an array of specimens, returns the biodiversity
# index as defined by the following formula: number_of_species**2 *
# smallest_population_size / largest_population_size biodiversity_index(["cat",
# "cat", "cat"]) => 1 biodiversity_index(["cat", "leopard-spotted ferret",
# "dog"]) => 9
def biodiversity_index(specimens)
  counter_hash = Hash.new(0)
  specimens.each do |animal|
    counter_hash[animal] += 1
  end

  number_of_species = specimens.uniq.length
  smallest_population_size = counter_hash.values.min
  largest_population_size = counter_hash.values.max

  number_of_species**2 * smallest_population_size / largest_population_size
end

# Define a method that, given the string of a respectable business sign, returns
# a boolean indicating whether pranksters can make a given vandalized string
# using the available letters. Ignore capitalization and punctuation.
# can_tweak_sign("We're having a yellow ferret sale for a good cause over at the
# pet shop!", "Leopard ferrets forever yo") => true
def can_tweak_sign?(normal_sign, vandalized_sign)
  letter_count_normal = character_count(normal_sign)
  letter_count_vandal = character_count(vandalized_sign)
  letter_count_vandal.all? { |l, count| letter_count_normal[l] >= count }
end

def character_count(str)
  result_hash = Hash.new(0)
  str.chars.each do |letter|
    result_hash[letter.downcase] += 1
  end
  result_hash
end
