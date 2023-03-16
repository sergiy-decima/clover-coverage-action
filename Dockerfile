FROM php:8.2-cli

COPY index.php /index.php

ENTRYPOINT ["php", "/index.php"]
