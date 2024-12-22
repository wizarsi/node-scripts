#!/bin/bash

# Скачивание архива
wget https://cdn.app.multiple.cc/client/linux/x64/multipleforlinux.tar

# Ожидание завершения загрузки
while [ ! -f multipleforlinux.tar ]; do
  sleep 1
done

# Распаковка архива
tar -xvf multipleforlinux.tar

# Переход в директорию
cd multipleforlinux/

# Присвоение прав на выполнение
chmod +x ./multiple-cli
chmod +x ./multiple-node

# Добавление пути в системную переменную PATH
sudo sed -i -e '$a\\nPATH=$PATH:/root/multipleforlinux/' /etc/profile

# Применение изменений в profile
source /etc/profile

# Установка прав на директорию
cd
chmod -R 777 multipleforlinux

# Запуск node в фоновом режиме
cd multipleforlinux/
nohup ./multiple-node > output.log 2>&1 &
