# Veiw of mix controls
amixer scontrols    

# Change master volume
amixer sset Master 60%  

# Mute/umute
amixer -q sset Master toggle    

# Graphical mixer program for the Advanced Linux Sound Architecture (ALSA)
alsamixer   

# Pulse audio volume control (pulseaudio is a audio proxy)
pavucontrol

# Convert audio
apt-get install libav-tools   
avconv -i file.m4a file.mp3
for i in *.m4a; do avconv -i "$i" "${i/.m4a/.mp3}"; done

# record playback computer
# use audacity with recording device select to alsa
# Open PulseAudio Volume Control (pavucontrol) and select recording tab
# In the "Capture from" dropdown, select the "Monitor" option of the playback device used by the application you want to record from
