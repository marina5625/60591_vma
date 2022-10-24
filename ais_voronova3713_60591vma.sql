-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: mysql
-- Время создания: Окт 24 2022 г., 15:41
-- Версия сервера: 8.0.29
-- Версия PHP: 8.0.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `ais_voronova3713_60591vma`
--

-- --------------------------------------------------------

--
-- Структура таблицы `hall`
--

CREATE TABLE `hall` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'наименование'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `movie`
--

CREATE TABLE `movie` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'наименование',
  `length` time NOT NULL COMMENT 'продолжительность'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Фильм';

-- --------------------------------------------------------

--
-- Структура таблицы `place`
--

CREATE TABLE `place` (
  `id` int UNSIGNED NOT NULL,
  `id_hall` int UNSIGNED NOT NULL,
  `row` int UNSIGNED NOT NULL COMMENT 'ряд',
  `number` int UNSIGNED NOT NULL COMMENT 'номер',
  `pricecategory` int UNSIGNED NOT NULL COMMENT ' ценовая категория'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='место';

-- --------------------------------------------------------

--
-- Структура таблицы `price`
--

CREATE TABLE `price` (
  `id` int UNSIGNED NOT NULL,
  `id_session` int UNSIGNED NOT NULL,
  `pricecategory` int UNSIGNED NOT NULL COMMENT 'ценовая категория',
  `price` int UNSIGNED NOT NULL COMMENT 'цена'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='цена';

-- --------------------------------------------------------

--
-- Структура таблицы `session`
--

CREATE TABLE `session` (
  `id` int UNSIGNED NOT NULL,
  `id_hall` int UNSIGNED NOT NULL,
  `id_movie` int UNSIGNED NOT NULL,
  `date` datetime NOT NULL COMMENT 'дата и время начала'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Сеанс';

-- --------------------------------------------------------

--
-- Структура таблицы `ticket`
--

CREATE TABLE `ticket` (
  `id` int UNSIGNED NOT NULL,
  `id_session` int UNSIGNED NOT NULL,
  `id_place` int UNSIGNED NOT NULL,
  `fio` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'ФИО'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='билет';

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `hall`
--
ALTER TABLE `hall`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `movie`
--
ALTER TABLE `movie`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `place`
--
ALTER TABLE `place`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_hall` (`id_hall`);

--
-- Индексы таблицы `price`
--
ALTER TABLE `price`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_session` (`id_session`);

--
-- Индексы таблицы `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_hall` (`id_hall`),
  ADD KEY `id_movie` (`id_movie`);

--
-- Индексы таблицы `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_place` (`id_place`),
  ADD KEY `id_session` (`id_session`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `hall`
--
ALTER TABLE `hall`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `movie`
--
ALTER TABLE `movie`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `place`
--
ALTER TABLE `place`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `price`
--
ALTER TABLE `price`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `session`
--
ALTER TABLE `session`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `ticket`
--
ALTER TABLE `ticket`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `place`
--
ALTER TABLE `place`
  ADD CONSTRAINT `place_ibfk_1` FOREIGN KEY (`id_hall`) REFERENCES `hall` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `price`
--
ALTER TABLE `price`
  ADD CONSTRAINT `price_ibfk_1` FOREIGN KEY (`id_session`) REFERENCES `session` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `session`
--
ALTER TABLE `session`
  ADD CONSTRAINT `session_ibfk_1` FOREIGN KEY (`id_hall`) REFERENCES `hall` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `session_ibfk_2` FOREIGN KEY (`id_movie`) REFERENCES `movie` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`id_place`) REFERENCES `place` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`id_session`) REFERENCES `session` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
