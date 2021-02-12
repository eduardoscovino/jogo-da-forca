puts "****** Bem vindo ao jogo da forca!! ******"

puts "Escolhendo a palavra secreta..."
sleep(1)
palavra_secreta = "pernambuco"
array_palavra = palavra_secreta.chars
view_palavra = palavra_secreta.chars.map { |letra| letra = "_" }.join(" ")

puts "\n\n\nPronto, escolhida!\n\n\n"
sleep(1)
puts "Vamos começar! A palavra escolhida tem #{palavra_secreta.size} letras"
puts "#{view_palavra}\n\n"

# receber uma letra do usuário
puts "Tentativa 1:"
chute = gets.chomp
# verificar se essa a palavra secreta contém essa letra
def tem_a_letra?(palavra, letra)
  array_palavra.include? letra
end
puts tem_a_letra?(palavra_secreta, chute)
# se sim:
# substituir o _ pela letra
# se não:
# perdeu a rodada e passa para a próxima tentativa

if tem_a_letra?(palavra, letra)
  palavra.find_index(letra)
else
  puts "Errou!"
end
