require_relative 'forca.rb'

def boas_vindas
  puts "****** Bem vindo ao jogo da forca!! ******"
end

def avisa_escolha
  puts "Escolhendo a palavra secreta..."
  sleep(1)
  puts "\n\n Pronto! Palavra escolhida!"
end

def diz_num_letras(palavra_secreta, view)
  sleep(1)
  puts "Vamos começar! A palavra escolhida tem #{palavra_secreta.size} letras"
  puts "\n\n#{view.join(" ")}\n\n"
end