# NaïveProxy

---

## Что такое NaïveProxy?

**NaïveProxy** — это лёгкий, высокопроизводительный прокси-инструмент, разработанный для обхода интернет-цензуры. Он поддерживает протоколы HTTP/2 и HTTP/3 и маскируется под обычный веб-трафик. Построен на Chromium с интегрированным TLS-шифрованием, благодаря чему обеспечивает безопасность, скорость и эффективность — идеально подходит для обхода ограничений без лишнего внимания.

---

## Почему стоит выбрать NaïveProxy?

- **Выглядит как обычный трафик**: использует TLS-стек Chromium, поэтому сливается с обычным трафиком браузера.
- **Простой в использовании**: легко настроить даже без глубоких технических знаний.

---

## Начало работы с NaïveProxy + Caddy

### Что вам понадобится

- **Доменное имя**, желательно управляемое через Cloudflare или похожего DNS-провайдера.
- **Linux VPS** с открытыми портами **443** и **80**.
- **Базовые требования**:
  - Базовые знания командной строки
  - Root-доступ к серверу

---

## Пошаговая установка

### 1. Перейдите в режим root-пользователя

```bash
sudo -s
```

### 2. Обновите систему

```bash
apt update
```

### 3. Установите Go

```bash
apt-get install software-properties-common
add-apt-repository ppa:longsleep/golang-backports
apt-get update
apt-get install golang-go
```

### 4. Установите `xcaddy`

```bash
go install github.com/caddyserver/xcaddy/cmd/xcaddy@latest
```

### 5. Соберите Caddy с плагином NaïveProxy

```bash
~/go/bin/xcaddy build \
  --with github.com/caddyserver/forwardproxy@caddy2=github.com/klzgrad/forwardproxy@naive
```

---

## Конфигурация

### 6. Создайте файл `Caddyfile`

Создайте новый файл с именем `Caddyfile` и вставьте в него следующий код. Обязательно замените значения-заполнители на свои данные:

```caddyfile
:443, your-domain.com
tls your-email@example.com

route {
  forward_proxy {
    basic_auth username password
    hide_ip
    hide_via
    probe_resistance
  }

  reverse_proxy https://example.com {
    header_up Host {upstream_hostport}
    header_up X-Forwarded-Host {host}
  }
}
```

> Замените `your-domain.com`, `your-email@example.com`, `username`, `password` и `https://example.com` на свои реальные значения.

---

## Команды для управления Caddy

### Запуск в форграунде

```bash
./caddy run
```

### Запуск в фоне

```bash
./caddy start
```

### Остановка сервера

```bash
./caddy stop
```

### Перезагрузка конфигурации

```bash
./caddy reload
```

---

## Запуск сервера

### 7. Сгенерируйте SSL-сертификаты

Запустите Caddy один раз, чтобы автоматически сгенерировать сертификаты:

```bash
./caddy run
```

Когда увидите, что сервер запущен, нажмите `Ctrl + C` для остановки.

### 8. Запустите Caddy в фоне

```bash
./caddy start
```

---

### 9. Автоматический запуск при перезагрузке

Откройте файл службы:

```bash
nano /etc/systemd/system/caddy-custom.service
```

И вставьте в него:

```
[Unit]
Description=Custom Caddy Service via Bash
After=network.target

[Service]
Type=simple
WorkingDirectory=/home/ВАШ_ПОЛЬЗОВАТЕЛЬ_ГДЕ_CADDYFILE
ExecStart=/bin/bash -c './caddy run'
Restart=on-failure
User=wispy
Group=wispy

[Install]
WantedBy=multi-user.target
```

Обязательно замените необходимые значения. Возможно, путь до вашего Caddy отличается — укажите его в `ExecStart`.
Нажмите `Ctrl + X`, затем `Y`, затем `Enter`, чтобы сохранить файл.

Перезагрузите systemd:

```bash
sudo systemctl daemon-reload
```

Теперь активируйте и запустите службу:

```bash
sudo systemctl enable caddy-custom
sudo systemctl start caddy-custom
sudo systemctl status caddy-custom
```

Если статус "active" и "running" — всё работает правильно.

---

## Готово!

Ваш сервер NaïveProxy теперь работает.

Настройте клиент, указав домен, имя пользователя и пароль, которые вы задали, используя порт 443. Не забудьте указать доменное имя в поле SNI (Server Name Indication). Все остальные настройки можно оставить по умолчанию.
