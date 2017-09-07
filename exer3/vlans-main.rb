require 'logger'

$LOG = Logger.new("vlans.log")

def verifica_ips_liberados(arquivo) 
    if File.zero?(arquivo) == true
        puts "Todos os ips já estão reservados."
        $LOG.error("Todos os ips já estão reservados.")
        exit
    end
end

def verifica_duplicidade(reservado, liberado)
    reservado.each do |ip_duplicado|
        if(liberado.include?(ip_duplicado))
            puts "Ip duplicado - #{ip_duplicado}"
             $LOG.error("Todos os ips já estão reservados.")
            exit
        end
    end
end

def add_ip_reservado(lista_ips_liberados, arquivo_ips_reservados)
    arquivo_ips_reservados.puts lista_ips_liberados[0]
    puts "IP reservado - #{lista_ips_liberados[0]}"
    puts "Solicitado pelo usuário - #{ARGV[0]}"
    $LOG.info("IP reservado - #{lista_ips_liberados[0]}")
    $LOG.info("Solicitaod pelo usuário - #{ARGV[0]}")
    ips_livres = lista_ips_liberados[1..-1]
    ips_liberados = File.open("vlan_dev_liberados", "w+")
    ips_liberados.puts ips_livres
end

def valida_email(email)
    begin
        #regex =  email[/^[a-z]+@[a-z]+\.(com)(\.[a-z]{2})?$/]
        regex = /^([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})$/i
        if email[regex]
            true
        else
            false
        end
    rescue NoMethodError => e
        puts e.message
        puts "Email vazio"
    rescue Exception => e
        puts e.message
    end
end