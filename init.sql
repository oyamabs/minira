create table project
(
    name        TEXT not null,
    identifier  text not null,
    description text,
    task_count  integer
);

create table task
(
    task_id      TEXT not null,
    name         TEXT not null,
    description  TEXT not null,
    status       TEXT not null,
    status_color INTEGER
);
