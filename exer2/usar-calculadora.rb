require './calculadora'

puts "Operações de soma"
soma(1,2)
soma(2,-2)
soma(3.3,5.5)

puts
puts "Operações de subtração"
sub(2,6)
sub(8,2)
sub(11.1,6.3)

puts
puts "Operações de multiplicação"
mult(1,5)
mult(5,-8)
mult(6.8,10.1)

puts
puts "Operações de divisão"
begin
    div(0,5)
    div(50,20)
    div(10,0)
rescue Exception => e
    puts e.message
    $LOG.error "#{e}"
    exit(1)
end