def es_primo(n)
  return false if n < 2
  (2..Math.sqrt(n)).each { |i| return false if n % i == 0 }
  true
end

primos = (0..300).select { |i| es_primo(i) }
contador = primos.length

puts "Números primos entre 0 y 300:"
puts primos.join(" ")
puts "Cantidad total: #{contador}"
