# Angular to do api

## API endpoints

| Verb   | URI Pattern         | Controller#Action |
|--------|---------------------|------------------ |
| POST   | `/users`            | `users#create`    |
| PATCH  | `/users/:id`        | `users#update`    |
| GET    | `/users`            | `users#index`     |
| GET    | `/users/:id`        | `users#show`      |
| DELETE | `/users/:id`        | `users#destroy`   |
|--------|---------------------|------------------ |
| POST   | `/tasks`            | `tasks#create`    |
