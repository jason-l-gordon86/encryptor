class Encryptor
  def cipher(rotation)
    characters = (' '..'z').to_a
    rotated_characters = characters.rotate(rotation)
    Hash[characters.zip(rotated_characters)]
  end

  def decipher(rotation)
    characters = (' '..'z').to_a
    rotated_characters = characters.rotate(rotation)
    Hash[characters.zip(rotated_characters).map(&:reverse)]
  end

  def encrypt_letter(letter, rotation)
    cipher_for_rotation = cipher(rotation)
    cipher_for_rotation[letter]
  end
  def encrypt(string, rotation)
    #1. Cut the input string into letters
    letters = string.split("")
    #2. Encrypt those letters one at a time, gathering results
    results = letters.collect do |letter|
      encrypted_letter = encrypt_letter(letter, rotation)
    end
    #3. Join the results into a string
    results.join
  end
  def decrypt_letter(letter, rotation)
    decipher_for_rotation = decipher(rotation)
    decipher_for_rotation[letter]
  end

  def decrypt(string, rotation)
    letters = string.split("")
    results = letters.collect do |letter|
      decrypted_letter = decrypt_letter(letter, rotation)
    end
    results.join
  end

  def encrypt_file(filename, rotation)
    input = File.open(filename, "r")
    input.read

  end

end
