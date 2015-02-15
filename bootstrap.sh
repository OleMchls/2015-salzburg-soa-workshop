# The output of all these installation steps is noisy. With this utility
# the progress report is nice and concise.
function install {
    echo installing $1
    shift
    apt-get -y install "$@" >/dev/null 2>&1
}

install 'zip' zip
install 'unzip' unzip

wget -q https://api.equinox.io/1/Applications/ap_pJSFC5wQYkAyI0FIVwKYs9h1hW/Updates/Asset/ngrok.zip\?os\=linux\&arch\=386\&channel\=stable -O ngrok.zip
sudo unzip ngrok.zip -d /usr/local/bin
