#!/bin/bash

# Configurações
COOKIES_FILE="/root/cookies.txt"
URLS_FILE="/root/urls.txt"
YT_DLP_BIN="/home/xtreamcodes/iptv_xtream_codes/bin/youtube"  # Caminho para yt-dlp
FFMPEG_BIN="/home/xtreamcodes/iptv_xtream_codes/bin/ffmpeg"        # Caminho para ffmpeg

# 1️⃣ Verificar se yt-dlp está instalado
if ! command -v yt-dlp &> /dev/null; then
    echo "yt-dlp não encontrado. Instalando..."
    sudo apt update && sudo apt install -y yt-dlp
fi

# 2️⃣ Verificar se FFMPEG está instalado
if ! command -v ffmpeg &> /dev/null; then
    echo "FFmpeg não encontrado. Instalando..."
    sudo apt update && sudo apt install -y ffmpeg
fi

# 3️⃣ Verificar se o arquivo de cookies existe
if [[ ! -f "$COOKIES_FILE" ]]; then
    echo "Erro: Arquivo de cookies não encontrado! Gere um novo e coloque em $COOKIES_FILE"
    exit 1
fi

# 4️⃣ Verificar se o arquivo de URLs existe
if [[ ! -f "$URLS_FILE" ]]; then
    echo "Erro: Arquivo urls.txt não encontrado! Crie um e adicione os links."
    exit 1
fi

# 5️⃣ Processar cada URL no arquivo urls.txt
while IFS='|' read -r YOUTUBE_URL UDP_OUTPUT; do
    # Ignorar linhas vazias ou comentadas
    [[ -z "$YOUTUBE_URL" || "$YOUTUBE_URL" =~ ^# ]] && continue

    echo "🔍 Buscando link da live no YouTube: $YOUTUBE_URL"

    # Obter o link direto do stream
    STREAM_URL=$($YT_DLP_BIN -g --cookies "$COOKIES_FILE" "$YOUTUBE_URL" 2>/dev/null)

    if [[ -z "$STREAM_URL" ]]; then
        echo "❌ Erro: Não foi possível obter o link para $YOUTUBE_URL!"
        continue
    fi

    echo "✅ Link obtido: $STREAM_URL"
    echo "🚀 Iniciando retransmissão para $UDP_OUTPUT via FFmpeg..."

    # Iniciar o stream via FFmpeg em background (&)
    $FFMPEG_BIN -i "$STREAM_URL" -c copy -f mpegts "udp://$UDP_OUTPUT" &
done < "$URLS_FILE"

echo "✅ Todos os streams foram iniciados!"
