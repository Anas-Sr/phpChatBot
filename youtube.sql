-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 23 يوليو 2024 الساعة 03:31
-- إصدار الخادم: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `youtube`
--

-- --------------------------------------------------------

--
-- بنية الجدول `chatbot_hints`
--

CREATE TABLE `chatbot_hints` (
  `id` int(11) NOT NULL,
  `question` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `reply` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- إرجاع أو استيراد بيانات الجدول `chatbot_hints`
--

INSERT INTO `chatbot_hints` (`id`, `question`, `reply`) VALUES
(20, 'مرحبا', 'مرحبا بك, كيف أستطيع مساعدتك؟'),
(21, 'هل يمكن أن تعرف عن نفسك؟', 'بكل تأكيد , اسمي هو روبي وأنا المساعد الشخصي الذي يحاول الإجابة على أسئلتك المنطقية..'),
(22, 'كيف تمت برمجتك؟', 'تمت برمجتي بواسطة صديقي العزيز أنس والذي تعب واجتهد على نفسه حتى يصل لهذه المرحلة .. لماذا تسأل؟'),
(23, 'همممم , أتشوق حقا لمعرفة هذا الشخص', 'أجل , كل ما يمكنني قوله أنه لا يستسلم ولديه قلب نقي وأصدقاء أوفياء .. لكن ..'),
(24, 'لكن ماذا؟', 'عندما يتعلق الأمر بالمأكولات فهو يتحول لوحش مخيف هههههه'),
(25, 'ما هي هوايته المفضلة؟', 'متابعة الأنمي و ألعاب الورق والشطرنج وغسل الصحون هههههه'),
(26, 'من هم أصدقاؤه المقربين؟', 'صديقي أنس لا يمتلك العديد من الأصدقاء لكن أصدقاؤه في الجامعة والحي الذي يقطن فيه يؤنسون وحشته'),
(27, 'أخبرني بنكتة', 'لماذا يعيش السمك في الماء؟'),
(28, 'لماذا؟', 'لأنه لا يمكن أن يعيش على اليابسة ههههههه'),
(29, 'لن أطلب منك نكتة مرة أخرى', 'قلت لك في البداية .. أحاول الإجابة على جميع أسئلتك (المنطقية)'),
(30, 'أشكرك على هذه المحادثة الجميلة', 'سعدت بمحادثتك.. تعال و دردش معي متى أردت'),
(31, 'وداعا إذا', 'تمهل قليلا .. اشكر الجميع وبالأخص كل من قرأ دردشتنا و قل لهم أن روبي يحبكم جميعا..'),
(32, 'حسنا اتفقنا', 'لنلتقي في وقت لاحق .. وداعا صديقي');

-- --------------------------------------------------------

--
-- بنية الجدول `message`
--

CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `message` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `added_on` datetime NOT NULL,
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- إرجاع أو استيراد بيانات الجدول `message`
--

INSERT INTO `message` (`id`, `message`, `added_on`, `type`) VALUES
(403, 'مرحبا', '2024-07-22 02:27:48', 'user'),
(404, 'مرحبا بك, كيف أستطيع مساعدتك؟', '2024-07-22 02:27:48', 'bot'),
(405, 'هل يمكن أن تعرف ', '2024-07-22 02:27:51', 'user'),
(406, 'بكل تأكيد , اسمي هو روبي وأنا المساعد الشخصي الذي يحاول الإجابة على أسئلتك المنطقية..', '2024-07-22 02:27:51', 'bot'),
(407, 'كيفك', '2024-07-22 02:28:07', 'user'),
(408, 'آسف,لا أفهم ما تقول?', '2024-07-22 02:28:07', 'bot'),
(409, 'تضرب بهالماركة', '2024-07-22 02:28:17', 'user'),
(410, 'آسف,لا أفهم ما تقول?', '2024-07-22 02:28:17', 'bot');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chatbot_hints`
--
ALTER TABLE `chatbot_hints`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chatbot_hints`
--
ALTER TABLE `chatbot_hints`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=411;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
