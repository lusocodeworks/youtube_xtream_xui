### **📜 Manual de Uso**
#### **YouTube Live Stream para Xtream Codes/XUI**
📌 **Copyright © 2025 LusoCodeWorks**  
📌 **Versão:** 1.0  
📌 **Última Atualização:** 18/03/2025  

---

## **📌 1. Introdução**
Este guia explica como **capturar transmissões ao vivo do YouTube** e transmiti-las via **Xtream Codes/XUI** usando **FFmpeg e yt-dlp**.  

✅ **Permite múltiplas lives** simultaneamente  
✅ **Suporte a cookies do YouTube** para acessar transmissões protegidas  
✅ **Atualização automática** dos links de transmissão  
✅ **Integração com Xtream Codes/XUI** via **UDP**  

---

## **📌 2. Requisitos**
Antes de começar, certificar de que o servidor tem:  
✔ **Ubuntu 18/20/22** (ou similar)  
✔ **Acesso root** ou permissões sudo  
✔ **FFmpeg e yt-dlp instalados**  
✔ **LB Xtream Codes/XUI configurado**  
✔ **python3.8 ou python3.9**  

Se precisar instalar os pacotes necessários, execute:
```bash
sudo apt update && sudo apt install -y yt-dlp
```

ou 
```bash

snap install yt-dlp

```
🐧 python3.9 Para Ubuntu / Debian (recomendado: Ubuntu 20.04 ou superior)

```bash
sudo apt update
sudo apt install -y software-properties-common
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt update
sudo apt install -y python3.9 python3.9-venv python3.9-dev
```
Verifique a instalação:
```bash
python3.9 --version
```
Perfeito! Para tornar o **Python 3.9** o padrão ao usar `python3` no terminal, siga os passos abaixo de acordo com o seu sistema:
---
### 🔧 **Em Ubuntu/Debian** (usando `update-alternatives`)

```bash
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.9 1
```

> Substitua `/usr/bin/python3.9` pelo caminho real do binário, se for diferente. Verifique com:
```bash
which python3.9
```

Depois, se quiser confirmar ou escolher entre versões:

```bash
sudo update-alternatives --config python3
```

Aí é só selecionar o número correspondente ao Python 3.9.

---

### 🧩 **Se `update-alternatives` não estiver disponível**

Você pode definir um alias no `~/.bashrc` (ou `~/.zshrc`, se usa zsh):

```bash
echo "alias python3='python3.9'" >> ~/.bashrc
source ~/.bashrc
```

---

### 🔁 Verifique se está funcionar:

```bash
python3 --version
```
Resultado esperado:

```
Python 3.9.x
```

Se quiser que eu gere um script completo `.sh` para automatizar isso tudo, posso te enviar agora mesmo. Deseja?`
---

## **📌 3. Como Capturar Cookies do YouTube**
O YouTube exige autenticação para algumas transmissões ao vivo. 
Para acessar esses conteúdos, é necessário exportar os cookies do navegador.

### **🔹 Passo 1: Instalar a extensão**
Instalar uma das seguintes extensões no navegador:  

📌 **Para Google Chrome:**  
👉 [Get cookies.txt](https://chromewebstore.google.com/detail/get-cookiestxt-locally/cclelndahbckbenkjhflpdbgdldlbecc)  

📌 **Para Firefox:**  
👉 [cookies.txt](https://addons.mozilla.org/en-US/firefox/addon/cookies-txt/)  

---

### **🔹 Passo 2: Exportar os cookies**
1️⃣ **Acesar [YouTube.com](https://www.youtube.com) e faça login**  
2️⃣ **Abre a transmissão ao vivo que deseja capturar**  
3️⃣ **Clica na extensão e exporte os cookies**  
4️⃣ **Salva o arquivo como `cookies.txt`**  

---

### **🔹 Passo 3: Transferir os cookies para o servidor**
Agora, copia os cookies para o servidor usando SCP ou SFTP:
```bash
/root/cookies.txt
```

---

## **📌 4. Configuração do Script**
Agora que os cookies foram transferidos, vamos configurar o script de transmissão.

### **🔹 Passo 1: Criar o arquivo de URLs**
No servidor, crie o arquivo `urls.txt` contendo os links das lives e portas UDP:
```bash
urls.txt
```
Adicione os links das transmissões no formato:
```
https://www.youtube.com/watch?v=7g88SDK9_Y0|127.0.0.1:1234
https://www.youtube.com/watch?v=EXEMPLO2|127.0.0.1:1235
https://www.youtube.com/watch?v=EXEMPLO3|127.0.0.1:1236
```
📌 **Cada linha representa um canal.**  
📌 **O primeiro campo é o link do YouTube.**  
📌 **O segundo campo é a porta UDP para o Xtream Codes/XUI.**

```bash
YT_DLP_BIN="/home/xtreamcodes/iptv_xtream_codes/bin/youtube"  # Caminho para yt-dlp
FFMPEG_BIN="/home/xtreamcodes/iptv_xtream_codes/bin/ffmpeg"        # Caminho para ffmpeg
```

**torne o script executável**:
```bash
chmod +x /root/youtube.sh
```

---

### **🔹 Passo 3: Executar o Script**
Agora, basta rodar:
```bash
bash /root/youtube.sh
```

Isso iniciará todas as transmissões conforme configurado em `urls.txt`.

---

## **📌 5. Integração com Xtream Codes/XUI**
1️⃣ No **Xtream Codes/XUI**, vá para **Adicionar Stream**  
2️⃣ Escolha o **Tipo: UDP**  
3️⃣ Insira o **Endereço UDP** correspondente ao canal  
   - Exemplo: `udp://127.0.0.1:1234`  
4️⃣ Salve e inicie a transmissão 🚀  

---

## **📌 6. Agendar Execução Automática**
Para manter os streams ativos, adicione ao **CRON**:
```bash
crontab -e
```
E adicione a linha:
```
0 */6 * * * /root/youtube.sh >> /root/youtube_live.log 2>&1
```
Isso garantirá que as lives sejam **reiniciadas a cada 6 horas**.

---

## **📌 7. Conclusão**
✅ **Streams do YouTube retransmitidos para Xtream Codes/XUI**  
✅ **Gerenciamento fácil via `urls.txt`**  
✅ **Autenticação automática via cookies**  
✅ **Execução automática via CRON**  

Agora você pode **transmitir qualquer live do YouTube automaticamente**! 🚀🔥  

📌 **Copyright © 2025 LusoCodeWorks - Todos os direitos reservados.** https://x-me.xyz
