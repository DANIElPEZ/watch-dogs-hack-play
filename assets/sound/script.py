import os
import subprocess

# URL del video
video_url = "https://youtu.be/DqoQG_XYF-8?si=VtKF7XJ2zGiysFs5"
audio_filename = "watchdogs.mp3"
output_clip = "hack_sound.mp3"

# Paso 1: Descargar el audio del video
print("🔽 Descargando audio del tráiler...")
subprocess.run([
    "yt-dlp",
    "-x", "--audio-format", "mp3",
    video_url,
    "-o", audio_filename
])

# Paso 2: Extraer el fragmento de 2:36 a 2:38 (156s a 158s)
print("✂️ Recortando fragmento del sonido...")
subprocess.run([
    "ffmpeg",
    "-y",  # sobrescribir si ya existe
    "-i", audio_filename,
    "-ss", "00:02:37.670",
    "-to", "00:02:38.425",
    "-c", "copy",
    output_clip
])

print(f"✅ Fragmento guardado como: {output_clip}")
