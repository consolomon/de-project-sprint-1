  # Требования к целевой витрине
   - Витрина должна распологаться в схеме "analisys"
   - Витрина должна состоять из полей:
     - user_id
     - recency (число от 1 до 5)
     - frequency (число от 1 до 5)
     - monetary_value (число от 1 до 5)
   - Глубина данных в витрине: с начала 2022 года
   - Название витрины: "dm_rfm_segments"
   - Обновление данных не требуется
   - Успешно выполненнный заказ: заказ со статусом "closed"
   
# Используемые поля
  ### для расчёта "recency":
  - orders.user_id
  - orders.order_ts
  - orders.status
  ### для расчёта "frequency":
  - orders.user_id
  - orders.order_id
  - orders.order_ts
  - orders.status
  ### для расчёта "monetary_value":
  - orders.user_id
  - orders.cost
  - orders.status

# 1.3. Качество данных
## Проверенные метрики и инструменты таблиц:
### Метрики:
  - количество исполненных/неисполненных заказов,
  - доля исполненных заказов среди всех заказов, включая невыполненные
  - отношение суммы платежа выполненных заказов к сумме платежа всех заказов, включая невыполненные

### Инструменты таблиц:
| Таблицы             | Объект                      | Инструмент      | Для чего используется |
| ------------------- | --------------------------- | --------------- | --------------------- |
| production.orders | order_id int NOT NULL PRIMARY KEY | Первичный ключ  | Обеспечивает уникальность записей о заказах |
| production.orders | cost, payment, bonus_payment numeric(19,5) NOT NULL CHECK  | Условие  | Обеспечивает соответствие суммы чека и суммы платежа |
| production.orders | all columns NOT NULL | Непустое значение | Обеспечивает отсутствие пустых полей во всех записях |
| production.users | id int NOT NULL PRIMARY KEY | Первичный ключ  | Обеспечивает уникальность идентификаторов пользователей |
| production.users | login NOT NULL | Непустое значение | Обеспечивает cуществование непустого логина у каждого зарегестрированного пользователя|