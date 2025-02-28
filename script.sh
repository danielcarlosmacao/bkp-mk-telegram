#!/bin/sh
unzip bkp-mk-telegram.zip
sleep 1 # Delay 

# Caminho do diretório que você deseja verificar/criar
diretorio="/root/script"

# Verificar se o diretório existe
if [ ! -d "$diretorio" ]; then
  echo "Diretório não existe. Criando agora..."
  mkdir -p "$diretorio"  # Cria o diretório, incluindo os diretórios pai se necessário
  echo "Diretório criado com sucesso!"
else
  echo "O diretório já existe."
fi

# Caminho do arquivo que você deseja verificar/criar
arquivo="/etc/cron.d/wf"

# Verificar se o arquivo existe
if [ ! -f "$arquivo" ]; then
  echo "Arquivo /etc/cron.d/wf não existe. Criando agora..."
  touch "$arquivo"  # Cria o arquivo vazio
  echo "Arquivo criado com sucesso!"
else
  echo "O arquivo /etc/cron.d/wf já  existe."
fi


texto="10 04   * * *   root    /root/scripts/bckptelegram.sh >/dev/null 2>&1"

# Verificar se o texto já existe no arquivo
if grep -qF "$texto" "$arquivo"; then
  echo "Texto já existe no arquivo. Va ate /etc/cron.d/wf para edita-lo"
  
  # Sobrescrever o arquivo com o novo texto
  # (Este exemplo substitui o conteúdo do arquivo com o novo texto)
  #echo "$texto" > "$arquivo"
else
  echo "Texto não encontrado. Adicionando ao final do arquivo..."
  
  # Adicionar o texto ao final do arquivo
  echo "$texto" >> "$arquivo"
fi


mv bckptelegram.sh /root/script/
sleep 1  # Delay 

echo "Por favor, insira o Token do Telegram:"
read Token
sed -i "s/^Token=.*/Token=\"$Token\"/"  /root/script/bckptelegram.sh

echo "Por favor, insira o ChatID do Telegram:"
read ChatID
sed -i "s/^ChatID=.*/ChatID=\"$ChatID\"/"  /root/script/bckptelegram.sh

echo "Por padrao o diretorio de backup do sistema e /opt/mk-auth/bckp caso nao seja seu caso alterer a variavel DirArqBkp em /root/script/bcptelegram.sh "

echo "Por favor, insira uma identificação para ir junto com o backup para o telegram:"
read Identificacao
sed -i "s/^Identificacao=.*/Identificacao=\"$Identificacao\"/"  /root/script/bckptelegram.sh

echo "Concluido!!!. Por padrao o backup via telegram e enviado as 04:10 caso queira alterar esse horario va em etc/cron.d/wf"
then
