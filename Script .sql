USE [master]
GO
/****** Object:  Database [rezervasyon]    Script Date: 27.05.2023 00:34:05 ******/
CREATE DATABASE [rezervasyon]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'rezervasyon', FILENAME = N'C:\sqlll\rezervasyon.mdf' , SIZE = 8192KB , MAXSIZE = 102400KB , FILEGROWTH = 5120KB )
 LOG ON 
( NAME = N'rezervasyon_log', FILENAME = N'C:\sqlll\rezervasyon_log.ldf' , SIZE = 2048KB , MAXSIZE = 51200KB , FILEGROWTH = 1024KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [rezervasyon] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [rezervasyon].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [rezervasyon] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [rezervasyon] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [rezervasyon] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [rezervasyon] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [rezervasyon] SET ARITHABORT OFF 
GO
ALTER DATABASE [rezervasyon] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [rezervasyon] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [rezervasyon] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [rezervasyon] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [rezervasyon] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [rezervasyon] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [rezervasyon] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [rezervasyon] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [rezervasyon] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [rezervasyon] SET  ENABLE_BROKER 
GO
ALTER DATABASE [rezervasyon] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [rezervasyon] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [rezervasyon] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [rezervasyon] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [rezervasyon] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [rezervasyon] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [rezervasyon] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [rezervasyon] SET RECOVERY FULL 
GO
ALTER DATABASE [rezervasyon] SET  MULTI_USER 
GO
ALTER DATABASE [rezervasyon] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [rezervasyon] SET DB_CHAINING OFF 
GO
ALTER DATABASE [rezervasyon] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [rezervasyon] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [rezervasyon] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [rezervasyon] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'rezervasyon', N'ON'
GO
ALTER DATABASE [rezervasyon] SET QUERY_STORE = ON
GO
ALTER DATABASE [rezervasyon] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [rezervasyon]
GO
/****** Object:  Table [dbo].[tblEkstra]    Script Date: 27.05.2023 00:34:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEkstra](
	[ekstra_id] [int] IDENTITY(1,1) NOT NULL,
	[ekstra_ad] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ekstra_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblFiyat]    Script Date: 27.05.2023 00:34:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFiyat](
	[fiyat_id] [int] IDENTITY(1,1) NOT NULL,
	[Fiyat] [money] NOT NULL,
	[fiyat_BaslangicTarihi] [date] NOT NULL,
	[fiyat_BitisTarihi] [date] NOT NULL,
	[OdaTuruId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[fiyat_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblIl]    Script Date: 27.05.2023 00:34:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblIl](
	[il_kod] [int] IDENTITY(1,1) NOT NULL,
	[il_ad] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[il_kod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblIlce]    Script Date: 27.05.2023 00:34:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblIlce](
	[ilce_id] [int] IDENTITY(1,1) NOT NULL,
	[Ilce_ad] [varchar](20) NOT NULL,
	[IlKod] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ilce_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblMusteri]    Script Date: 27.05.2023 00:34:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMusteri](
	[musteri_id] [int] IDENTITY(1,1) NOT NULL,
	[musteri_ad] [varchar](20) NOT NULL,
	[musteri_soyad] [varchar](20) NOT NULL,
	[musteri_dogumTarihi] [date] NOT NULL,
	[musteri_TC] [char](11) NOT NULL,
	[musteri_cinsiyet] [char](5) NOT NULL,
	[musteri_email] [varchar](50) NULL,
	[musteri_yas]  AS (datediff(year,[musteri_dogumTarihi],getdate())),
	[musteri_telefon] [char](10) NULL,
	[IlKodu] [int] NOT NULL,
	[IlceKodu] [int] NOT NULL,
	[Musterituru_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[musteri_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblMusteri_Otel]    Script Date: 27.05.2023 00:34:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMusteri_Otel](
	[musteri_otel_id] [int] IDENTITY(1,1) NOT NULL,
	[musteri_id] [int] NOT NULL,
	[otel_id] [int] NOT NULL,
	[yorum] [varchar](50) NOT NULL,
	[yorumtarihi] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[musteri_otel_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblMusteri_Rezervasyon]    Script Date: 27.05.2023 00:34:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMusteri_Rezervasyon](
	[musteri_rezervasyon_id] [int] IDENTITY(1,1) NOT NULL,
	[musteri_id] [int] NOT NULL,
	[rezervasyon_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[musteri_rezervasyon_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblMusteriTuru]    Script Date: 27.05.2023 00:34:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMusteriTuru](
	[musterituru_id] [int] IDENTITY(1,1) NOT NULL,
	[musterituru_ad] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[musterituru_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOda]    Script Date: 27.05.2023 00:34:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOda](
	[oda_id] [int] IDENTITY(1,1) NOT NULL,
	[oda_numara] [varchar](4) NULL,
	[oda_dolulukDurumu] [varchar](4) NULL,
	[odaturu_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[oda_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOda_tblOtelVeOdaOzellikleri]    Script Date: 27.05.2023 00:34:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOda_tblOtelVeOdaOzellikleri](
	[oda_otelveodaozellikleri_id] [int] IDENTITY(1,1) NOT NULL,
	[oda_id] [int] NOT NULL,
	[otelveodaozellikleri_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[oda_otelveodaozellikleri_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOda_tblPersonel]    Script Date: 27.05.2023 00:34:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOda_tblPersonel](
	[oda_personel_id] [int] IDENTITY(1,1) NOT NULL,
	[oda_id] [int] NOT NULL,
	[personel_id] [int] NOT NULL,
	[yorum] [varchar](20) NOT NULL,
	[baslamasaati] [time](7) NOT NULL,
	[bitissaati] [time](7) NOT NULL,
	[tarih] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[oda_personel_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOdaTuru]    Script Date: 27.05.2023 00:34:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOdaTuru](
	[odaturu_id] [int] IDENTITY(1,1) NOT NULL,
	[odaturu_ad] [varchar](20) NOT NULL,
	[odaturu_aciklama] [varchar](200) NULL,
	[odaturu_maxKisiSayisi] [int] NOT NULL,
	[odaturu_yatakSayisi] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[odaturu_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOtel]    Script Date: 27.05.2023 00:34:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOtel](
	[otel_id] [int] IDENTITY(1,1) NOT NULL,
	[otel_email] [varchar](50) NOT NULL,
	[otel_adres] [varchar](100) NULL,
	[otel_ad] [varchar](20) NOT NULL,
	[otel_telefon] [char](10) NULL,
	[otel_aciklama] [varchar](100) NULL,
	[otel_yildizi] [smallint] NULL,
	[otel_puani] [smallint] NULL,
	[IlKodu] [int] NOT NULL,
	[IlceKodu] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[otel_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOtel_Ekstra]    Script Date: 27.05.2023 00:34:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOtel_Ekstra](
	[otel_ekstra_id] [int] IDENTITY(1,1) NOT NULL,
	[otel_id] [int] NOT NULL,
	[ekstra_id] [int] NOT NULL,
	[fiyat] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[otel_ekstra_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOtel_tblOtelVeOdaOzellikleri]    Script Date: 27.05.2023 00:34:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOtel_tblOtelVeOdaOzellikleri](
	[otel_otelveodaozellikleri_id] [int] IDENTITY(1,1) NOT NULL,
	[otel_id] [int] NOT NULL,
	[otelveodaozellikleri_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[otel_otelveodaozellikleri_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOtelVeOdaOzellikleri]    Script Date: 27.05.2023 00:34:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOtelVeOdaOzellikleri](
	[otelveodaozellikleri_id] [int] IDENTITY(1,1) NOT NULL,
	[otelveodaozellikleri_ad] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[otelveodaozellikleri_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPersonel]    Script Date: 27.05.2023 00:34:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPersonel](
	[personel_id] [int] IDENTITY(1,1) NOT NULL,
	[personel_ad] [varchar](20) NULL,
	[personel_soyad] [varchar](20) NULL,
	[personel_dogumTarihi] [date] NOT NULL,
	[personel_TC] [char](11) NOT NULL,
	[personel_cinsiyet] [char](5) NOT NULL,
	[personel_email] [varchar](50) NULL,
	[personel_yas]  AS (datediff(year,[personel_dogumTarihi],getdate())),
	[personel_telefon] [char](10) NULL,
	[OtelId] [int] NOT NULL,
	[IlKodu] [int] NOT NULL,
	[IlceKodu] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[personel_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRezervasyon]    Script Date: 27.05.2023 00:34:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRezervasyon](
	[rezervasyon_id] [int] IDENTITY(1,1) NOT NULL,
	[rezervasyon_kisiSayisi] [int] NOT NULL,
	[rezervasyon_indirimTutari] [money] NULL,
	[rezervasyon_numara] [varchar](10) NOT NULL,
	[rezervasyon_geceSayisi] [int] NULL,
	[rezervasyon_toplamExtraUcret] [int] NOT NULL,
	[rezervasyon_gunlukUcret] [int] NOT NULL,
	[rezervasyon_netUcret]  AS (([rezervasyon_gunlukUcret]*[rezervasyon_geceSayisi]+[rezervasyon_toplamExtraUcret])-[rezervasyon_indirimTutari]),
	[rezervasyon_brutUcret]  AS ((([rezervasyon_gunlukUcret]*[rezervasyon_geceSayisi])*(1.18)+[rezervasyon_toplamExtraUcret])-[rezervasyon_indirimTutari]),
	[rezervasyon__baslangicTarihi] [date] NOT NULL,
	[rezervasyon_bitisTarihi] [date] NOT NULL,
	[Oda_id] [int] NOT NULL,
	[Musteri_id] [int] NOT NULL,
	[Personel_id] [int] NOT NULL,
	[Otel_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[rezervasyon_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRezervasyon_tblEkstra]    Script Date: 27.05.2023 00:34:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRezervasyon_tblEkstra](
	[rezervasyon_ekstra_id] [int] IDENTITY(1,1) NOT NULL,
	[rezervasyon_id] [int] NOT NULL,
	[ekstra_id] [int] NOT NULL,
	[tarih] [date] NOT NULL,
	[birimFiyat] [money] NOT NULL,
	[miktar] [int] NOT NULL,
	[tutar]  AS ([birimFiyat]*[miktar]),
PRIMARY KEY CLUSTERED 
(
	[rezervasyon_ekstra_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblEkstra] ON 

INSERT [dbo].[tblEkstra] ([ekstra_id], [ekstra_ad]) VALUES (1, N'Wifi')
INSERT [dbo].[tblEkstra] ([ekstra_id], [ekstra_ad]) VALUES (2, N'Otopark')
INSERT [dbo].[tblEkstra] ([ekstra_id], [ekstra_ad]) VALUES (3, N'Havuz')
INSERT [dbo].[tblEkstra] ([ekstra_id], [ekstra_ad]) VALUES (4, N'Spa')
INSERT [dbo].[tblEkstra] ([ekstra_id], [ekstra_ad]) VALUES (5, N'Restoran')
INSERT [dbo].[tblEkstra] ([ekstra_id], [ekstra_ad]) VALUES (6, N'Fitness Merkezi')
INSERT [dbo].[tblEkstra] ([ekstra_id], [ekstra_ad]) VALUES (7, N'Çamaşırhane')
INSERT [dbo].[tblEkstra] ([ekstra_id], [ekstra_ad]) VALUES (8, N'Kuru Temizleme')
INSERT [dbo].[tblEkstra] ([ekstra_id], [ekstra_ad]) VALUES (9, N'Oyun Alanı')
INSERT [dbo].[tblEkstra] ([ekstra_id], [ekstra_ad]) VALUES (10, N'Toplantı Salonu')
INSERT [dbo].[tblEkstra] ([ekstra_id], [ekstra_ad]) VALUES (11, N'Bar')
INSERT [dbo].[tblEkstra] ([ekstra_id], [ekstra_ad]) VALUES (12, N'24 Saat Resepsiyon')
INSERT [dbo].[tblEkstra] ([ekstra_id], [ekstra_ad]) VALUES (13, N'Havaalanı Servisi')
INSERT [dbo].[tblEkstra] ([ekstra_id], [ekstra_ad]) VALUES (14, N'Çocuk Kulübü')
INSERT [dbo].[tblEkstra] ([ekstra_id], [ekstra_ad]) VALUES (15, N'Bisiklet Kiralama')
INSERT [dbo].[tblEkstra] ([ekstra_id], [ekstra_ad]) VALUES (16, N'SigaraİçilmeyenYer')
INSERT [dbo].[tblEkstra] ([ekstra_id], [ekstra_ad]) VALUES (17, N'Engelli Dostu')
INSERT [dbo].[tblEkstra] ([ekstra_id], [ekstra_ad]) VALUES (18, N'Evcil Hayvan Dostu')
INSERT [dbo].[tblEkstra] ([ekstra_id], [ekstra_ad]) VALUES (19, N'Teras')
INSERT [dbo].[tblEkstra] ([ekstra_id], [ekstra_ad]) VALUES (20, N'Bahçe')
SET IDENTITY_INSERT [dbo].[tblEkstra] OFF
GO
SET IDENTITY_INSERT [dbo].[tblFiyat] ON 

INSERT [dbo].[tblFiyat] ([fiyat_id], [Fiyat], [fiyat_BaslangicTarihi], [fiyat_BitisTarihi], [OdaTuruId]) VALUES (1, 200.0000, CAST(N'2023-01-01' AS Date), CAST(N'2023-12-31' AS Date), 1)
INSERT [dbo].[tblFiyat] ([fiyat_id], [Fiyat], [fiyat_BaslangicTarihi], [fiyat_BitisTarihi], [OdaTuruId]) VALUES (2, 150.0000, CAST(N'2023-01-01' AS Date), CAST(N'2023-12-31' AS Date), 2)
INSERT [dbo].[tblFiyat] ([fiyat_id], [Fiyat], [fiyat_BaslangicTarihi], [fiyat_BitisTarihi], [OdaTuruId]) VALUES (3, 180.0000, CAST(N'2023-01-01' AS Date), CAST(N'2023-12-31' AS Date), 3)
INSERT [dbo].[tblFiyat] ([fiyat_id], [Fiyat], [fiyat_BaslangicTarihi], [fiyat_BitisTarihi], [OdaTuruId]) VALUES (4, 250.0000, CAST(N'2023-01-01' AS Date), CAST(N'2023-12-31' AS Date), 4)
INSERT [dbo].[tblFiyat] ([fiyat_id], [Fiyat], [fiyat_BaslangicTarihi], [fiyat_BitisTarihi], [OdaTuruId]) VALUES (5, 300.0000, CAST(N'2023-01-01' AS Date), CAST(N'2023-12-31' AS Date), 5)
INSERT [dbo].[tblFiyat] ([fiyat_id], [Fiyat], [fiyat_BaslangicTarihi], [fiyat_BitisTarihi], [OdaTuruId]) VALUES (6, 220.0000, CAST(N'2023-01-01' AS Date), CAST(N'2023-12-31' AS Date), 6)
INSERT [dbo].[tblFiyat] ([fiyat_id], [Fiyat], [fiyat_BaslangicTarihi], [fiyat_BitisTarihi], [OdaTuruId]) VALUES (7, 170.0000, CAST(N'2023-01-01' AS Date), CAST(N'2023-12-31' AS Date), 7)
INSERT [dbo].[tblFiyat] ([fiyat_id], [Fiyat], [fiyat_BaslangicTarihi], [fiyat_BitisTarihi], [OdaTuruId]) VALUES (8, 190.0000, CAST(N'2023-01-01' AS Date), CAST(N'2023-12-31' AS Date), 8)
INSERT [dbo].[tblFiyat] ([fiyat_id], [Fiyat], [fiyat_BaslangicTarihi], [fiyat_BitisTarihi], [OdaTuruId]) VALUES (9, 210.0000, CAST(N'2023-01-01' AS Date), CAST(N'2023-12-31' AS Date), 9)
INSERT [dbo].[tblFiyat] ([fiyat_id], [Fiyat], [fiyat_BaslangicTarihi], [fiyat_BitisTarihi], [OdaTuruId]) VALUES (10, 180.0000, CAST(N'2023-01-01' AS Date), CAST(N'2023-12-31' AS Date), 10)
SET IDENTITY_INSERT [dbo].[tblFiyat] OFF
GO
SET IDENTITY_INSERT [dbo].[tblIl] ON 

INSERT [dbo].[tblIl] ([il_kod], [il_ad]) VALUES (1, N'ADANA')
INSERT [dbo].[tblIl] ([il_kod], [il_ad]) VALUES (2, N'ADIYAMAN')
INSERT [dbo].[tblIl] ([il_kod], [il_ad]) VALUES (3, N'AFYON')
INSERT [dbo].[tblIl] ([il_kod], [il_ad]) VALUES (4, N'AĞRI')
INSERT [dbo].[tblIl] ([il_kod], [il_ad]) VALUES (5, N'AMASYA')
INSERT [dbo].[tblIl] ([il_kod], [il_ad]) VALUES (6, N'ANKARA')
INSERT [dbo].[tblIl] ([il_kod], [il_ad]) VALUES (7, N'ANTALYA')
INSERT [dbo].[tblIl] ([il_kod], [il_ad]) VALUES (8, N'ARTVİN')
INSERT [dbo].[tblIl] ([il_kod], [il_ad]) VALUES (9, N'AYDIN')
INSERT [dbo].[tblIl] ([il_kod], [il_ad]) VALUES (10, N'BALIKESİR')
INSERT [dbo].[tblIl] ([il_kod], [il_ad]) VALUES (11, N'BİLECİK')
INSERT [dbo].[tblIl] ([il_kod], [il_ad]) VALUES (12, N'BİNGÖL')
INSERT [dbo].[tblIl] ([il_kod], [il_ad]) VALUES (13, N'BİTLİS')
INSERT [dbo].[tblIl] ([il_kod], [il_ad]) VALUES (14, N'BOLU')
INSERT [dbo].[tblIl] ([il_kod], [il_ad]) VALUES (15, N'BURDUR')
INSERT [dbo].[tblIl] ([il_kod], [il_ad]) VALUES (16, N'BURSA')
INSERT [dbo].[tblIl] ([il_kod], [il_ad]) VALUES (17, N'ÇANAKKALE')
INSERT [dbo].[tblIl] ([il_kod], [il_ad]) VALUES (18, N'ÇANKIRI')
INSERT [dbo].[tblIl] ([il_kod], [il_ad]) VALUES (19, N'ÇORUM')
INSERT [dbo].[tblIl] ([il_kod], [il_ad]) VALUES (20, N'DENİZLİ')
INSERT [dbo].[tblIl] ([il_kod], [il_ad]) VALUES (21, N'DİYARBAKIR')
INSERT [dbo].[tblIl] ([il_kod], [il_ad]) VALUES (22, N'EDİRNE')
INSERT [dbo].[tblIl] ([il_kod], [il_ad]) VALUES (23, N'ELAZIĞ')
INSERT [dbo].[tblIl] ([il_kod], [il_ad]) VALUES (24, N'ERZİNCAN')
INSERT [dbo].[tblIl] ([il_kod], [il_ad]) VALUES (25, N'ERZURUM')
INSERT [dbo].[tblIl] ([il_kod], [il_ad]) VALUES (26, N'ESKİŞEHİR')
INSERT [dbo].[tblIl] ([il_kod], [il_ad]) VALUES (27, N'GAZİANTEP')
INSERT [dbo].[tblIl] ([il_kod], [il_ad]) VALUES (28, N'GİRESUN')
INSERT [dbo].[tblIl] ([il_kod], [il_ad]) VALUES (29, N'GÜMÜŞHANE')
INSERT [dbo].[tblIl] ([il_kod], [il_ad]) VALUES (30, N'HAKKARİ')
INSERT [dbo].[tblIl] ([il_kod], [il_ad]) VALUES (31, N'HATAY')
INSERT [dbo].[tblIl] ([il_kod], [il_ad]) VALUES (32, N'ISPARTA')
INSERT [dbo].[tblIl] ([il_kod], [il_ad]) VALUES (33, N'İÇEL')
INSERT [dbo].[tblIl] ([il_kod], [il_ad]) VALUES (34, N'İSTANBUL')
INSERT [dbo].[tblIl] ([il_kod], [il_ad]) VALUES (35, N'İZMİR')
INSERT [dbo].[tblIl] ([il_kod], [il_ad]) VALUES (36, N'KARS')
INSERT [dbo].[tblIl] ([il_kod], [il_ad]) VALUES (37, N'KASTAMONU')
INSERT [dbo].[tblIl] ([il_kod], [il_ad]) VALUES (38, N'KAYSERİ')
INSERT [dbo].[tblIl] ([il_kod], [il_ad]) VALUES (39, N'KIRKLARELİ')
INSERT [dbo].[tblIl] ([il_kod], [il_ad]) VALUES (40, N'KIRŞEHİR')
INSERT [dbo].[tblIl] ([il_kod], [il_ad]) VALUES (41, N'KOCAELİ')
INSERT [dbo].[tblIl] ([il_kod], [il_ad]) VALUES (42, N'KONYA')
INSERT [dbo].[tblIl] ([il_kod], [il_ad]) VALUES (43, N'KÜTAHYA')
INSERT [dbo].[tblIl] ([il_kod], [il_ad]) VALUES (44, N'MALATYA')
INSERT [dbo].[tblIl] ([il_kod], [il_ad]) VALUES (45, N'MANİSA')
INSERT [dbo].[tblIl] ([il_kod], [il_ad]) VALUES (46, N'KAHRAMANMARAŞ')
INSERT [dbo].[tblIl] ([il_kod], [il_ad]) VALUES (47, N'MARDİN')
INSERT [dbo].[tblIl] ([il_kod], [il_ad]) VALUES (48, N'MUĞLA')
INSERT [dbo].[tblIl] ([il_kod], [il_ad]) VALUES (49, N'MUŞ')
INSERT [dbo].[tblIl] ([il_kod], [il_ad]) VALUES (50, N'NEVŞEHİR')
INSERT [dbo].[tblIl] ([il_kod], [il_ad]) VALUES (51, N'NİĞDE')
INSERT [dbo].[tblIl] ([il_kod], [il_ad]) VALUES (52, N'ORDU')
INSERT [dbo].[tblIl] ([il_kod], [il_ad]) VALUES (53, N'RİZE')
INSERT [dbo].[tblIl] ([il_kod], [il_ad]) VALUES (54, N'SAKARYA')
INSERT [dbo].[tblIl] ([il_kod], [il_ad]) VALUES (55, N'SAMSUN')
INSERT [dbo].[tblIl] ([il_kod], [il_ad]) VALUES (56, N'SİİRT')
INSERT [dbo].[tblIl] ([il_kod], [il_ad]) VALUES (57, N'SİNOP')
INSERT [dbo].[tblIl] ([il_kod], [il_ad]) VALUES (58, N'SİVAS')
INSERT [dbo].[tblIl] ([il_kod], [il_ad]) VALUES (59, N'TEKİRDAĞ')
INSERT [dbo].[tblIl] ([il_kod], [il_ad]) VALUES (60, N'TOKAT')
INSERT [dbo].[tblIl] ([il_kod], [il_ad]) VALUES (61, N'TRABZON')
INSERT [dbo].[tblIl] ([il_kod], [il_ad]) VALUES (62, N'TUNCELİ')
INSERT [dbo].[tblIl] ([il_kod], [il_ad]) VALUES (63, N'ŞANLIURFA')
INSERT [dbo].[tblIl] ([il_kod], [il_ad]) VALUES (64, N'UŞAK')
INSERT [dbo].[tblIl] ([il_kod], [il_ad]) VALUES (65, N'VAN')
INSERT [dbo].[tblIl] ([il_kod], [il_ad]) VALUES (66, N'YOZGAT')
INSERT [dbo].[tblIl] ([il_kod], [il_ad]) VALUES (67, N'ZONGULDAK')
INSERT [dbo].[tblIl] ([il_kod], [il_ad]) VALUES (68, N'AKSARAY')
INSERT [dbo].[tblIl] ([il_kod], [il_ad]) VALUES (69, N'BAYBURT')
INSERT [dbo].[tblIl] ([il_kod], [il_ad]) VALUES (70, N'KARAMAN')
INSERT [dbo].[tblIl] ([il_kod], [il_ad]) VALUES (71, N'KIRIKKALE')
INSERT [dbo].[tblIl] ([il_kod], [il_ad]) VALUES (72, N'BATMAN')
INSERT [dbo].[tblIl] ([il_kod], [il_ad]) VALUES (73, N'ŞIRNAK')
INSERT [dbo].[tblIl] ([il_kod], [il_ad]) VALUES (74, N'BARTIN')
INSERT [dbo].[tblIl] ([il_kod], [il_ad]) VALUES (75, N'ARDAHAN')
INSERT [dbo].[tblIl] ([il_kod], [il_ad]) VALUES (76, N'IĞDIR')
INSERT [dbo].[tblIl] ([il_kod], [il_ad]) VALUES (77, N'YALOVA')
INSERT [dbo].[tblIl] ([il_kod], [il_ad]) VALUES (78, N'KARABÜK')
INSERT [dbo].[tblIl] ([il_kod], [il_ad]) VALUES (79, N'KİLİS')
INSERT [dbo].[tblIl] ([il_kod], [il_ad]) VALUES (80, N'OSMANİYE')
INSERT [dbo].[tblIl] ([il_kod], [il_ad]) VALUES (81, N'DÜZCE')
SET IDENTITY_INSERT [dbo].[tblIl] OFF
GO
SET IDENTITY_INSERT [dbo].[tblIlce] ON 

INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (1, N'ALADAĞ', 1)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (2, N'CEYHAN', 1)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (3, N'ÇUKUROVA', 1)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (4, N'FEKE', 1)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (5, N'İMAMOĞLU', 1)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (6, N'KARAİSALI', 1)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (7, N'KARATAŞ', 1)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (8, N'KOZAN', 1)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (9, N'POZANTI', 1)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (10, N'SAİMBEYLİ', 1)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (11, N'SARIÇAM', 1)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (12, N'SEYHAN', 1)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (13, N'TUFANBEYLİ', 1)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (14, N'YUMURTALIK', 1)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (15, N'YÜREĞİR', 1)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (16, N'BESNİ', 2)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (17, N'ÇELİKHAN', 2)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (18, N'GERGER', 2)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (19, N'GÖLBAŞI', 2)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (20, N'KAHTA', 2)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (21, N'MERKEZ', 2)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (22, N'SAMSAT', 2)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (23, N'SİNCİK', 2)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (24, N'TUT', 2)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (25, N'BAŞMAKÇI', 3)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (26, N'BAYAT', 3)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (27, N'BOLVADİN', 3)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (28, N'ÇAY', 3)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (29, N'ÇOBANLAR', 3)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (30, N'DAZKIRI', 3)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (31, N'DİNAR', 3)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (32, N'EMİRDAĞ', 3)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (33, N'EVCİLER', 3)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (34, N'HOCALAR', 3)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (35, N'İHSANİYE', 3)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (36, N'İSCEHİSAR', 3)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (37, N'KIZILÖREN', 3)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (38, N'MERKEZ', 3)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (39, N'SANDIKLI', 3)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (40, N'SİNANPAŞA', 3)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (41, N'SULTANDAĞI', 3)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (42, N'ŞUHUT', 3)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (43, N'DİYADİN', 4)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (44, N'DOĞUBAYAZIT', 4)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (45, N'ELEŞKİRT', 4)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (46, N'HAMUR', 4)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (47, N'MERKEZ', 4)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (48, N'PATNOS', 4)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (49, N'TAŞLIÇAY', 4)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (50, N'TUTAK', 4)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (51, N'AĞAÇÖREN', 68)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (52, N'ESKİL', 68)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (53, N'GÜLAĞAÇ', 68)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (54, N'GÜZELYURT', 68)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (55, N'MERKEZ', 68)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (56, N'ORTAKÖY', 68)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (57, N'SARIYAHŞİ', 68)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (58, N'SULTANHANI', 68)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (59, N'GÖYNÜCEK', 5)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (60, N'GÜMÜŞHACIKÖY', 5)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (61, N'HAMAMÖZÜ', 5)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (62, N'MERKEZ', 5)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (63, N'MERZİFON', 5)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (64, N'SULUOVA', 5)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (65, N'TAŞOVA', 5)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (66, N'AKYURT', 6)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (67, N'ALTINDAĞ', 6)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (68, N'AYAŞ', 6)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (69, N'BALA', 6)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (70, N'BEYPAZARI', 6)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (71, N'ÇAMLIDERE', 6)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (72, N'ÇANKAYA', 6)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (73, N'ÇUBUK', 6)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (74, N'ELMADAĞ', 6)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (75, N'ETİMESGUT', 6)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (76, N'EVREN', 6)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (77, N'GÖLBAŞI', 6)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (78, N'GÜDÜL', 6)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (79, N'HAYMANA', 6)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (80, N'KAHRAMANKAZAN', 6)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (81, N'KALECİK', 6)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (82, N'KEÇİÖREN', 6)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (83, N'KIZILCAHAMAM', 6)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (84, N'MAMAK', 6)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (85, N'NALLIHAN', 6)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (86, N'POLATLI', 6)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (87, N'PURSAKLAR', 6)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (88, N'SİNCAN', 6)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (89, N'ŞEREFLİKOÇHİSAR', 6)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (90, N'YENİMAHALLE', 6)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (91, N'AKSEKİ', 7)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (92, N'AKSU', 7)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (93, N'ALANYA', 7)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (94, N'DEMRE', 7)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (95, N'DÖŞEMEALTI', 7)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (96, N'ELMALI', 7)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (97, N'FİNİKE', 7)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (98, N'GAZİPAŞA', 7)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (99, N'GÜNDOĞMUŞ', 7)
GO
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (100, N'İBRADI', 7)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (101, N'KAŞ', 7)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (102, N'KEMER', 7)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (103, N'KEPEZ', 7)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (104, N'KONYAALTI', 7)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (105, N'KORKUTELİ', 7)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (106, N'KUMLUCA', 7)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (107, N'MANAVGAT', 7)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (108, N'MURATPAŞA', 7)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (109, N'SERİK', 7)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (110, N'ÇILDIR', 75)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (111, N'DAMAL', 75)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (112, N'GÖLE', 75)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (113, N'HANAK', 75)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (114, N'MERKEZ', 75)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (115, N'POSOF', 75)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (116, N'ARDANUÇ', 8)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (117, N'ARHAVİ', 8)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (118, N'BORÇKA', 8)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (119, N'HOPA', 8)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (120, N'KEMALPAŞA', 8)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (121, N'MERKEZ', 8)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (122, N'MURGUL', 8)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (123, N'ŞAVŞAT', 8)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (124, N'YUSUFELİ', 8)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (125, N'BOZDOĞAN', 9)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (126, N'BUHARKENT', 9)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (127, N'ÇİNE', 9)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (128, N'DİDİM', 9)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (129, N'EFELER', 9)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (130, N'GERMENCİK', 9)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (131, N'İNCİRLİOVA', 9)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (132, N'KARACASU', 9)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (133, N'KARPUZLU', 9)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (134, N'KOÇARLI', 9)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (135, N'KÖŞK', 9)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (136, N'KUŞADASI', 9)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (137, N'KUYUCAK', 9)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (138, N'NAZİLLİ', 9)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (139, N'SÖKE', 9)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (140, N'SULTANHİSAR', 9)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (141, N'YENİPAZAR', 9)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (142, N'ALTIEYLÜL', 10)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (143, N'AYVALIK', 10)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (144, N'BALYA', 10)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (145, N'BANDIRMA', 10)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (146, N'BİGADİÇ', 10)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (147, N'BURHANİYE', 10)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (148, N'DURSUNBEY', 10)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (149, N'EDREMİT', 10)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (150, N'ERDEK', 10)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (151, N'GÖMEÇ', 10)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (152, N'GÖNEN', 10)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (153, N'HAVRAN', 10)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (154, N'İVRİNDİ', 10)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (155, N'KARESİ', 10)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (156, N'KEPSUT', 10)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (157, N'MANYAS', 10)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (158, N'MARMARA', 10)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (159, N'SAVAŞTEPE', 10)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (160, N'SINDIRGI', 10)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (161, N'SUSURLUK', 10)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (162, N'AMASRA', 74)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (163, N'KURUCAŞİLE', 74)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (164, N'MERKEZ', 74)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (165, N'ULUS', 74)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (166, N'BEŞİRİ', 72)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (167, N'GERCÜŞ', 72)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (168, N'HASANKEYF', 72)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (169, N'KOZLUK', 72)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (170, N'MERKEZ', 72)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (171, N'SASON', 72)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (172, N'AYDINTEPE', 69)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (173, N'DEMİRÖZÜ', 69)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (174, N'MERKEZ', 69)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (175, N'BOZÜYÜK', 11)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (176, N'GÖLPAZARI', 11)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (177, N'İNHİSAR', 11)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (178, N'MERKEZ', 11)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (179, N'OSMANELİ', 11)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (180, N'PAZARYERİ', 11)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (181, N'SÖĞÜT', 11)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (182, N'YENİPAZAR', 11)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (183, N'ADAKLI', 12)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (184, N'GENÇ', 12)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (185, N'KARLIOVA', 12)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (186, N'KİĞI', 12)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (187, N'MERKEZ', 12)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (188, N'SOLHAN', 12)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (189, N'YAYLADERE', 12)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (190, N'YEDİSU', 12)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (191, N'ADİLCEVAZ', 13)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (192, N'AHLAT', 13)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (193, N'GÜROYMAK', 13)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (194, N'HİZAN', 13)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (195, N'MERKEZ', 13)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (196, N'MUTKİ', 13)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (197, N'TATVAN', 13)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (198, N'DÖRTDİVAN', 14)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (199, N'GEREDE', 14)
GO
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (200, N'GÖYNÜK', 14)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (201, N'KIBRISCIK', 14)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (202, N'MENGEN', 14)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (203, N'MERKEZ', 14)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (204, N'MUDURNU', 14)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (205, N'SEBEN', 14)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (206, N'YENİÇAĞA', 14)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (207, N'AĞLASUN', 15)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (208, N'ALTINYAYLA', 15)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (209, N'BUCAK', 15)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (210, N'ÇAVDIR', 15)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (211, N'ÇELTİKÇİ', 15)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (212, N'GÖLHİSAR', 15)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (213, N'KARAMANLI', 15)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (214, N'KEMER', 15)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (215, N'MERKEZ', 15)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (216, N'TEFENNİ', 15)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (217, N'YEŞİLOVA', 15)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (218, N'BÜYÜKORHAN', 16)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (219, N'GEMLİK', 16)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (220, N'GÜRSU', 16)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (221, N'HARMANCIK', 16)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (222, N'İNEGÖL', 16)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (223, N'İZNİK', 16)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (224, N'KARACABEY', 16)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (225, N'KELES', 16)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (226, N'KESTEL', 16)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (227, N'MUDANYA', 16)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (228, N'MUSTAFAKEMALPAŞA', 16)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (229, N'NİLÜFER', 16)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (230, N'ORHANELİ', 16)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (231, N'ORHANGAZİ', 16)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (232, N'OSMANGAZİ', 16)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (233, N'YENİŞEHİR', 16)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (234, N'YILDIRIM', 16)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (235, N'AYVACIK', 17)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (236, N'BAYRAMİÇ', 17)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (237, N'BİGA', 17)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (238, N'BOZCAADA', 17)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (239, N'ÇAN', 17)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (240, N'ECEABAT', 17)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (241, N'EZİNE', 17)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (242, N'GELİBOLU', 17)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (243, N'GÖKÇEADA', 17)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (244, N'LAPSEKİ', 17)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (245, N'MERKEZ', 17)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (246, N'YENİCE', 17)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (247, N'ATKARACALAR', 18)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (248, N'BAYRAMÖREN', 18)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (249, N'ÇERKEŞ', 18)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (250, N'ELDİVAN', 18)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (251, N'ILGAZ', 18)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (252, N'KIZILIRMAK', 18)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (253, N'KORGUN', 18)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (254, N'KURŞUNLU', 18)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (255, N'MERKEZ', 18)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (256, N'ORTA', 18)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (257, N'ŞABANÖZÜ', 18)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (258, N'YAPRAKLI', 18)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (259, N'ALACA', 19)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (260, N'BAYAT', 19)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (261, N'BOĞAZKALE', 19)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (262, N'DODURGA', 19)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (263, N'İSKİLİP', 19)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (264, N'KARGI', 19)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (265, N'LAÇİN', 19)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (266, N'MECİTÖZÜ', 19)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (267, N'MERKEZ', 19)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (268, N'OĞUZLAR', 19)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (269, N'ORTAKÖY', 19)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (270, N'OSMANCIK', 19)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (271, N'SUNGURLU', 19)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (272, N'UĞURLUDAĞ', 19)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (273, N'ACIPAYAM', 20)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (274, N'BABADAĞ', 20)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (275, N'BAKLAN', 20)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (276, N'BEKİLLİ', 20)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (277, N'BEYAĞAÇ', 20)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (278, N'BOZKURT', 20)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (279, N'BULDAN', 20)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (280, N'ÇAL', 20)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (281, N'ÇAMELİ', 20)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (282, N'ÇARDAK', 20)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (283, N'ÇİVRİL', 20)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (284, N'GÜNEY', 20)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (285, N'HONAZ', 20)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (286, N'KALE', 20)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (287, N'MERKEZEFENDİ', 20)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (288, N'PAMUKKALE', 20)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (289, N'SARAYKÖY', 20)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (290, N'SERİNHİSAR', 20)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (291, N'TAVAS', 20)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (292, N'BAĞLAR', 21)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (293, N'BİSMİL', 21)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (294, N'ÇERMİK', 21)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (295, N'ÇINAR', 21)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (296, N'ÇÜNGÜŞ', 21)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (297, N'DİCLE', 21)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (298, N'EĞİL', 21)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (299, N'ERGANİ', 21)
GO
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (300, N'HANİ', 21)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (301, N'HAZRO', 21)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (302, N'KAYAPINAR', 21)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (303, N'KOCAKÖY', 21)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (304, N'KULP', 21)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (305, N'LİCE', 21)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (306, N'SİLVAN', 21)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (307, N'SUR', 21)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (308, N'YENİŞEHİR', 21)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (309, N'AKÇAKOCA', 81)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (310, N'CUMAYERİ', 81)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (311, N'ÇİLİMLİ', 81)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (312, N'GÖLYAKA', 81)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (313, N'GÜMÜŞOVA', 81)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (314, N'KAYNAŞLI', 81)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (315, N'MERKEZ', 81)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (316, N'YIĞILCA', 81)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (317, N'ENEZ', 22)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (318, N'HAVSA', 22)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (319, N'İPSALA', 22)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (320, N'KEŞAN', 22)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (321, N'LALAPAŞA', 22)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (322, N'MERİÇ', 22)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (323, N'MERKEZ', 22)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (324, N'SÜLOĞLU', 22)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (325, N'UZUNKÖPRÜ', 22)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (326, N'AĞIN', 23)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (327, N'ALACAKAYA', 23)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (328, N'ARICAK', 23)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (329, N'BASKİL', 23)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (330, N'KARAKOÇAN', 23)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (331, N'KEBAN', 23)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (332, N'KOVANCILAR', 23)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (333, N'MADEN', 23)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (334, N'MERKEZ', 23)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (335, N'PALU', 23)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (336, N'SİVRİCE', 23)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (337, N'ÇAYIRLI', 24)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (338, N'İLİÇ', 24)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (339, N'KEMAH', 24)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (340, N'KEMALİYE', 24)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (341, N'MERKEZ', 24)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (342, N'OTLUKBELİ', 24)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (343, N'REFAHİYE', 24)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (344, N'TERCAN', 24)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (345, N'ÜZÜMLÜ', 24)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (346, N'AŞKALE', 25)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (347, N'AZİZİYE', 25)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (348, N'ÇAT', 25)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (349, N'HINIS', 25)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (350, N'HORASAN', 25)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (351, N'İSPİR', 25)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (352, N'KARAÇOBAN', 25)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (353, N'KARAYAZI', 25)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (354, N'KÖPRÜKÖY', 25)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (355, N'NARMAN', 25)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (356, N'OLTU', 25)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (357, N'OLUR', 25)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (358, N'PALANDÖKEN', 25)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (359, N'PASİNLER', 25)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (360, N'PAZARYOLU', 25)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (361, N'ŞENKAYA', 25)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (362, N'TEKMAN', 25)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (363, N'TORTUM', 25)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (364, N'UZUNDERE', 25)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (365, N'YAKUTİYE', 25)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (366, N'ALPU', 26)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (367, N'BEYLİKOVA', 26)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (368, N'ÇİFTELER', 26)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (369, N'GÜNYÜZÜ', 26)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (370, N'HAN', 26)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (371, N'İNÖNÜ', 26)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (372, N'MAHMUDİYE', 26)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (373, N'MİHALGAZİ', 26)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (374, N'MİHALIÇÇIK', 26)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (375, N'ODUNPAZARI', 26)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (376, N'SARICAKAYA', 26)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (377, N'SEYİTGAZİ', 26)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (378, N'SİVRİHİSAR', 26)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (379, N'TEPEBAŞI', 26)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (380, N'ARABAN', 27)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (381, N'İSLAHİYE', 27)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (382, N'KARKAMIŞ', 27)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (383, N'NİZİP', 27)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (384, N'NURDAĞI', 27)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (385, N'OĞUZELİ', 27)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (386, N'ŞAHİNBEY', 27)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (387, N'ŞEHİTKAMİL', 27)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (388, N'YAVUZELİ', 27)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (389, N'ALUCRA', 28)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (390, N'BULANCAK', 28)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (391, N'ÇAMOLUK', 28)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (392, N'ÇANAKÇI', 28)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (393, N'DERELİ', 28)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (394, N'DOĞANKENT', 28)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (395, N'ESPİYE', 28)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (396, N'EYNESİL', 28)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (397, N'GÖRELE', 28)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (398, N'GÜCE', 28)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (399, N'KEŞAP', 28)
GO
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (400, N'MERKEZ', 28)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (401, N'PİRAZİZ', 28)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (402, N'ŞEBİNKARAHİSAR', 28)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (403, N'TİREBOLU', 28)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (404, N'YAĞLIDERE', 28)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (405, N'KELKİT', 29)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (406, N'KÖSE', 29)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (407, N'KÜRTÜN', 29)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (408, N'MERKEZ', 29)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (409, N'ŞİRAN', 29)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (410, N'TORUL', 29)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (411, N'ÇUKURCA', 30)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (412, N'DERECİK', 30)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (413, N'MERKEZ', 30)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (414, N'ŞEMDİNLİ', 30)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (415, N'YÜKSEKOVA', 30)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (416, N'ALTINÖZÜ', 31)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (417, N'ANTAKYA', 31)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (418, N'ARSUZ', 31)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (419, N'BELEN', 31)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (420, N'DEFNE', 31)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (421, N'DÖRTYOL', 31)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (422, N'ERZİN', 31)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (423, N'HASSA', 31)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (424, N'İSKENDERUN', 31)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (425, N'KIRIKHAN', 31)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (426, N'KUMLU', 31)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (427, N'PAYAS', 31)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (428, N'REYHANLI', 31)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (429, N'SAMANDAĞ', 31)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (430, N'YAYLADAĞI', 31)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (431, N'ARALIK', 76)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (432, N'KARAKOYUNLU', 76)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (433, N'MERKEZ', 76)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (434, N'TUZLUCA', 76)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (435, N'AKSU', 32)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (436, N'ATABEY', 32)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (437, N'EĞİRDİR', 32)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (438, N'GELENDOST', 32)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (439, N'GÖNEN', 32)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (440, N'KEÇİBORLU', 32)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (441, N'MERKEZ', 32)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (442, N'SENİRKENT', 32)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (443, N'SÜTÇÜLER', 32)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (444, N'ŞARKİKARAAĞAÇ', 32)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (445, N'ULUBORLU', 32)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (446, N'YALVAÇ', 32)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (447, N'YENİŞARBADEMLİ', 32)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (448, N'ADALAR', 34)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (449, N'ARNAVUTKÖY', 34)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (450, N'ATAŞEHİR', 34)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (451, N'AVCILAR', 34)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (452, N'BAĞCILAR', 34)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (453, N'BAHÇELİEVLER', 34)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (454, N'BAKIRKÖY', 34)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (455, N'BAŞAKŞEHİR', 34)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (456, N'BAYRAMPAŞA', 34)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (457, N'BEŞİKTAŞ', 34)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (458, N'BEYKOZ', 34)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (459, N'BEYLİKDÜZÜ', 34)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (460, N'BEYOĞLU', 34)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (461, N'BÜYÜKÇEKMECE', 34)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (462, N'ÇATALCA', 34)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (463, N'ÇEKMEKÖY', 34)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (464, N'ESENLER', 34)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (465, N'ESENYURT', 34)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (466, N'EYÜPSULTAN', 34)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (467, N'FATİH', 34)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (468, N'GAZİOSMANPAŞA', 34)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (469, N'GÜNGÖREN', 34)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (470, N'KADIKÖY', 34)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (471, N'KAĞITHANE', 34)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (472, N'KARTAL', 34)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (473, N'KÜÇÜKÇEKMECE', 34)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (474, N'MALTEPE', 34)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (475, N'PENDİK', 34)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (476, N'SANCAKTEPE', 34)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (477, N'SARIYER', 34)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (478, N'SİLİVRİ', 34)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (479, N'SULTANBEYLİ', 34)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (480, N'SULTANGAZİ', 34)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (481, N'ŞİLE', 34)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (482, N'ŞİŞLİ', 34)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (483, N'TUZLA', 34)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (484, N'ÜMRANİYE', 34)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (485, N'ÜSKÜDAR', 34)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (486, N'ZEYTİNBURNU', 34)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (487, N'ALİAĞA', 35)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (488, N'BALÇOVA', 35)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (489, N'BAYINDIR', 35)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (490, N'BAYRAKLI', 35)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (491, N'BERGAMA', 35)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (492, N'BEYDAĞ', 35)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (493, N'BORNOVA', 35)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (494, N'BUCA', 35)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (495, N'ÇEŞME', 35)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (496, N'ÇİĞLİ', 35)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (497, N'DİKİLİ', 35)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (498, N'FOÇA', 35)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (499, N'GAZİEMİR', 35)
GO
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (500, N'GÜZELBAHÇE', 35)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (501, N'KARABAĞLAR', 35)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (502, N'KARABURUN', 35)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (503, N'KARŞIYAKA', 35)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (504, N'KEMALPAŞA', 35)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (505, N'KINIK', 35)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (506, N'KİRAZ', 35)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (507, N'KONAK', 35)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (508, N'MENDERES', 35)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (509, N'MENEMEN', 35)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (510, N'NARLIDERE', 35)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (511, N'ÖDEMİŞ', 35)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (512, N'SEFERİHİSAR', 35)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (513, N'SELÇUK', 35)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (514, N'TİRE', 35)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (515, N'TORBALI', 35)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (516, N'URLA', 35)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (517, N'AFŞİN', 46)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (518, N'ANDIRIN', 46)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (519, N'ÇAĞLAYANCERİT', 46)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (520, N'DULKADİROĞLU', 46)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (521, N'EKİNÖZÜ', 46)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (522, N'ELBİSTAN', 46)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (523, N'GÖKSUN', 46)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (524, N'NURHAK', 46)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (525, N'ONİKİŞUBAT', 46)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (526, N'PAZARCIK', 46)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (527, N'TÜRKOĞLU', 46)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (528, N'EFLANİ', 78)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (529, N'ESKİPAZAR', 78)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (530, N'MERKEZ', 78)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (531, N'OVACIK', 78)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (532, N'SAFRANBOLU', 78)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (533, N'YENİCE', 78)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (534, N'AYRANCI', 70)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (535, N'BAŞYAYLA', 70)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (536, N'ERMENEK', 70)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (537, N'KAZIMKARABEKİR', 70)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (538, N'MERKEZ', 70)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (539, N'SARIVELİLER', 70)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (540, N'AKYAKA', 36)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (541, N'ARPAÇAY', 36)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (542, N'DİGOR', 36)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (543, N'KAĞIZMAN', 36)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (544, N'MERKEZ', 36)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (545, N'SARIKAMIŞ', 36)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (546, N'SELİM', 36)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (547, N'SUSUZ', 36)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (548, N'ABANA', 37)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (549, N'AĞLI', 37)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (550, N'ARAÇ', 37)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (551, N'AZDAVAY', 37)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (552, N'BOZKURT', 37)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (553, N'CİDE', 37)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (554, N'ÇATALZEYTİN', 37)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (555, N'DADAY', 37)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (556, N'DEVREKANİ', 37)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (557, N'DOĞANYURT', 37)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (558, N'HANÖNÜ', 37)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (559, N'İHSANGAZİ', 37)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (560, N'İNEBOLU', 37)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (561, N'KÜRE', 37)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (562, N'MERKEZ', 37)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (563, N'PINARBAŞI', 37)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (564, N'SEYDİLER', 37)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (565, N'ŞENPAZAR', 37)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (566, N'TAŞKÖPRÜ', 37)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (567, N'TOSYA', 37)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (568, N'AKKIŞLA', 38)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (569, N'BÜNYAN', 38)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (570, N'DEVELİ', 38)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (571, N'FELAHİYE', 38)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (572, N'HACILAR', 38)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (573, N'İNCESU', 38)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (574, N'KOCASİNAN', 38)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (575, N'MELİKGAZİ', 38)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (576, N'ÖZVATAN', 38)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (577, N'PINARBAŞI', 38)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (578, N'SARIOĞLAN', 38)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (579, N'SARIZ', 38)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (580, N'TALAS', 38)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (581, N'TOMARZA', 38)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (582, N'YAHYALI', 38)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (583, N'YEŞİLHİSAR', 38)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (584, N'BAHŞILI', 71)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (585, N'BALIŞEYH', 71)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (586, N'ÇELEBİ', 71)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (587, N'DELİCE', 71)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (588, N'KARAKEÇİLİ', 71)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (589, N'KESKİN', 71)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (590, N'MERKEZ', 71)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (591, N'SULAKYURT', 71)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (592, N'YAHŞİHAN', 71)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (593, N'BABAESKİ', 39)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (594, N'DEMİRKÖY', 39)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (595, N'KOFÇAZ', 39)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (596, N'LÜLEBURGAZ', 39)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (597, N'MERKEZ', 39)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (598, N'PEHLİVANKÖY', 39)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (599, N'PINARHİSAR', 39)
GO
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (600, N'VİZE', 39)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (601, N'AKÇAKENT', 40)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (602, N'AKPINAR', 40)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (603, N'BOZTEPE', 40)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (604, N'ÇİÇEKDAĞI', 40)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (605, N'KAMAN', 40)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (606, N'MERKEZ', 40)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (607, N'MUCUR', 40)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (608, N'ELBEYLİ', 79)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (609, N'MERKEZ', 79)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (610, N'MUSABEYLİ', 79)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (611, N'POLATELİ', 79)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (612, N'BAŞİSKELE', 41)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (613, N'ÇAYIROVA', 41)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (614, N'DARICA', 41)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (615, N'DERİNCE', 41)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (616, N'DİLOVASI', 41)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (617, N'GEBZE', 41)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (618, N'GÖLCÜK', 41)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (619, N'İZMİT', 41)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (620, N'KANDIRA', 41)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (621, N'KARAMÜRSEL', 41)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (622, N'KARTEPE', 41)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (623, N'KÖRFEZ', 41)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (624, N'AHIRLI', 42)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (625, N'AKÖREN', 42)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (626, N'AKŞEHİR', 42)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (627, N'ALTINEKİN', 42)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (628, N'BEYŞEHİR', 42)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (629, N'BOZKIR', 42)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (630, N'CİHANBEYLİ', 42)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (631, N'ÇELTİK', 42)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (632, N'ÇUMRA', 42)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (633, N'DERBENT', 42)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (634, N'DEREBUCAK', 42)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (635, N'DOĞANHİSAR', 42)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (636, N'EMİRGAZİ', 42)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (637, N'EREĞLİ', 42)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (638, N'GÜNEYSINIR', 42)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (639, N'HADİM', 42)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (640, N'HALKAPINAR', 42)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (641, N'HÜYÜK', 42)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (642, N'ILGIN', 42)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (643, N'KADINHANI', 42)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (644, N'KARAPINAR', 42)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (645, N'KARATAY', 42)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (646, N'KULU', 42)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (647, N'MERAM', 42)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (648, N'SARAYÖNÜ', 42)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (649, N'SELÇUKLU', 42)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (650, N'SEYDİŞEHİR', 42)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (651, N'TAŞKENT', 42)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (652, N'TUZLUKÇU', 42)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (653, N'YALIHÜYÜK', 42)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (654, N'YUNAK', 42)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (655, N'ALTINTAŞ', 43)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (656, N'ASLANAPA', 43)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (657, N'ÇAVDARHİSAR', 43)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (658, N'DOMANİÇ', 43)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (659, N'DUMLUPINAR', 43)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (660, N'EMET', 43)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (661, N'GEDİZ', 43)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (662, N'HİSARCIK', 43)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (663, N'MERKEZ', 43)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (664, N'PAZARLAR', 43)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (665, N'SİMAV', 43)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (666, N'ŞAPHANE', 43)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (667, N'TAVŞANLI', 43)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (668, N'AKÇADAĞ', 44)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (669, N'ARAPGİR', 44)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (670, N'ARGUVAN', 44)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (671, N'BATTALGAZİ', 44)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (672, N'DARENDE', 44)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (673, N'DOĞANŞEHİR', 44)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (674, N'DOĞANYOL', 44)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (675, N'HEKİMHAN', 44)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (676, N'KALE', 44)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (677, N'KULUNCAK', 44)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (678, N'PÜTÜRGE', 44)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (679, N'YAZIHAN', 44)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (680, N'YEŞİLYURT', 44)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (681, N'AHMETLİ', 45)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (682, N'AKHİSAR', 45)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (683, N'ALAŞEHİR', 45)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (684, N'DEMİRCİ', 45)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (685, N'GÖLMARMARA', 45)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (686, N'GÖRDES', 45)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (687, N'KIRKAĞAÇ', 45)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (688, N'KÖPRÜBAŞI', 45)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (689, N'KULA', 45)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (690, N'SALİHLİ', 45)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (691, N'SARIGÖL', 45)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (692, N'SARUHANLI', 45)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (693, N'SELENDİ', 45)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (694, N'SOMA', 45)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (695, N'ŞEHZADELER', 45)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (696, N'TURGUTLU', 45)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (697, N'YUNUSEMRE', 45)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (698, N'ARTUKLU', 47)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (699, N'DARGEÇİT', 47)
GO
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (700, N'DERİK', 47)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (701, N'KIZILTEPE', 47)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (702, N'MAZIDAĞI', 47)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (703, N'MİDYAT', 47)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (704, N'NUSAYBİN', 47)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (705, N'ÖMERLİ', 47)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (706, N'SAVUR', 47)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (707, N'YEŞİLLİ', 47)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (708, N'AKDENİZ', 33)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (709, N'ANAMUR', 33)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (710, N'AYDINCIK', 33)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (711, N'BOZYAZI', 33)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (712, N'ÇAMLIYAYLA', 33)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (713, N'ERDEMLİ', 33)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (714, N'GÜLNAR', 33)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (715, N'MEZİTLİ', 33)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (716, N'MUT', 33)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (717, N'SİLİFKE', 33)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (718, N'TARSUS', 33)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (719, N'TOROSLAR', 33)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (720, N'YENİŞEHİR', 33)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (721, N'BODRUM', 48)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (722, N'DALAMAN', 48)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (723, N'DATÇA', 48)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (724, N'FETHİYE', 48)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (725, N'KAVAKLIDERE', 48)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (726, N'KÖYCEĞİZ', 48)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (727, N'MARMARİS', 48)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (728, N'MENTEŞE', 48)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (729, N'MİLAS', 48)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (730, N'ORTACA', 48)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (731, N'SEYDİKEMER', 48)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (732, N'ULA', 48)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (733, N'YATAĞAN', 48)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (734, N'BULANIK', 49)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (735, N'HASKÖY', 49)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (736, N'KORKUT', 49)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (737, N'MALAZGİRT', 49)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (738, N'MERKEZ', 49)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (739, N'VARTO', 49)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (740, N'ACIGÖL', 50)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (741, N'AVANOS', 50)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (742, N'DERİNKUYU', 50)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (743, N'GÜLŞEHİR', 50)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (744, N'HACIBEKTAŞ', 50)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (745, N'KOZAKLI', 50)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (746, N'MERKEZ', 50)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (747, N'ÜRGÜP', 50)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (748, N'ALTUNHİSAR', 51)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (749, N'BOR', 51)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (750, N'ÇAMARDI', 51)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (751, N'ÇİFTLİK', 51)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (752, N'MERKEZ', 51)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (753, N'ULUKIŞLA', 51)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (754, N'AKKUŞ', 52)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (755, N'ALTINORDU', 52)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (756, N'AYBASTI', 52)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (757, N'ÇAMAŞ', 52)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (758, N'ÇATALPINAR', 52)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (759, N'ÇAYBAŞI', 52)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (760, N'FATSA', 52)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (761, N'GÖLKÖY', 52)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (762, N'GÜLYALI', 52)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (763, N'GÜRGENTEPE', 52)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (764, N'İKİZCE', 52)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (765, N'KABADÜZ', 52)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (766, N'KABATAŞ', 52)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (767, N'KORGAN', 52)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (768, N'KUMRU', 52)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (769, N'MESUDİYE', 52)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (770, N'PERŞEMBE', 52)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (771, N'ULUBEY', 52)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (772, N'ÜNYE', 52)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (773, N'BAHÇE', 80)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (774, N'DÜZİÇİ', 80)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (775, N'HASANBEYLİ', 80)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (776, N'KADİRLİ', 80)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (777, N'MERKEZ', 80)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (778, N'SUMBAS', 80)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (779, N'TOPRAKKALE', 80)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (780, N'ARDEŞEN', 53)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (781, N'ÇAMLIHEMŞİN', 53)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (782, N'ÇAYELİ', 53)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (783, N'DEREPAZARI', 53)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (784, N'FINDIKLI', 53)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (785, N'GÜNEYSU', 53)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (786, N'HEMŞİN', 53)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (787, N'İKİZDERE', 53)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (788, N'İYİDERE', 53)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (789, N'KALKANDERE', 53)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (790, N'MERKEZ', 53)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (791, N'PAZAR', 53)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (792, N'ADAPAZARI', 54)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (793, N'AKYAZI', 54)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (794, N'ARİFİYE', 54)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (795, N'ERENLER', 54)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (796, N'FERİZLİ', 54)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (797, N'GEYVE', 54)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (798, N'HENDEK', 54)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (799, N'KARAPÜRÇEK', 54)
GO
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (800, N'KARASU', 54)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (801, N'KAYNARCA', 54)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (802, N'KOCAALİ', 54)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (803, N'PAMUKOVA', 54)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (804, N'SAPANCA', 54)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (805, N'SERDİVAN', 54)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (806, N'SÖĞÜTLÜ', 54)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (807, N'TARAKLI', 54)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (808, N'19 MAYIS', 55)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (809, N'ALAÇAM', 55)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (810, N'ASARCIK', 55)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (811, N'ATAKUM', 55)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (812, N'AYVACIK', 55)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (813, N'BAFRA', 55)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (814, N'CANİK', 55)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (815, N'ÇARŞAMBA', 55)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (816, N'HAVZA', 55)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (817, N'İLKADIM', 55)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (818, N'KAVAK', 55)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (819, N'LADİK', 55)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (820, N'SALIPAZARI', 55)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (821, N'TEKKEKÖY', 55)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (822, N'TERME', 55)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (823, N'VEZİRKÖPRÜ', 55)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (824, N'YAKAKENT', 55)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (825, N'BAYKAN', 56)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (826, N'ERUH', 56)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (827, N'KURTALAN', 56)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (828, N'MERKEZ', 56)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (829, N'PERVARİ', 56)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (830, N'ŞİRVAN', 56)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (831, N'TİLLO', 56)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (832, N'AYANCIK', 57)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (833, N'BOYABAT', 57)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (834, N'DİKMEN', 57)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (835, N'DURAĞAN', 57)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (836, N'ERFELEK', 57)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (837, N'GERZE', 57)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (838, N'MERKEZ', 57)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (839, N'SARAYDÜZÜ', 57)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (840, N'TÜRKELİ', 57)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (841, N'AKINCILAR', 58)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (842, N'ALTINYAYLA', 58)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (843, N'DİVRİĞİ', 58)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (844, N'DOĞANŞAR', 58)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (845, N'GEMEREK', 58)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (846, N'GÖLOVA', 58)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (847, N'GÜRÜN', 58)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (848, N'HAFİK', 58)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (849, N'İMRANLI', 58)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (850, N'KANGAL', 58)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (851, N'KOYULHİSAR', 58)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (852, N'MERKEZ', 58)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (853, N'SUŞEHRİ', 58)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (854, N'ŞARKIŞLA', 58)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (855, N'ULAŞ', 58)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (856, N'YILDIZELİ', 58)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (857, N'ZARA', 58)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (858, N'AKÇAKALE', 63)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (859, N'BİRECİK', 63)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (860, N'BOZOVA', 63)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (861, N'CEYLANPINAR', 63)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (862, N'EYYÜBİYE', 63)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (863, N'HALFETİ', 63)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (864, N'HALİLİYE', 63)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (865, N'HARRAN', 63)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (866, N'HİLVAN', 63)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (867, N'KARAKÖPRÜ', 63)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (868, N'SİVEREK', 63)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (869, N'SURUÇ', 63)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (870, N'VİRANŞEHİR', 63)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (871, N'BEYTÜŞŞEBAP', 73)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (872, N'CİZRE', 73)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (873, N'GÜÇLÜKONAK', 73)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (874, N'İDİL', 73)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (875, N'MERKEZ', 73)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (876, N'SİLOPİ', 73)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (877, N'ULUDERE', 73)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (878, N'ÇERKEZKÖY', 59)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (879, N'ÇORLU', 59)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (880, N'ERGENE', 59)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (881, N'HAYRABOLU', 59)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (882, N'KAPAKLI', 59)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (883, N'MALKARA', 59)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (884, N'MARMARAEREĞLİSİ', 59)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (885, N'MURATLI', 59)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (886, N'SARAY', 59)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (887, N'SÜLEYMANPAŞA', 59)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (888, N'ŞARKÖY', 59)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (889, N'ALMUS', 60)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (890, N'ARTOVA', 60)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (891, N'BAŞÇİFTLİK', 60)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (892, N'ERBAA', 60)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (893, N'MERKEZ', 60)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (894, N'NİKSAR', 60)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (895, N'PAZAR', 60)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (896, N'REŞADİYE', 60)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (897, N'SULUSARAY', 60)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (898, N'TURHAL', 60)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (899, N'YEŞİLYURT', 60)
GO
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (900, N'ZİLE', 60)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (901, N'AKÇAABAT', 61)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (902, N'ARAKLI', 61)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (903, N'ARSİN', 61)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (904, N'BEŞİKDÜZÜ', 61)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (905, N'ÇARŞIBAŞI', 61)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (906, N'ÇAYKARA', 61)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (907, N'DERNEKPAZARI', 61)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (908, N'DÜZKÖY', 61)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (909, N'HAYRAT', 61)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (910, N'KÖPRÜBAŞI', 61)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (911, N'MAÇKA', 61)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (912, N'OF', 61)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (913, N'ORTAHİSAR', 61)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (914, N'SÜRMENE', 61)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (915, N'ŞALPAZARI', 61)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (916, N'TONYA', 61)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (917, N'VAKFIKEBİR', 61)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (918, N'YOMRA', 61)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (919, N'ÇEMİŞGEZEK', 62)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (920, N'HOZAT', 62)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (921, N'MAZGİRT', 62)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (922, N'MERKEZ', 62)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (923, N'NAZIMİYE', 62)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (924, N'OVACIK', 62)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (925, N'PERTEK', 62)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (926, N'PÜLÜMÜR', 62)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (927, N'BANAZ', 64)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (928, N'EŞME', 64)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (929, N'KARAHALLI', 64)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (930, N'MERKEZ', 64)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (931, N'SİVASLI', 64)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (932, N'ULUBEY', 64)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (933, N'BAHÇESARAY', 65)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (934, N'BAŞKALE', 65)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (935, N'ÇALDIRAN', 65)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (936, N'ÇATAK', 65)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (937, N'EDREMİT', 65)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (938, N'ERCİŞ', 65)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (939, N'GEVAŞ', 65)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (940, N'GÜRPINAR', 65)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (941, N'İPEKYOLU', 65)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (942, N'MURADİYE', 65)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (943, N'ÖZALP', 65)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (944, N'SARAY', 65)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (945, N'TUŞBA', 65)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (946, N'ALTINOVA', 77)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (947, N'ARMUTLU', 77)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (948, N'ÇINARCIK', 77)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (949, N'ÇİFTLİKKÖY', 77)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (950, N'MERKEZ', 77)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (951, N'TERMAL', 77)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (952, N'AKDAĞMADENİ', 66)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (953, N'AYDINCIK', 66)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (954, N'BOĞAZLIYAN', 66)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (955, N'ÇANDIR', 66)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (956, N'ÇAYIRALAN', 66)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (957, N'ÇEKEREK', 66)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (958, N'KADIŞEHRİ', 66)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (959, N'MERKEZ', 66)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (960, N'SARAYKENT', 66)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (961, N'SARIKAYA', 66)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (962, N'SORGUN', 66)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (963, N'ŞEFAATLİ', 66)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (964, N'YENİFAKILI', 66)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (965, N'YERKÖY', 66)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (966, N'ALAPLI', 67)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (967, N'ÇAYCUMA', 67)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (968, N'DEVREK', 67)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (969, N'EREĞLİ', 67)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (970, N'GÖKÇEBEY', 67)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (971, N'KİLİMLİ', 67)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (972, N'KOZLU', 67)
INSERT [dbo].[tblIlce] ([ilce_id], [Ilce_ad], [IlKod]) VALUES (973, N'MERKEZ', 67)
SET IDENTITY_INSERT [dbo].[tblIlce] OFF
GO
SET IDENTITY_INSERT [dbo].[tblMusteri] ON 

INSERT [dbo].[tblMusteri] ([musteri_id], [musteri_ad], [musteri_soyad], [musteri_dogumTarihi], [musteri_TC], [musteri_cinsiyet], [musteri_email], [musteri_telefon], [IlKodu], [IlceKodu], [Musterituru_id]) VALUES (1, N'Ahmet', N'Yılmaz', CAST(N'1990-01-01' AS Date), N'22345678901', N'Erkek', N'ahmet@example.com', N'5555555555', 1, 1, 1)
INSERT [dbo].[tblMusteri] ([musteri_id], [musteri_ad], [musteri_soyad], [musteri_dogumTarihi], [musteri_TC], [musteri_cinsiyet], [musteri_email], [musteri_telefon], [IlKodu], [IlceKodu], [Musterituru_id]) VALUES (2, N'Ayşe', N'Demir', CAST(N'1992-05-26' AS Date), N'23456789012', N'Kadın', N'ayse@example.com', N'5555555556', 2, 2, 2)
INSERT [dbo].[tblMusteri] ([musteri_id], [musteri_ad], [musteri_soyad], [musteri_dogumTarihi], [musteri_TC], [musteri_cinsiyet], [musteri_email], [musteri_telefon], [IlKodu], [IlceKodu], [Musterituru_id]) VALUES (3, N'Mehmet', N'Kaya', CAST(N'1988-12-15' AS Date), N'34567890123', N'Erkek', N'mehmet@example.com', N'5555555557', 3, 1, 1)
INSERT [dbo].[tblMusteri] ([musteri_id], [musteri_ad], [musteri_soyad], [musteri_dogumTarihi], [musteri_TC], [musteri_cinsiyet], [musteri_email], [musteri_telefon], [IlKodu], [IlceKodu], [Musterituru_id]) VALUES (4, N'Fatma', N'Şahin', CAST(N'1995-07-18' AS Date), N'45678901234', N'Kadın', N'fatma@example.com', N'5555555558', 4, 2, 2)
INSERT [dbo].[tblMusteri] ([musteri_id], [musteri_ad], [musteri_soyad], [musteri_dogumTarihi], [musteri_TC], [musteri_cinsiyet], [musteri_email], [musteri_telefon], [IlKodu], [IlceKodu], [Musterituru_id]) VALUES (5, N'Ali', N'Çelik', CAST(N'1991-03-05' AS Date), N'56789012345', N'Erkek', N'ali@example.com', N'5555555559', 5, 3, 3)
INSERT [dbo].[tblMusteri] ([musteri_id], [musteri_ad], [musteri_soyad], [musteri_dogumTarihi], [musteri_TC], [musteri_cinsiyet], [musteri_email], [musteri_telefon], [IlKodu], [IlceKodu], [Musterituru_id]) VALUES (6, N'Zeynep', N'Koç', CAST(N'1989-09-09' AS Date), N'67890123456', N'Kadın', N'zeynep@example.com', N'5555555560', 6, 4, 4)
INSERT [dbo].[tblMusteri] ([musteri_id], [musteri_ad], [musteri_soyad], [musteri_dogumTarihi], [musteri_TC], [musteri_cinsiyet], [musteri_email], [musteri_telefon], [IlKodu], [IlceKodu], [Musterituru_id]) VALUES (7, N'Mustafa', N'Öztürk', CAST(N'1987-06-21' AS Date), N'78901234567', N'Erkek', N'mustafa@example.com', N'5555555561', 7, 5, 5)
INSERT [dbo].[tblMusteri] ([musteri_id], [musteri_ad], [musteri_soyad], [musteri_dogumTarihi], [musteri_TC], [musteri_cinsiyet], [musteri_email], [musteri_telefon], [IlKodu], [IlceKodu], [Musterituru_id]) VALUES (8, N'Aysel', N'Aydın', CAST(N'1993-02-10' AS Date), N'89012345678', N'Kadın', N'aysel@example.com', N'5555555562', 8, 6, 6)
INSERT [dbo].[tblMusteri] ([musteri_id], [musteri_ad], [musteri_soyad], [musteri_dogumTarihi], [musteri_TC], [musteri_cinsiyet], [musteri_email], [musteri_telefon], [IlKodu], [IlceKodu], [Musterituru_id]) VALUES (9, N'Emre', N'Kurt', CAST(N'1994-11-28' AS Date), N'90123456789', N'Erkek', N'emre@example.com', N'5555555563', 9, 7, 7)
INSERT [dbo].[tblMusteri] ([musteri_id], [musteri_ad], [musteri_soyad], [musteri_dogumTarihi], [musteri_TC], [musteri_cinsiyet], [musteri_email], [musteri_telefon], [IlKodu], [IlceKodu], [Musterituru_id]) VALUES (10, N'Seda', N'Yıldırım', CAST(N'1996-08-14' AS Date), N'01234567890', N'Kadın', N'seda@example.com', N'5555555564', 10, 8, 8)
SET IDENTITY_INSERT [dbo].[tblMusteri] OFF
GO
SET IDENTITY_INSERT [dbo].[tblMusteri_Otel] ON 

INSERT [dbo].[tblMusteri_Otel] ([musteri_otel_id], [musteri_id], [otel_id], [yorum], [yorumtarihi]) VALUES (1, 1, 1, N'Harika bir otel!', CAST(N'2022-05-01' AS Date))
INSERT [dbo].[tblMusteri_Otel] ([musteri_otel_id], [musteri_id], [otel_id], [yorum], [yorumtarihi]) VALUES (2, 2, 1, N'Çok memnun kaldım.', CAST(N'2022-05-02' AS Date))
INSERT [dbo].[tblMusteri_Otel] ([musteri_otel_id], [musteri_id], [otel_id], [yorum], [yorumtarihi]) VALUES (3, 3, 1, N'Personel çok ilgili.', CAST(N'2022-05-03' AS Date))
INSERT [dbo].[tblMusteri_Otel] ([musteri_otel_id], [musteri_id], [otel_id], [yorum], [yorumtarihi]) VALUES (4, 4, 2, N'Otel konumu mükemmel.', CAST(N'2023-05-04' AS Date))
INSERT [dbo].[tblMusteri_Otel] ([musteri_otel_id], [musteri_id], [otel_id], [yorum], [yorumtarihi]) VALUES (5, 5, 2, N'Odalardaki temizlik iyiydi.', CAST(N'2023-05-05' AS Date))
INSERT [dbo].[tblMusteri_Otel] ([musteri_otel_id], [musteri_id], [otel_id], [yorum], [yorumtarihi]) VALUES (6, 6, 2, N'Hizmet beklentilerimi karşıladı.', CAST(N'2023-05-06' AS Date))
INSERT [dbo].[tblMusteri_Otel] ([musteri_otel_id], [musteri_id], [otel_id], [yorum], [yorumtarihi]) VALUES (7, 7, 3, N'Tatilim harika geçti.', CAST(N'2022-05-07' AS Date))
INSERT [dbo].[tblMusteri_Otel] ([musteri_otel_id], [musteri_id], [otel_id], [yorum], [yorumtarihi]) VALUES (8, 8, 3, N'Kahvaltı lezzetliydi.', CAST(N'2023-05-08' AS Date))
INSERT [dbo].[tblMusteri_Otel] ([musteri_otel_id], [musteri_id], [otel_id], [yorum], [yorumtarihi]) VALUES (9, 9, 3, N'Havuz keyfi muhteşemdi.', CAST(N'2023-05-09' AS Date))
INSERT [dbo].[tblMusteri_Otel] ([musteri_otel_id], [musteri_id], [otel_id], [yorum], [yorumtarihi]) VALUES (10, 10, 1, N'Tekrar tercih edeceğim.', CAST(N'2023-05-10' AS Date))
SET IDENTITY_INSERT [dbo].[tblMusteri_Otel] OFF
GO
SET IDENTITY_INSERT [dbo].[tblMusteri_Rezervasyon] ON 

INSERT [dbo].[tblMusteri_Rezervasyon] ([musteri_rezervasyon_id], [musteri_id], [rezervasyon_id]) VALUES (1, 1, 1)
INSERT [dbo].[tblMusteri_Rezervasyon] ([musteri_rezervasyon_id], [musteri_id], [rezervasyon_id]) VALUES (2, 2, 2)
INSERT [dbo].[tblMusteri_Rezervasyon] ([musteri_rezervasyon_id], [musteri_id], [rezervasyon_id]) VALUES (3, 3, 3)
INSERT [dbo].[tblMusteri_Rezervasyon] ([musteri_rezervasyon_id], [musteri_id], [rezervasyon_id]) VALUES (4, 4, 4)
INSERT [dbo].[tblMusteri_Rezervasyon] ([musteri_rezervasyon_id], [musteri_id], [rezervasyon_id]) VALUES (5, 5, 5)
INSERT [dbo].[tblMusteri_Rezervasyon] ([musteri_rezervasyon_id], [musteri_id], [rezervasyon_id]) VALUES (6, 6, 6)
INSERT [dbo].[tblMusteri_Rezervasyon] ([musteri_rezervasyon_id], [musteri_id], [rezervasyon_id]) VALUES (7, 7, 7)
INSERT [dbo].[tblMusteri_Rezervasyon] ([musteri_rezervasyon_id], [musteri_id], [rezervasyon_id]) VALUES (8, 8, 8)
INSERT [dbo].[tblMusteri_Rezervasyon] ([musteri_rezervasyon_id], [musteri_id], [rezervasyon_id]) VALUES (9, 9, 9)
INSERT [dbo].[tblMusteri_Rezervasyon] ([musteri_rezervasyon_id], [musteri_id], [rezervasyon_id]) VALUES (10, 10, 10)
SET IDENTITY_INSERT [dbo].[tblMusteri_Rezervasyon] OFF
GO
SET IDENTITY_INSERT [dbo].[tblMusteriTuru] ON 

INSERT [dbo].[tblMusteriTuru] ([musterituru_id], [musterituru_ad]) VALUES (1, N'Bireysel')
INSERT [dbo].[tblMusteriTuru] ([musterituru_id], [musterituru_ad]) VALUES (2, N'Kurumsal')
INSERT [dbo].[tblMusteriTuru] ([musterituru_id], [musterituru_ad]) VALUES (3, N'Acenta')
INSERT [dbo].[tblMusteriTuru] ([musterituru_id], [musterituru_ad]) VALUES (4, N'Grup')
INSERT [dbo].[tblMusteriTuru] ([musterituru_id], [musterituru_ad]) VALUES (5, N'Öğrenci')
INSERT [dbo].[tblMusteriTuru] ([musterituru_id], [musterituru_ad]) VALUES (6, N'Misafir')
INSERT [dbo].[tblMusteriTuru] ([musterituru_id], [musterituru_ad]) VALUES (7, N'Tatil Köyü')
INSERT [dbo].[tblMusteriTuru] ([musterituru_id], [musterituru_ad]) VALUES (8, N'SPA Merkezi')
INSERT [dbo].[tblMusteriTuru] ([musterituru_id], [musterituru_ad]) VALUES (9, N'Balayı')
INSERT [dbo].[tblMusteriTuru] ([musterituru_id], [musterituru_ad]) VALUES (10, N'Toplantı')
INSERT [dbo].[tblMusteriTuru] ([musterituru_id], [musterituru_ad]) VALUES (11, N'Düğün')
INSERT [dbo].[tblMusteriTuru] ([musterituru_id], [musterituru_ad]) VALUES (12, N'Resmi')
INSERT [dbo].[tblMusteriTuru] ([musterituru_id], [musterituru_ad]) VALUES (13, N'Özel')
INSERT [dbo].[tblMusteriTuru] ([musterituru_id], [musterituru_ad]) VALUES (14, N'Kongre')
INSERT [dbo].[tblMusteriTuru] ([musterituru_id], [musterituru_ad]) VALUES (15, N'Seminer')
INSERT [dbo].[tblMusteriTuru] ([musterituru_id], [musterituru_ad]) VALUES (16, N'Sağlık')
INSERT [dbo].[tblMusteriTuru] ([musterituru_id], [musterituru_ad]) VALUES (17, N'Fitness')
INSERT [dbo].[tblMusteriTuru] ([musterituru_id], [musterituru_ad]) VALUES (18, N'Aile')
INSERT [dbo].[tblMusteriTuru] ([musterituru_id], [musterituru_ad]) VALUES (19, N'Evcil Hayvan')
INSERT [dbo].[tblMusteriTuru] ([musterituru_id], [musterituru_ad]) VALUES (20, N'Yabancı')
SET IDENTITY_INSERT [dbo].[tblMusteriTuru] OFF
GO
SET IDENTITY_INSERT [dbo].[tblOda] ON 

INSERT [dbo].[tblOda] ([oda_id], [oda_numara], [oda_dolulukDurumu], [odaturu_id]) VALUES (1, N'101', N'Boş', 1)
INSERT [dbo].[tblOda] ([oda_id], [oda_numara], [oda_dolulukDurumu], [odaturu_id]) VALUES (2, N'102', N'Dolu', 2)
INSERT [dbo].[tblOda] ([oda_id], [oda_numara], [oda_dolulukDurumu], [odaturu_id]) VALUES (3, N'103', N'Boş', 1)
INSERT [dbo].[tblOda] ([oda_id], [oda_numara], [oda_dolulukDurumu], [odaturu_id]) VALUES (4, N'104', N'Boş', 1)
INSERT [dbo].[tblOda] ([oda_id], [oda_numara], [oda_dolulukDurumu], [odaturu_id]) VALUES (5, N'105', N'Dolu', 2)
INSERT [dbo].[tblOda] ([oda_id], [oda_numara], [oda_dolulukDurumu], [odaturu_id]) VALUES (6, N'106', N'Boş', 1)
INSERT [dbo].[tblOda] ([oda_id], [oda_numara], [oda_dolulukDurumu], [odaturu_id]) VALUES (7, N'107', N'Dolu', 2)
INSERT [dbo].[tblOda] ([oda_id], [oda_numara], [oda_dolulukDurumu], [odaturu_id]) VALUES (8, N'108', N'Boş', 1)
INSERT [dbo].[tblOda] ([oda_id], [oda_numara], [oda_dolulukDurumu], [odaturu_id]) VALUES (9, N'109', N'Boş', 1)
INSERT [dbo].[tblOda] ([oda_id], [oda_numara], [oda_dolulukDurumu], [odaturu_id]) VALUES (10, N'110', N'Dolu', 2)
INSERT [dbo].[tblOda] ([oda_id], [oda_numara], [oda_dolulukDurumu], [odaturu_id]) VALUES (11, N'111', N'Dolu', 2)
INSERT [dbo].[tblOda] ([oda_id], [oda_numara], [oda_dolulukDurumu], [odaturu_id]) VALUES (12, N'112', N'Boş', 1)
INSERT [dbo].[tblOda] ([oda_id], [oda_numara], [oda_dolulukDurumu], [odaturu_id]) VALUES (13, N'113', N'Boş', 3)
INSERT [dbo].[tblOda] ([oda_id], [oda_numara], [oda_dolulukDurumu], [odaturu_id]) VALUES (14, N'114', N'Boş', 3)
INSERT [dbo].[tblOda] ([oda_id], [oda_numara], [oda_dolulukDurumu], [odaturu_id]) VALUES (15, N'115', N'Dolu', 2)
INSERT [dbo].[tblOda] ([oda_id], [oda_numara], [oda_dolulukDurumu], [odaturu_id]) VALUES (16, N'116', N'Dolu', 2)
INSERT [dbo].[tblOda] ([oda_id], [oda_numara], [oda_dolulukDurumu], [odaturu_id]) VALUES (17, N'117', N'Boş', 3)
INSERT [dbo].[tblOda] ([oda_id], [oda_numara], [oda_dolulukDurumu], [odaturu_id]) VALUES (18, N'118', N'Boş', 1)
INSERT [dbo].[tblOda] ([oda_id], [oda_numara], [oda_dolulukDurumu], [odaturu_id]) VALUES (19, N'119', N'Boş', 1)
INSERT [dbo].[tblOda] ([oda_id], [oda_numara], [oda_dolulukDurumu], [odaturu_id]) VALUES (20, N'120', N'Dolu', 2)
SET IDENTITY_INSERT [dbo].[tblOda] OFF
GO
SET IDENTITY_INSERT [dbo].[tblOda_tblOtelVeOdaOzellikleri] ON 

INSERT [dbo].[tblOda_tblOtelVeOdaOzellikleri] ([oda_otelveodaozellikleri_id], [oda_id], [otelveodaozellikleri_id]) VALUES (1, 1, 1)
INSERT [dbo].[tblOda_tblOtelVeOdaOzellikleri] ([oda_otelveodaozellikleri_id], [oda_id], [otelveodaozellikleri_id]) VALUES (2, 1, 2)
INSERT [dbo].[tblOda_tblOtelVeOdaOzellikleri] ([oda_otelveodaozellikleri_id], [oda_id], [otelveodaozellikleri_id]) VALUES (3, 1, 3)
INSERT [dbo].[tblOda_tblOtelVeOdaOzellikleri] ([oda_otelveodaozellikleri_id], [oda_id], [otelveodaozellikleri_id]) VALUES (4, 2, 4)
INSERT [dbo].[tblOda_tblOtelVeOdaOzellikleri] ([oda_otelveodaozellikleri_id], [oda_id], [otelveodaozellikleri_id]) VALUES (5, 2, 5)
INSERT [dbo].[tblOda_tblOtelVeOdaOzellikleri] ([oda_otelveodaozellikleri_id], [oda_id], [otelveodaozellikleri_id]) VALUES (6, 3, 2)
INSERT [dbo].[tblOda_tblOtelVeOdaOzellikleri] ([oda_otelveodaozellikleri_id], [oda_id], [otelveodaozellikleri_id]) VALUES (7, 3, 6)
INSERT [dbo].[tblOda_tblOtelVeOdaOzellikleri] ([oda_otelveodaozellikleri_id], [oda_id], [otelveodaozellikleri_id]) VALUES (8, 4, 3)
INSERT [dbo].[tblOda_tblOtelVeOdaOzellikleri] ([oda_otelveodaozellikleri_id], [oda_id], [otelveodaozellikleri_id]) VALUES (9, 4, 7)
INSERT [dbo].[tblOda_tblOtelVeOdaOzellikleri] ([oda_otelveodaozellikleri_id], [oda_id], [otelveodaozellikleri_id]) VALUES (10, 5, 1)
SET IDENTITY_INSERT [dbo].[tblOda_tblOtelVeOdaOzellikleri] OFF
GO
SET IDENTITY_INSERT [dbo].[tblOda_tblPersonel] ON 

INSERT [dbo].[tblOda_tblPersonel] ([oda_personel_id], [oda_id], [personel_id], [yorum], [baslamasaati], [bitissaati], [tarih]) VALUES (1, 1, 1, N'Temizlik işleri', CAST(N'08:00:00' AS Time), CAST(N'16:00:00' AS Time), CAST(N'2023-05-24' AS Date))
INSERT [dbo].[tblOda_tblPersonel] ([oda_personel_id], [oda_id], [personel_id], [yorum], [baslamasaati], [bitissaati], [tarih]) VALUES (2, 1, 2, N'Resepsiyon görevlisi', CAST(N'09:00:00' AS Time), CAST(N'17:00:00' AS Time), CAST(N'2023-05-24' AS Date))
INSERT [dbo].[tblOda_tblPersonel] ([oda_personel_id], [oda_id], [personel_id], [yorum], [baslamasaati], [bitissaati], [tarih]) VALUES (3, 2, 3, N'Oda servisi', CAST(N'10:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'2023-05-25' AS Date))
INSERT [dbo].[tblOda_tblPersonel] ([oda_personel_id], [oda_id], [personel_id], [yorum], [baslamasaati], [bitissaati], [tarih]) VALUES (4, 2, 4, N'Oda temizliği', CAST(N'08:30:00' AS Time), CAST(N'16:30:00' AS Time), CAST(N'2023-05-25' AS Date))
INSERT [dbo].[tblOda_tblPersonel] ([oda_personel_id], [oda_id], [personel_id], [yorum], [baslamasaati], [bitissaati], [tarih]) VALUES (5, 3, 1, N'Havuz görevlisi', CAST(N'09:30:00' AS Time), CAST(N'17:30:00' AS Time), CAST(N'2023-05-26' AS Date))
INSERT [dbo].[tblOda_tblPersonel] ([oda_personel_id], [oda_id], [personel_id], [yorum], [baslamasaati], [bitissaati], [tarih]) VALUES (6, 3, 5, N'Otel güvenliği', CAST(N'08:00:00' AS Time), CAST(N'16:00:00' AS Time), CAST(N'2023-05-26' AS Date))
INSERT [dbo].[tblOda_tblPersonel] ([oda_personel_id], [oda_id], [personel_id], [yorum], [baslamasaati], [bitissaati], [tarih]) VALUES (7, 4, 2, N'Resepsiyon görevlisi', CAST(N'09:00:00' AS Time), CAST(N'17:00:00' AS Time), CAST(N'2023-05-27' AS Date))
INSERT [dbo].[tblOda_tblPersonel] ([oda_personel_id], [oda_id], [personel_id], [yorum], [baslamasaati], [bitissaati], [tarih]) VALUES (8, 4, 6, N'Oda servisi', CAST(N'10:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'2023-05-27' AS Date))
INSERT [dbo].[tblOda_tblPersonel] ([oda_personel_id], [oda_id], [personel_id], [yorum], [baslamasaati], [bitissaati], [tarih]) VALUES (9, 5, 3, N'Oda temizliği', CAST(N'08:30:00' AS Time), CAST(N'16:30:00' AS Time), CAST(N'2023-05-28' AS Date))
INSERT [dbo].[tblOda_tblPersonel] ([oda_personel_id], [oda_id], [personel_id], [yorum], [baslamasaati], [bitissaati], [tarih]) VALUES (10, 5, 7, N'Havuz görevlisi', CAST(N'09:30:00' AS Time), CAST(N'17:30:00' AS Time), CAST(N'2023-05-28' AS Date))
SET IDENTITY_INSERT [dbo].[tblOda_tblPersonel] OFF
GO
SET IDENTITY_INSERT [dbo].[tblOdaTuru] ON 

INSERT [dbo].[tblOdaTuru] ([odaturu_id], [odaturu_ad], [odaturu_aciklama], [odaturu_maxKisiSayisi], [odaturu_yatakSayisi]) VALUES (1, N'Standart', N'Standart oda', 2, 1)
INSERT [dbo].[tblOdaTuru] ([odaturu_id], [odaturu_ad], [odaturu_aciklama], [odaturu_maxKisiSayisi], [odaturu_yatakSayisi]) VALUES (2, N'Deluxe', N'Deluxe oda', 2, 1)
INSERT [dbo].[tblOdaTuru] ([odaturu_id], [odaturu_ad], [odaturu_aciklama], [odaturu_maxKisiSayisi], [odaturu_yatakSayisi]) VALUES (3, N'Suit', N'Suit oda', 3, 2)
INSERT [dbo].[tblOdaTuru] ([odaturu_id], [odaturu_ad], [odaturu_aciklama], [odaturu_maxKisiSayisi], [odaturu_yatakSayisi]) VALUES (4, N'Aile', N'Aile odası', 4, 2)
INSERT [dbo].[tblOdaTuru] ([odaturu_id], [odaturu_ad], [odaturu_aciklama], [odaturu_maxKisiSayisi], [odaturu_yatakSayisi]) VALUES (5, N'Kral Dairesi', N'Kral dairesi', 4, 2)
INSERT [dbo].[tblOdaTuru] ([odaturu_id], [odaturu_ad], [odaturu_aciklama], [odaturu_maxKisiSayisi], [odaturu_yatakSayisi]) VALUES (6, N'Ekonomik', N'Ekonomik oda', 1, 1)
INSERT [dbo].[tblOdaTuru] ([odaturu_id], [odaturu_ad], [odaturu_aciklama], [odaturu_maxKisiSayisi], [odaturu_yatakSayisi]) VALUES (7, N'Tek Kişilik', N'Tek kişilik oda', 1, 1)
INSERT [dbo].[tblOdaTuru] ([odaturu_id], [odaturu_ad], [odaturu_aciklama], [odaturu_maxKisiSayisi], [odaturu_yatakSayisi]) VALUES (8, N'Bahçe Manzaralı', N'Bahçe manzaralı oda', 2, 1)
INSERT [dbo].[tblOdaTuru] ([odaturu_id], [odaturu_ad], [odaturu_aciklama], [odaturu_maxKisiSayisi], [odaturu_yatakSayisi]) VALUES (9, N'Deniz Manzaralı', N'Deniz manzaralı oda', 2, 1)
INSERT [dbo].[tblOdaTuru] ([odaturu_id], [odaturu_ad], [odaturu_aciklama], [odaturu_maxKisiSayisi], [odaturu_yatakSayisi]) VALUES (10, N'Havuz Manzaralı', N'Havuz manzaralı oda', 2, 1)
INSERT [dbo].[tblOdaTuru] ([odaturu_id], [odaturu_ad], [odaturu_aciklama], [odaturu_maxKisiSayisi], [odaturu_yatakSayisi]) VALUES (11, N'Engelli', N'Engelli odası', 2, 1)
INSERT [dbo].[tblOdaTuru] ([odaturu_id], [odaturu_ad], [odaturu_aciklama], [odaturu_maxKisiSayisi], [odaturu_yatakSayisi]) VALUES (12, N'Dubleks', N'Dubleks oda', 4, 2)
INSERT [dbo].[tblOdaTuru] ([odaturu_id], [odaturu_ad], [odaturu_aciklama], [odaturu_maxKisiSayisi], [odaturu_yatakSayisi]) VALUES (13, N'Panorama', N'Panoramik manzaralı oda', 2, 1)
INSERT [dbo].[tblOdaTuru] ([odaturu_id], [odaturu_ad], [odaturu_aciklama], [odaturu_maxKisiSayisi], [odaturu_yatakSayisi]) VALUES (14, N'Terasta Jakuzili', N'Terasta jakuzili oda', 2, 1)
INSERT [dbo].[tblOdaTuru] ([odaturu_id], [odaturu_ad], [odaturu_aciklama], [odaturu_maxKisiSayisi], [odaturu_yatakSayisi]) VALUES (15, N'Özel Havuzlu', N'Özel havuzlu oda', 2, 1)
INSERT [dbo].[tblOdaTuru] ([odaturu_id], [odaturu_ad], [odaturu_aciklama], [odaturu_maxKisiSayisi], [odaturu_yatakSayisi]) VALUES (16, N'Balkonlu', N'Balkonlu oda', 2, 1)
INSERT [dbo].[tblOdaTuru] ([odaturu_id], [odaturu_ad], [odaturu_aciklama], [odaturu_maxKisiSayisi], [odaturu_yatakSayisi]) VALUES (17, N'Lüks', N'Lüks oda', 2, 1)
INSERT [dbo].[tblOdaTuru] ([odaturu_id], [odaturu_ad], [odaturu_aciklama], [odaturu_maxKisiSayisi], [odaturu_yatakSayisi]) VALUES (18, N'Özel Plajlı', N'Özel plajlı oda', 2, 1)
INSERT [dbo].[tblOdaTuru] ([odaturu_id], [odaturu_ad], [odaturu_aciklama], [odaturu_maxKisiSayisi], [odaturu_yatakSayisi]) VALUES (19, N'Kamelyalı', N'Kamelyalı oda', 2, 1)
SET IDENTITY_INSERT [dbo].[tblOdaTuru] OFF
GO
SET IDENTITY_INSERT [dbo].[tblOtel] ON 

INSERT [dbo].[tblOtel] ([otel_id], [otel_email], [otel_adres], [otel_ad], [otel_telefon], [otel_aciklama], [otel_yildizi], [otel_puani], [IlKodu], [IlceKodu]) VALUES (1, N'otel1@example.com', N'Yalova', N'Örnek Otel', N'5555555555', N'Örnek otel açıklaması', 5, 8, 77, 1)
INSERT [dbo].[tblOtel] ([otel_id], [otel_email], [otel_adres], [otel_ad], [otel_telefon], [otel_aciklama], [otel_yildizi], [otel_puani], [IlKodu], [IlceKodu]) VALUES (2, N'otel2@example.com', N'Yalova', N'Örnek Otel 2', N'5555555556', N'Örnek otel 2 açıklaması', 4, 7, 77, 2)
INSERT [dbo].[tblOtel] ([otel_id], [otel_email], [otel_adres], [otel_ad], [otel_telefon], [otel_aciklama], [otel_yildizi], [otel_puani], [IlKodu], [IlceKodu]) VALUES (3, N'otel3@example.com', N'Yalova', N'Örnek Otel 3', N'5555555557', N'Örnek otel 3 açıklaması', 3, 6, 77, 3)
INSERT [dbo].[tblOtel] ([otel_id], [otel_email], [otel_adres], [otel_ad], [otel_telefon], [otel_aciklama], [otel_yildizi], [otel_puani], [IlKodu], [IlceKodu]) VALUES (4, N'otel4@example.com', N'Antalya', N'Örnek Otel 4', N'5555555558', N'Örnek otel 4 açıklaması', 5, 8, 77, 1)
INSERT [dbo].[tblOtel] ([otel_id], [otel_email], [otel_adres], [otel_ad], [otel_telefon], [otel_aciklama], [otel_yildizi], [otel_puani], [IlKodu], [IlceKodu]) VALUES (5, N'otel5@example.com', N'Bodrum', N'Örnek Otel 5', N'5555555559', N'Örnek otel 5 açıklaması', 4, 7, 77, 2)
INSERT [dbo].[tblOtel] ([otel_id], [otel_email], [otel_adres], [otel_ad], [otel_telefon], [otel_aciklama], [otel_yildizi], [otel_puani], [IlKodu], [IlceKodu]) VALUES (6, N'otel6@example.com', N'Marmaris', N'Örnek Otel 6', N'5555555560', N'Örnek otel 6 açıklaması', 3, 6, 77, 3)
INSERT [dbo].[tblOtel] ([otel_id], [otel_email], [otel_adres], [otel_ad], [otel_telefon], [otel_aciklama], [otel_yildizi], [otel_puani], [IlKodu], [IlceKodu]) VALUES (7, N'otel7@example.com', N'Fethiye', N'Örnek Otel 7', N'5555555561', N'Örnek otel 7 açıklaması', 5, 8, 77, 1)
INSERT [dbo].[tblOtel] ([otel_id], [otel_email], [otel_adres], [otel_ad], [otel_telefon], [otel_aciklama], [otel_yildizi], [otel_puani], [IlKodu], [IlceKodu]) VALUES (8, N'otel8@example.com', N'Alanya', N'Örnek Otel 8', N'5555555562', N'Örnek otel 8 açıklaması', 4, 7, 77, 2)
INSERT [dbo].[tblOtel] ([otel_id], [otel_email], [otel_adres], [otel_ad], [otel_telefon], [otel_aciklama], [otel_yildizi], [otel_puani], [IlKodu], [IlceKodu]) VALUES (9, N'otel9@example.com', N'Kuşadası', N'Örnek Otel 9', N'5555555563', N'Örnek otel 9 açıklaması', 3, 6, 77, 3)
INSERT [dbo].[tblOtel] ([otel_id], [otel_email], [otel_adres], [otel_ad], [otel_telefon], [otel_aciklama], [otel_yildizi], [otel_puani], [IlKodu], [IlceKodu]) VALUES (10, N'otel10@example.com', N'Çeşme', N'Örnek Otel 10', N'5555555564', N'Örnek otel 10 açıklaması', 5, 8, 77, 1)
SET IDENTITY_INSERT [dbo].[tblOtel] OFF
GO
SET IDENTITY_INSERT [dbo].[tblOtel_Ekstra] ON 

INSERT [dbo].[tblOtel_Ekstra] ([otel_ekstra_id], [otel_id], [ekstra_id], [fiyat]) VALUES (1, 1, 1, 50.0000)
INSERT [dbo].[tblOtel_Ekstra] ([otel_ekstra_id], [otel_id], [ekstra_id], [fiyat]) VALUES (2, 1, 2, 20.0000)
INSERT [dbo].[tblOtel_Ekstra] ([otel_ekstra_id], [otel_id], [ekstra_id], [fiyat]) VALUES (3, 2, 3, 30.0000)
INSERT [dbo].[tblOtel_Ekstra] ([otel_ekstra_id], [otel_id], [ekstra_id], [fiyat]) VALUES (4, 2, 4, 40.0000)
INSERT [dbo].[tblOtel_Ekstra] ([otel_ekstra_id], [otel_id], [ekstra_id], [fiyat]) VALUES (5, 3, 1, 50.0000)
INSERT [dbo].[tblOtel_Ekstra] ([otel_ekstra_id], [otel_id], [ekstra_id], [fiyat]) VALUES (6, 3, 3, 30.0000)
INSERT [dbo].[tblOtel_Ekstra] ([otel_ekstra_id], [otel_id], [ekstra_id], [fiyat]) VALUES (7, 4, 2, 20.0000)
INSERT [dbo].[tblOtel_Ekstra] ([otel_ekstra_id], [otel_id], [ekstra_id], [fiyat]) VALUES (8, 4, 4, 40.0000)
INSERT [dbo].[tblOtel_Ekstra] ([otel_ekstra_id], [otel_id], [ekstra_id], [fiyat]) VALUES (9, 5, 1, 50.0000)
INSERT [dbo].[tblOtel_Ekstra] ([otel_ekstra_id], [otel_id], [ekstra_id], [fiyat]) VALUES (10, 5, 2, 20.0000)
SET IDENTITY_INSERT [dbo].[tblOtel_Ekstra] OFF
GO
SET IDENTITY_INSERT [dbo].[tblOtel_tblOtelVeOdaOzellikleri] ON 

INSERT [dbo].[tblOtel_tblOtelVeOdaOzellikleri] ([otel_otelveodaozellikleri_id], [otel_id], [otelveodaozellikleri_id]) VALUES (1, 1, 1)
INSERT [dbo].[tblOtel_tblOtelVeOdaOzellikleri] ([otel_otelveodaozellikleri_id], [otel_id], [otelveodaozellikleri_id]) VALUES (2, 1, 2)
INSERT [dbo].[tblOtel_tblOtelVeOdaOzellikleri] ([otel_otelveodaozellikleri_id], [otel_id], [otelveodaozellikleri_id]) VALUES (3, 2, 3)
INSERT [dbo].[tblOtel_tblOtelVeOdaOzellikleri] ([otel_otelveodaozellikleri_id], [otel_id], [otelveodaozellikleri_id]) VALUES (4, 2, 4)
INSERT [dbo].[tblOtel_tblOtelVeOdaOzellikleri] ([otel_otelveodaozellikleri_id], [otel_id], [otelveodaozellikleri_id]) VALUES (5, 3, 1)
INSERT [dbo].[tblOtel_tblOtelVeOdaOzellikleri] ([otel_otelveodaozellikleri_id], [otel_id], [otelveodaozellikleri_id]) VALUES (6, 3, 3)
INSERT [dbo].[tblOtel_tblOtelVeOdaOzellikleri] ([otel_otelveodaozellikleri_id], [otel_id], [otelveodaozellikleri_id]) VALUES (7, 4, 2)
INSERT [dbo].[tblOtel_tblOtelVeOdaOzellikleri] ([otel_otelveodaozellikleri_id], [otel_id], [otelveodaozellikleri_id]) VALUES (8, 4, 4)
INSERT [dbo].[tblOtel_tblOtelVeOdaOzellikleri] ([otel_otelveodaozellikleri_id], [otel_id], [otelveodaozellikleri_id]) VALUES (9, 5, 1)
INSERT [dbo].[tblOtel_tblOtelVeOdaOzellikleri] ([otel_otelveodaozellikleri_id], [otel_id], [otelveodaozellikleri_id]) VALUES (10, 5, 2)
SET IDENTITY_INSERT [dbo].[tblOtel_tblOtelVeOdaOzellikleri] OFF
GO
SET IDENTITY_INSERT [dbo].[tblOtelVeOdaOzellikleri] ON 

INSERT [dbo].[tblOtelVeOdaOzellikleri] ([otelveodaozellikleri_id], [otelveodaozellikleri_ad]) VALUES (1, N'WiFi')
INSERT [dbo].[tblOtelVeOdaOzellikleri] ([otelveodaozellikleri_id], [otelveodaozellikleri_ad]) VALUES (2, N'Ücretsiz Kahvaltı')
INSERT [dbo].[tblOtelVeOdaOzellikleri] ([otelveodaozellikleri_id], [otelveodaozellikleri_ad]) VALUES (3, N'Havuz')
INSERT [dbo].[tblOtelVeOdaOzellikleri] ([otelveodaozellikleri_id], [otelveodaozellikleri_ad]) VALUES (4, N'Spa')
INSERT [dbo].[tblOtelVeOdaOzellikleri] ([otelveodaozellikleri_id], [otelveodaozellikleri_ad]) VALUES (5, N'Fitness Merkezi')
INSERT [dbo].[tblOtelVeOdaOzellikleri] ([otelveodaozellikleri_id], [otelveodaozellikleri_ad]) VALUES (6, N'Restoran')
INSERT [dbo].[tblOtelVeOdaOzellikleri] ([otelveodaozellikleri_id], [otelveodaozellikleri_ad]) VALUES (7, N'Otopark')
INSERT [dbo].[tblOtelVeOdaOzellikleri] ([otelveodaozellikleri_id], [otelveodaozellikleri_ad]) VALUES (8, N'Çamaşırhane')
INSERT [dbo].[tblOtelVeOdaOzellikleri] ([otelveodaozellikleri_id], [otelveodaozellikleri_ad]) VALUES (9, N'Klima')
INSERT [dbo].[tblOtelVeOdaOzellikleri] ([otelveodaozellikleri_id], [otelveodaozellikleri_ad]) VALUES (10, N'24 Saat Resepsiyon')
SET IDENTITY_INSERT [dbo].[tblOtelVeOdaOzellikleri] OFF
GO
SET IDENTITY_INSERT [dbo].[tblPersonel] ON 

INSERT [dbo].[tblPersonel] ([personel_id], [personel_ad], [personel_soyad], [personel_dogumTarihi], [personel_TC], [personel_cinsiyet], [personel_email], [personel_telefon], [OtelId], [IlKodu], [IlceKodu]) VALUES (1, N'Ali', N'Yıldız', CAST(N'1990-03-15' AS Date), N'34567890123', N'Erkek', N'ali@example.com', N'5555555557', 1, 1, 1)
INSERT [dbo].[tblPersonel] ([personel_id], [personel_ad], [personel_soyad], [personel_dogumTarihi], [personel_TC], [personel_cinsiyet], [personel_email], [personel_telefon], [OtelId], [IlKodu], [IlceKodu]) VALUES (2, N'Ayşe', N'Kara', CAST(N'1992-07-12' AS Date), N'45678901234', N'Kadın', N'ayse@example.com', N'5555555558', 1, 1, 2)
INSERT [dbo].[tblPersonel] ([personel_id], [personel_ad], [personel_soyad], [personel_dogumTarihi], [personel_TC], [personel_cinsiyet], [personel_email], [personel_telefon], [OtelId], [IlKodu], [IlceKodu]) VALUES (3, N'Mehmet', N'Koç', CAST(N'1988-11-25' AS Date), N'56789012345', N'Erkek', N'mehmet@example.com', N'5555555559', 3, 3, 3)
INSERT [dbo].[tblPersonel] ([personel_id], [personel_ad], [personel_soyad], [personel_dogumTarihi], [personel_TC], [personel_cinsiyet], [personel_email], [personel_telefon], [OtelId], [IlKodu], [IlceKodu]) VALUES (4, N'Fatma', N'Demir', CAST(N'1995-04-18' AS Date), N'67890123456', N'Kadın', N'fatma@example.com', N'5555555560', 4, 2, 4)
INSERT [dbo].[tblPersonel] ([personel_id], [personel_ad], [personel_soyad], [personel_dogumTarihi], [personel_TC], [personel_cinsiyet], [personel_email], [personel_telefon], [OtelId], [IlKodu], [IlceKodu]) VALUES (5, N'Ahmet', N'Kaya', CAST(N'1991-05-26' AS Date), N'78901234567', N'Erkek', N'ahmet@example.com', N'5555555561', 5, 2, 5)
INSERT [dbo].[tblPersonel] ([personel_id], [personel_ad], [personel_soyad], [personel_dogumTarihi], [personel_TC], [personel_cinsiyet], [personel_email], [personel_telefon], [OtelId], [IlKodu], [IlceKodu]) VALUES (6, N'Zeynep', N'Aydın', CAST(N'1989-05-09' AS Date), N'89012345678', N'Kadın', N'zeynep@example.com', N'5555555562', 6, 1, 6)
INSERT [dbo].[tblPersonel] ([personel_id], [personel_ad], [personel_soyad], [personel_dogumTarihi], [personel_TC], [personel_cinsiyet], [personel_email], [personel_telefon], [OtelId], [IlKodu], [IlceKodu]) VALUES (7, N'Mustafa', N'Kurt', CAST(N'1987-07-21' AS Date), N'90123456789', N'Erkek', N'mustafa@example.com', N'5555555563', 7, 1, 7)
INSERT [dbo].[tblPersonel] ([personel_id], [personel_ad], [personel_soyad], [personel_dogumTarihi], [personel_TC], [personel_cinsiyet], [personel_email], [personel_telefon], [OtelId], [IlKodu], [IlceKodu]) VALUES (8, N'Aysel', N'Şahin', CAST(N'1993-01-10' AS Date), N'01234567890', N'Kadın', N'aysel@example.com', N'5555555564', 8, 1, 8)
INSERT [dbo].[tblPersonel] ([personel_id], [personel_ad], [personel_soyad], [personel_dogumTarihi], [personel_TC], [personel_cinsiyet], [personel_email], [personel_telefon], [OtelId], [IlKodu], [IlceKodu]) VALUES (9, N'Emre', N'Yılmaz', CAST(N'1994-10-28' AS Date), N'12345678901', N'Erkek', N'emre@example.com', N'5555555565', 9, 1, 9)
INSERT [dbo].[tblPersonel] ([personel_id], [personel_ad], [personel_soyad], [personel_dogumTarihi], [personel_TC], [personel_cinsiyet], [personel_email], [personel_telefon], [OtelId], [IlKodu], [IlceKodu]) VALUES (10, N'Seda', N'Derin', CAST(N'1996-08-14' AS Date), N'23456789012', N'Kadın', N'seda@example.com', N'5555555566', 10, 1, 10)
SET IDENTITY_INSERT [dbo].[tblPersonel] OFF
GO
SET IDENTITY_INSERT [dbo].[tblRezervasyon] ON 

INSERT [dbo].[tblRezervasyon] ([rezervasyon_id], [rezervasyon_kisiSayisi], [rezervasyon_indirimTutari], [rezervasyon_numara], [rezervasyon_geceSayisi], [rezervasyon_toplamExtraUcret], [rezervasyon_gunlukUcret], [rezervasyon__baslangicTarihi], [rezervasyon_bitisTarihi], [Oda_id], [Musteri_id], [Personel_id], [Otel_id]) VALUES (1, 2, 100.0000, N'RES0001', 5, 50, 200, CAST(N'2022-05-01' AS Date), CAST(N'2022-05-06' AS Date), 1, 1, 1, 1)
INSERT [dbo].[tblRezervasyon] ([rezervasyon_id], [rezervasyon_kisiSayisi], [rezervasyon_indirimTutari], [rezervasyon_numara], [rezervasyon_geceSayisi], [rezervasyon_toplamExtraUcret], [rezervasyon_gunlukUcret], [rezervasyon__baslangicTarihi], [rezervasyon_bitisTarihi], [Oda_id], [Musteri_id], [Personel_id], [Otel_id]) VALUES (2, 1, 0.0000, N'RES0002', 3, 0, 150, CAST(N'2022-05-01' AS Date), CAST(N'2022-05-06' AS Date), 1, 1, 1, 1)
INSERT [dbo].[tblRezervasyon] ([rezervasyon_id], [rezervasyon_kisiSayisi], [rezervasyon_indirimTutari], [rezervasyon_numara], [rezervasyon_geceSayisi], [rezervasyon_toplamExtraUcret], [rezervasyon_gunlukUcret], [rezervasyon__baslangicTarihi], [rezervasyon_bitisTarihi], [Oda_id], [Musteri_id], [Personel_id], [Otel_id]) VALUES (3, 4, 50.0000, N'RES0003', 5, 100, 180, CAST(N'2022-08-05' AS Date), CAST(N'2022-08-12' AS Date), 3, 3, 3, 3)
INSERT [dbo].[tblRezervasyon] ([rezervasyon_id], [rezervasyon_kisiSayisi], [rezervasyon_indirimTutari], [rezervasyon_numara], [rezervasyon_geceSayisi], [rezervasyon_toplamExtraUcret], [rezervasyon_gunlukUcret], [rezervasyon__baslangicTarihi], [rezervasyon_bitisTarihi], [Oda_id], [Musteri_id], [Personel_id], [Otel_id]) VALUES (4, 3, 0.0000, N'RES0004', 2, 20, 120, CAST(N'2022-09-20' AS Date), CAST(N'2022-09-22' AS Date), 4, 4, 4, 2)
INSERT [dbo].[tblRezervasyon] ([rezervasyon_id], [rezervasyon_kisiSayisi], [rezervasyon_indirimTutari], [rezervasyon_numara], [rezervasyon_geceSayisi], [rezervasyon_toplamExtraUcret], [rezervasyon_gunlukUcret], [rezervasyon__baslangicTarihi], [rezervasyon_bitisTarihi], [Oda_id], [Musteri_id], [Personel_id], [Otel_id]) VALUES (5, 2, 0.0000, N'RES0005', 4, 30, 160, CAST(N'2023-10-15' AS Date), CAST(N'2023-10-19' AS Date), 5, 5, 5, 2)
INSERT [dbo].[tblRezervasyon] ([rezervasyon_id], [rezervasyon_kisiSayisi], [rezervasyon_indirimTutari], [rezervasyon_numara], [rezervasyon_geceSayisi], [rezervasyon_toplamExtraUcret], [rezervasyon_gunlukUcret], [rezervasyon__baslangicTarihi], [rezervasyon_bitisTarihi], [Oda_id], [Musteri_id], [Personel_id], [Otel_id]) VALUES (6, 1, 50.0000, N'RES0006', 6, 80, 190, CAST(N'2023-11-11' AS Date), CAST(N'2023-11-17' AS Date), 6, 6, 6, 2)
INSERT [dbo].[tblRezervasyon] ([rezervasyon_id], [rezervasyon_kisiSayisi], [rezervasyon_indirimTutari], [rezervasyon_numara], [rezervasyon_geceSayisi], [rezervasyon_toplamExtraUcret], [rezervasyon_gunlukUcret], [rezervasyon__baslangicTarihi], [rezervasyon_bitisTarihi], [Oda_id], [Musteri_id], [Personel_id], [Otel_id]) VALUES (7, 5, 0.0000, N'RES0007', 2, 0, 150, CAST(N'2023-05-03' AS Date), CAST(N'2023-05-05' AS Date), 1, 1, 1, 1)
INSERT [dbo].[tblRezervasyon] ([rezervasyon_id], [rezervasyon_kisiSayisi], [rezervasyon_indirimTutari], [rezervasyon_numara], [rezervasyon_geceSayisi], [rezervasyon_toplamExtraUcret], [rezervasyon_gunlukUcret], [rezervasyon__baslangicTarihi], [rezervasyon_bitisTarihi], [Oda_id], [Musteri_id], [Personel_id], [Otel_id]) VALUES (8, 2, 0.0000, N'RES0008', 4, 40, 170, CAST(N'2023-01-18' AS Date), CAST(N'2023-01-22' AS Date), 8, 8, 8, 1)
INSERT [dbo].[tblRezervasyon] ([rezervasyon_id], [rezervasyon_kisiSayisi], [rezervasyon_indirimTutari], [rezervasyon_numara], [rezervasyon_geceSayisi], [rezervasyon_toplamExtraUcret], [rezervasyon_gunlukUcret], [rezervasyon__baslangicTarihi], [rezervasyon_bitisTarihi], [Oda_id], [Musteri_id], [Personel_id], [Otel_id]) VALUES (9, 3, 75.0000, N'RES0009', 5, 60, 180, CAST(N'2023-02-12' AS Date), CAST(N'2023-02-17' AS Date), 9, 9, 9, 3)
INSERT [dbo].[tblRezervasyon] ([rezervasyon_id], [rezervasyon_kisiSayisi], [rezervasyon_indirimTutari], [rezervasyon_numara], [rezervasyon_geceSayisi], [rezervasyon_toplamExtraUcret], [rezervasyon_gunlukUcret], [rezervasyon__baslangicTarihi], [rezervasyon_bitisTarihi], [Oda_id], [Musteri_id], [Personel_id], [Otel_id]) VALUES (10, 2, 0.0000, N'RES0010', 2, 10, 110, CAST(N'2023-03-25' AS Date), CAST(N'2023-03-27' AS Date), 10, 10, 10, 3)
SET IDENTITY_INSERT [dbo].[tblRezervasyon] OFF
GO
SET IDENTITY_INSERT [dbo].[tblRezervasyon_tblEkstra] ON 

INSERT [dbo].[tblRezervasyon_tblEkstra] ([rezervasyon_ekstra_id], [rezervasyon_id], [ekstra_id], [tarih], [birimFiyat], [miktar]) VALUES (1, 1, 1, CAST(N'2023-06-01' AS Date), 50.0000, 2)
INSERT [dbo].[tblRezervasyon_tblEkstra] ([rezervasyon_ekstra_id], [rezervasyon_id], [ekstra_id], [tarih], [birimFiyat], [miktar]) VALUES (2, 1, 2, CAST(N'2023-06-01' AS Date), 30.0000, 1)
INSERT [dbo].[tblRezervasyon_tblEkstra] ([rezervasyon_ekstra_id], [rezervasyon_id], [ekstra_id], [tarih], [birimFiyat], [miktar]) VALUES (3, 2, 3, CAST(N'2023-06-02' AS Date), 20.0000, 3)
INSERT [dbo].[tblRezervasyon_tblEkstra] ([rezervasyon_ekstra_id], [rezervasyon_id], [ekstra_id], [tarih], [birimFiyat], [miktar]) VALUES (4, 2, 4, CAST(N'2023-06-02' AS Date), 40.0000, 2)
INSERT [dbo].[tblRezervasyon_tblEkstra] ([rezervasyon_ekstra_id], [rezervasyon_id], [ekstra_id], [tarih], [birimFiyat], [miktar]) VALUES (5, 3, 1, CAST(N'2023-06-03' AS Date), 50.0000, 1)
INSERT [dbo].[tblRezervasyon_tblEkstra] ([rezervasyon_ekstra_id], [rezervasyon_id], [ekstra_id], [tarih], [birimFiyat], [miktar]) VALUES (6, 3, 3, CAST(N'2023-06-03' AS Date), 20.0000, 4)
INSERT [dbo].[tblRezervasyon_tblEkstra] ([rezervasyon_ekstra_id], [rezervasyon_id], [ekstra_id], [tarih], [birimFiyat], [miktar]) VALUES (7, 4, 2, CAST(N'2023-06-04' AS Date), 30.0000, 2)
INSERT [dbo].[tblRezervasyon_tblEkstra] ([rezervasyon_ekstra_id], [rezervasyon_id], [ekstra_id], [tarih], [birimFiyat], [miktar]) VALUES (8, 4, 4, CAST(N'2023-06-04' AS Date), 40.0000, 1)
INSERT [dbo].[tblRezervasyon_tblEkstra] ([rezervasyon_ekstra_id], [rezervasyon_id], [ekstra_id], [tarih], [birimFiyat], [miktar]) VALUES (9, 5, 1, CAST(N'2023-06-05' AS Date), 50.0000, 3)
INSERT [dbo].[tblRezervasyon_tblEkstra] ([rezervasyon_ekstra_id], [rezervasyon_id], [ekstra_id], [tarih], [birimFiyat], [miktar]) VALUES (10, 5, 2, CAST(N'2023-06-05' AS Date), 30.0000, 2)
SET IDENTITY_INSERT [dbo].[tblRezervasyon_tblEkstra] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tblMuste__966C03B748369BF8]    Script Date: 27.05.2023 00:34:05 ******/
ALTER TABLE [dbo].[tblMusteri] ADD UNIQUE NONCLUSTERED 
(
	[musteri_TC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [pktblMusteri_Otel]    Script Date: 27.05.2023 00:34:05 ******/
ALTER TABLE [dbo].[tblMusteri_Otel] ADD  CONSTRAINT [pktblMusteri_Otel] UNIQUE NONCLUSTERED 
(
	[musteri_id] ASC,
	[otel_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [pktblMusteri_Rezervasyon]    Script Date: 27.05.2023 00:34:05 ******/
ALTER TABLE [dbo].[tblMusteri_Rezervasyon] ADD  CONSTRAINT [pktblMusteri_Rezervasyon] UNIQUE NONCLUSTERED 
(
	[musteri_id] ASC,
	[rezervasyon_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [pktblOda_Otelveodaozellikleri]    Script Date: 27.05.2023 00:34:05 ******/
ALTER TABLE [dbo].[tblOda_tblOtelVeOdaOzellikleri] ADD  CONSTRAINT [pktblOda_Otelveodaozellikleri] UNIQUE NONCLUSTERED 
(
	[oda_id] ASC,
	[otelveodaozellikleri_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [unqtblMusteriEmail]    Script Date: 27.05.2023 00:34:05 ******/
ALTER TABLE [dbo].[tblOtel] ADD  CONSTRAINT [unqtblMusteriEmail] UNIQUE NONCLUSTERED 
(
	[otel_email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tblOtel__43F6D739D4E4D994]    Script Date: 27.05.2023 00:34:05 ******/
ALTER TABLE [dbo].[tblOtel] ADD UNIQUE NONCLUSTERED 
(
	[otel_ad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [pktblOtel_Ekstra]    Script Date: 27.05.2023 00:34:05 ******/
ALTER TABLE [dbo].[tblOtel_Ekstra] ADD  CONSTRAINT [pktblOtel_Ekstra] UNIQUE NONCLUSTERED 
(
	[otel_id] ASC,
	[ekstra_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [pktblOtel_Otelveodaozellikleri]    Script Date: 27.05.2023 00:34:05 ******/
ALTER TABLE [dbo].[tblOtel_tblOtelVeOdaOzellikleri] ADD  CONSTRAINT [pktblOtel_Otelveodaozellikleri] UNIQUE NONCLUSTERED 
(
	[otel_id] ASC,
	[otelveodaozellikleri_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tblPerso__48A7E15D619C13B9]    Script Date: 27.05.2023 00:34:05 ******/
ALTER TABLE [dbo].[tblPersonel] ADD UNIQUE NONCLUSTERED 
(
	[personel_TC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblFiyat]  WITH CHECK ADD FOREIGN KEY([OdaTuruId])
REFERENCES [dbo].[tblOdaTuru] ([odaturu_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblIlce]  WITH CHECK ADD FOREIGN KEY([IlKod])
REFERENCES [dbo].[tblIl] ([il_kod])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblMusteri]  WITH CHECK ADD FOREIGN KEY([IlceKodu])
REFERENCES [dbo].[tblIlce] ([ilce_id])
GO
ALTER TABLE [dbo].[tblMusteri]  WITH CHECK ADD FOREIGN KEY([IlKodu])
REFERENCES [dbo].[tblIl] ([il_kod])
GO
ALTER TABLE [dbo].[tblMusteri]  WITH CHECK ADD FOREIGN KEY([Musterituru_id])
REFERENCES [dbo].[tblMusteriTuru] ([musterituru_id])
GO
ALTER TABLE [dbo].[tblMusteri_Otel]  WITH CHECK ADD FOREIGN KEY([musteri_id])
REFERENCES [dbo].[tblMusteri] ([musteri_id])
GO
ALTER TABLE [dbo].[tblMusteri_Otel]  WITH CHECK ADD FOREIGN KEY([otel_id])
REFERENCES [dbo].[tblOtel] ([otel_id])
GO
ALTER TABLE [dbo].[tblMusteri_Rezervasyon]  WITH CHECK ADD FOREIGN KEY([musteri_id])
REFERENCES [dbo].[tblMusteri] ([musteri_id])
GO
ALTER TABLE [dbo].[tblMusteri_Rezervasyon]  WITH CHECK ADD FOREIGN KEY([rezervasyon_id])
REFERENCES [dbo].[tblRezervasyon] ([rezervasyon_id])
GO
ALTER TABLE [dbo].[tblOda]  WITH CHECK ADD FOREIGN KEY([odaturu_id])
REFERENCES [dbo].[tblOdaTuru] ([odaturu_id])
GO
ALTER TABLE [dbo].[tblOda_tblOtelVeOdaOzellikleri]  WITH CHECK ADD FOREIGN KEY([oda_id])
REFERENCES [dbo].[tblOda] ([oda_id])
GO
ALTER TABLE [dbo].[tblOda_tblOtelVeOdaOzellikleri]  WITH CHECK ADD FOREIGN KEY([otelveodaozellikleri_id])
REFERENCES [dbo].[tblOtelVeOdaOzellikleri] ([otelveodaozellikleri_id])
GO
ALTER TABLE [dbo].[tblOda_tblPersonel]  WITH CHECK ADD FOREIGN KEY([oda_id])
REFERENCES [dbo].[tblOda] ([oda_id])
GO
ALTER TABLE [dbo].[tblOda_tblPersonel]  WITH CHECK ADD FOREIGN KEY([personel_id])
REFERENCES [dbo].[tblPersonel] ([personel_id])
GO
ALTER TABLE [dbo].[tblOtel]  WITH CHECK ADD FOREIGN KEY([IlceKodu])
REFERENCES [dbo].[tblIlce] ([ilce_id])
GO
ALTER TABLE [dbo].[tblOtel]  WITH CHECK ADD FOREIGN KEY([IlKodu])
REFERENCES [dbo].[tblIl] ([il_kod])
GO
ALTER TABLE [dbo].[tblOtel_Ekstra]  WITH CHECK ADD FOREIGN KEY([ekstra_id])
REFERENCES [dbo].[tblEkstra] ([ekstra_id])
GO
ALTER TABLE [dbo].[tblOtel_Ekstra]  WITH CHECK ADD FOREIGN KEY([otel_id])
REFERENCES [dbo].[tblOtel] ([otel_id])
GO
ALTER TABLE [dbo].[tblOtel_tblOtelVeOdaOzellikleri]  WITH CHECK ADD FOREIGN KEY([otel_id])
REFERENCES [dbo].[tblOtel] ([otel_id])
GO
ALTER TABLE [dbo].[tblOtel_tblOtelVeOdaOzellikleri]  WITH CHECK ADD FOREIGN KEY([otelveodaozellikleri_id])
REFERENCES [dbo].[tblOtelVeOdaOzellikleri] ([otelveodaozellikleri_id])
GO
ALTER TABLE [dbo].[tblPersonel]  WITH CHECK ADD FOREIGN KEY([IlceKodu])
REFERENCES [dbo].[tblIlce] ([ilce_id])
GO
ALTER TABLE [dbo].[tblPersonel]  WITH CHECK ADD FOREIGN KEY([IlKodu])
REFERENCES [dbo].[tblIl] ([il_kod])
GO
ALTER TABLE [dbo].[tblPersonel]  WITH CHECK ADD FOREIGN KEY([OtelId])
REFERENCES [dbo].[tblOtel] ([otel_id])
GO
ALTER TABLE [dbo].[tblRezervasyon]  WITH CHECK ADD FOREIGN KEY([Musteri_id])
REFERENCES [dbo].[tblMusteri] ([musteri_id])
GO
ALTER TABLE [dbo].[tblRezervasyon]  WITH CHECK ADD FOREIGN KEY([Oda_id])
REFERENCES [dbo].[tblOda] ([oda_id])
GO
ALTER TABLE [dbo].[tblRezervasyon]  WITH CHECK ADD FOREIGN KEY([Otel_id])
REFERENCES [dbo].[tblOtel] ([otel_id])
GO
ALTER TABLE [dbo].[tblRezervasyon]  WITH CHECK ADD FOREIGN KEY([Personel_id])
REFERENCES [dbo].[tblPersonel] ([personel_id])
GO
ALTER TABLE [dbo].[tblRezervasyon_tblEkstra]  WITH CHECK ADD FOREIGN KEY([ekstra_id])
REFERENCES [dbo].[tblEkstra] ([ekstra_id])
GO
ALTER TABLE [dbo].[tblRezervasyon_tblEkstra]  WITH CHECK ADD FOREIGN KEY([rezervasyon_id])
REFERENCES [dbo].[tblRezervasyon] ([rezervasyon_id])
GO
ALTER TABLE [dbo].[tblMusteri]  WITH CHECK ADD  CONSTRAINT [checktblMusteriTelefon] CHECK  (([musteri_telefon] like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'))
GO
ALTER TABLE [dbo].[tblMusteri] CHECK CONSTRAINT [checktblMusteriTelefon]
GO
ALTER TABLE [dbo].[tblOtel]  WITH CHECK ADD  CONSTRAINT [checktblMusteriEmail] CHECK  (([otel_email] like '%@%.%'))
GO
ALTER TABLE [dbo].[tblOtel] CHECK CONSTRAINT [checktblMusteriEmail]
GO
ALTER TABLE [dbo].[tblOtel]  WITH CHECK ADD  CONSTRAINT [checktblOtelTelefon] CHECK  (([otel_telefon] like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'))
GO
ALTER TABLE [dbo].[tblOtel] CHECK CONSTRAINT [checktblOtelTelefon]
GO
USE [master]
GO
ALTER DATABASE [rezervasyon] SET  READ_WRITE 
GO
