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