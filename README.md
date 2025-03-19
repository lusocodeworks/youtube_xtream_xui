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
Antes de começar, certifique-se de que seu servidor tem:  
✔ **Ubuntu 18/20/22** (ou similar)  
✔ **Acesso root** ou permissões sudo  
✔ **FFmpeg e yt-dlp instalados**  
✔ **Xtream Codes/XUI configurado**  

Se precisar instalar os pacotes necessários, execute:
```bash
sudo apt update && sudo apt install -y yt-dlp
```

ou 
```bash

snap install yt-dlp

```

---

## **📌 3. Como Capturar Cookies do YouTube**
O YouTube exige autenticação para algumas transmissões ao vivo. Para acessar esses conteúdos, é necessário exportar seus cookies do navegador.

### **🔹 Passo 1: Instalar a extensão**
Instale uma das seguintes extensões no navegador:  

📌 **Para Google Chrome:**  
👉 [Get cookies.txt](https://chrome.google.com/webstore/detail/get-cookiestxt-locally/cookiemanager-free-addon)  

📌 **Para Firefox:**  
👉 [cookies.txt](https://addons.mozilla.org/en-US/firefox/addon/cookies-txt/)  

---

### **🔹 Passo 2: Exportar os cookies**
1️⃣ **Acesse [YouTube.com](https://www.youtube.com) e faça login**  
2️⃣ **Abra a transmissão ao vivo que deseja capturar**  
3️⃣ **Clique na extensão e exporte os cookies**  
4️⃣ **Salve o arquivo como `cookies.txt`**  

---

### **🔹 Passo 3: Transferir os cookies para o servidor**
Agora, copie os cookies para o servidor usando SCP ou SFTP:
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

Salve e feche (`CTRL + X`, `Y`, `ENTER`).

---

Salve e **torne o script executável**:
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

📌 **Copyright © 2025 LusoCodeWorks - Todos os direitos reservados.**