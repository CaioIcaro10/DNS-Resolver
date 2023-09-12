#!/usr/bin/python
import socket,sys,subprocess

host = sys.argv[1]

print(f"{host} ---> {socket.gethostbyname(host)}")

print("Deseja entrar em uma porta especifica com nmap  ou Prefere testar qualquer porta?")
print("Porta com NMAP -> 0")
print("Todas as portas -> 1")

resp = input(" ")

if resp == "0":
	print("Testando NMAP")
	comando_nmap = f"nmap {host}"
	processo = subprocess.Popen(comando_nmap, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)


	saida, erro = processo.communicate()

	# Imprimindo a saída
	print("Saída:")
	print(saida.decode())

	# Imprimindo o erro, se houver
	if erro:
    		print("Erro:")
    		print(erro.decode())

else:
	for porta in range(1,65535):
        	meusocket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

	        if  meusocket.connect_ex((ip,porta)) == 0:
        	        #connect_exe retorna 0 se funcionou a conexao
                	print(f"Porta {porta} [ABERTA]")

