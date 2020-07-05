#hanif nuryanto, 20170801156

function header {
    write "+==============================+"
    write "|                              |"
    write "|    WELCOME TO THE GAME OF    |"
    write "|      Remember Your Name      |"
    write "|                              |"
    write "+==============================+"
}

function enter {
    write " "
}

function isiNama {
    write "+======================================+"
    write "| Ayo masukkan nama yang ingin dihafal |"
    write "+======================================+"
}

function main {
    write "+============================+"
    write "|                            |"
    write "|    AYO KITA MAINKANNN!!    |"
    write "|                            |"
    write "+============================+"
    write ""
}

function menu {    
    write " 1) Hafal Urut"
    write " 2) Hafal Terbalik"
    write " 3) Hafal Acak"
    write " 4) Lihat Nama Dong"
    write " 5) Keluar ah"
}

function lihat {
    write "+======================+"
    write "+                      +"
    write "|   DAFTAR NAMA-NAMA   |"
    write "+                      +"
    write "+======================+"
    write " "
}

cls
header 
$player = Read-Host " Siapa nama kamu "
write " Hai $player! Selamat bermain ya!"
enter
[int]$banyakNama = Read-Host " Berapa nama yang pengen kamu hafal "
enter
write " Kamu mau ngehafal $banyakNama nama?"
enter
if($banyakNama -le 3) {
    write " Wah sedikit ya!, hehe, tapi gpp!"
} else {
    write " Wow! Kamu keren!!"
}
pause
enter
write " Mari kita mulai!"
pause
cls

isiNama
$nama = @(" ")
for($i = 1; $i -le $banyakNama; $i++) {
    $temp = Read-Host " $i) Nama ke-$i "
    $nama+=$temp
    rv temp
}
write " Hafal baik-baik ya!!"
pause
cls

$pilihan = 0
while($pilihan -notlike 5) {
    cls
    main
    menu
    enter
    $wrong = 0
    $pilihan = Read-Host "  Mau main yang mana " 
    cls
    switch($pilihan) {
        '1' {
                main
                for($i = 1; $i -le $banyakNama; $i++) {
                    $tebak = Read-Host " Masukkan nama ke-$i "
                    if($tebak -like $nama[$i]) {
                        write " Wow kamu benar!"
                    } else {
                        write " Kamu salah!"
                        $wrong++
                    }
                    enter
                }
                if($wrong -eq 0) {
                    write " Wow keren! Kamu inget semua nama"
                } else {
                    write " $player, kamu salah $wrong nama"
                }
                pause 
            }
        '2' {
                main
                for($i = $banyakNama; $i -ge 1; $i--) {
                    $tebak = Read-Host " Masukkan nama ke-$i "
                    if($tebak -like $nama[$i]) {
                        write " Wow kamu benar!"
                    } else {
                        write " Kamu salah!"
                        $wrong++
                    }
                    enter
                }
                if($wrong -eq 0) {
                    write " Wow keren! Kamu inget semua nama"
                } else {
                    write " $player, kamu salah $wrong nama"
                }
                pause
            }
        '3' {
                main
                $arr = Get-Random -Count $banyakNama -in(1..$banyakNama)
                for($i = 0; $i -lt $banyakNama; $i++) {
                    $acak = $arr[$i]
                    $tebak = Read-Host " Masukkan nama ke-$acak "
                    if($tebak -like $nama[$acak]) {
                        write " Wow kamu benar!"
                    } else {
                        write " Kamu salah!"
                        $wrong++
                    }
                    enter
                }
                if($wrong -eq 0) {
                    write " Wow keren! Kamu inget semua nama"
                } else {
                    write " $player, kamu salah $wrong nama"
                }
                pause
            }
        '4' {
                lihat
                for($i = 1; $i -le $banyakNama; $i++) {
                    $temp = $nama[$i]
                    write " Nama ke-$i : $temp"
                }
                pause
            }
        '5' {
                break
            }
    }
 } 