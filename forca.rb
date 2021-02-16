def boas_vindas
  puts "******************************************"
  puts "****** Bem vindo ao jogo da forca!! ******"
  puts "******************************************"
end

def diz_as_regras
  puts "Regras do jogo:"
  puts "1 - Escolha um tema"
  puts "2 - Digite seu chute (não há til ou acentuação nas palavras)"
  puts "Você tem 5 tentativas e a cada erro perde uma"
end

def pergunta_tema(temas)
  puts "Digite o número do tema que deseja para a forca"
  temas.each_with_index { |tema, index| puts "#{index + 1} - #{tema}"}
end

def mostra_tema_escolhido(temas, opcao)
  puts "Legal! Você escolheu #{temas[opcao - 1]}"
end

def sorteia_palavra(tema, frutas, esportes, cores)
  case tema
  when 1
    frutas[rand(0...frutas.size)]
  when 2
    esportes[rand(0...esportes.size)]
  when 3
    cores[rand(0...cores.size)]
  end
end

def avisa_escolha
  puts "Escolhendo a palavra secreta..."
  sleep(1)
  puts "\n\nPronto! Palavra escolhida!"
end

def diz_num_letras(palavra_secreta, view)
  sleep(1)
  puts "Vamos começar! A palavra escolhida tem #{palavra_secreta.size} letras"
  puts "\n\n#{view.join(" ")}\n\n"
end

def avisa_tentativa(tentativa, maximo)
  puts "Tentativa #{tentativa} de #{maximo} possíveis"
end

def pede_chute
  puts "Qual é o seu chute?"
end

def avisa_chute(chute)
  puts "\n\nSeu chute foi #{chute}"
end

def eh_palavra?(chute)
  chute.size > 1
end

def palavra_correta?(chute, palavra)
  chute == palavra
end

def tem_a_letra?(palavra, chute)
  palavra.include? chute
end

def acertou_chute(array, chute, view)
  puts "Acertou!"
  substitui_chute_certo(array, chute, view)
  puts "\n#{view.join(" ")}"
end

def errou_chute(view)
  puts "Errou!"
  puts "\n#{view.join(" ")}"
end

def substitui_chute_certo(palavra, chute, view)
  palavra.each_with_index do |letra, index|
    letra == chute ? view[index] = letra : view[index]
    view
  end
end

def array_incompleto?(view)
  view.include? "_"
end

def mensagem_resultado(resultado, palavra)
  if resultado
    puts "\n\nGanhou o jogo! A palavra era #{palavra}"
  else
    puts "\n\nQue pena, você perdeu! A palavra era #{palavra}"
  end
end

# dando boas vindas
boas_vindas

# diz as regras
diz_as_regras

# escolhendo o tema da forca
frutas = ["banana", "maça", "limao", "tangerina", "laranja", "uva", "abacaxi", "manga", "pera", "lichia", "figo"]
esportes = ["futebol", "handebol", "volei", "remo", "nataçao", "judo", "tiro", "taekwondo", "esgrima", "basquete", "tenis"]
cores = ["verde", "amarelo", "laranja", "vermelho", "azul", "branco", "preto", "violeta", "roxo", "lilas", "anil", "rubro", "rosa", "fucsia"]
array_temas = ["Frutas", "Esportes Olímpicos", "Cores"]
escolheu_tema = false
while escolheu_tema == false
  pergunta_tema(array_temas)
  tema = gets.chomp.to_i
  if (1..3).include? tema
    escolheu_tema = true
  else
    puts "Opção inválida. Tente novamente"
  end
end
mostra_tema_escolhido(array_temas, tema)

# escolhendo a palavra
avisa_escolha
palavra_secreta = sorteia_palavra(tema, frutas, esportes, cores)
array_palavra = palavra_secreta.chars
view_palavra = Array.new(array_palavra.size, "_")
diz_num_letras(palavra_secreta, view_palavra)

# setando as tentativas
max_tentativas = 5
tentativa_atual = 1
ganhou_jogo = false

while tentativa_atual <= max_tentativas
  # num de tentativas
  avisa_tentativa(tentativa_atual, max_tentativas)

  # recebendo o chute
  pede_chute
  chute = gets.chomp.downcase
  avisa_chute(chute)

  # bifurcaçao palavra e letra
  if eh_palavra?(chute)
    if palavra_correta?(chute, palavra_secreta)
      ganhou_jogo = true
      view_palavra = chute.chars
      tentativa_atual = 6
    else
      errou_chute(view_palavra)
      tentativa_atual += 1
    end
  else
    if tem_a_letra?(array_palavra, chute)
      acertou_chute(array_palavra, chute, view_palavra)
    else
      errou_chute(view_palavra)
      tentativa_atual += 1
    end
  end
  # proximo chute
  if array_incompleto?(view_palavra)
    puts "Próximo chute"
  else
    tentativa_atual = 6
    ganhou_jogo = true
  end
end

mensagem_resultado(ganhou_jogo, palavra_secreta)

puts "\n\nFim do jogo"
