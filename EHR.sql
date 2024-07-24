-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th7 24, 2024 lúc 09:09 PM
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
-- Cơ sở dữ liệu: `demo1`
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
  `id_k` int(11) NOT NULL,
  `cccd` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `bacsi`
--

INSERT INTO `bacsi` (`id`, `ten`, `id_cn`, `diachi`, `email`, `sdt`, `id_k`, `cccd`) VALUES
(11, 'Le Thi K', 1, '123 Le Loi, District 1, HCMC', 'lethik@example.com', '0915123451', 1, '012345678911'),
(12, 'Nguyen Van L', 2, '456 Hai Ba Trung, District 3, HCMC', 'nguyenvanl@example.com', '0916123452', 2, '012345678912'),
(13, 'Pham Thi M', 3, '789 Nguyen Trai, District 5, HCMC', 'phamthim@example.com', '0917123453', 3, '012345678913'),
(14, 'Tran Van N', 4, '101 Vo Van Tan, District 1, HCMC', 'tranvann@example.com', '0918123454', 4, '012345678914'),
(15, 'Hoang Thi O', 5, '202 Le Thanh Ton, District 1, HCMC', 'hoangthio@example.com', '0919123455', 5, '012345678915'),
(16, 'Do Van P', 6, '303 Dong Khoi, District 1, HCMC', 'dovanp@example.com', '0920123456', 6, '012345678916'),
(17, 'Vo Thi Q', 7, '404 Pasteur, District 3, HCMC', 'vothiq@example.com', '0921123457', 7, '012345678917'),
(18, 'Nguyen Thi R', 8, '505 Nguyen Dinh Chieu, District 3, HCMC', 'nguyenthir@example.com', '0922123458', 8, '012345678918'),
(19, 'Bui Van S', 9, '606 Pham Ngu Lao, District 1, HCMC', 'buivans@example.com', '0923123459', 9, '012345678919'),
(20, 'Duong Thi T', 10, '707 Le Van Sy, District 3, HCMC', 'duongthit@example.com', '0924123460', 10, '012345678920');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `benhan`
--

CREATE TABLE `benhan` (
  `id` int(11) NOT NULL,
  `id_bs` int(11) NOT NULL,
  `id_bn` int(11) NOT NULL,
  `ngay` datetime DEFAULT NULL,
  `chuandoan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `benhan`
--

INSERT INTO `benhan` (`id`, `id_bs`, `id_bn`, `ngay`, `chuandoan`) VALUES
(4, 11, 2, '2024-07-25 10:00:00', 'Cảm cúm'),
(5, 11, 2, '2024-07-25 10:00:00', 'Sốt'),
(7, 11, 1, '2024-07-25 10:00:00', 'Cảm cúm'),
(8, 12, 2, '2024-07-26 11:00:00', 'Viêm họng'),
(9, 14, 4, '2024-07-28 15:00:00', 'Dị ứng'),
(10, 13, 3, '2024-07-27 14:00:00', 'Đau dạ dày'),
(11, 15, 5, '2024-07-29 16:00:00', 'Gãy xương'),
(12, 16, 6, '2024-07-30 09:00:00', 'Đau đầu'),
(13, 17, 7, '2024-07-31 12:00:00', 'Ho'),
(14, 18, 8, '2024-08-01 13:00:00', 'Mệt mỏi'),
(15, 19, 9, '2024-08-02 17:00:00', 'Viêm khớp'),
(16, 20, 10, '2024-08-03 18:00:00', 'Cảm lạnh'),
(17, 11, 1, '2024-07-25 10:00:00', 'Viêm họng cấp');

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
(1, 'Diệp Thiếu Kiệt', NULL, '079304011052', '0878623892', NULL, 0, 'A', NULL),
(2, 'Nguyen Van A', 1, '012345678901', '0905123456', 'nguyenvana@example.com', 123456789, 'O+', '1990-01-01'),
(3, 'Tran Thi B', 0, '012345678902', '0906123457', 'tranthib@example.com', 223456789, 'A+', '1992-02-02'),
(4, 'Le Van C', 1, '012345678903', '0907123458', 'levanc@example.com', 323456789, 'B+', '1994-03-03'),
(5, 'Pham Thi D', 0, '012345678904', '0908123459', 'phamthid@example.com', 423456789, 'AB+', '1996-04-04'),
(6, 'Hoang Van E', 1, '012345678905', '0909123460', 'hoangvane@example.com', 523456789, 'O-', '1988-05-05'),
(7, 'Do Thi F', 0, '012345678906', '0910123461', 'dothif@example.com', 623456789, 'A-', '1989-06-06'),
(8, 'Vo Van G', 1, '012345678907', '0911123462', 'vovang@example.com', 723456789, 'B-', '1991-07-07'),
(9, 'Ngo Thi H', 0, '012345678908', '0912123463', 'ngothih@example.com', 823456789, 'AB-', '1993-08-08'),
(10, 'Bui Van I', 1, '012345678909', '0913123464', 'buivani@example.com', 923456789, 'O+', '1995-09-09'),
(11, 'Duong Thi J', 0, '012345678910', '0914123465', 'duongthij@example.com', 1023456789, 'A+', '1997-10-10');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `benhvien`
--

CREATE TABLE `benhvien` (
  `id` int(11) NOT NULL,
  `ten` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `benhvien`
--

INSERT INTO `benhvien` (`id`, `ten`) VALUES
(1, 'Bệnh viện Chợ Rẫy'),
(2, 'Bệnh viện 115'),
(3, 'Bệnh viện Nhi Đồng 1'),
(4, 'Bệnh viện Từ Dũ'),
(5, 'Bệnh viện Tai Mũi Họng');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chinhanh`
--

CREATE TABLE `chinhanh` (
  `id` int(11) NOT NULL,
  `diachi` varchar(500) DEFAULT NULL,
  `id_bv` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `chinhanh`
--

INSERT INTO `chinhanh` (`id`, `diachi`, `id_bv`) VALUES
(1, '1 Le Loi, District 1, HCMC', 1),
(2, '2 Hai Ba Trung, District 3, HCMC', 1),
(3, '3 Nguyen Trai, District 5, HCMC', 2),
(4, '4 Vo Van Tan, District 1, HCMC', 2),
(5, '5 Le Thanh Ton, District 1, HCMC', 3),
(6, '6 Dong Khoi, District 1, HCMC', 3),
(7, '7 Pasteur, District 3, HCMC', 4),
(8, '8 Nguyen Dinh Chieu, District 3, HCMC', 4),
(9, '9 Pham Ngu Lao, District 1, HCMC', 5),
(10, '10 Le Van Sy, District 3, HCMC', 5);

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
(1, 17, 'Paracetamol', 'Viên', 20, 'Uống 1 viên mỗi 6 giờ'),
(2, 17, 'Ibuprofen', 'Viên', 15, 'Uống 1 viên mỗi 8 giờ'),
(3, 17, 'Amoxicillin', 'Viên', 10, 'Uống 1 viên mỗi 12 giờ'),
(4, 17, 'Vitamin C', 'Viên', 30, 'Uống 1 viên mỗi ngày');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khoa`
--

CREATE TABLE `khoa` (
  `id` int(11) NOT NULL,
  `ten` varchar(255) NOT NULL,
  `mota` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `khoa`
--

INSERT INTO `khoa` (`id`, `ten`, `mota`) VALUES
(1, 'Khoa Nội', 'Chuyên về các bệnh nội khoa'),
(2, 'Khoa Ngoại', 'Chuyên về các bệnh ngoại khoa'),
(3, 'Khoa Nhi', 'Chuyên về các bệnh nhi khoa'),
(4, 'Khoa Sản', 'Chuyên về các bệnh sản khoa'),
(5, 'Khoa Tai Mũi Họng', 'Chuyên về các bệnh tai mũi họng'),
(6, 'Khoa Mắt', 'Chuyên về các bệnh về mắt'),
(7, 'Khoa Tim mạch', 'Chuyên về các bệnh tim mạch'),
(8, 'Khoa Da liễu', 'Chuyên về các bệnh da liễu'),
(9, 'Khoa Thần kinh', 'Chuyên về các bệnh thần kinh'),
(10, 'Khoa Tiêu hóa', 'Chuyên về các bệnh tiêu hóa');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `kqxn`
--

CREATE TABLE `kqxn` (
  `id` int(11) NOT NULL,
  `id_ba` int(11) NOT NULL,
  `ten` varchar(255) NOT NULL,
  `mota` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `kqxn`
--

INSERT INTO `kqxn` (`id`, `id_ba`, `ten`, `mota`) VALUES
(1, 4, 'Xét nghiệm máu', 'Kết quả bình thường'),
(2, 7, 'Xét nghiệm máu', 'Kết quả bình thường'),
(3, 8, 'Xét nghiệm họng', 'Tăng bạch cầu'),
(4, 9, 'Xét nghiệm dị ứng', 'Phản ứng dương tính với phấn hoa'),
(5, 10, 'Xét nghiệm dạ dày', 'Đau dạ dày'),
(6, 11, 'Xét nghiệm xương', 'Gãy xương tay'),
(7, 12, 'Xét nghiệm máu', 'Bình thường'),
(8, 13, 'Xét nghiệm phổi', 'Khô'),
(9, 14, 'Xét nghiệm máu', 'Thiếu máu'),
(10, 15, 'Xét nghiệm khớp', 'Viêm khớp'),
(11, 16, 'Xét nghiệm máu', 'Có dấu hiệu cảm lạnh'),
(12, 17, 'Xét nghiệm máu', 'Kết quả bình thường');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `login`
--

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `cccd` varchar(12) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `role` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `login`
--

INSERT INTO `login` (`id`, `cccd`, `pass`, `role`) VALUES
(1, '079304011052', 'ttgn822004', 1),
(2, '012345678901', 'password1', 1),
(3, '012345678902', 'password2', 1),
(4, '012345678903', 'password3', 1),
(5, '012345678904', 'password4', 1),
(6, '012345678905', 'password5', 1),
(7, '012345678906', 'password6', 1),
(8, '012345678907', 'password7', 1),
(9, '012345678908', 'password8', 1),
(10, '012345678909', 'password9', 1),
(11, '012345678910', 'password10', 1),
(12, '012345678911', 'password11', 1),
(13, '012345678912', 'password12', 1),
(14, '012345678913', 'password13', 1),
(15, '012345678914', 'password14', 1),
(16, '012345678915', 'password15', 1),
(17, '012345678916', 'password16', 1),
(18, '012345678917', 'password17', 1),
(19, '012345678918', 'password18', 1),
(20, '012345678919', 'password19', 1),
(21, '012345678920', 'password20', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `xquang`
--

CREATE TABLE `xquang` (
  `id` int(11) NOT NULL,
  `id_ba` int(11) NOT NULL,
  `ten` varchar(255) NOT NULL,
  `mota` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `xquang`
--

INSERT INTO `xquang` (`id`, `id_ba`, `ten`, `mota`) VALUES
(1, 4, 'X-quang ngực', 'Có dấu hiệu viêm phổi'),
(2, 7, 'X-quang ngực', 'Có dấu hiệu viêm phổi'),
(3, 10, 'X-quang bụng', 'Không phát hiện bất thường'),
(4, 11, 'X-quang tay', 'Xương gãy'),
(5, 12, 'X-quang đầu', 'Không có dấu hiệu bất thường'),
(6, 13, 'X-quang ngực', 'Có dấu hiệu viêm phổi'),
(7, 15, 'X-quang khớp', 'Phát hiện viêm'),
(8, 17, 'Chụp X-quang ngực', 'Có dấu hiệu viêm phổi');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `bacsi`
--
ALTER TABLE `bacsi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cn` (`id_cn`),
  ADD KEY `id_k` (`id_k`);

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
-- Chỉ mục cho bảng `khoa`
--
ALTER TABLE `khoa`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `kqxn`
--
ALTER TABLE `kqxn`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kqxn_ibfk_1` (`id_ba`);

--
-- Chỉ mục cho bảng `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cccd` (`cccd`);

--
-- Chỉ mục cho bảng `xquang`
--
ALTER TABLE `xquang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `xquang_ibfk_1` (`id_ba`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `bacsi`
--
ALTER TABLE `bacsi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `benhan`
--
ALTER TABLE `benhan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT cho bảng `benhnhan`
--
ALTER TABLE `benhnhan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `benhvien`
--
ALTER TABLE `benhvien`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `chinhanh`
--
ALTER TABLE `chinhanh`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `donthuoc`
--
ALTER TABLE `donthuoc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `khoa`
--
ALTER TABLE `khoa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `kqxn`
--
ALTER TABLE `kqxn`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT cho bảng `xquang`
--
ALTER TABLE `xquang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `bacsi`
--
ALTER TABLE `bacsi`
  ADD CONSTRAINT `bacsi_ibfk_1` FOREIGN KEY (`id_cn`) REFERENCES `chinhanh` (`id`),
  ADD CONSTRAINT `bacsi_ibfk_2` FOREIGN KEY (`id_k`) REFERENCES `khoa` (`id`);

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

--
-- Các ràng buộc cho bảng `kqxn`
--
ALTER TABLE `kqxn`
  ADD CONSTRAINT `kqxn_ibfk_1` FOREIGN KEY (`id_ba`) REFERENCES `benhan` (`id`);

--
-- Các ràng buộc cho bảng `xquang`
--
ALTER TABLE `xquang`
  ADD CONSTRAINT `xquang_ibfk_1` FOREIGN KEY (`id_ba`) REFERENCES `benhan` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
