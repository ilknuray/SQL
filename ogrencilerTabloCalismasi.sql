create table Ogrenciler(
OgrenciNo int not null primary key ,
OgrenciAdi varchar(30) not null,
OgrenciSoyadi varchar(30) not null,
Cinsiyet char(5),
DogumTarihi date,
BolumNo int not null ,
constraint fk_ogrenciBolum foreign key (BolumNo) references Bolumler(BolumNo)  
);

create table Bolumler(
BolumNo int not null primary key ,
BolumAdi varchar(20),
FakulteNo int,
constraint fk_fakulte_bolum foreign key (FakulteNo) references Fakulteler(FakulteNo)		

);

create table Fakulteler(
FakulteNo int  not null primary key ,
FakulteAdi varchar(20)

);

create table Desler(
	
DersNo int primary key,
	
DersAdi  varchar(20) not null,
BolumNo  int not null,
TeorikKredi int,
UygulamaKredi int,
constraint fk_dersler_bolumler foreign key (BolumNo) references Bolumler(BolumNo));

create table Notlar(
OgrenciNo int  primary key ,
DersNo int,
vize int,
Final int,
Butunleme int,
Durum int,
constraint fk_notlar_dersler foreign key (DersNo) references Dersler(DersNo)
);