# Проект "Базы данных"

Этот проект представляет собой создание, наполнение и манипуляцию данными в PostgreSQL. Целью проекта является закрепление полученных в курсе знаний о базах данных.

## Описание

Проект включает 4 базы данных:
- Транспортные средства
- Автомобильные гонки
- Бронирование отелей
- Структура организации

Каждая база данных содержит скрипты для создания таблиц, наполнения их данными и решения задач разной сложности.

## База данных: Транспортные средства

#### 1. Таблица `Vehicle`
- **Цель**: Содержит общую информацию о производителях и моделях транспортных средств.
- **Поля**:
  - `maker`: (VARCHAR) Название производителя.
  - `model`: (VARCHAR) Название модели. Это поле также служит первичным ключом, что означает, что каждая модель должна быть уникальной.
  - `type`: (VARCHAR) Тип транспортного средства, который может принимать одно из значений: 'Car', 'Motorcycle', 'Bicycle'.

#### 2. Таблица `Car`
- **Цель**: Содержит детали о легковых автомобилях.
- **Поля**:
  - `vin`: (VARCHAR) Уникальный идентификатор автомобиля (номер VIN), который является первичным ключом.
  - `model`: (VARCHAR) Название модели автомобиля, которая ссылается на поле `model` в таблице `Vehicle`. Это поле используется как внешний ключ для обеспечения целостности данных.
  - `engine_capacity`: (DECIMAL) Объем двигателя в литрах.
  - `horsepower`: (INT) Мощность двигателя в лошадиных силах.
  - `price`: (DECIMAL) Цена автомобиля в долларах.
  - `transmission`: (VARCHAR) Тип трансмиссии, которая может быть 'Automatic' (автоматическая) или 'Manual' (механическая).

#### 3. Таблица `Motorcycle`
- **Цель**: Содержит детали о мотоциклах.
- **Поля**:
  - `vin`: (VARCHAR) Уникальный идентификатор мотоцикла (номер VIN), который является первичным ключом.
  - `model`: (VARCHAR) Название модели мотоцикла, которая ссылается на поле `model` в таблице `Vehicle`, используется как внешний ключ.
  - `engine_capacity`: (DECIMAL) Объем двигателя в литрах.
  - `horsepower`: (INT) Мощность двигателя в лошадиных силах.
  - `price`: (DECIMAL) Цена мотоцикла в долларах.
  - `type`: (VARCHAR) Тип мотоцикла, который может принимать одно из значений: 'Sport', 'Cruiser', 'Touring'.

#### 4. Таблица `Bicycle`
- **Цель**: Содержит детали о велосипедах.
- **Поля**:
  - `serial_number`: (VARCHAR) Уникальный серийный номер велосипеда, который является первичным ключом.
  - `model`: (VARCHAR) Название модели велосипеда, которая ссылается на поле `model` в таблице `Vehicle`, используется как внешний ключ.
  - `gear_count`: (INT) Количество передач велосипеда.
  - `price`: (DECIMAL) Цена велосипеда в долларах.
  - `type`: (VARCHAR) Тип велосипеда, который может принимать одно из значений: 'Mountain', 'Road', 'Hybrid'.

#### Взаимосвязи
- Каждая из таблиц `Car`, `Motorcycle` и `Bicycle` ссылается на таблицу `Vehicle` через поле `model`, что обеспечивает целостность данных. Это значит, что каждая модель, указанная в таблицах `Car`, `Motorcycle` и `Bicycle`, должна предварительно существовать в таблице `Vehicle`.
- Таблицы `Car`, `Motorcycle` и `Bicycle` можно считать подмножествами таблицы `Vehicle`, где каждая подтаблица содержит специфические детали для каждого типа транспортного средства.

### Подготовительный этап:
1. Создадим БД vehicles в графическом интерфейсе.
2. Создадим таблицы, запустив скрипт из файла db/vehicles/vehicle__create_tables.sql.
3. Наполним таблицы данными с помощью скрипта db/vehicles/vehicle__insert_tables.sql.

### Задачи:
#### Задача 1.
Условие:
Найдите производителей (maker) и модели всех мотоциклов, которые имеют мощность более 150 лошадиных сил, 
стоят менее 20 тысяч долларов и являются спортивными (тип Sport). Также отсортируйте результаты 
по мощности в порядке убывания.

Решение:
размещено в скрипте db/vehicles/vehicle-t1.sql.

#### Задача 2.
Условие:
Найти информацию о производителях и моделях различных типов транспортных средств 
(автомобили, мотоциклы и велосипеды), которые соответствуют заданным критериям.

Автомобили:
Извлечь данные о всех автомобилях, которые имеют:

Мощность двигателя более 150 лошадиных сил.
Объем двигателя менее 3 литров.
Цену менее 35 тысяч долларов.
В выводе должны быть указаны производитель (maker), номер модели (model), 
мощность (horsepower), объем двигателя (engine_capacity) 
и тип транспортного средства, который будет обозначен как Car.

Мотоциклы:
Извлечь данные о всех мотоциклах, которые имеют:

Мощность двигателя более 150 лошадиных сил.
Объем двигателя менее 1,5 литров.
Цену менее 20 тысяч долларов.
В выводе должны быть указаны производитель (maker), номер модели (model), 
мощность (horsepower), объем двигателя (engine_capacity) 
и тип транспортного средства, который будет обозначен как Motorcycle.

Велосипеды:
Извлечь данные обо всех велосипедах, которые имеют:

Количество передач больше 18.
Цену менее 4 тысяч долларов.
В выводе должны быть указаны производитель (maker), номер модели (model), 
а также NULL для мощности и объема двигателя, так как эти характеристики 
не применимы для велосипедов. Тип транспортного средства будет обозначен как Bicycle.

Сортировка:
Результаты должны быть объединены в один набор данных и отсортированы 
по мощности в порядке убывания. Для велосипедов, 
у которых нет значения мощности, они будут располагаться внизу списка.

Решение:
размещено в скрипте db/vehicles/vehicle-t2.sql.


## База данных 2. Автомобильные гонки.

#### 1. Таблица `Classes`
- **Цель**: Содержит информацию о классах автомобилей.
- **Поля**:
  - `class`: (VARCHAR) Название класса. Это поле также служит первичным ключом, что означает, что каждый класс должен быть уникальным.
  - `type`: (VARCHAR) Тип класса, который может принимать одно из значений: 'Racing' или 'Street'.
  - `country`: (VARCHAR) Страна производства.
  - `numDoors`: (INT) Количество дверей.
  - `engineSize`: (DECIMAL) Размер двигателя в литрах.
  - `weight`: (INT) Вес автомобиля в килограммах.

#### 2. Таблица `Cars`
- **Цель**: Содержит информацию об автомобилях.
- **Поля**:
  - `name`: (VARCHAR) Название автомобиля. Это поле также служит первичным ключом.
  - `class`: (VARCHAR) Название класса автомобиля, которая ссылается на поле `class` в таблице `Classes`. Это поле используется как внешний ключ для обеспечения целостности данных.
  - `year`: (INT) Год выпуска автомобиля.

#### 3. Таблица `Races`
- **Цель**: Содержит информацию о гонках.
- **Поля**:
  - `name`: (VARCHAR) Название гонки. Это поле также служит первичным ключом.
  - `date`: (DATE) Дата проведения гонки.

#### 4. Таблица `Results`
- **Цель**: Содержит информацию о результатах гонок.
- **Поля**:
  - `car`: (VARCHAR) Название автомобиля, который участвовал в гонке. Это поле ссылается на поле `name` в таблице `Cars`.
  - `race`: (VARCHAR) Название гонки, в которой участвовал автомобиль. Это поле ссылается на поле `name` в таблице `Races`.
  - `position`: (INT) Позиция, на которой автомобиль финишировал в гонке.
  - Первичный ключ: Комбинация полей `car` и `race`, что обеспечивает уникальность каждого результата.

#### Взаимосвязи
- Таблица `Cars` ссылается на таблицу `Classes` через поле `class`, что обеспечивает целостность данных.
- Таблица `Results` ссылается на таблицы `Cars` и `Races` через поля `car` и `race` соответственно, что обеспечивает целостность данных.
- Таблица `Results` хранит уникальные результаты для каждой пары автомобиль-гонка.

### Подготовительный этап:
1. Создадим БД car_races в графическом интерфейсе.
2. Создадим таблицы, запустив скрипт из файла db/races/races__create_tables.sql.
3. Наполним таблицы данными с помощью скрипта db/races/races__insert_tables.sql.

### Задачи:
#### Задача 1.
Условие:
Определить, какие автомобили из каждого класса имеют наименьшую среднюю позицию в гонках, 
и вывести информацию о каждом таком автомобиле для данного класса, включая его класс, 
среднюю позицию и количество гонок, в которых он участвовал. 
Также отсортировать результаты по средней позиции.

Решение:
размещено в скрипте db/races/races-t1.sql.

#### Задача 2.
Условие:
Определить автомобиль, который имеет наименьшую среднюю позицию в гонках среди всех автомобилей, 
и вывести информацию об этом автомобиле, включая его класс, среднюю позицию, количество гонок, 
в которых он участвовал, и страну производства класса автомобиля. 
Если несколько автомобилей имеют одинаковую наименьшую среднюю позицию, 
выбрать один из них по алфавиту (по имени автомобиля).

Решение:
размещено в скрипте db/races/races-t2.sql.

#### Задача 3.
Условие:
Определить классы автомобилей, которые имеют наименьшую среднюю позицию в гонках, 
и вывести информацию о каждом автомобиле из этих классов, включая его имя, 
среднюю позицию, количество гонок, в которых он участвовал, страну производства 
класса автомобиля, а также общее количество гонок, в которых участвовали 
автомобили этих классов. 
Если несколько классов имеют одинаковую среднюю позицию, выбрать все из них.

Решение:
размещено в скрипте db/races/races-t3.sql.

#### Задача 4.
Условие:
Определить, какие автомобили имеют среднюю позицию лучше (меньше) средней позиции 
всех автомобилей в своем классе (то есть автомобилей в классе должно быть минимум два, 
чтобы выбрать один из них). Вывести информацию об этих автомобилях, включая их имя, 
класс, среднюю позицию, количество гонок, в которых они участвовали, и 
страну производства класса автомобиля. 
Также отсортировать результаты по классу и затем по средней позиции в порядке возрастания.

Решение:
размещено в скрипте db/races/races-t4.sql.

#### Задача 5.
Условие:
Определить, какие классы автомобилей имеют наибольшее количество автомобилей с 
низкой средней позицией (больше 3.0) и вывести информацию о каждом автомобиле 
из этих классов, включая его имя, класс, среднюю позицию, количество гонок, 
в которых он участвовал, страну производства класса автомобиля, а также 
общее количество гонок для каждого класса. Отсортировать результаты по 
количеству автомобилей с низкой средней позицией.

Решение:
размещено в скрипте db/races/races-t5.sql.

## База данных 3. Бронирование отелей.

#### 1. Таблица `Hotel`
- **Цель**: Содержит информацию об отелях.
- **Поля**:
  - `ID_hotel`: (SERIAL) Уникальный идентификатор отеля, который автоматически генерируется и служит первичным ключом.
  - `name`: (VARCHAR) Название отеля.
  - `location`: (VARCHAR) Местоположение отеля.

#### 2. Таблица `Room`
- **Цель**: Содержит информацию о номерах в отелях.
- **Поля**:
  - `ID_room`: (SERIAL) Уникальный идентификатор номера, который автоматически генерируется и служит первичным ключом.
  - `ID_hotel`: (INT) Идентификатор отеля, к которому относится номер. Это поле ссылается на поле `ID_hotel` в таблице `Hotel` и используется как внешний ключ.
  - `room_type`: (VARCHAR) Тип номера, который может принимать одно из значений: 'Single', 'Double', 'Suite'.
  - `price`: (DECIMAL) Цена номера.
  - `capacity`: (INT) Вместимость номера (количество человек).

#### 3. Таблица `Customer`
- **Цель**: Содержит информацию о клиентах.
- **Поля**:
  - `ID_customer`: (SERIAL) Уникальный идентификатор клиента, который автоматически генерируется и служит первичным ключом.
  - `name`: (VARCHAR) Имя клиента.
  - `email`: (VARCHAR) Электронная почта клиента, которая должна быть уникальной.
  - `phone`: (VARCHAR) Номер телефона клиента.

#### 4. Таблица `Booking`
- **Цель**: Содержит информацию о бронированиях номеров.
- **Поля**:
  - `ID_booking`: (SERIAL) Уникальный идентификатор бронирования, который автоматически генерируется и служит первичным ключом.
  - `ID_room`: (INT) Идентификатор номера, который бронируется. Это поле ссылается на поле `ID_room` в таблице `Room`.
  - `ID_customer`: (INT) Идентификатор клиента, который бронирует номер. Это поле ссылается на поле `ID_customer` в таблице `Customer`.
  - `check_in_date`: (DATE) Дата заезда.
  - `check_out_date`: (DATE) Дата выезда.

#### Взаимосвязи
- Таблица `Room` ссылается на таблицу `Hotel` через поле `ID_hotel`, что обеспечивает целостность данных.
- Таблица `Booking` ссылается на таблицы `Room` и `Customer` через поля `ID_room` и `ID_customer` соответственно, что обеспечивает целостность данных.
- Таблица `Booking` хранит уникальные записи для каждого бронирования, связывая номера и клиентов.


### Подготовительный этап:
1. Создадим БД hotels_booking в графическом интерфейсе.
2. Создадим таблицы, запустив скрипт из файла db/hotels/hotel__create_tables.sql.
3. Наполним таблицы данными с помощью скрипта db/hotels/hotel__insert_tables.sql.

### Задачи:
#### Задача 1.
Условие:
Определить, какие клиенты сделали более двух бронирований в разных отелях, 
и вывести информацию о каждом таком клиенте, включая его имя, электронную почту, 
телефон, общее количество бронирований, а также список отелей, в которых 
они бронировали номера (объединенные в одно поле через запятую с помощью CONCAT). 
Также подсчитать среднюю длительность их пребывания (в днях) по всем бронированиям. 
Отсортировать результаты по количеству бронирований в порядке убывания.

Решение:
размещено в скрипте db/hotels/hotel-t1.sql.

#### Задача 2.
Условие:
Необходимо провести анализ клиентов, которые сделали более двух бронирований в разных 
отелях и потратили более 500 долларов на свои бронирования. 
Для этого:
Определить клиентов, которые сделали более двух бронирований и забронировали 
номера в более чем одном отеле. Вывести для каждого такого клиента следующие данные: 
ID_customer, имя, общее количество бронирований, общее количество уникальных отелей, 
в которых они бронировали номера, и общую сумму, потраченную на бронирования.
Также определить клиентов, которые потратили более 500 долларов на бронирования, 
и вывести для них ID_customer, имя, общую сумму, потраченную на бронирования, 
и общее количество бронирований.
В результате объединить данные из первых двух пунктов, чтобы получить список клиентов, 
которые соответствуют условиям обоих запросов. Отобразить поля: ID_customer, имя, 
общее количество бронирований, общую сумму, потраченную на бронирования, 
и общее количество уникальных отелей.
Результаты отсортировать по общей сумме, потраченной клиентами, в порядке убывания.

Решение:
размещено в скрипте db/hotels/hotel-t2.sql.

#### Задача 3.
Условие:
Вам необходимо провести анализ данных о бронированиях в отелях и определить предпочтения 
клиентов по типу отелей. Для этого выполните следующие шаги:

Категоризация отелей.
Определите категорию каждого отеля на основе средней стоимости номера:

«Дешевый»: средняя стоимость менее 175 долларов.
«Средний»: средняя стоимость от 175 до 300 долларов.
«Дорогой»: средняя стоимость более 300 долларов.
Анализ предпочтений клиентов.
Для каждого клиента определите предпочитаемый тип отеля на основе количества отелей в
каждой категории, которые они посетили. 
Если у клиента одинаковое количество отелей в нескольких категориях, 
выбирайте самую дорогую категорию:

Если у клиента есть хотя бы один «дорогой» отель, присвойте ему категорию «дорогой».
Если у клиента нет «дорогих» отелей, но есть хотя бы один «средний», 
присвойте ему категорию «средний».
Если у клиента нет «дорогих» и «средних» отелей, но есть «дешевые», 
присвойте ему категорию предпочитаемых отелей «дешевый».
Вывод информации.
Выведите для каждого клиента следующую информацию:

ID_customer: уникальный идентификатор клиента.
name: имя клиента.
preferred_hotel_type: предпочитаемый тип отеля.
visited_hotels: список уникальных отелей, которые посетил клиент.
Сортировка результатов.
Отсортируйте клиентов так, чтобы сначала шли клиенты с «дешевыми» отелями, 
затем со «средними» и в конце — с «дорогими».

Решение:
размещено в скрипте db/hotels/hotel-t3.sql.

## База данных 4. Структура организации.

#### 1. Таблица `Departments`
- **Цель**: Содержит информацию о департаментах.
- **Поля**:
  - `DepartmentID`: (SERIAL) Уникальный идентификатор департамента, который автоматически генерируется и служит первичным ключом.
  - `DepartmentName`: (VARCHAR) Название департамента.

#### 2. Таблица `Roles`
- **Цель**: Содержит информацию о ролях сотрудников.
- **Поля**:
  - `RoleID`: (SERIAL) Уникальный идентификатор роли, который автоматически генерируется и служит первичным ключом.
  - `RoleName`: (VARCHAR) Название роли.

#### 3. Таблица `Employees`
- **Цель**: Содержит информацию о сотрудниках.
- **Поля**:
  - `EmployeeID`: (SERIAL) Уникальный идентификатор сотрудника, который автоматически генерируется и служит первичным ключом.
  - `Name`: (VARCHAR) Имя сотрудника.
  - `Position`: (VARCHAR) Должность сотрудника.
  - `ManagerID`: (INT) Идентификатор менеджера сотрудника. Это поле ссылается на поле `EmployeeID` в таблице `Employees`. При удалении менеджера это поле устанавливается в NULL.
  - `DepartmentID`: (INT) Идентификатор департамента, к которому относится сотрудник. Это поле ссылается на поле `DepartmentID` в таблице `Departments`. При удалении департамента сотрудники также удаляются.
  - `RoleID`: (INT) Идентификатор роли сотрудника. Это поле ссылается на поле `RoleID` в таблице `Roles`. При удалении роли это поле устанавливается в NULL.

#### 4. Таблица `Projects`
- **Цель**: Содержит информацию о проектах.
- **Поля**:
  - `ProjectID`: (SERIAL) Уникальный идентификатор проекта, который автоматически генерируется и служит первичным ключом.
  - `ProjectName`: (VARCHAR) Название проекта.
  - `StartDate`: (DATE) Дата начала проекта.
  - `EndDate`: (DATE) Дата окончания проекта.
  - `DepartmentID`: (INT) Идентификатор департамента, к которому относится проект. Это поле ссылается на поле `DepartmentID` в таблице `Departments`. При удалении департамента проекты также удаляются.

#### 5. Таблица `Tasks`
- **Цель**: Содержит информацию о задачах в проектах.
- **Поля**:
  - `TaskID`: (SERIAL) Уникальный идентификатор задачи, который автоматически генерируется и служит первичным ключом.
  - `TaskName`: (VARCHAR) Название задачи.
  - `AssignedTo`: (INT) Идентификатор сотрудника, которому назначена задача. Это поле ссылается на поле `EmployeeID` в таблице `Employees`. При удалении сотрудника это поле устанавливается в NULL.
  - `ProjectID`: (INT) Идентификатор проекта, к которому относится задача. Это поле ссылается на поле `ProjectID` в таблице `Projects`. При удалении проекта задачи также удаляются.

#### Взаимосвязи
- Таблица `Employees` ссылается на таблицы `Employees` (для менеджера), `Departments` и `Roles` через поля `ManagerID`, `DepartmentID` и `RoleID` соответственно.
- Таблица `Projects` ссылается на таблицу `Departments` через поле `DepartmentID`.
- Таблица `Tasks` ссылается на таблицы `Employees` и `Projects` через поля `AssignedTo` и `ProjectID` соответственно.
- Установлено поведение при удалении для внешних ключей, чтобы обеспечить целостность данных.

### Подготовительный этап:
1. Создадим БД company_structure в графическом интерфейсе.
2. Создадим таблицы, запустив скрипт из файла db/departments/departments__create_tables.sql.
3. Наполним таблицы данными с помощью скрипта db/departments/departments__insert_tables.sql.

#### Задачи:
#### Задача 1.
Условие:
Найти всех сотрудников, подчиняющихся Ивану Иванову (с EmployeeID = 1), 
включая их подчиненных и подчиненных подчиненных. Для каждого сотрудника вывести следующую информацию:

EmployeeID: идентификатор сотрудника.
Имя сотрудника.
ManagerID: Идентификатор менеджера.
Название отдела, к которому он принадлежит.
Название роли, которую он занимает.
Название проектов, к которым он относится (если есть, конкатенированные в одном столбце через запятую).
Название задач, назначенных этому сотруднику (если есть, конкатенированные в одном столбце через запятую).
Если у сотрудника нет назначенных проектов или задач, отобразить NULL.
Требования:
Рекурсивно извлечь всех подчиненных сотрудников Ивана Иванова и их подчиненных.
Для каждого сотрудника отобразить информацию из всех таблиц.
Результаты должны быть отсортированы по имени сотрудника.
Решение задачи должно представлять из себя один sql-запрос и задействовать ключевое слово RECURSIVE.

Решение:
размещено в скрипте db/departments/departments-t1.sql.

#### Задача 2.
Условие:
Найти всех сотрудников, подчиняющихся Ивану Иванову с EmployeeID = 1, 
включая их подчиненных и подчиненных подчиненных. Для каждого сотрудника вывести следующую информацию:

EmployeeID: идентификатор сотрудника.
Имя сотрудника.
Идентификатор менеджера.
Название отдела, к которому он принадлежит.
Название роли, которую он занимает.
Название проектов, к которым он относится (если есть, конкатенированные в одном столбце).
Название задач, назначенных этому сотруднику (если есть, конкатенированные в одном столбце).
Общее количество задач, назначенных этому сотруднику.
Общее количество подчиненных у каждого сотрудника (не включая подчиненных их подчиненных).
Если у сотрудника нет назначенных проектов или задач, отобразить NULL.

Решение:
размещено в скрипте db/departments/departments-t2.sql.

#### Задача 3.
Условие:
Найти всех сотрудников, которые занимают роль менеджера и имеют подчиненных 
(то есть число подчиненных больше 0). Для каждого такого сотрудника вывести следующую информацию:

EmployeeID: идентификатор сотрудника.
Имя сотрудника.
Идентификатор менеджера.
Название отдела, к которому он принадлежит.
Название роли, которую он занимает.
Название проектов, к которым он относится (если есть, конкатенированные в одном столбце).
Название задач, назначенных этому сотруднику (если есть, конкатенированные в одном столбце).
Общее количество подчиненных у каждого сотрудника (включая их подчиненных).
Если у сотрудника нет назначенных проектов или задач, отобразить NULL.

Решение:
размещено в скрипте db/departments/departments-t3.sql.