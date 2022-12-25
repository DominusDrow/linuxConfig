_BLOCK_39_(){
local Vol=$(pactl list sinks | awk '/Volumen: front/{print $5-"%"}' | awk 'END{print}')
local Mute=$(pactl list sinks | awk '/Silencio: /{print $2}' | awk 'END{print}')
local Bluetooth=$(bluetoothctl info | awk '/Connected: /{print $2}')



if [ "$Mute" = "sí" ];then
    echo -e " --"
else
    if [ "$Bluetooth" = "yes" ];then
        echo -e " $Vol%"
    elif [ "$Vol" -gt "60" ];then
        echo -e " $Vol%"
    elif [ "$Vol" -gt "30" ];then
        echo -e " $Vol%"
    elif [ "$Vol" -lt "30" ];then
        echo -e " $Vol%"
    fi
fi
}

_BLOCK_39_
