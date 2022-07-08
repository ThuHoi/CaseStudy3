create database casemodul3;
use casemodul3;

create table account(
     id int primary key AUTO_INCREMENT,
     userName varchar(50)not null,
     birthdayUser  Date  not null,
     numberUser int (50) not null unique,
     mailUser varchar(50) not null,
     passwordUser varchar(50) not null,
     addressUser varchar(50) not  null,
     statusUser int default 1
);

create table Phim(
     idPhim int primary key auto_increment,
     tenPhim varchar(255),
     thoiGian varchar(255),
     loaiPhim varchar(255),
     daoDien varchar(255),
     quocGia varchar(255),
     dienVien varchar(255),
     nhaSX varchar(255),
	 ngayKhoiChieu date,
	 moTa longtext,
     trailer varchar(255),
     img varchar(255),
     star double
);


create table ghe(
    idGhe int primary key,
    tenGhe varchar(255)
);

create table ve(
    idVe int primary key AUTO_INCREMENT,
    idPhim int,
    idGhe int,
    idAccount int,
    foreign key  (idPhim) references Phim(idPhim),
    foreign key(idGhe) references ghe(idGhe),
    foreign key(idAccount) references account(id)
);

create table comment(
idcomment int primary key auto_increment,
account varchar(255),
content varchar(255),
tenphim varchar(255),
sao int,
thoigian datetime default current_timestamp,
idphim int
);

create table reply(
idreply int primary key auto_increment,
idcomment int,
conntentreply varchar(255),
thoigianreply datetime default current_timestamp,

foreign key (idcomment) references comment (idcomment)
);


DELIMITER $$
CREATE TRIGGER tgSetstar
 after insert on comment
 for each row
 BEGIN
 SET SQL_SAFE_UPDATES=0;
	update phim 
    set star =  (select cast( avg(sao) as decimal(5,1))  from comment where idphim = new.idphim  group by comment.idphim  ) where idPhim = new.idPhim ;
SET SQL_SAFE_UPDATES=1;
End;
$$


insert into Phim(tenPhim,thoiGian,loaiPhim,daoDien,quocGia,dienVien,nhaSX,ngayKhoiChieu,moTa,trailer,img) values 
('Minions: The rise of Gru','88 phút','Hoạt Hình','Kyle Balda','Mỹ','Steve Carell,Julie Andrews','Illumination Entertainment','2022/07/16','Rất lâu trước khi trở thành một phản diện chuyên nghiệp, Gru chỉ là một cậu bé 12 tuổi sống ở vùng ngoại ô vào những năm 1970, với ước mơ một ngày sẽ làm “bá chủ” thế giới. Và 3 “quả chuối” vàng biết đi từ trên trời rơi xuống đã là những đồng đội đầu tiên của Gru, bên cạnh ủng hộ cậu bé, cùng nhau thiết kế những vũ khí đầu tiên, thực hiện những phi vụ đầu tiên.','https://youtu.be/X3ybO0kXjHE','https://cdn.galaxycine.vn/media/2022/6/14/1200wx1800h_1655176495829.jpg');
insert into Phim(tenPhim,thoiGian,loaiPhim,daoDien,quocGia,dienVien,nhaSX,ngayKhoiChieu,moTa,trailer,img) values 
('Thor: Love and Thunder','118 phút','Hành Động','Taika Waititi','Mỹ','  Chris Hemsworth, Natalie Portman, Tessa Thompson, Chris Pratt, Dave Bautista, Karen Gillan, Russell Crowe, Christian Bale','Marvel Studios','2022/07/18','Sau khi kết thúc Avengers: Endgame, chàng Thần Sấm tạm biệt bạn bè và vùng New Asgard để theo chân đội Vệ binh dải Ngân Hà phiêu lưu khắp vũ trụ.   Bộ đôi siêu anh hùng nổi bật nhất vũ trụ điện ảnh Marvel là Captain America và Iron Man chỉ có 3 phần phim riêng, chàng Thor béo ú lại được ưu ái cho ra mắt đến tận phần 4. Tuy nhiên, nguồn tin “hành lang” cho biết, đối tượng “chiếm sóng” trong phần 4 là cô người yêu cũ Janes Foster chứ chẳng phải Thần Sấm. Marvel tiếp tục giao cho Taika Waititi ngồi tiếp ghế đạo diễn. Phim vẫn có sự góp mặt của các diễn viên quen thuộc Chris Hemsworth, Natalie Portman, Tessa Thompson. “Tắc kè hoa” Christian Bale sẽ góp mặt ở vai trò phản diện. Ngoài ra, dù rằng Loki có vẻ như đã chết ở Avengers: Endgame, khán giả vẫn mong Tom Hiddleston có thể quay lại để thần Lừa một lần nữa sát cánh cùng anh trai.   Dù là kẻ đến sau, đạo diễn kiêm biên kịch Taika Waititi đã nhét đầy nét đặc trưng của mình vào franchise Thần Sấm. Tương tự những gì James Gunn làm được ở Guardians Of The Galaxy. Không Taika, không có Thor như cách vắng James Gun chẳng có Vệ Binh Dải Ngân Hà. Với tất cả thành quả ấy, dĩ nhiên, Marvel tiếp tục giao cho Taika Waititi trọng trách thực hiện Thor: Love And Thunder. Thành công mời Natalie Portman quay trở lại, Taika lôi kéo luôn Christian Bale vốn nổi tiếng chọn phim khó tính. Vốn từ chối quay trở lại dòng phim siêu anh hùng, Bale đổi ý sau khi đọc kịch bản phim mới Tình Yêu Và Sấm Sét','https://youtu.be/PEo2LzBi4_o','https://cdn.galaxycine.vn/media/2022/6/13/300x450_1655112728976.jpg');
insert into Phim(tenPhim,thoiGian,loaiPhim,daoDien,quocGia,dienVien,nhaSX,ngayKhoiChieu,moTa,trailer,img) values 
('The Witch','138 phút','Hành Động','Park Hoon Jung','Hàn Quốc','  Kim Da Mi, Lee Jong Suk, Park Eun Bin','','2022/07/29','Sát thủ mang bí danh ARK-ADP1 - vật mẫu sống sót duy nhất trong cuộc tàn s.át tại cơ sở thí nghiệm, cũng là người sở hữu siêu năng lực hoàn chỉnh nhất, hứa hẹn sẽ đem lại cơn sốt như phim từng làm được ở phần 1. Câu chuyện dần dần được hé lộ, không chỉ mỗi tổ chức của chị em song sinh Baek truy bắt mà còn nhiều thế lực khác săn lùng gắt gao. Rốt cuộc, những cuộc săn đuổi này nhằm mục đích gì?','https://youtu.be/2j_g0bmlgoQ','https://cdn.galaxycine.vn/media/2022/6/21/1200x1800_1655786885716.jpg');
insert into Phim(tenPhim,thoiGian,loaiPhim,daoDien,quocGia,dienVien,nhaSX,ngayKhoiChieu,moTa,trailer,img) values 
('Broker: Người môi giới','129 phút','Tâm Lý','Hirokazu Koreeda','Hàn Quốc','Song Kang Ho, Kang Dong Won, Bae Doo Na','Zip Cinema','2022/07/30','Một người đàn ông làm công việc "trung chuyển" các em bé bị bỏ rơi đang phải đối mặt với sự điều tra từ phía cảnh sát. Kết quả sẽ ra sao?','https://youtu.be/AU5KLnOZQVY','https://cdn.galaxycine.vn/media/2022/6/14/300_1655225644915.jpg');
insert into Phim(tenPhim,thoiGian,loaiPhim,daoDien,quocGia,dienVien,nhaSX,ngayKhoiChieu,moTa,trailer,img) values 
('Em và Trịnh','136 phút','Tình cảm,Lãng mạn','Phan Gia Nhật Linh','Việt Nam','Avin Lu, Lan Thy, Hoàng Hà, Trần Lực, Bùi Lan Hương, Phạm Quỳnh Anh','Galaxy Play','2022/07/18','Cuộc gặp gỡ định mệnh giữa Trịnh Công Sơn và nữ sinh viên Nhật Bản Michiko tại Paris năm 1990 đã mở ra một mối duyên kỳ ngộ. Từ đây bắt đầu hành trình ngược dòng thời gian, khám phá tuổi thanh xuân và tình yêu của người nhạc sĩ tài hoa với các nàng thơ Thanh Thuý, Bích Diễm, Dao Ánh, Khánh Ly, và những tình khúc mà họ lưu lại trong trái tim ông. Bộ phim lãng mạn, mở ra thế giới nhạc Trịnh quyến rũ với những mảnh ghép tình yêu đa sắc, lung linh tuyệt đẹp.','https://youtu.be/zzik4JB9D1Q','https://cdn.galaxycine.vn/media/2022/6/17/300x450_1655470357035.jpg');
insert into Phim(tenPhim,thoiGian,loaiPhim,daoDien,quocGia,dienVien,nhaSX,ngayKhoiChieu,moTa,trailer,img) values 
('Kẻ đào mộ','93 phút','Kinh Dị','Công Hậu','Việt Nam','Trương Thị May, Vũ Đức Hải, Phương Dung, Ngọc Trai','','2022,07/20','Kẻ đào mồ kể về câu chuyện tại một miền quê khô cằn vào đầu thế kỷ 19. Nơi mảnh đất khô cằn còn có sự phân hóa rõ rệt giữa người giàu và người nghèo. Lúc này, trong vùng xuất hiện những vụ đào mồ người giàu tại nghĩa trang và khiến sở cẩm mất ăn mất ngủ. Bạch Liên (Trương Thị May) trở thành nghi can số một khi là người trông coi nghĩa trang và được các gia đình giàu có nhờ canh mộ. Vậy lý do thực sự của Bạch Liên là gì khi cô luôn xuất hiện giữa đêm khuya tại nghĩa trang vào những đêm vừa có người hạ huyệt?','https://youtu.be/TFLeNVUV6c4','https://cdn.galaxycine.vn/media/2022/6/28/300x450_1656399324129.jpg');
insert into Phim(tenPhim,thoiGian,loaiPhim,daoDien,quocGia,dienVien,nhaSX,ngayKhoiChieu,moTa,trailer,img) values
('Lightyear','105 phút','Hoạt Hình','Angus MacLane','Mỹ','Chris Evans,Keke Palmer,Taika Waititi','Walt Disnay Pictures','2022/07/22','Bộ phim kể về chuyến hành trình hành động kết hợp khoa học viễn tưởng nhằm giới thiệu câu chuyện về nguồn gốc của nhân vật Buzz Lightyear — người anh hùng đã truyền cảm hứng sáng tạo ra Toy Story. “Lightyear” sẽ theo chân Cảnh Sát Vũ Trụ huyền thoại trong cuộc hành trình bước ra ngoài không gian cùng với một nhóm chiến binh đầy tham vọng và người bạn đồng hành là chú mèo máy Sox.','https://youtu.be/dIsvndy9I_k','https://cdn.galaxycine.vn/media/2022/6/1/300x450_1654069488377.jpg');
insert into Phim(tenPhim,thoiGian,loaiPhim,daoDien,quocGia,dienVien,nhaSX,ngayKhoiChieu,moTa,trailer,img) values
('Jurassic world dominion','147 phút','Hành Động','Colin Trevorrow','Mỹ','Laura Dern, Sam Neill, Jeff Goldblum, Chris Pratt, Bryce Dallas Howard','Universal Pictures','2022/07/25','Bốn năm sau kết thúc Jurassic World: Fallen Kingdom, những con khủng long đã thoát khỏi nơi giam cầm và tiến vào thế giới loài người. Giờ đây, chúng xuất hiện ở khắp mọi nơi. Sinh vật to lớn ấy không còn chỉ ở trên đảo như trước nữa mà gần ngay trước mắt, thậm chí còn có thể chạm tới. Owen Grady may mắn gặp lại cô khủng long mà anh và khán giả vô cùng yêu mến - Blue. Tuy nhiên, Blue không đi một mình mà còn đem theo một chú khủng long con khác. Điều này khiến Owen càng quyết tâm bảo vệ mẹ con cô được sinh sống an toàn. Thế nhưng, hai giống loài quá khác biệt. Liệu có thể tồn tại một kỷ nguyên mà khủng long và con người sống chung một cách hòa bình? Chris Pratt và Bryce Dallas Howard tiếp tục vào vai hai nhân vật chính Owen Grady và Claire Dearing. Ngoài ra, thật tuyệt vời khi Laura Dern, Sam Neill, Jeff Goldblum và BD Wong quay lại diễn những nhân vật thời Jurassic Parkl: Tiến sĩ Ellie Sattler, Tiến sĩ Alan Grant, Tiến sĩ Ian Malcolm và Tiến sĩ Henry Wu.','https://youtu.be/X0Peh-AClUM','https://cdn.galaxycine.vn/media/2022/6/10/1200wx1800h_1654828635520.jpg');


