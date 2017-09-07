require 'logger'

$LOG = Logger.new("calculadora.log")
$LOG.info("Iniciou calculadora")

def soma(num1, num2)
    log("soma", num1, num2)
    resultado = num1 + num2
    puts "#{num1} + #{num2} = #{resultado}"
end

def sub(num1, num2)
    log("sub", num1, num2)
    resultado = num1 - num2
    puts "#{num1} - #{num2} = #{resultado}"
end

def mult(num1, num2)
    log("mult", num1, num2)
    resultado = num1 * num2
    puts "#{num1} * #{num2} = #{resultado}"
end

def div(num1, num2)
    log("div", num1, num2)
    resultado = num1.to_f / num2.to_f
    if num2.to_f == 0
        raise Exception, "#{num1} / #{num2} = ERRO - O denominador não pode ser zero."
    else
        puts "#{num1} / #{num2} = #{resultado}"
    end
end

def log(metodo, param1, param2)
    $LOG.info("Execuntado método - #{metodo}, Parâmetros - #{param1} e #{param2}")
end
