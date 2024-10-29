-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 22, 2024 at 05:00 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `smart`
--

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(50) NOT NULL,
  `product_name` varchar(50) NOT NULL,
  `product_desc` varchar(200) NOT NULL,
  `product_cost` int(50) NOT NULL,
  `product_category` varchar(50) NOT NULL,
  `product_image_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `product_desc`, `product_cost`, `product_category`, `product_image_name`) VALUES
(1, 'Ceramic Mug', 'A durable ceramic mug with a matte finish.', 11, 'cups', 'tea1.jpg'),
(2, 'Glass Tumbler', 'Elegant glass tumbler for hot and cold beverages.', 15, 'cups', 'tea2.jpg'),
(3, 'Stainless Steel Travel Mug', 'Double-walled travel mug with spill-proof lid.', 20, 'cups', 'tea3.jpg'),
(4, 'Eco-Friendly Bamboo Cup', 'Reusable bamboo cup for eco-conscious customers.', 9, 'cups', 'tea1.jpg'),
(5, 'Ceramic Dinner Plate', 'A classic white ceramic dinner plate', 11, 'plates', 'plate1.jpg'),
(6, 'Glass Salad Plate', 'Clear glass plate for salads', 9, 'plates', 'plate2.jpg'),
(7, 'Porcelain Dessert Plate', 'Elegant porcelain plate for desserts', 13, 'plates', 'plate3.jpg'),
(8, 'Stoneware Dinner Plate', 'Rustic stoneware dinner plate', 16, 'plates', 'plate4.jpg'),
(9, 'Melamine Picnic Plate', 'Durable melamine plate for outdoor use', 7, 'plates', 'plate5.jpg'),
(10, 'Stainless Steel Hotpot', 'Durable stainless steel hotpot for retaining heat', 30, 'hotpots', 'pot1.jpg'),
(11, 'Electric Hotpot', 'Convenient electric hotpot with adjustable temperature control', 46, 'hotpots', 'pot2.jpg'),
(12, 'Ceramic Hotpot', 'Traditional ceramic hotpot for slow cooking', 40, 'hotpots', 'pot3.jpg'),
(13, 'Copper Hotpot', 'Premium copper hotpot with excellent heat distribution', 60, 'hotpots', 'pot4.jpg'),
(14, 'Induction Hotpot', 'Induction-compatible hotpot for modern cooking', 50, 'hotpots', 'pot2.jpg'),
(15, 'Wine Glass', 'Elegant wine glass with a long stem', 13, 'glasses', 'glass1.jpg'),
(16, 'Champagne Flute', 'Slim champagne flute for celebrations', 16, 'glasses', 'glass2.jpg'),
(17, 'Whiskey Tumbler', 'Heavy-bottomed glass tumbler for whiskey', 10, 'glasses', 'glass3.jpg'),
(18, 'Highball Glass', 'Tall glass perfect for cocktails and mixed drinks', 8, 'glasses', 'glass4.jpg'),
(19, 'Juice Glass', 'Short, wide glass ideal for juice or soft drinks', 6, 'glasses', 'glass3.jpg'),
(20, 'Luxe Velvet Curtains', ' These premium velvet curtains offer a soft, rich texture that adds elegance to any room. They are thermal-insulated, helping to regulate temperature and reduce energy costs.', 4000, 'curtains', 'curtain1.jpg'),
(21, 'Sheer Linen Curtains', 'Light and airy, these linen curtains allow natural light to filter through while providing a delicate touch of privacy. Ideal for living rooms or sunrooms.', 5000, 'curtains', 'curtain2.jpg'),
(22, 'Geometric Patterned Curtains', 'Contemporary curtains with a bold geometric design, perfect for modern interiors. These curtains come with a noise-reducing and room-darkening fabric.', 6000, 'curtains', 'curtain3.jpg'),
(23, 'Thermal Blackout Curtains', 'These thick, thermal-insulated blackout curtains are designed to block out 99% of sunlight and UV rays, making them ideal for bedrooms or media rooms.', 7000, 'curtains', 'curtain4.jpg'),
(24, 'Embroidered Lace Curtains', 'delicate lace curtains featuring intricate embroidery, perfect for creating a romantic and classic look in bedrooms or dining rooms.', 7000, 'curtains', 'curtain5.jpg'),
(25, ' Persian Heritage Carpet', 'A luxurious, hand-knotted Persian carpet made from the finest wool and silk. Features intricate designs that have been passed down through generations, adding elegance to any room.', 3000, 'carpets', 'carpet1.jpg'),
(26, 'Traditional Carpets', 'A contemporary area rug with bold geometric patterns and vibrant colors, perfect for modern living spaces. Made from durable synthetic fibers, it’s easy to clean and maintain.', 4000, 'carpets', 'carpet2.jpg'),
(27, 'Moroccan Berber Shag Rug', ' A soft, plush shag rug inspired by traditional Moroccan designs. Made with thick, high-pile wool for ultimate comfort and warmth, this rug brings bohemian style to your home.', 5000, 'carpets', 'carpet3.jpg'),
(28, ' Eco-Friendly Jute Area Rug', 'Crafted from 100% natural jute, this eco-friendly area rug adds rustic charm to your space. It is durable, biodegradable, and perfect for high-traffic areas.', 6000, 'carpets', 'carpet4.jpg'),
(29, ' Vintage Oriental Runner', 'A classic runner rug with a distressed vintage look, featuring floral and medallion motifs. Made from a blend of wool and synthetic fibers, it\'s ideal for hallways or narrow spaces.', 5000, 'carpets', 'carpet5.jpg'),
(30, 'Welcome Home Coir Doormat', ' A natural coir doormat featuring a stylish \"Welcome\" design, perfect for adding a warm touch to your entryway. Made from eco-friendly materials.', 2000, 'doormats', 'door1.jpg'),
(31, 'Funny Quote Indoor', ' A durable, weather-resistant doormat with a humorous quote that’s sure to make guests smile. Ideal for both indoor and outdoor use.', 3000, 'doormats', 'door2.jpg'),
(32, 'Personalized Family Name Doormat', 'Customizable doormat featuring your family name. Made from high-quality, heavy-duty material to withstand all weather conditions.', 4000, 'doormats', 'door3.jpg'),
(33, ' Seasonal Leaves Print Doormat', 'A charming doormat adorned with a seasonal leaf design, perfect for welcoming guests throughout the autumn season.', 5000, 'doormats', 'door4.jpg'),
(34, 'Wildflower Reversible Vest', 'A versatile reversible vest showcasing wildflower designs on one side and a solid color on the other. Great for mixing and matching outfits.', 2000, 'flowervest', 'flower1.jpg'),
(35, ' Petal Puffer Vest', 'A chic puffer vest with a delicate petal print. Perfect for adding warmth without sacrificing style, ideal for outdoor adventures.', 3000, 'flowervest', 'flower2.jpg'),
(36, ' Floral Patchwork Utility Vest', 'A trendy utility vest featuring a unique patchwork of floral designs. Equipped with multiple pockets for practicality and style.', 4000, 'flowervest', 'flower3.jpg'),
(37, 'Gardenia Quilted Vest', ' A cozy, quilted vest adorned with gardenia prints. Ideal for layering during the cooler months, it includes pockets and a stylish zip closure.', 4000, 'flowervest', 'flower4.jpg'),
(38, ' Vintage Style Oval Frame', ' An ornate oval frame with an antique finish, perfect for adding a touch of elegance to your decor. Great for portraits or special moments captured in time.', 400, 'frames', 'wall5.jpg'),
(39, ' Multi-Opening Collage Frame', 'A versatile collage frame that can hold multiple photos, allowing you to create a personalized gallery wall. Comes in various configurations and colors.', 500, 'frames', 'wall4.jpg'),
(40, ' Modern Minimalist Frame', 'A sleek and simple frame designed for modern aesthetics, featuring a clear glass front and an aluminum backing. Ideal for displaying photos or art in any contemporary setting.', 600, 'frames', 'wall3.jpg'),
(41, 'Rustic Barnwood Frame', ' A charming frame made from reclaimed barn wood, perfect for adding a rustic touch to your home decor. Each frame has a unique finish and texture.', 600, 'frames', 'wall2.jpg'),
(42, 'Elegant Art Frame', ' A sophisticated frame designed to showcase your favorite artwork or photos, made from high-quality wood with a smooth finish. Available in multiple sizes.', 600, 'frames', 'wall1.jpg'),
(43, 'Serene Meadow Vest', 'Made from eco-friendly materials, this vest features a serene meadow design that’s perfect for nature lovers and eco-conscious shoppers.', 3000, 'flowervest', 'flower5.jpg'),
(44, 'glass tea cup', 'This is a world class glass cup made within our country', 450, 'cups', 'tea4.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `username` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role` varchar(50) DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `gender`, `phone`, `password`, `role`) VALUES
(2, 'susan', 'ngesasuzan@gmail.com', 'female', '0712461219', '12345', 'admin'),
(3, 'paul', 'ngesapaul@gmail.com', 'male', '0726472751', '112233', 'user'),
(4, 'susan', 'ngesasuzan@gmail.com', 'female', '0712461219', '112233', 'user'),
(5, 'quinter', 'quinter@gmail.com', 'female', '0742183979', '123', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
