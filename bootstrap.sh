# The output of all these installation steps is noisy. With this utility
# the progress report is nice and concise.
function install {
    echo installing $1
    shift
    apt-get -y install "$@" >/dev/null 2>&1
}

install 'zip' zip
install 'unzip' unzip

echo 'installing ngrok https://ngrok.com/'
rm ngrok.zip /usr/local/bin/ngrok
wget -q https://api.equinox.io/1/Applications/ap_pJSFC5wQYkAyI0FIVwKYs9h1hW/Updates/Asset/ngrok.zip\?os\=linux\&arch\=386\&channel\=stable -O ngrok.zip
sudo unzip ngrok.zip -d /usr/local/bin

install 'httpie' httpie
install 'nmap' nmap

IRBRC_FILE="/home/vagrant/.irbrc"
if [ ! -f $IRBRC_FILE ]; then
  echo "Enabling up IRB history"
  echo "require 'irb/ext/save-history'" > $IRBRC_FILE
  echo "IRB.conf[:SAVE_HISTORY] = 100" >> $IRBRC_FILE
  echo "IRB.conf[:HISTORY_FILE] = File.join(ENV['HOME'], '.irb-save-history')" >> $IRBRC_FILE
fi
