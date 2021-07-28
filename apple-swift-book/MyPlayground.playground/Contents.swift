let alphabet = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]

var password = ""

for _ in 1...6{ password.append(alphabet.randomElement()!)}

print (password)

