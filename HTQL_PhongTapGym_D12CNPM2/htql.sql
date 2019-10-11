﻿--DROP DATABASE HTQL
create database HTQL
go
use HTQL
go
CREATE TABLE THANHVIEN
(   
	MATV NVARCHAR(50) NOT NULL,
    TENTV NVARCHAR(50) NOT NULL,
	NAMSINH	DATE ,
	DIACHI NVARCHAR (50),
	SDT INT ,
	GIOI_TINH NVARCHAR(50) NOT NULL,
	DIEM INT ,
	XEPHANG nvarchar(50),
	CONSTRAINT pk_MATV PRIMARY KEY (MATV)
);
--DROP TABLE THANHVIEN
CREATE TABLE HLV 
(
	MAHLV NVARCHAR(50),
	TENHLV NVARCHAR(50),
	NAMSINH DATE,
	DIACHI NVARCHAR(50),
	SDT INT,
	GIOI_TINH NVARCHAR(50) NOT NULL,
	CONSTRAINT PK_MAHLV PRIMARY KEY (MAHLV)
);
--DROP TABLE HLV
CREATE TABLE THE 
(
	MATHE NVARCHAR(50),
	TENTHE NVARCHAR(50),
	NGAY_KICH_HOAT DATE ,
	NGAY_HET_HAN DATE,
	CONSTRAINT PK_MATHE PRIMARY KEY (MATHE)
);
--DROP TABLE THE
CREATE TABLE QUANLY 
(
	MAHD NVARCHAR(50),
	MATV NVARCHAR (50),
	MAHLV NVARCHAR(50),
	MATHE NVARCHAR(50) ,
	CONSTRAINT PK_QUANLY PRIMARY KEY (MAHD),
	CONSTRAINT FK_QUANLY_MATV FOREIGN KEY (MATV) REFERENCES THANHVIEN(MATV) ON DELETE CASCADE ON UPDATE CASCADE ,
	CONSTRAINT FK_QUANLY_MAHLV FOREIGN KEY (MAHLV) REFERENCES HLV(MAHLV) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT FK_QUANLY_MATHE FOREIGN KEY (MATHE) REFERENCES THE(MATHE) ON DELETE CASCADE ON UPDATE CASCADE
);
--DROP TABLE QUANLY
CREATE TABLE ID 
(
	TK NVARCHAR(50) NOT NULL,
	MK NVARCHAR(50) NOT NULL,
	TEN NVARCHAR(50) ,
	CONSTRAINT PK_TK PRIMARY KEY (TK) 
);
 ---  ID ---
INSERT INTO ID VALUES ('admin','admin',N'Thanh Tùng')
INSERT INTO ID VALUES ('1781310181','1',N'Thu Trang')
INSERT INTO ID VALUES ('abc','abc',N'Ngọc Huyền')
INSERT INTO ID VALUES ('xda','1',N'Doãn Việt')
INSERT INTO ID VALUES ('123','123',N'Thuỳ Miên')
INSERT INTO ID VALUES ('xda2','2',N'Đỗ Đức')
 --- THANHVIEN ---
 INSERT INTO THANHVIEN VALUES ('1',N'Thanh Tùng','11/27/1999',N'Hà Nội','086',N'Nam','1000','S')
 INSERT INTO THANHVIEN VALUES ('2',N'Thu Trang','08/15/2000',N'Hà Nội','087',N'Nữ','600','B')
 INSERT INTO THANHVIEN VALUES ('3',N'Hồng Đức','07/02/1999',N'Thanh Hoá','878',N'Nam','750','B+')
 INSERT INTO THANHVIEN VALUES ('4',N'Doãn Việt','01/13/1999',N'Hà Nội','0879',N'Nam','500','C+')
 INSERT INTO THANHVIEN VALUES ('5',N'Ngọc Huyền','02/16/1999',N'Hà Nội','0870',N'Nữ','100','D-')
 INSERT INTO THANHVIEN VALUES ('6',N'Thuỳ Miên','01/09/1999',N'Thái Bình','0871',N'Nữ','700','B')
 INSERT INTO THANHVIEN VALUES ('7',N'Kim Trang','08/25/1999',N'Thanh Hoá','0872',N'Nữ','1000','S')
 INSERT INTO THANHVIEN VALUES ('8',N'Thuỳ Dung','01/09/1999',N'Thái Bình','0871',N'Nữ','700','B')
 INSERT INTO THANHVIEN VALUES ('9',N'Phương Ngọc','03/09/1999',N'Thanh Hóa','089',N'Nữ','100','B')
 INSERT INTO THANHVIEN VALUES ('10',N'Đức Phú','04/28/1999',N'Hà Nội','0992',N'Nam','400','B')
 INSERT INTO THANHVIEN VALUES ('11',N'Anh Dũng','05/10/1999',N'Thanh Hóa','6754',N'Nữ','650','B')
 INSERT INTO THANHVIEN VALUES ('12',N'Quỳnh Mai','11/11/2000',N'Thái Bình','3535',N'Nữ','500','B')
 ---  HLV    ---- 
 INSERT INTO HLV VALUES ('1',N'Tuấn Dũng','08/15/2000',N'Hà Nội','087',N'Nam')
 INSERT INTO HLV VALUES ('2',N'Quang Huy','08/15/2000',N'Vĩnh Phúc','088',N'Nam')
 INSERT INTO HLV VALUES ('3',N'Thanh Bình','08/15/2000',N'Thanh Hoá','089',N'Nữ')
 INSERT INTO HLV VALUES ('4',N'Minh Anh','08/15/2000',N'Ba Vì','090',N'Nữ')
 INSERT INTO HLV VALUES ('5',N'Thành Long','08/15/2000',N'Hà Nội','091',N'Nam')
 INSERT INTO HLV VALUES ('6',N'Việt Hoàng','08/15/2000',N'Nghệ An','092',N'Nam')
 --- THE ---
 INSERT INTO THE VALUES ('Brozne',N'Đồng','08/18/2019','09/18/2019')
 INSERT INTO THE VALUES ('Silver',N'Bạc','07/5/2019','08/5/2019')
 INSERT INTO THE VALUES ('Gold',N'Vàng','08/3/2019','09/15/2019')
 INSERT INTO THE VALUES ('Platinum',N'Bạch Kim','08/15/2019','10/25/2019')
 INSERT INTO THE VALUES ('Diamond',N'Kim Cương','01/01/2000','12/30/2019')
 ---- QUANLY ----
 INSERT INTO QUANLY VALUES ('1','1','1','Brozne')
 INSERT INTO QUANLY VALUES ('2','2','2','Silver')
 INSERT INTO QUANLY VALUES ('3','3','3','Silver')
 INSERT INTO QUANLY VALUES ('4','4','4','Gold')
 INSERT INTO QUANLY VALUES ('5','5','5','Gold')
 INSERT INTO QUANLY VALUES ('6','6','6','Platinum')
 INSERT INTO QUANLY VALUES ('7','7','6','Diamond')



CREATE VIEW v_QuanLy  AS 
SELECT MAHD,TENTV,TENHLV,TENTHE,NGAY_KICH_HOAT,NGAY_HET_HAN,DIEM,XEPHANG 
	FROM THANHVIEN,QUANLY,HLV,THE 
	WHERE THANHVIEN.MATV = QUANLY.MATV AND HLV.MAHLV = QUANLY.MAHLV AND THE.MATHE = QUANLY.MATHE ;

 SELECT MAHD,TENTV,TENHLV,TENTHE,NGAY_KICH_HOAT,NGAY_HET_HAN,dbo.THANHVIEN.DIEM 
	FROM THANHVIEN,QUANLY,HLV,THE 
	WHERE THANHVIEN.MATV = QUANLY.MATV AND HLV.MAHLV = QUANLY.MAHLV AND THE.MATHE = QUANLY.MATHE ;

CREATE TRIGGER cs_QuanLy on dbo.THANHVIEN
 FOR insert,update
 as
	Begin
		update THANHVIEN set XEPHANG=N'S' where diem>750
		update THANHVIEN set XEPHANG=N'A+' where diem = 750
		update THANHVIEN set XEPHANG=N'A' where diem>500 and diem<750
		update THANHVIEN set XEPHANG=N'B+' where diem = 500
		update THANHVIEN set XEPHANG=N'B' where diem>400 and diem<500
		update THANHVIEN set XEPHANG=N'C+' where diem=400
		update THANHVIEN set XEPHANG=N'C' where diem>300 and diem <400
		update THANHVIEN set XEPHANG=N'D+' where diem=300
		update THANHVIEN set XEPHANG=N'D' where diem>=100 AND diem<300
		update THANHVIEN set XEPHANG=N'F' where diem<100
	END
	DROP TRIGGER cs_QuanLy
