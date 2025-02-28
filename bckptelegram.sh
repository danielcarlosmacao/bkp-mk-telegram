#!/bin/bash

# Altere abaixo o token e id do bot do telegram e o caminho do diretorio onde estão os arquivos de backup

#variaveis ---------------------------------------
Token=""
ChatID=""
DirArqBkp="/opt/mk-auth/bckp"
Identificacao=""

#-------------------------------------------------

# Formato de compactação desejado: zip ou tar
Compactacao="zip"

# Captura data do envio do backup
Data=$(date +%d/%m/%Y)

# Mensagem de notificão
Notifica="Mk-Auth $Identificacao - Backup do dia $Data"

# Verifica se o diretorio existe
if [ -d "$DirArqBkp" ]; then

# Seleciona o ultimo arquivo de backup criado
ArqBkp=$(ls -t "$DirArqBkp" | head -1)

# Compacta o arquivo de backup
if [ "$Compactacao" = "zip" ]; then
  zip -r "$DirArqBkp/$ArqBkp.zip" "$DirArqBkp/$ArqBkp"
  ArqBkp="$ArqBkp.zip"
else
  tar -zcvf "$DirArqBkp/$ArqBkp.tar.gz" "$DirArqBkp/$ArqBkp"
  ArqBkp="$ArqBkp.tar.gz"
fi

# Verifica se o arquivo existe
if [ -a "$DirArqBkp/$ArqBkp" ]; then
# Envia para o telegram
curl -F document=@"${DirArqBkp}/${ArqBkp}" -F caption="$Notifica" "https://api.telegram.org/bot${Token}/sendDocument?chat_id=$ChatID" &>/dev/null
fi
fi
rm ${DirArqBkp}/${ArqBkp}
exit 0