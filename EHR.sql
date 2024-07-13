-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th7 11, 2024 lúc 08:24 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `demo`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bacsi`
--

CREATE TABLE `bacsi` (
  `id` int(11) NOT NULL,
  `ten` varchar(255) NOT NULL,
  `id_cn` int(11) NOT NULL,
  `diachi` varchar(500) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `sdt` varchar(10) NOT NULL,
  `cccd` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `bacsi`
--

INSERT INTO `bacsi` (`id`, `ten`, `id_cn`, `diachi`, `email`, `sdt`, `cccd`) VALUES
(1, 'Nguyễn Văn A', 1, 'Số 1, Phố Chùa Bộc, Đống Đa, Hà Nội', 'nguyenvana@hospital.com', '0987654321', '123456789012'),
(2, 'Trần Thị B', 1, 'Số 1, Phố Chùa Bộc, Đống Đa, Hà Nội', 'tranthib@hospital.com', '0987654322', '123456789013'),
(3, 'Lê Văn C', 1, 'Số 1, Phố Chùa Bộc, Đống Đa, Hà Nội', 'levanc@hospital.com', '0987654323', '123456789014'),
(4, 'Phạm Thị D', 2, '78 Đường Giải Phóng, Phương Mai, Đống Đa, Hà Nội', 'phamthid@hospital.com', '0987654324', '123456789015'),
(5, 'Hoàng Văn E', 2, '78 Đường Giải Phóng, Phương Mai, Đống Đa, Hà Nội', 'hoangvane@hospital.com', '0987654325', '123456789016'),
(6, 'Mai Thị F', 2, '78 Đường Giải Phóng, Phương Mai, Đống Đa, Hà Nội', 'maithif@hospital.com', '0987654326', '123456789017'),
(7, 'Vũ Văn G', 3, '40 Tràng Thi, Hoàn Kiếm, Hà Nội', 'vuvang@hospital.com', '0987654327', '123456789018'),
(8, 'Ngọc Hạnh', 3, '40 Tràng Thi, Hoàn Kiếm, Hà Nội', 'ngochanh@hospital.com', '0987654328', '123456789019'),
(9, 'Đặng Xuân H', 3, '40 Tràng Thi, Hoàn Kiếm, Hà Nội', 'dangxuanh@hospital.com', '0987654329', '123456789020'),
(10, 'Phan Thanh I', 4, '16 Lê Lợi, TP. Huế, Thừa Thiên Huế', 'phanthani@hospital.com', '0987654330', '123456789021'),
(11, 'Nguyễn Thị K', 4, '16 Lê Lợi, TP. Huế, Thừa Thiên Huế', 'nguyenthik@hospital.com', '0987654331', '123456789022'),
(12, 'Trần Văn L', 4, '16 Lê Lợi, TP. Huế, Thừa Thiên Huế', 'tranvanl@hospital.com', '0987654332', '123456789023'),
(13, 'Lê Thị M', 5, 'Số 1 Đại lộ Lê Nin, Thành phố Bắc Ninh, Bắc Ninh', 'lethim@hospital.com', '0987654333', '123456789024'),
(14, 'Hoàng Văn N', 5, 'Số 1 Đại lộ Lê Nin, Thành phố Bắc Ninh, Bắc Ninh', 'hoangvann@hospital.com', '0987654334', '123456789025'),
(15, 'Nguyễn Văn P', 5, 'Số 1 Đại lộ Lê Nin, Thành phố Bắc Ninh, Bắc Ninh', 'nguyenvanp@hospital.com', '0987654335', '123456789026');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `benhan`
--

CREATE TABLE `benhan` (
  `id` int(11) NOT NULL,
  `id_bs` int(11) NOT NULL,
  `id_bn` int(11) NOT NULL,
  `ngay` datetime DEFAULT NULL,
  `kqxn` text DEFAULT NULL,
  `chuandoan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `benhan`
--

INSERT INTO `benhan` (`id`, `id_bs`, `id_bn`, `ngay`, `kqxn`, `chuandoan`) VALUES
(1, 1, 1, '2024-07-11 10:00:00', 'Xét nghiệm thường', 'Cảm cúm đơn giản'),
(2, 2, 1, '2024-07-12 11:00:00', 'Đo huyết áp', 'Huyết áp cao'),
(3, 3, 1, '2024-07-13 12:00:00', 'Siêu âm bụng', 'Đau bụng dạ dày'),
(4, 2, 2, '2024-07-11 10:30:00', 'Đo đường huyết', 'Đái tháo đường'),
(5, 3, 3, '2024-07-12 11:30:00', 'Siêu âm tim', 'Bệnh tim mạch'),
(6, 1, 4, '2024-07-13 12:30:00', 'Xét nghiệm máu', 'Bệnh lý gan'),
(7, 2, 5, '2024-07-14 13:00:00', 'Xét nghiệm tiểu đường', 'Tiểu đường'),
(8, 3, 6, '2024-07-15 14:00:00', 'Siêu âm bụng', 'Bệnh đường tiêu hóa'),
(9, 1, 7, '2024-07-16 15:00:00', 'Xét nghiệm nội tiết', 'Rối loạn nội tiết'),
(10, 2, 8, '2024-07-17 16:00:00', 'Đo huyết áp', 'Huyết áp cao'),
(11, 3, 9, '2024-07-18 17:00:00', 'Xét nghiệm sàng lọc ung thư', 'Ung thư cổ tử cung'),
(12, 1, 10, '2024-07-19 18:00:00', 'Siêu âm thai', 'Sức khỏe thai nhi');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `benhnhan`
--

CREATE TABLE `benhnhan` (
  `id` int(11) NOT NULL,
  `ten` varchar(255) NOT NULL,
  `gt` tinyint(1) DEFAULT NULL,
  `cccd` varchar(12) NOT NULL,
  `sdt` varchar(10) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `sobh` int(11) NOT NULL,
  `nmau` varchar(5) DEFAULT NULL,
  `ngaysinh` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `benhnhan`
--

INSERT INTO `benhnhan` (`id`, `ten`, `gt`, `cccd`, `sdt`, `email`, `sobh`, `nmau`, `ngaysinh`) VALUES
(1, 'Nguyễn Văn An', 1, '123456789011', '0987654321', 'nguyenvanan@example.com', 1001, 'A', '1990-05-15'),
(2, 'Trần Thị Bình', 0, '123456789012', '0987654322', 'tranthibinh@example.com', 1002, 'B', '1985-10-20'),
(3, 'Lê Văn Cường', 1, '123456789013', '0987654323', 'levancuong@example.com', 1003, 'AB', '1992-12-25'),
(4, 'Phạm Thị Dung', 0, '123456789014', '0987654324', 'phamthidung@example.com', 1004, 'O', '1988-03-30'),
(5, 'Hoàng Văn Đức', 1, '123456789015', '0987654325', 'hoangvanduc@example.com', 1005, 'A', '1995-08-05'),
(6, 'Mai Thị Lan', 0, '123456789016', '0987654326', 'maithilan@example.com', 1006, 'B', '1987-07-10'),
(7, 'Nguyễn Thanh Hải', 1, '123456789017', '0987654327', 'nguyenthanhhai@example.com', 1007, 'AB', '1991-09-18'),
(8, 'Trần Minh Hoa', 0, '123456789018', '0987654328', 'tranminhhoa@example.com', 1008, 'O', '1993-04-22'),
(9, 'Lê Thị Kim Anh', 0, '123456789019', '0987654329', 'lethikimanh@example.com', 1009, 'A', '1989-06-08'),
(10, 'Vũ Văn Bảo', 1, '123456789020', '0987654330', 'vuvanbao@example.com', 1010, 'B', '1994-01-12');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `benhvien`
--

CREATE TABLE `benhvien` (
  `id` int(11) NOT NULL,
  `ten` varchar(255) NOT NULL,
  `token` NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `benhvien`
--

INSERT INTO `benhvien` (`id`, `ten`) VALUES
(1, 'Bệnh viện Đại học Y Hà Nội'),
(2, 'Bệnh viện Bạch Mai'),
(3, 'Bệnh viện Việt Đức'),
(4, 'Bệnh viện Trung ương Huế'),
(5, 'Bệnh viện Đa khoa tỉnh Bắc Ninh');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chinhanh`
--

CREATE TABLE `chinhanh` (
  `id` int(11) NOT NULL,
  `diachi` varchar(500) DEFAULT NULL,
  `id_bv` int(11) NOT NULL,
  `token` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `chinhanh`
--

INSERT INTO `chinhanh` (`id`, `diachi`, `id_bv`) VALUES
(1, 'Số 1, Phố Chùa Bộc, Đống Đa, Hà Nội', 1),
(2, '78 Đường Giải Phóng, Phương Mai, Đống Đa, Hà Nội', 2),
(3, '40 Tràng Thi, Hoàn Kiếm, Hà Nội', 3),
(4, '16 Lê Lợi, TP. Huế, Thừa Thiên Huế', 4),
(5, 'Số 1 Đại lộ Lê Nin, Thành phố Bắc Ninh, Bắc Ninh', 5);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `donthuoc`
--

CREATE TABLE `donthuoc` (
  `id` int(11) NOT NULL,
  `id_ba` int(11) NOT NULL,
  `ten` varchar(255) NOT NULL,
  `dvt` varchar(50) DEFAULT NULL,
  `sl` int(11) DEFAULT NULL,
  `hdsd` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `donthuoc`
--

INSERT INTO `donthuoc` (`id`, `id_ba`, `ten`, `dvt`, `sl`, `hdsd`) VALUES
(1, 1, 'Paracetamol', 'viên', 1, 'Ngày uống 3 lần sau bữa ăn'),
(2, 1, 'Vitamin C', 'viên', 1, 'Ngày uống 1 viên vào buổi sáng'),
(3, 1, 'Salbutamol', 'viên', 1, 'Dùng khi cần thiết để giảm triệu chứng hen suyễn'),
(4, 2, 'Metformin', 'viên', 1, 'Ngày uống 2 lần sau bữa ăn'),
(5, 2, 'Gliclazide', 'viên', 1, 'Ngày uống 1 viên vào buổi sáng'),
(6, 2, 'Ramipril', 'viên', 1, 'Ngày uống 1 viên vào buổi tối'),
(7, 3, 'Omeprazole', 'viên', 1, 'Ngày uống 1 viên trước bữa ăn sáng'),
(8, 3, 'Domperidone', 'viên', 1, 'Ngày uống 1 viên trước bữa ăn chiều'),
(9, 3, 'Sucralfate', 'viên', 1, 'Ngày uống 1 viên trước bữa ăn tối');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `login`
--

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `cccd` varchar(12) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `role` tinyint(1) DEFAULT 0,
  `token` text NOT NULL,
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `login`
--

INSERT INTO `login` (`id`, `cccd`, `pass`, `role`) VALUES
(1, '123456789011', 'password1', 0),
(2, '123456789012', 'password2', 0),
(3, '123456789013', 'password3', 0),
(4, '123456789014', 'password4', 0),
(5, '123456789015', 'password5', 0),
(6, '123456789101', 'password6', 1),
(7, '123456789102', 'password7', 1),
(8, '123456789103', 'password8', 1),
(9, '123456789104', 'password9', 1),
(10, '123456789105', 'password10', 1);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `bacsi`
--
ALTER TABLE `bacsi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cn` (`id_cn`);

--
-- Chỉ mục cho bảng `benhan`
--
ALTER TABLE `benhan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_bs` (`id_bs`),
  ADD KEY `id_bn` (`id_bn`);

--
-- Chỉ mục cho bảng `benhnhan`
--
ALTER TABLE `benhnhan`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cccd` (`cccd`);

--
-- Chỉ mục cho bảng `benhvien`
--
ALTER TABLE `benhvien`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `chinhanh`
--
ALTER TABLE `chinhanh`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_bv` (`id_bv`);

--
-- Chỉ mục cho bảng `donthuoc`
--
ALTER TABLE `donthuoc`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_ba` (`id_ba`);

--
-- Chỉ mục cho bảng `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cccd` (`cccd`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `bacsi`
--
ALTER TABLE `bacsi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `benhan`
--
ALTER TABLE `benhan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `benhnhan`
--
ALTER TABLE `benhnhan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `benhvien`
--
ALTER TABLE `benhvien`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `chinhanh`
--
ALTER TABLE `chinhanh`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `donthuoc`
--
ALTER TABLE `donthuoc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `bacsi`
--
ALTER TABLE `bacsi`
  ADD CONSTRAINT `bacsi_ibfk_1` FOREIGN KEY (`id_cn`) REFERENCES `chinhanh` (`id`);

--
-- Các ràng buộc cho bảng `benhan`
--
ALTER TABLE `benhan`
  ADD CONSTRAINT `benhan_ibfk_1` FOREIGN KEY (`id_bs`) REFERENCES `bacsi` (`id`),
  ADD CONSTRAINT `benhan_ibfk_2` FOREIGN KEY (`id_bn`) REFERENCES `benhnhan` (`id`);

--
-- Các ràng buộc cho bảng `chinhanh`
--
ALTER TABLE `chinhanh`
  ADD CONSTRAINT `chinhanh_ibfk_1` FOREIGN KEY (`id_bv`) REFERENCES `benhvien` (`id`);

--
-- Các ràng buộc cho bảng `donthuoc`
--
ALTER TABLE `donthuoc`
  ADD CONSTRAINT `donthuoc_ibfk_1` FOREIGN KEY (`id_ba`) REFERENCES `benhan` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
