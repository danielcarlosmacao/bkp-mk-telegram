
### Instalação

Baixe e extraia os arquivo

```sh
cd /root; curl -LO https://github.com/danielcarlosmacao/bkp-mk-telegram/archive/refs/heads/main.zip
```
Extraia o arquivo

```sh
unzip main.zip
```
va ao diretorio

```sh
cd bkp-mk-telegram-main
```
De as permiçoes
```sh
chmod +x script.sh; sed -i 's/\r//' script.sh
```
Execute o script

```sh
sh script.sh
```



Conseguir Token e o id do grupo

1.Procurar por BotFather dentro do Telegram

2.Adicionar um novo bot (/newbot)

3.Escolher um nome para o bot

4.Escolher um login para o bot (obrigatorio terminar com bot)

5.Anotar o Token

6.Verificar se o token está funcionando com a URL de Atualizações.

7.Adicionar o bot ao grupo usado o @login

8.Pegar o ID do grupo com a URL de Atualizações.

9.Fazer teste de envio com URL de envio.

nos links abaixo troque SEUTOKEN e SEUGRUPO

URL de Atualizações:
https://api.telegram.org/botSEUTOKEN/getUpdates

URL de envio:
https://api.telegram.org/botSEUTOKEN/sendMessage?chat_id=SEUGRUPO&text=TestandoEnvio
