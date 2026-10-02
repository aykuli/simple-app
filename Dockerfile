# Используем официальный легковесный образ Nginx
FROM nginx:alpine

# Удаляем стандартный конфигурационный файл Nginx
RUN rm /etc/nginx/conf.d/default.conf

# Копируем наш кастомный конфиг Nginx внутрь контейнера
COPY nginx/default.conf /etc/nginx/conf.d/default.conf

# Копируем статические файлы в директорию, которую обслуживает Nginx
COPY static/ /usr/share/nginx/html/

# Открываем 80-й порт для доступа к приложению
EXPOSE 80

# Команда для запуска Nginx в фоновом режиме (по умолчанию в базовом образе)
CMD ["nginx", "-g", "daemon off;"]
