# GoBack
GoBack is a simple tool for "Goleki backdoor" server side.


## Usage 

```
./goback.sh -kb <path_to_keybackdoor.txt> -fo <path_to_folder> -o <output_filename.txt>
```

This is the usage argument.

```
`-kb` atau `--keybackdoor`: Path ke file teks yang berisi daftar kata kunci backdoor. Jika tidak ditentukan, secara default akan menggunakan `lib/keybackdoor.txt`.
`-fo` atau `--folder`: Path ke folder yang akan diperiksa. Jika tidak ditentukan, secara default akan menggunakan root directory (`/`).
`-o` atau `--output`: Nama file untuk menyimpan hasil pencarian backdoor. Jika tidak ditentukan, secara default akan menggunakan `output/YYYY-MM-DD/possiblebackdoor.txt`, dengan `YYYY-MM-DD` adalah tanggal saat ini.
```

## Requirement
- root user 
- OS other than Windows.

## Installation 

- ``` git clone https://github.com/tegal1337/GoBack.git ```
- ``` cd GoBack ```
- ``` chmod +x goback.sh ```
- Sample usage : ``` ./goback.sh -fo /home/user/public_html/ ```

## Demo 

1. Simple command
```
$root/GoBack:  ./goback.sh -fo /home/user/public_html/

$root/GoBack: cat output/2023-05-15/possiblebackdoor.txt
Found backdoor/malicious file: /home/user/public_html/x.php (2023-05-10 17:14:51.805476235 +0700)
Found backdoor/malicious file: /home/user/public_html/yoursite/shell.php (2023-05-10 17:15:01.735475533 +0700)
Found backdoor/malicious file: /home/user/public_html/yoursite/.as.php (2023-05-10 17:15:09.355475001 +0700)

```

2. Other command 

```
$root/GoBack:  ./goback.sh -kb /root/customregex.txt -fo /home/user/public_html/ -o /root/outputposiblebackdoor.txt

$root/GoBack: cat /root/outputposiblebackdoor.txt
Found backdoor/malicious file: /home/user/public_html/x.php (2023-05-10 17:14:51.805476235 +0700)
Found backdoor/malicious file: /home/user/public_html/yoursite/shell.php (2023-05-10 17:15:01.735475533 +0700)
Found backdoor/malicious file: /home/user/public_html/yoursite/.as.php (2023-05-10 17:15:09.355475001 +0700)

```
## Contribution

- Kamu dapat berkontribusi dengan menambah "Keyword" yang biasa terdapat pada backdoor di [Keybackdoor.txt](https://github.com/tegal1337/GoBack/lib/keybackdoor.txt)
- Ataupun membuat tools ini menjadi lebih powerfull.

## Reference 

- https://blog.sucuri.net/2021/05/server-side-scans-and-file-integrity-monitoring.html
- https://github.com/topics/backdoor-finder


