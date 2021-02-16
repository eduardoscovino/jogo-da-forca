def boas_vindas
  puts "******************************************"
  puts "****** Bem vindo ao jogo da forca!! ******"
  puts "******************************************"
end

def diz_as_regras
  puts "\n\nRegras do jogo:"
  puts "1 - Escolha um tema"
  puts "2 - Digite seu chute (não há til ou acentuação nas palavras)"
  puts "3 - Você tem 5 tentativas e a cada erro perde uma"
end

def pergunta_tema(temas)
  puts "\n\nDigite o número do tema que deseja para a forca"
  temas.each_with_index { |tema, index| puts "#{index + 1} - #{tema}"}
end

def mostra_tema_escolhido(temas, opcao)
  puts "\n\nLegal! Você escolheu #{temas[opcao - 1]}"
end

def avisa_escolha
  puts "\n\nEscolhendo a palavra secreta..."
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

def mensagem_resultado(resultado, palavra)
  if resultado
    puts "\n\nGanhou o jogo! A palavra era #{palavra}"
  else
    puts "\n\nQue pena, você perdeu! A palavra era #{palavra}"
  end
end

def desenha_forca(erros)
	cabeca = "   "
	bracos = "   "
	pernas = "   "
	corpo = " "
	if erros >= 1
		cabeca = "(_)"
	end
	if erros >= 2
		bracos = " | "
		corpo = "|"
	end
	if erros >= 3
		bracos = "\\|/"
	end
	if erros >= 4
		pernas = "/ \\"
	end
	puts "  _______       \n"
	puts " |/      |      \n"
	puts " |      #{cabeca}  \n"
	puts " |      #{bracos}  \n"
	puts " |       #{corpo}     \n"
	puts " |      #{pernas}   \n"
	puts " |              \n"
	puts "_|___           \n"
	puts "\n\n"	
end

def fim_do_jogo
  puts "\n\nFim do jogo"
end