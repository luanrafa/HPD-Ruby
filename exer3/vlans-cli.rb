require './vlans-main'

email = ARGV[0]

if valida_email(email) == true
    ips_reservados = File.open("vlan_dev_reservados", "a+")
    ips_liberados = File.open("vlan_dev_liberados")
    array_reservado = ips_reservados.readlines
    array_liberado = ips_liberados.readlines

    verifica_ips_liberados(ips_liberados)
    verifica_duplicidade(array_reservado, array_liberado)
    add_ip_reservado(array_liberado, ips_reservados)

else
     puts "Help: ruby vlans-cli.rb email.\n
    Ex.: ruby vlans-cli.rb luanrafael@outlook.com"
end