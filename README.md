![Typing SVG](https://readme-typing-svg.herokuapp.com?color=%2336BCF7&lines=Docker+PostgreSQL+with+auto+backups)

# PostgreSQL 16.2 with auto backups Preview example

<a name="tables"><h2>Structure</h2></a>
```no-highlight
Desccription of structure.
| Entity                | Description                                        |
| ---------------------- |:------------------------------------------:|
| ./cron                 | sh scripts for crone                       |
| ./data                 | PostgreSQL data                            |
| ./pg_dump              | PostgreSQL databases backups               |
| ./docker-compose.yml   | docker-compose runscript                   |
| ./postgres.env.example | env configurations example                 |
```

Build steps:
1. rename postgres.env.example into postgres.env
2. run "docker-compose up --build"