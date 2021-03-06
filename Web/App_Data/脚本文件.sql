USE [master]
GO
/****** Object:  Database [VillagePraise]    Script Date: 2015/6/25 8:27:09 ******/
CREATE DATABASE [VillagePraise]
 CONTAINMENT = NONE

GO
ALTER DATABASE [VillagePraise] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [VillagePraise].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [VillagePraise] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [VillagePraise] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [VillagePraise] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [VillagePraise] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [VillagePraise] SET ARITHABORT OFF 
GO
ALTER DATABASE [VillagePraise] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [VillagePraise] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [VillagePraise] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [VillagePraise] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [VillagePraise] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [VillagePraise] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [VillagePraise] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [VillagePraise] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [VillagePraise] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [VillagePraise] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [VillagePraise] SET  DISABLE_BROKER 
GO
ALTER DATABASE [VillagePraise] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [VillagePraise] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [VillagePraise] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [VillagePraise] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [VillagePraise] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [VillagePraise] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [VillagePraise] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [VillagePraise] SET RECOVERY FULL 
GO
ALTER DATABASE [VillagePraise] SET  MULTI_USER 
GO
ALTER DATABASE [VillagePraise] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [VillagePraise] SET DB_CHAINING OFF 
GO
ALTER DATABASE [VillagePraise] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [VillagePraise] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'VillagePraise', N'ON'
GO
USE [VillagePraise]
GO
/****** Object:  Table [dbo].[actiInfo]    Script Date: 2015/6/25 8:27:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[actiInfo](
	[actiID] [int] IDENTITY(1,1) NOT NULL,
	[villageID] [int] NOT NULL,
	[actiName] [nvarchar](50) NOT NULL,
	[actiTime] [char](10) NOT NULL,
	[actiDes] [text] NOT NULL,
	[actiDesImg] [nvarchar](500) NOT NULL,
	[actiImg] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_actiInfo] PRIMARY KEY CLUSTERED 
(
	[actiID] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[adminInfo]    Script Date: 2015/6/25 8:27:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[adminInfo](
	[adminID] [int] IDENTITY(1,1) NOT NULL,
	[adminName] [nvarchar](50) NOT NULL,
	[adminPwd] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_adminInfo] PRIMARY KEY CLUSTERED 
(
	[adminID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[comInfo]    Script Date: 2015/6/25 8:27:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comInfo](
	[comID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [int] NOT NULL,
	[expID] [int] NOT NULL,
	[comCont] [text] NOT NULL,
	[comTime] [datetime] NOT NULL,
 CONSTRAINT [PK_comInfo] PRIMARY KEY CLUSTERED 
(
	[comID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[comReturn]    Script Date: 2015/6/25 8:27:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comReturn](
	[comReturnID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [int] NOT NULL,
	[comID] [int] NOT NULL,
	[comReturnTime] [datetime] NOT NULL,
	[comReturnCont] [text] NOT NULL,
 CONSTRAINT [PK_returnOne] PRIMARY KEY CLUSTERED 
(
	[comReturnID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[expInfo]    Script Date: 2015/6/25 8:27:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[expInfo](
	[expID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [int] NOT NULL,
	[expTitle] [nvarchar](100) NOT NULL,
	[expTime] [datetime] NOT NULL,
	[expDes] [text] NOT NULL,
	[expImg] [nvarchar](500) NOT NULL,
	[praiseCount] [int] NULL,
 CONSTRAINT [PK_expInfo] PRIMARY KEY CLUSTERED 
(
	[expID] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[foodInfo]    Script Date: 2015/6/25 8:27:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[foodInfo](
	[foodID] [int] IDENTITY(1,1) NOT NULL,
	[villageID] [int] NOT NULL,
	[foodName] [nvarchar](50) NOT NULL,
	[foodTime] [char](10) NOT NULL,
	[foodDes] [text] NOT NULL,
	[foodDesImg] [nvarchar](500) NOT NULL,
	[foodImg] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_foodInfo] PRIMARY KEY CLUSTERED 
(
	[foodID] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[itemInfo]    Script Date: 2015/6/25 8:27:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[itemInfo](
	[itemID] [int] IDENTITY(1,1) NOT NULL,
	[villageID] [int] NOT NULL,
	[itemName] [nvarchar](50) NOT NULL,
	[itemTime] [char](10) NOT NULL,
	[itemDes] [text] NOT NULL,
	[itemDesImg] [nvarchar](500) NOT NULL,
	[itemImg] [nvarchar](500) NOT NULL,
	[isLight] [nchar](8) NULL,
 CONSTRAINT [PK_itemInfo] PRIMARY KEY CLUSTERED 
(
	[itemID] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[massInfo]    Script Date: 2015/6/25 8:27:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[massInfo](
	[massID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [int] NOT NULL,
	[massTitle] [nvarchar](100) NOT NULL,
	[massTime] [datetime] NOT NULL,
	[massDes] [text] NOT NULL,
 CONSTRAINT [PK_massInfo] PRIMARY KEY CLUSTERED 
(
	[massID] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[newsInfo]    Script Date: 2015/6/25 8:27:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[newsInfo](
	[newsID] [int] IDENTITY(1,1) NOT NULL,
	[newsTitle] [nvarchar](100) NOT NULL,
	[newsTime] [datetime] NOT NULL,
	[newsCont] [text] NOT NULL,
 CONSTRAINT [PK_newsInfo] PRIMARY KEY CLUSTERED 
(
	[newsID] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[postReturn]    Script Date: 2015/6/25 8:27:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[postReturn](
	[postReturnID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [int] NOT NULL,
	[massID] [int] NOT NULL,
	[postReturnTime] [datetime] NOT NULL,
	[postReturnCont] [text] NOT NULL,
 CONSTRAINT [PK_postReturn] PRIMARY KEY CLUSTERED 
(
	[postReturnID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[userInfo]    Script Date: 2015/6/25 8:27:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[userInfo](
	[userID] [int] IDENTITY(1,1) NOT NULL,
	[userName] [nvarchar](50) NOT NULL,
	[userPassword] [nvarchar](50) NOT NULL,
	[userSex] [nchar](10) NOT NULL,
	[birthday] [datetime] NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[userPhone] [bigint] NOT NULL,
	[userCity] [nvarchar](50) NOT NULL,
	[userAddr] [nvarchar](100) NOT NULL,
	[regTime] [datetime] NOT NULL,
 CONSTRAINT [PK_userInfo] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[villageInfo]    Script Date: 2015/6/25 8:27:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[villageInfo](
	[villageID] [int] IDENTITY(1,1) NOT NULL,
	[villageName] [nvarchar](50) NOT NULL,
	[villageAddr] [nvarchar](100) NOT NULL,
	[villageImg] [nvarchar](500) NOT NULL,
	[villageDesImg] [nvarchar](500) NOT NULL,
	[villageDes] [text] NOT NULL,
	[bestTime] [char](10) NULL,
 CONSTRAINT [PK_villageInfo] PRIMARY KEY CLUSTERED 
(
	[villageID] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[View_1]    Script Date: 2015/6/25 8:27:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_1]
AS
SELECT   dbo.actiInfo.villageID, dbo.villageInfo.villageName
FROM      dbo.actiInfo INNER JOIN
                dbo.villageInfo ON dbo.actiInfo.villageID = dbo.villageInfo.villageID

GO
/****** Object:  View [dbo].[View_2]    Script Date: 2015/6/25 8:27:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_2]
AS
SELECT   dbo.expInfo.userID, dbo.userInfo.userName
FROM      dbo.expInfo INNER JOIN
                dbo.userInfo ON dbo.expInfo.userID = dbo.userInfo.userID

GO
/****** Object:  View [dbo].[View_3]    Script Date: 2015/6/25 8:27:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_3]
AS
SELECT   dbo.itemInfo.villageID, dbo.villageInfo.villageName
FROM      dbo.itemInfo INNER JOIN
                dbo.villageInfo ON dbo.itemInfo.villageID = dbo.villageInfo.villageID

GO
SET IDENTITY_INSERT [dbo].[actiInfo] ON 

INSERT [dbo].[actiInfo] ([actiID], [villageID], [actiName], [actiTime], [actiDes], [actiDesImg], [actiImg]) VALUES (15, 13, N'活动活动活动', N'七月      ', N'汉 严忌 《哀时命》：“下垂钓於谿谷兮，上要求於仙者。” 唐 孟浩然 《临洞庭》诗：“坐观垂钓者，徒有羡鱼情。” 宋 范仲淹 《赠方秀才》诗：“隣里多垂钓，儿孙半属文。” 碧野 《富春江畔·钓鱼台》：“遥想当年， 严子陵 在 钓鱼台 上垂钓，鲥鱼肥鲜。', N'~\Images\village7.jpg', N'~\Images\village6.jpg')
INSERT [dbo].[actiInfo] ([actiID], [villageID], [actiName], [actiTime], [actiDes], [actiDesImg], [actiImg]) VALUES (14, 5, N'汤峪碧水湾，此刻，尽享安逸', N'四月      ', N'汤峪温泉碧水湾 活动介绍
远离都市的喧嚣，让心灵回归，静，以致远。西北最大的露天泡汤温泉浴场，历史皇家沐浴之地，环境幽雅宁静。让你身心放松，悠然享受温泉式生活，让你的春天并不遥远！温泉水还有良好的医用价值，护肤美容、保健祛疾。这个金秋逛遗址公园、泡温泉，是个不错的选择哦。

大兴汤院遗址公园门票+碧水湾温泉票原价119元，现村游价仅需68元！预订从速哦！

汤峪温泉碧水湾简介
汤峪温泉碧水湾，坐落在苍翠的大秦岭终南山脚下，依山傍水、景色优美！在闻名遐迩的避暑疗养胜地汤峪碧水湾悠然享受温泉式生活，让您的春天并不遥远！
 
首创“家庭星级酒店”概念，为家庭旅游度假提供完美的场所，在度假之余，更能享受家庭的温馨。
 
汤峪温泉历史悠久，汉代即作为皇家沐浴之用，温泉储量大、水温高、水质好、疗效独特，适宜适宜30多类、105种疾病的沐浴疗养，被誉为“天下第一名汤”，有“功德水”“桃花水”之称，唐玄宗曾赐名“大兴汤院”。有融雪汤、玉女汤、男人汤、鲤鱼汤等汤池。
 
汤峪温泉碧水湾阳光以汤峪河为纽带，在河道两侧规划建设高、中、低档相结合，室内、外洗浴相结合，温泉洗浴与民俗表演、餐饮娱乐相结合的大型综合性温泉旅游项目。 
 
汤池介绍
男人汤
根据男女性别的不同，泡汤的水温是有差异的，男人汤专门为男人设置舒活筋骨的泉水温度，让男人在工作之余既能享受闲暇的泡汤时光，又能由内而外的感受身心放松。
女人汤
人汤的泉水温度比男人汤的水温略高一些，这是对女人娇贵体质的温婉照顾，较高的水温能够驱散女人体内的寒气，令全身毛孔充分扩张。 
 
大唐五池
李隆基御赐的“大兴汤院”大唐五池，融雪、玉女、涟珠、漱玉、濯缨五个汤池错层而建，温热的泉水从崖壁急转直下，在水面上激起阵阵白色的水雾，温暖徜徉。置身体中，宛若仙境。 
天圆地方池
汤池整体结构呈方形设计，上空楼层为露天圆形。汤池中央又以其独特的设计——“九棵大树五棵小树”的参差种植来把昔日帝王的九五之尊之意表达得淋漓尽致。蓝天绿树融为一体，室内室外香气扑鼻。让您在泡汤的同时亲身感受帝王的尊贵与王者的风范。
 
御汤石苑
石板浴位于皇室御汤院东侧，整体为四合院风格建筑。
出浴后躺在石板上，倾听温泉水从身下潺潺流过的声音，享受石板带来蒸腾的暖意，院内设有专业的配套服务，可以尽情享受按摩所带来的身体放松，感受贴心服务带来的温暖。
茶艺包房
院落整洁有序，安静舒适，在这里泡汤的游客可以品茶、打牌、休息等使您忘却工作的压力与生活的困惑，在泡汤的宁静时刻告别昔日的凡尘琐事，享受私人专属的度假生活，给您真正的私人空间。
 

温泉在保健方面的功效
一、可以通过体表疏通经络、畅通气血，调整人体经络气血的平衡。
二、温泉可以固守元气来强身益寿，可使温热刺激经络和按摩。
三、温泉有舒缓压力、调节情绪的作用。
四、温泉具有美容养颜方面的作用。帮助新陈代谢和减肥，对全身皮肤的美容效果非常好，让皮肤既光滑又紧制。', N'~\Images\acit.jpg', N'~\Images\acit3.jpg')
INSERT [dbo].[actiInfo] ([actiID], [villageID], [actiName], [actiTime], [actiDes], [actiDesImg], [actiImg]) VALUES (13, 2, N'来太河湾感受田园隐居般的生活', N'十二月    ', N'太河湾山庄 活动介绍
吃、住、玩、乐，就去太河湾山庄位于太河西岸南100米，三面环山、让你体验隐居般的田园生活。不过你可不用担心来这里没有好玩好吃的，农家小吃、野外烧烤、棋盘娱乐应有尽有！是你休闲度假的最佳选择！

太河湾山庄预订
普通包（周日至周四）　票面价：￥138　村游价：￥80
普通包（周五至周六）　票面价：￥138　村游价：￥98
豪华包（周日至周四）　票面价：￥158　村游价：￥90
豪华包（周五至周六）　票面价：￥158　村游价：￥118
棋牌房（周日至周四）　票面价：￥168　村游价：￥100
棋牌房（周五至周六）　票面价：￥168　村游价：￥128
两人餐　票面价：￥192　村游价：￥99
六人餐（7凉+6热）　票面价：￥412　村游价：￥298
十人餐（9凉+9热）　票面价：￥563　村游价：￥398

太河湾山庄简介
太河湾山庄地处老环山路，环境优雅，三面环山，是假期避暑休闲的首选。以住宿、农家餐饮、野外烧烤、棋盘娱乐、会议接待、健身为主，集各地农家小吃，新派川菜为主，展现别样的太河湾。
 

 
住宿客房外景
 
客房内景，还有小阳台哦~
 
阳台休闲一角 
 
小包间，餐厅，聚会、生日party 均可享用 
 

 

 
会议室，可容纳50位宾客
 
休闲娱乐设施：打打乒乓、健健身
 
太河湾棋牌室
 
和朋友话话家常谈谈心呗，只有天山水地，知道你们说了什么！
 
庭外休闲亭，扑克棋盘、啤酒烧烤的优选之地
 
消暑野味、采摘垂钓，不妨与家人朋友下榻太河湾，感受田园隐居却不失美味好心情……
 
?	住宿预订
?	套餐预订
?	立即预定
客房类型	门市价	村游价	优惠	支付方式	操作
普通包（平日价）
周日至周四
￥
￥80.0	￥58.0	在线支付
定金￥18.0	立即预订

普通包（周末价）
周五至周六
￥
￥98.0	￥40.0	在线支付
定金￥18.0	立即预订

豪华包（平日价）
周日至周四
￥
￥90.0	￥68.0	在线支付
定金￥18.0	立即预订

豪华包（周末价）
周五至周六
￥
￥118.0	￥40.0	在线支付
定金￥18.0	立即预订

棋牌房（平日价）
周日至周四
￥
￥100.0	￥68.0	在线支付
定金￥18.0	立即预订

棋牌房（周末价）
周五至周六
￥
￥128.0	￥40.0	在线支付
定金￥18.0	立即预订

预订须知
  联系农家乐的时候，请说是在“村游网”看到的，即可享受优惠价喽！
入住凭证：凭村游网预定短信到店入住
付款说明：请携带现金，到店支付剩余费用
退定说明：若因故无法按预定日期入住，请至少提前一天致电村游网客服通知。
温馨提示：①房间数量有限，请您在预订前电话咨询房源
               ②建议您提前1天预订。但周末、节假日、或旅游旺季最好提前较长时间预订，以防客满
十人套餐菜品：
  凉菜  酱猪蹄、干炸小野鱼、香烤山野兔、麻辣牛肉、芥味海带面、丁香鱼菠菜、农家人汉菜、麻辣蕨菜、辣子锅盔
  热菜  双椒鱼头、农家烧丸子、酸菜肥肠、小米椒爱上小公鸡、小时候菜、韭菜炒鸭血、农家大烩菜、蒜茸油麦菜、烩麻食 
六人套餐菜品：
  凉菜  口水鸡、无骨鱼、双椒皮蛋、香烤野山兔、爽口苦菊、虫草花拌黑豆丝、金丝油塔
  热菜  双椒鱼头、峰斋玉米、酸菜肥肠、炒乌鸡蛋、干煸豆角、烩麻食 
两人套餐菜品：
面皮捞牛肉、小炒野猪肉、人汉菜、农家大烩菜、搅团（送米饭）
PS： 欢迎加入陕西村游网会员二群，交流周边好玩好吃，还有优惠信息分享哦！QQ 群号：150145156', N'~\Images\acit12.jpg', N'~\Images\acit2.jpg')
INSERT [dbo].[actiInfo] ([actiID], [villageID], [actiName], [actiTime], [actiDes], [actiDesImg], [actiImg]) VALUES (12, 2, N'来两江游览 举办游轮水上婚礼', N'十月      ', N'活动主题：武汉两江游览游轮婚礼
　　活动时间：永久性
　　活动特色：水上游轮婚礼、浪漫高贵的婚礼新形式
　　预定电话：027-85685488 / 18040554605
　　预定链接：http://www.cywhb.com/jingdian/wuhan-6308.html
 
 
 
　　从现在开始，武汉两江游览的游船已经不再仅限于游览观光了，在游轮上举办婚礼已经变成可能了，在游轮上举办婚礼在很多女生的心中大概就像是初次看见大海的那种心动吧(或许不仅于此)，所以如果你是准备要结婚的，不妨可以体验一下：
 
     
 
    
 
 
 
 
 
 
 
  
 
 
 
 
 
 
 
　　游轮婚礼的意义：
　　游轮婚礼是当今流行的一种豪华、高档的主题婚礼形式。将最浪漫、美妙的婚礼意识，从酒店移到水上，很大程度上满足了年青人追求时尚、新奇婚礼的需求。在壮阔的海面上，对爱的人许下一生不变的誓言。即使山无棱、江水为竭，亦执子之手，与子偕老。这样高贵、特别的婚礼，一定能给您和所爱的人以及在场的亲朋好友留下一段终生难忘的美好记忆。', N'~\Images\acti11.jpg', N'~\Images\acti2.jpg')
INSERT [dbo].[actiInfo] ([actiID], [villageID], [actiName], [actiTime], [actiDes], [actiDesImg], [actiImg]) VALUES (11, 11, N'周边适合垂钓的农家乐', N'十一月    ', N'① 东湖牧羊庄烤全羊
预订电话：027-83320778 / 15307126225
地址：东湖风景区团山路市水务局度假村旁
 
........................................................................................................................................................................................
东湖牧羊庄烤全羊农家菜重庆特色烤全羊，
是采用山地放养的小尾山羊为主要原料，
采用天然慢火烘烤，秘制配方加工而成。
具有高蛋白、低脂肪、外酥内嫩，味美鲜香，
是宴请宾客朋友聚会的最佳选择。
........................................................................................................................................................................................
 
② 东湖翠竹园烤全羊
 预订电话：13018004971
地址：武汉东湖风景区磨山（桥梁村）武汉植物园大门左侧100米
 
........................................................................................................................................................................................  
依山傍水、亲朋好友、品味美食、养生健体
........................................................................................................................................................................................
 
③ 神农人家烤全羊
预订电话：15927083479
地址：武汉东湖风景区鲁磨路大李村39号', N'~\Images\acti14.jpg', N'~\Images\acit10.jpg')
INSERT [dbo].[actiInfo] ([actiID], [villageID], [actiName], [actiTime], [actiDes], [actiDesImg], [actiImg]) VALUES (10, 9, N'想吃纯正的烤羊肉吗？来这儿吧！', N'九月      ', N'① 东湖牧羊庄烤全羊
预订电话：027-83320778 / 15307126225
地址：东湖风景区团山路市水务局度假村旁
 
........................................................................................................................................................................................
东湖牧羊庄烤全羊农家菜重庆特色烤全羊，
是采用山地放养的小尾山羊为主要原料，
采用天然慢火烘烤，秘制配方加工而成。
具有高蛋白、低脂肪、外酥内嫩，味美鲜香，
是宴请宾客朋友聚会的最佳选择。
........................................................................................................................................................................................
 
② 东湖翠竹园烤全羊
 预订电话：13018004971
地址：武汉东湖风景区磨山（桥梁村）武汉植物园大门左侧100米
 
........................................................................................................................................................................................  
依山傍水、亲朋好友、品味美食、养生健体
........................................................................................................................................................................................
 
③ 神农人家烤全羊
预订电话：15927083479
地址：武汉东湖风景区鲁磨路大李村39号', N'~\Images\acti2.jpg', N'~\Images\acit9.jpg')
INSERT [dbo].[actiInfo] ([actiID], [villageID], [actiName], [actiTime], [actiDes], [actiDesImg], [actiImg]) VALUES (9, 5, N'邀您来赏一年中最美的沉湖', N'六月      ', N'沉湖湿地：2万亩花海似雪
　　沉湖省级湿地自然保护区位于武汉市蔡甸区西南部，保护区内约有2万亩芦苇地。主要分布在保护区的核心区与缓冲区，东至曲口大堤，西至张沉垸北堤，南至九沟桥，北至黄丝河。目前芦苇已开花，芦苇花海景观颇具规模。预定在2014年11月29日当天举办首届沉湖湿地芦花节。

 	 

　　沉湖湿地观鸟节：
　　来自全省的14支观鸟队及鸟类专家学者在沉湖湿地监测人员的引导下，进行了户外观鸟活动。2012年，在沉湖湿地共监测到鸟类39种一万余只，已发现国家一级保护鸟类白鹤3只，国家二级鸟类灰鹤300余只。本次湿地观鸟节活动还举办了首届湿地观鸟节论坛、湿地观鸟节比赛、爱鸟护鸟知识讲座、湿地保护知识培训等活动。今年的观鸟节预定在11月29号，规模比2012年要大，所以有兴趣的爱好者可以选择出门。

 	 
 	 

活动主题：11月29日邀您来赏一年中最美的沉湖
活动内容：沉湖国际重要湿地文化旅游节29日开幕
咨询电话：027-83328668 / 15307123581
详情链接：http://www.cywhb.com/zhusu/wuhan-3133.html

　　沉湖路线图：', N'~\Images\acti2.jpg', N'~\Images\acti8.jpg')
INSERT [dbo].[actiInfo] ([actiID], [villageID], [actiName], [actiTime], [actiDes], [actiDesImg], [actiImg]) VALUES (8, 5, N'木兰天池推“‘迎新年’乡村打年货套餐”', N'六月      ', N'年末之时到周边的乡村去打年货、迎新年，这已经成为许多城区人的一种休闲出游习惯了。新近，木兰天池便推出了“‘迎新年’乡村打年货套餐”，争抢出城打“春节”年货休闲旅游的游人。
　　木兰天池地处武汉市的北部山区，这里山峦起伏，水网密布，湖鲜山珍繁多，蔬果品类丰富，素有“鱼米之乡”之美誉。12月，该景区依托自身独特的旅游资源，以民俗风情为特色，推出了“‘迎新年’乡村打年货套餐”——“一日游”两人套餐158元(原价278元)含2张门票、2人中餐、1份土特产;“二日游”两人套餐388元(原价1038元)含2人早餐、2人门票、2人正餐、1间标准客房、1份土特产;三人家庭套餐428元(原价1188元)含3人早餐、3人门票、3人正餐、1间标准客房、1份土特产。参与上述套餐活动的游人，可以走进周边村湾的农家与农民们一起“忙年”，还可以在景区酒店预订特色的特色年夜饭，同时参与体验当地村湾农家特有的年俗活动。

 
　
不过在此之前，小编还是先来说说详情：
活动场地：武汉木兰天池 
活动咨询：027-61518926 / 02761518923 
天池详情：http://www.cywhb.com/jingdian/wuhan-3525.html
 
 
 
 
 
　木兰天池拥有占地1000余亩的高山湖泊，水光潋滟，波光生辉、群鸟啼鸣、鱼游倒影……独具特色的旖旎风光,让人疑似来到了江南水乡、流连忘返。景区海拔580至480公尺落差的“大天池”、“龙池堰”、“木兰西湖”中，湖鲜资源尤其丰富，知名度也高，湖中盛产各种野生名贵的淡水鱼30余种。为此，许多知情的游人逢“年节”均过来尝鲜，年末之时更是呼朋唤友前来景区“淘宝”。在“‘迎新年’乡村打年货套餐”活动中，该景区还推出有参与性、竞技性极强的钓鱼、捕鱼比赛项目;游人与景区提前预约后，还可以走进农家参与“农事”体验——磨豆腐、香油、花生酱、汤圆粉;油炸猪肉丸子、萝卜丸子、豆腐丸子、麻花和年糕等。在景区门前的“仿明清商业一条街”上，各家店铺里摆满了各种当地的农副产品——野菜、香菇、菌类、土鸡、土鸭、野猪肉……这一些“乡村土特产”对于城区来的游人真可谓是难得一见，全部是真正意义、货真价实的绿色食品。', N'~\Images\acti4.jpg', N'~\Images\acti7.png')
INSERT [dbo].[actiInfo] ([actiID], [villageID], [actiName], [actiTime], [actiDes], [actiDesImg], [actiImg]) VALUES (7, 4, N'新华农庄：现实版开心农场', N'六月      ', N'咨询电话：027-87976188 / 13995607228

       新华农庄脚踏土地， 如果你喜欢土地，那你可以在这里认领一块属于自己的田园耕地，自主决定耕种与收获，与家人和朋友一起享受郊外田园的农耕乐趣；
 
       你可以定制购买新华农庄自产的原生态农产品，放心品味纯正自然安全的美味食材；你还可以在新华农庄里认领与你有缘的【爱心树】，为它松土、浇水、施肥、装扮，一起成长。 脚踏土地，新华农庄欢你！
 
 
【新华农庄会员服务】
新华农庄采取会员式服务，凡认领新华农庄任何一款产品的参与者均可自动成为【新华农庄会员】，会员将享受以下会员待遇：
1、  会员认领耕地及果树租赁到期后拥有优先续租权；    
2、  会员可以根据各自需求自主制定农庄活动方案，农庄将全力支持配合；
3、  新华农庄定期举办的各类主题活动，会员享有优先权和优惠权。 
4、老地主介绍新地主前来租地，老地主将会获得一份礼物。   
5、为让地主在辛勤劳动之后得以放松，保证地主身心健康，农庄开设特色农家保健菜馆，为您特制各种绿色美食。您也可以享用自家农场的果实（仅收加工成本费），同时农庄还提供其他休闲娱乐活动。 
6、地主可持地主户口卡，在农庄任意偷取他人农场5%的成熟果实。
7、农庄免费为地主拍摄种菜收菜视频，以示纪念。
8、农庄为地主建QQ群和网站（博客），以便庄园与地主、地主与地主之间相互交流、加强了解，增进友谊。
 
【新华农庄2014认购方案】
【新华农庄耕地认领】：800元=拥有一块自主田园耕地，面积20平米，可以自主决定种植各类蔬菜瓜果花草，随时可以来耕作打理，自己收获成果以及悠闲快乐的劳动耕种体验！每块耕地每年认领费800元（自主耕种，日常维护及收获自理，农园提供农作工具。） 
【新华农庄果树认领】：600元=拥有一颗爱心果树果园，可以果园自选，里面有1-7年树龄的桃树、枇杷树、枣树若干。每棵果树认领费600元（含日常管理维护费），每棵树都会挂上认领者专属姓名的牌子。你可以随时来农庄给果树松土、浇水、施肥、剪枝，等到果子成熟季节可以带上孩子亲人及同事朋友们一起来亲手采摘，体验田园劳动生活与丰收喜悦。', N'~\Images\acit6.jpg', N'~\Images\acit2.jpg')
INSERT [dbo].[actiInfo] ([actiID], [villageID], [actiName], [actiTime], [actiDes], [actiDesImg], [actiImg]) VALUES (6, 3, N'板溪镇红叶+世外桃花源+酉州古城', N'五月      ', N'酉阳桃花源 活动介绍
第一天重庆-酉阳-板溪镇
参考行程
从重庆出发，至酉阳县城【4小时48分钟】，酉阳到板溪镇近25分钟。板溪镇是渝东南最大的红叶基地，漫山遍野绯红、桃红、紫红、嫣红、朱红、金黄的红叶，层次分明，极具立体感。此地，你便可品尝唯美的“应季菜”了。近晚饭时间，驱车前往世外桃源-桃花源【板溪镇-桃花源约30分钟】，食宿在桃花源附近的特色农家乐进行。
酉阳
酉阳土家族苗族自治县（简称为酉阳县）位于长江上游地区、重庆东南部，地处武陵山区腹地，是渝、鄂、湘、黔的重要门户，素有“渝东南门户、湘黔咽喉”之称。
 

板溪镇
板溪镇位于重庆市酉阳县城南郊12公里，面积160平方公里，耕地面积15264亩，被称为县城的后花园。板溪镇千亩红叶位于该镇红溪村，毗邻巴尔盖国家森林公园，背靠青华林场，是渝东南地区面积最大的红叶基地，每年秋季都会吸引上千名摄影爱好者到此摄影创作。
 

第二天板溪镇-桃花源-酉阳-重庆
参考行程
吃罢早饭，进入5A景区-桃花源进行观赏，让唯美仙境跃然纸上，体验一把隔绝与世的情怀，午饭后可驱车回重庆
桃花源
桃花源位于重庆市东南部，桃花源是国家5A级旅游景区，总面积2734公顷，由世外桃源、伏羲洞、桃花源国家森林公园、金银山、酉州古城、二酉山等六大部分组成的。森林覆盖率80.4%，重庆市“特色森林公园”，中国登山协会户外运动训练基地
 

特色美食

米豆腐
色泽润绿明亮，口感清香、软滑细嫩。在0 ℃ ～25℃温度下存放3天仍能保持新鲜不变质。米豆腐既可冷食也可熟食，风味独特，倍受消费者的青睐。
油粑粑
将米浆包裹豆类、土豆等油炸而成的一种食品，贵州省江口、沿河县的油粑粑通常用土家族秘制的醡海椒作为包心，其香其脆，其色泽，其味道更是别具一格。
 
?	门票预订
?	住宿预订
?	立即预定
门票类型	票面价	村游价	优惠	团队价	支付方式	操作
特价票
桃花源团队票 
10人以上起订	￥
￥84.0	￥36	--	景区现付	立即预订

成人票
桃花源风景区儿童票 	￥
￥60.0	￥60	--	景区现付	立即预订

桃花源风景区门票 	￥
￥96.0	￥24	--	景区现付	立即预订

桃花源风景区老年票 	￥
￥60.0	￥60	--	景区现付	立即预订

学生票
桃花源学生优惠票 	￥
￥60.0	￥60	--	景区现付	立即预订

套票
【双人套餐】桃花源门票2张+酉州古城住宿1间1晚 	￥
￥368.0	￥70	--	在线支付
定金￥168.0	立即预订

预订须知
 
 
开放时间:	夏季7:30—18:00
冬季8:00—17:30（伏羲洞景点17:00停止进入）
取票地点:	报"村游网"在体育馆左侧桃花源游客接待中心
入园凭证:	村游网预订成功确认订单短信
优惠政策:	A.免费政策：儿童身高1.2米以下免票 ;70岁以上老人，残疾人，军人凭有效证件免票
B.优惠政策：儿童身高1.2-1.4米之间购买儿童票半票，老人60-69岁持有效证件半票，学生凭学生证(限大中小学生）半价。其他优惠以景区公布为准
C.导游凭国家导游证和出团计划书可免费乘坐景区旅游观光车；身高1.2米以下儿童；全国省级以上新闻单位的记者凭有效证件和采访介绍信可免费乘坐景区旅游观光车。
最佳赏花花期:	3月-4月
花卉受天气、气温影响，略有提前或延迟，敬请关注景区最新动态
温馨提示:	门票价格不含观光车车票，观光车车票由游客自费购买
由于伏羲洞全线开通，有可能需要乘坐旅游观光车，观光车运营线路及票价参考如下
伏羲洞出口——森林公园艾坝出口——伏羲洞出口（环线）票价：20元/人次
伏羲洞出口——酉州古城北门票价：5元/人次
酉州古城北门——酉州古城南门票价：2元/人次
伏羲洞出口——文体中心停车场票价：10元/人次。', N'~\Images\acti2.jpg', N'~\Images\acit5.jpg')
INSERT [dbo].[actiInfo] ([actiID], [villageID], [actiName], [actiTime], [actiDes], [actiDesImg], [actiImg]) VALUES (5, 1, N'【村游推荐】畅览豪迈夔门雄，朝辞彩云', N'四月      ', N'奉节白帝城 活动介绍
瞿塘峡+奉节白帝城
白帝城门票预定
原价80元	村游价73元	 
特色：览山水+品人文=真的醉了
最佳观赏期：11月中旬——12月
行车路线：主城(经渝宜高速约360公里，约4小时)—奉节县城—白帝城?瞿塘峡景区-兴隆镇—天井峡地缝景区—兴隆镇—小寨天坑—奉节高速路口收费站—主城
 
简介：奉节县今年新推出观秋赏叶旅游环线，起于天坑地缝，途经三桥、黑湾、茅草坝高山草场、四十二坝、石乳关，止于兴隆镇岩口子，全长54.3公里。环线上分布了陈家河、黑湾、皮鼓瑶、十里沟4个观景平台，是游客观景、休憩、摄影的理想之地。
 
参考行程：
第一天：重庆-奉节
重庆出发，经沪渝、沪蓉高速路达奉节【车程5小时】。来到美丽的瞿塘峡，当然还要坐船欣赏了。可以在附近找私人的小船，还可以讨价还价，游整个瞿塘峡，大约2个小时。夔门天下险，绝对让你叹为观止，山拔地来地刺天，满山红叶在雄壮的背景映衬下更显波澜壮阔。你还可以与船夫商量看悬棺，采采草药。
 
住：奉节凤凰大酒店
 
第二天：白帝城-重庆
一早起来，感受那句“朝辞白帝彩云间，千里江陵一日还”的壮阔，俯瞰夔门，在心里烙印，便可安然离开，美景已然印在心里。
 
 
有发觉什么吗？没错我国新版10元人民币的背面，正是取景夔门，这是从白帝城俯看的景色，来到这一定要多多的拍下美照哟！
玩得舒心了，便可适时返回温馨的家！', N'~\Images\acti2.jpg', N'~\Images\acit4.jpg')
INSERT [dbo].[actiInfo] ([actiID], [villageID], [actiName], [actiTime], [actiDes], [actiDesImg], [actiImg]) VALUES (4, 7, N'云篆山亲子二日游，和孩子一起创造温', N'三月      ', N'上田生态园 活动介绍
小朋友们：
知道曲奇是怎么做成的吗？你们心中的曲奇饼干长什么样子呢，星星形状、爱心形状还是米老鼠形状？是什么味道呢，甜的、咸的、还是没有？只有自己动手才能知道答案呢！跟着我们田园糕点师一起来寻找心中的答案吧，快行动起来吧！

活动时间每个周末
活动地点巴南鱼洞云篆山上田生态园 
活动形式自驾到指定地点集合
活动内容和孩子钓鱼、摘水果、认蔬菜、DIY曲奇，陪孩子快乐成长！

活动须知：成人预定两人起定，儿童和大人一个房间，如单人预定请补足单房差。
注意事项：在线支付——预定房间及套餐前，必须提前电话核房，咨询电话：023-61990191在线支付优惠产品不接
                  受改期退订，请谨慎支付；
                  前台现付——提前电话核房，咨询电话：023-61990191请带上入住人身份证在前台办理入住手续。

【亲子游套餐】三餐一宿	村游价188元	 
儿童价（3—14岁半价）	村游价99元	 

活动流程流程介绍
Day1 
 10:20 云篆山上田生态园集合，工作人员接待安排
 

10:40 听田园烘焙师讲解，体验制作柠檬曲奇（锻炼孩子动手能力）
 

12:00 收场工作（做事善始善终）
12:20 在学习后，请有秩序享用午餐
 

13:30 午餐后，稍作休息赏风景，并向大自然学习（了解红柠檬的生长过程）
 

15:00 采摘果实（红柠檬和梨橙），认蔬菜，钓鱼
 
 

17:30  自助烧烤（准备材料）自制辣椒酱、烤架、准备烧烤食材（田园使者为大家准备了：新鲜牛肉、鸡翅、豆干、藕
           片、菌类等新鲜菜品，请礼让节约），分享劳动成果：钓鱼、时蔬，大家相互交流，记忆快乐时光。
 

20:00 晚上入住古式竹筒床
 

Day2 
08:00起床吃早餐,可自行安排（返回温馨家园或自行周边游玩）
09:30 农夫市集（组织当地农夫自种有机蔬菜来分享多余，让小朋友认识时令蔬菜）
 

以上图片仅供参考
温馨提示：
1、在游玩过程中，请注意安全，不要让小孩单独接触危险地带（比如：池塘边、烤架旁等）。
2、请节约食材，不要养成浪费的习惯哟。
3、若对自己自制的辣椒酱不自信，可以自带辣椒酱。
4、在制作曲奇饼干的时候，有问题可以咨询工作人员。
5、费用说明：A、活动价格含1早餐、1午餐、1晚餐自助烧烤、曲奇课程、烧烤材料费（碳火和晚餐食材）、1晚住宿；
                       B、钓鱼10元/竿（响应“浪费可耻”的口号，田园使者特赠根据自己家庭的食量自定鱼的重量，若吃不
                            完需要按价付费哟，不要贪心哟）。
6、限10个家庭（2个大人1个小孩），游戏规则请详读，目的为孩子能在安全舒适的环境下，领略大自然、懂得珍惜。', N'~\Images\acti2.jpg', N'~\Images\acti3.jpg')
INSERT [dbo].[actiInfo] ([actiID], [villageID], [actiName], [actiTime], [actiDes], [actiDesImg], [actiImg]) VALUES (3, 12, N'仙女山集体婚礼报名', N'一月      ', N'仙女山 活动介绍
一年一度的仙女山冰雪童话旅游季，即将在12月底开幕。本届主题活动包括了雪地集体婚礼，雪地足球赛等丰富有趣的冰雪活动。最亮眼的当属仙女山雪地集体婚礼了，本次集体婚礼将突破西式婚礼的轨迹，结合中华传统，以“大红花轿、迎亲仪仗队、拜天地、掀盖头，凤冠霞帔、蟒袍玉带这些元素为主题举办汉式集体婚礼，在浪漫雪原，共同谱写冬日恋歌。
婚礼日期2014年12月27日（暂定）
婚礼地点仙女山户外运动中心
报名对象准备举行婚礼的新人(举行新婚典礼、已婚夫妇(举行纪念婚典)
报名名额99对(额满为止)
报名时间即日起至2014年12月10日
所需证件结婚证、身份证
报名费用新人666元/对
服务内容：
1、汉式婚服、专业化妆、仪式、跟拍摄影、知名主持人婚礼主持、婚礼照片等全套婚礼服务
2、重庆至仙女山交通往返
3、四星级酒店2晚
4、豪华婚宴一场
5、武隆5大景区旅游套票
6、仙女山景区终身免费卡
购买产品时请在备注处填写上以下信息：
1、夫妻双方姓名及身份证号
2、是否自驾
3、手机号码
仙女山集体婚礼1对夫妻	村游价666.0元	 
2013年仙女山集体婚礼回顾', N'~\Images\acti2.jpg', N'~\Images\acti1.jpg')
INSERT [dbo].[actiInfo] ([actiID], [villageID], [actiName], [actiTime], [actiDes], [actiDesImg], [actiImg]) VALUES (1, 1, N'枫香园自助火锅', N'二月      ', N'歌乐山枫香园度假酒店 活动介绍
游览苏州式园林，吃豪华自助火锅，8人起订，68元起，赶快行动吧！！！

 
枫香园坐落于山秀林茂的歌乐山风景区，森林植被覆盖率达90%。园中建筑是以苏式园林风格建造，种植古木佳卉上百种，整座园林幽隐于古木丛林间，与苍山松林清波鱼潭浑然一体，融入了自然生态的大环境之中。
 
火锅厅共计桌数28桌 可接待宾客250人左右（8人/桌），分为大厅和包间。
大厅
靠湖边摆有6人台（可加成8人位）5张桌
中间为连桌4张，摆有12人台（可加成14人位）
靠吧台左边摆有8人台4张
大厅共计17桌 最多可容纳130-140人用餐
包间 
连包2个分别为（春桃、春柳和冬梅、冬韵）每间收取服务费50元，每桌可坐10位 
单包6间分别为（春华、夏风、夏荷、夏凉、秋实、秋桂）每间收取服务费30元，每桌可坐10位
豪华单包1间（秋菊）收取服务费50元，可坐11位 
包间共计9间11桌，最多可容纳110人用餐
 
 

自助点餐68/位（不含酒水、锅底，油碟2元/人），每桌坐8位，菜品新鲜，种类繁多，放心吃，随便吃。   
 

锅底红汤、三鲜鸳鸯汤锅免费，其余汤锅锅底费另算，大锅38元、小锅28元 ，鸳鸯锅根据不同锅底收取费用 （例如：香菇乳鸽 68元/锅 百菓山鸡68元/锅 野生菌 48元/锅 ）。
 

适合中老年的有酸萝卜老鸭汤 88/锅（一只全鸭 饲养一年以上） 配送小菜4道 青椒沾碟1个
 

预订电话：023-61990191
?	门票预订
?	住宿预订
?	立即预定
门票类型	票面价	村游价	优惠	团队价	支付方式	操作
成人票
自助火锅 
不含酒水	￥
￥68.0	￥0	--	景区现付	立即预订

4小时机麻包房（含茶水） 	￥
￥128.0	￥0	--	景区现付	立即预订

机麻包房买断（含茶水） 
买断时间早11:00——凌晨2:00	￥
￥148.0	￥20	--	景区现付	立即预订

【三餐一宿】10人起订 
1早餐+1午餐桌餐+1晚餐自助火锅或桌餐+1晚住宿	￥
￥228.0	￥20	--	景区现付	立即预订

烤全羊（36元/斤，送汤锅、自制饮料1扎） 
预计40斤的价格	￥
￥1,440.0	￥0	--	景区现付	立即预订

【10人套餐】烤全羊（送汤锅和自制饮料一扎）+标间一晚+早餐 
烤全羊预计40斤左右，住宿为标间	￥
￥2,700.0	￥620	--	景区现付	立即预订

预订须知
 
 
 温馨提示：您只有通过本站在线预订，购票时出示并核对订票短信方可尊享本站预订价格
开放时间:	10：00—23：30
取票地点:	酒店前台
退房须知:	1、退房时间为中午14：00
2、延迟退房费用：18:00前按半天计算
3、加床费用：80元/间/床
入园凭证:	村游网预订成功确认订单短信
优惠政策:	A.免费政策： 儿童身高1.2（包含1.2）米以下免票。
B.优惠政策：儿童身高1.2米—1.4（包含1.4）购优惠票。
发票说明:	网络预订不提供发票。
注意事项:	1、预定房间及套票必须提前与我方核实是否有房，咨询电话：023-61990191/13640508947 ，如因未核房造成的相关损失需自行承担
2、在线支付优惠产品，不接受改期退订，请谨慎支付。
           枫香园静心2日游', N'~\Images\wind1.jpg', N'~\Images\acti2.jpg')
SET IDENTITY_INSERT [dbo].[actiInfo] OFF
SET IDENTITY_INSERT [dbo].[comInfo] ON 

INSERT [dbo].[comInfo] ([comID], [userID], [expID], [comCont], [comTime]) VALUES (1, 10001, 2018, N'服务解放军是', CAST(0x0000A40000BCC887 AS DateTime))
INSERT [dbo].[comInfo] ([comID], [userID], [expID], [comCont], [comTime]) VALUES (2, 10001, 2018, N'哇娥夫人师范', CAST(0x0000A40000C20CEA AS DateTime))
INSERT [dbo].[comInfo] ([comID], [userID], [expID], [comCont], [comTime]) VALUES (3, 10001, 2018, N'阿斯顿分师大师大', CAST(0x0000A40000F95258 AS DateTime))
INSERT [dbo].[comInfo] ([comID], [userID], [expID], [comCont], [comTime]) VALUES (4, 10001, 2018, N'啊微软是', CAST(0x0000A40000FD9BCC AS DateTime))
INSERT [dbo].[comInfo] ([comID], [userID], [expID], [comCont], [comTime]) VALUES (1002, 10001, 2013, N'师大潍坊为啥当初vq我', CAST(0x0000A40100962C66 AS DateTime))
INSERT [dbo].[comInfo] ([comID], [userID], [expID], [comCont], [comTime]) VALUES (1003, 10001, 2018, N'我怕我', CAST(0x0000A4010124D04F AS DateTime))
INSERT [dbo].[comInfo] ([comID], [userID], [expID], [comCont], [comTime]) VALUES (2003, 10001, 2015, N'我也去过那个地方，真的很不错', CAST(0x0000A402008F8E2A AS DateTime))
INSERT [dbo].[comInfo] ([comID], [userID], [expID], [comCont], [comTime]) VALUES (2004, 10001, 2016, N'这个地方很好玩啊，也很漂亮，我上次去栏', CAST(0x0000A40400AE203E AS DateTime))
INSERT [dbo].[comInfo] ([comID], [userID], [expID], [comCont], [comTime]) VALUES (2005, 10001, 2018, N'我我哦呜哦', CAST(0x0000A40400B3316B AS DateTime))
INSERT [dbo].[comInfo] ([comID], [userID], [expID], [comCont], [comTime]) VALUES (2006, 10001, 2018, N'你好', CAST(0x0000A40400B539F8 AS DateTime))
INSERT [dbo].[comInfo] ([comID], [userID], [expID], [comCont], [comTime]) VALUES (2007, 10001, 2015, N'阿斯顿分阿斯顿', CAST(0x0000A408009F37FD AS DateTime))
INSERT [dbo].[comInfo] ([comID], [userID], [expID], [comCont], [comTime]) VALUES (2008, 10001, 2018, N'带你走进这个江西东北部的小村落，拥抱最美的春天……', CAST(0x0000A409009DCC66 AS DateTime))
INSERT [dbo].[comInfo] ([comID], [userID], [expID], [comCont], [comTime]) VALUES (2009, 10001, 2018, N'顿顿是傻逼', CAST(0x0000A40900C17BAF AS DateTime))
INSERT [dbo].[comInfo] ([comID], [userID], [expID], [comCont], [comTime]) VALUES (3008, 10001, 2018, N'啊手动阀是大概', CAST(0x0000A40B008C8E4F AS DateTime))
INSERT [dbo].[comInfo] ([comID], [userID], [expID], [comCont], [comTime]) VALUES (3009, 10002, 2018, N'我也去过啊 感觉真的很好的，我喜欢，给个赞
', CAST(0x0000A40B0120C0C7 AS DateTime))
INSERT [dbo].[comInfo] ([comID], [userID], [expID], [comCont], [comTime]) VALUES (3010, 10001, 2018, N'感觉66的', CAST(0x0000A40D0119E57C AS DateTime))
SET IDENTITY_INSERT [dbo].[comInfo] OFF
SET IDENTITY_INSERT [dbo].[comReturn] ON 

INSERT [dbo].[comReturn] ([comReturnID], [userID], [comID], [comReturnTime], [comReturnCont]) VALUES (3, 10001, 2003, CAST(0x0000A40200F7AD3F AS DateTime), N'我我我我我我我')
INSERT [dbo].[comReturn] ([comReturnID], [userID], [comID], [comReturnTime], [comReturnCont]) VALUES (4, 10001, 2003, CAST(0x0000A40201023CCB AS DateTime), N'阿斯顿阿三')
INSERT [dbo].[comReturn] ([comReturnID], [userID], [comID], [comReturnTime], [comReturnCont]) VALUES (5, 10001, 1, CAST(0x0000A40201093D6E AS DateTime), N'放松放松的')
INSERT [dbo].[comReturn] ([comReturnID], [userID], [comID], [comReturnTime], [comReturnCont]) VALUES (6, 10001, 1003, CAST(0x0000A40400A0CB7D AS DateTime), N'我我我我我我我我我')
INSERT [dbo].[comReturn] ([comReturnID], [userID], [comID], [comReturnTime], [comReturnCont]) VALUES (7, 10001, 4, CAST(0x0000A40400A2A426 AS DateTime), N'我我我我我我我我我我我')
INSERT [dbo].[comReturn] ([comReturnID], [userID], [comID], [comReturnTime], [comReturnCont]) VALUES (8, 10001, 1, CAST(0x0000A40400A8E3BC AS DateTime), N'我我我我哦我')
INSERT [dbo].[comReturn] ([comReturnID], [userID], [comID], [comReturnTime], [comReturnCont]) VALUES (9, 10001, 2004, CAST(0x0000A40400AE3FFA AS DateTime), N'我我我w哦我我我我我为')
INSERT [dbo].[comReturn] ([comReturnID], [userID], [comID], [comReturnTime], [comReturnCont]) VALUES (10, 10001, 2, CAST(0x0000A40800E803DF AS DateTime), N'阿三')
INSERT [dbo].[comReturn] ([comReturnID], [userID], [comID], [comReturnTime], [comReturnCont]) VALUES (11, 10001, 2, CAST(0x0000A40800E80CB1 AS DateTime), N'阿三')
INSERT [dbo].[comReturn] ([comReturnID], [userID], [comID], [comReturnTime], [comReturnCont]) VALUES (1010, 10001, 2008, CAST(0x0000A409009DF1FF AS DateTime), N'')
INSERT [dbo].[comReturn] ([comReturnID], [userID], [comID], [comReturnTime], [comReturnCont]) VALUES (1011, 10001, 2006, CAST(0x0000A409009DF557 AS DateTime), N'带你走进这个江西东北部的小村落，拥抱最美的春天……')
INSERT [dbo].[comReturn] ([comReturnID], [userID], [comID], [comReturnTime], [comReturnCont]) VALUES (1012, 10001, 1, CAST(0x0000A40900C18B9C AS DateTime), N'咳咳咳')
INSERT [dbo].[comReturn] ([comReturnID], [userID], [comID], [comReturnTime], [comReturnCont]) VALUES (1013, 10001, 1, CAST(0x0000A40900C196F7 AS DateTime), N'咳咳咳')
INSERT [dbo].[comReturn] ([comReturnID], [userID], [comID], [comReturnTime], [comReturnCont]) VALUES (2010, 10002, 3009, CAST(0x0000A40B0120E9FB AS DateTime), N'对的，感觉66的')
INSERT [dbo].[comReturn] ([comReturnID], [userID], [comID], [comReturnTime], [comReturnCont]) VALUES (2011, 10002, 3009, CAST(0x0000A40B0120ED80 AS DateTime), N'对的，感觉66的')
INSERT [dbo].[comReturn] ([comReturnID], [userID], [comID], [comReturnTime], [comReturnCont]) VALUES (2012, 10001, 3, CAST(0x0000A40D0119FC80 AS DateTime), N'感觉66的，还可以啊 ')
INSERT [dbo].[comReturn] ([comReturnID], [userID], [comID], [comReturnTime], [comReturnCont]) VALUES (2013, 10001, 2005, CAST(0x0000A40D011A16EB AS DateTime), N'就问你怕不怕，就问你慌不慌')
INSERT [dbo].[comReturn] ([comReturnID], [userID], [comID], [comReturnTime], [comReturnCont]) VALUES (2014, 10001, 2005, CAST(0x0000A40D011A1DAE AS DateTime), N'就问你怕不怕，就问你慌不慌')
INSERT [dbo].[comReturn] ([comReturnID], [userID], [comID], [comReturnTime], [comReturnCont]) VALUES (2015, 10001, 2009, CAST(0x0000A40D011AB497 AS DateTime), N'就你事多')
SET IDENTITY_INSERT [dbo].[comReturn] OFF
SET IDENTITY_INSERT [dbo].[expInfo] ON 

INSERT [dbo].[expInfo] ([expID], [userID], [expTitle], [expTime], [expDes], [expImg], [praiseCount]) VALUES (2018, 10017, N'困在城市里的我们却早已盼望着春天的气息，是花草，是乡野，是小桥流水世外桃源', CAST(0x0000A40000AB573E AS DateTime), N'未到，困在城市里的我们却早已盼望着春天的气息，是花草，是乡野，是小桥流水世外桃源，还有那片片金黄的油菜花田。婺源——这个中国最美的乡村，即将在春天来临之时，盛开出最灿烂的景色，白墙黑瓦袅袅炊烟，璀璨金黄油菜花田。本期驴妈妈赏油菜花专题，将带你走进这个江西东北部的小村落，拥抱最美的春天……', N'~\Images\view2.jpg', 261)
INSERT [dbo].[expInfo] ([expID], [userID], [expTitle], [expTime], [expDes], [expImg], [praiseCount]) VALUES (2017, 10017, N'第一次爬上这样有趣的屋顶赏景，第一次自己爬上屋顶去摘水果', CAST(0x0000A40000AAF5FB AS DateTime), N'在屋顶时，真舍不得下来啊。坐在屋顶欣赏风景真的好惬意。真可惜无法在那过夜，要是可以在那过夜，一群人在屋顶的树荫下泡上一壶功夫茶，摆上几碟小点心，顺手摘摘旁边的水果，聊聊天，哇~~~多么享受啊。在晴朗的天时还可以坐在屋顶上仰望满天星星的夜空，哇，多么浪漫。(*^__^*) 嘻嘻……以后有机会，真想找一群朋友一起去。', N'~\Images\village2.jpg', 145)
INSERT [dbo].[expInfo] ([expID], [userID], [expTitle], [expTime], [expDes], [expImg], [praiseCount]) VALUES (2016, 10017, N'以体验田园风光、回归乡野自然为主题的乡村', CAST(0x0000A40000AA0EBA AS DateTime), N'乡村旅游为乡村旅游地带来了巨大的经济利益,但同时也引发了乡村旅游地的城市化、现代化和商业化等负面效应,从而导致其产生了不真实的现象,因此在乡村旅游的开发和运营过程中,如何保持乡村旅游地的真实性和可持续发展,同时又满足旅游者求真、求异的乡村旅游体验经历,已经成为乡村旅游能否吸引游客,能否可持续发展,能否推动当地经济持续发展的一个重要瓶颈。', N'~\Images\view1.jpg', 534)
INSERT [dbo].[expInfo] ([expID], [userID], [expTitle], [expTime], [expDes], [expImg], [praiseCount]) VALUES (2015, 10017, N'多元化、多样化、特色化的发展，将环境旅游与文化旅游紧密结合', CAST(0x0000A40000A8FC20 AS DateTime), N'推出复合型乡村旅游产品正是我市各级旅游部门正积极探索的工作。据潘土根透露，接下来将根据全市6个县(市、区)各地特有的民俗文化、每季蔬果特色等，由旅游部门引导推动，开展丰富多彩的游客互动活动，不仅让游客参与体验，也通过此让农民参与到旅游进程中来，让他们真正受益，从而最终实现提高农民收入、促进农民就业、调整和改善农村经济结构、推进城乡一体化建设等目标。', N'~\Images\game2.jpg', 5880)
INSERT [dbo].[expInfo] ([expID], [userID], [expTitle], [expTime], [expDes], [expImg], [praiseCount]) VALUES (2014, 10001, N'“不管是概念中提到的民俗文化还是田园风光，', CAST(0x0000A40000A6A8D7 AS DateTime), N'市都有着良好的条件，比如柯城区余家山头的‘女儿节’，虽然只是当地的一个民俗，但这种小题完全可以大作，以此吸引游客前往亲身感受‘女儿节’的温馨、和谐。”潘土根说，其实在我市已有不少地方在乡村旅游上做了很好的探索，比如衢江区东坪乡的古道体验游、柿子采摘游、参与自制豆腐花，还有江山和睦彩陶村的陶瓷制作等，每一项活动游客都能参与其中。', N'~\Images\xiangcun1.jpg', 7345)
INSERT [dbo].[expInfo] ([expID], [userID], [expTitle], [expTime], [expDes], [expImg], [praiseCount]) VALUES (2013, 10001, N'“挖了几根春笋，出了身汗，过瘾！”', CAST(0x0000A40000A533E9 AS DateTime), N'“这山远远看过来真的像一个毛笔架，神了！”……4月4日，正值清明小长假，天气晴好，除了祭奠先人，不少市民也选择了外出游玩，在衢江区湖南镇破石村的笔架山庄，爬山、挖笋，游客们玩得很开心。“生意还可以，今天中午就有5桌。”山庄老板张春香忙前忙后，她说，从2006年开始经营农家乐，节假日的生意还不错。', N'~\Images\game1.jpg', 471)
SET IDENTITY_INSERT [dbo].[expInfo] OFF
SET IDENTITY_INSERT [dbo].[foodInfo] ON 

INSERT [dbo].[foodInfo] ([foodID], [villageID], [foodName], [foodTime], [foodDes], [foodDesImg], [foodImg]) VALUES (30, 11, N'芝麻糖饼仔', N'一月      ', N'芝麻糖饼仔
    南昌民间售销的芝麻糖饼仔有上百年的历史，具有甜而不腻，止咳化痰等功效。  
    芝麻糖饼仔选用大白米，熟白芝麻为主要原料。现多采用传统方法与粉酶液化新工艺相结合，以麦牙糖化开的棕黄色液体制成饴糖，再经浸泡、磨浆、糖化、挤压成型。  
每天下午3点以后，南昌的小巷深处，常有"芝麻糖饼仔啊"的悠扬叫卖声，这就是卖芝麻糖饼仔的，小商用竹制萝筐挑着叫卖，一般都是自产自销、大人小孩都受吃。特别是病后久咳不止，买上几块，用热米汤水化开喝只消喝几次便可痊愈。', N'~\Images\芝麻糖饼仔 Des.jpg', N'~\Images\芝麻糖饼仔.jpg')
INSERT [dbo].[foodInfo] ([foodID], [villageID], [foodName], [foodTime], [foodDes], [foodDesImg], [foodImg]) VALUES (29, 11, N'婺源萝卜饺', N'十月      ', N'萝卜最有名的制作方法是：一种是腌制成萝卜干，另一种就是制我们现在端上桌的信丰萝卜饺。
   萝卜饺的制作方法是将白萝卜切成块状，煮至八成熟，捞起沥干剁成泥状，配以盐、酱油、辣椒粉、味精、葱花等佐料。入锅翻炒用淀粉勾芡，制成糊陷，再将猪肉、鱼肉切成指甲大小的薄片，拌上酱油、味精，以上馅料备好后，再进行擀皮。擀皮时，先将薯粉倒入加热的锅中，加适量冷水，待水沸后用锅铲快速拌匀，起锅时，将粉倒在案板上，反复搓匀，最后搓成长圆条，掐成小脐，然后用擀面杖擀成圆皮。包饺时，一手托皮，一手执莲花刀把萝卜馅下脐中间，再下鱼、肉各一片，然后包成月牙形的饺子，入笼用旺火蒸15分钟即成。制作完成后的萝卜饺子，用调好的麻油、酱油、辣椒蘸食，成品萝卜饺饺皮透明滑润，入口有很好的嚼劲，馅肉香辣味鲜，风味独特。
朴实无华的信丰萝卜饺，皮是用红薯磨成粉做的，馅是萝卜，再普通不过一如我们可爱的信丰乡亲。', N'~\Images\信奉萝卜饺Des.jpg', N'~\Images\信奉萝卜饺.jpg')
INSERT [dbo].[foodInfo] ([foodID], [villageID], [foodName], [foodTime], [foodDes], [foodDesImg], [foodImg]) VALUES (28, 10, N'三杯鸡', N'三月月    ', N'三杯鸡
  相传与民族英雄文天祥有关。因其烹制时不放汤水，仅用米酒一杯，猪油一杯，酱油一杯，故名三杯鸡。
 三杯鸡是江西特色菜，因烹调鸡块时加入甜米酒、猪油、酱油各一小杯，不放汤水，用炭火将鸡块炖熟而得名。而它的来源与大英雄文天祥有关：
   南宋末年，民族英雄文天祥抗元被俘。一位老婆婆得知文天祥即将被杀，就带了一只鸡和一壶酒来狱中探望他。在一位江西狱卒的帮助下，老婆婆见到了文天祥。这位狱卒把老婆婆带的鸡收拾好切成块，在瓦钵中倒上三杯米酒，用小火煨制。一个时辰后，两人把鸡肉端到文天祥面前，他心怀亡国之恨吃完了最后这顿饭。这个狱卒回到老家江西后，每逢文天祥祭日，必用这道菜祭奠他。后来，厨师将三杯酒改成一杯甜酒酿、一杯酱油、一杯猪油，而且用江西宁都特产的宁都三黄鸡做原料，这就是现在大名鼎鼎的江西三杯鸡了。2008年，这道菜还入选了奥运主菜单', N'~\Images\三杯鸡Des.jpg', N'~\Images\三杯鸡.jpg')
INSERT [dbo].[foodInfo] ([foodID], [villageID], [foodName], [foodTime], [foodDes], [foodDesImg], [foodImg]) VALUES (27, 10, N'瓦罐汤', N'四月      ', N'南昌瓦罐汤
  南昌煨汤，又名南昌瓦罐汤。尤以南昌民间饭庄最为有名，是江西南昌地区的汉族名菜，完全采用汉族民间传统的煨汤方法，以土质陶器为瓦罐，精配食物，加以天然矿泉水为原料，置入1米方圆的巨型大缸内，以硬质木炭火恒温传统式六面受热，煨制达7小时以上，过程是160℃煨2 到3小时，接着降温到120℃煨2个小时左右，再用文火慢慢煨。汤馆每天一大早就选用上好原料现煲的小罐汤在一人高的大缸中，慢火煨一天后就变成了又浓又香的滋补品。瓦罐的妙处在于土质陶器，秉阴阳之性含五行之功效，久煨之下原料鲜味及营养成分充分溶解于汤中，其味鲜香淳浓。
    肉骨汤所以营养丰富，味道鲜美，主要是蛋白质和脂肪溶解在汤里的结果。炖肉骨汤时，先冷水下锅，逐渐升温煮沸，然后文火煨炖，这样，可以使肉骨的骨组织疏松，骨中的蛋白质、脂肪逐渐解聚而溶出。于是，肉骨汤便越煨越浓，油脂如膏，骨酥可嚼。', N'~\Images\南昌瓦罐汤 Des.jpg', N'~\Images\南昌瓦罐汤.jpg')
INSERT [dbo].[foodInfo] ([foodID], [villageID], [foodName], [foodTime], [foodDes], [foodDesImg], [foodImg]) VALUES (26, 10, N'炒粉', N'五月      ', N'南昌炒粉 
  江西是鱼米之乡，盛产大米，因此也有很多大米做的食品，其中米粉是老百姓日常主食，炒粉为江西民间的一种
食物，是将粉（南方人叫米粉，江西人通常就叫粉。形状为圆条状，白色，用米浆做）煮熟，再捞起（捞起后可持续晾干放置数小时，晾干放置时间的长短会影响到炒粉的硬度和口感），然后将粉放入油锅里通过明火翻炒，放入酱油、辣椒
粉、青菜等配料，有米的醇香和爆炒的煎炸味道。这是一道风味独特饮食，方便容易制作，可做正餐使用。同类的还有炒面。其中江西南昌炒粉最为有名。久负盛名的南昌米粉，具有洁白、细嫩、久漂不烂、久炒不碎的特点。南昌米粉历史悠久，主要制作原料是优质晚米。要经过浸米、磨浆、滤干、采浆等多道工序。吃法也方便、简洁，可以凉拌米粉、炒煮米粉，放入姜沫、蒜沫、麻油、酱油、猪油、葱花、咸菜沫，最不可少的是南昌人喜欢的辣椒和胡椒粉。那可真是肉嫩，粉韧、味鲜。', N'~\Images\南昌炒粉Des.jpg', N'~\Images\南昌炒粉.jpg')
INSERT [dbo].[foodInfo] ([foodID], [villageID], [foodName], [foodTime], [foodDes], [foodDesImg], [foodImg]) VALUES (25, 12, N'狮子头', N'一月      ', N'鄱阳湖狮子头

    鄱阳湖狮子头是南昌名菜，制作独特，质地酥软，味道鲜美。制作方法：先将香芋切丝放盆内加精盐拌匀腌软，猪肉剁成米粒状。再将肉粒、香芋丝、马蹄末、火腿末、干贝丝、姜末、鸡蛋拌在一起，加入干淀粉、精盐、酱油、胡椒粉搅打后分成4份，每份包一个咸蛋黄，即为狮子头生坯。然后炒锅上火，放入色拉油烧到五成热时，放入狮子头生坯，炸至金黄色捞出，放入高汤（与狮子头相平）后再加精盐、料酒、酱油、葱结、姜丝上笼蒸2小时左右。至酥烂出笼，拣去葱结。炒锅上火，放入清水烧沸，加入少量油，放入菜心、精盐、鸡精、味精，略炒至熟，出锅盛于平底汤盘内。炒锅重上火，将狮子头的原汁倒入锅内，狮子头反扣于菜心上，用湿淀粉勾芡，加入明油，淋浇于狮子头上即成。', N'~\Images\鄱阳湖狮子头Des.jpg', N'~\Images\鄱阳湖狮子头.jpg')
INSERT [dbo].[foodInfo] ([foodID], [villageID], [foodName], [foodTime], [foodDes], [foodDesImg], [foodImg]) VALUES (24, 12, N'炸鱼饼', N'十二月    ', N'赣南炸鱼饼
   鱼饼是一道汉族传统名菜，历来以浙江温州鱼饼、江西赣州鱼饼和广东顺德鱼饼最为有名。顺德均安鱼饼肉质鲜嫩、鲜而不腥、低脂肪，营养极为丰富，鱼饼色泽金黄，具有香、滑、爽、嫩、鲜的特色，是下酒下饭之佳肴，令人“食过番(再)寻味”。
    鱼饼有上千年的历史，长期以来只在皇宫贵族的御宴中流行。相传在上古时期，舜帝南巡，深得他宠幸的潇湘二妃陪伴左右。由于旅途劳累，二妃茶饭不思，日渐消瘦。无奈中舜帝便寻名方，仍不能缓解。后来一个名叫伯的渔夫，奉上他精心制作的鱼饼，潇湘二妃吃后，顿觉精神倍增，旅途劳累一扫而除。爱民如子的舜帝，见鱼饼如此神奇，遂令伯将制作方法传与众人，自此鱼饼广为流行。清朝光绪年间，光绪帝的爱妃——珍妃，从小对鱼糕情有独钟，每餐必食。而她爱吃的鱼饼自传入宫中有，在宫中盛极一时。为彰显皇宫气派，御膳房的御厨们，根据珍妃所授的配方，经过精心改进和提升，成了宫廷中的一道名菜，这就是著名的珍妃鱼饼。但是，随着珍妃因追随光绪支持戊戌变法，而被慈禧赐死后，珍妃鱼饼也随珍妃一起在宫中消失。', N'~\Images\赣南炸鱼饼Des.png', N'~\Images\赣南炸鱼饼.jpg')
INSERT [dbo].[foodInfo] ([foodID], [villageID], [foodName], [foodTime], [foodDes], [foodDesImg], [foodImg]) VALUES (23, 12, N'千层酥', N'十一月    ', N'赣南千层酥
  酥皮点心一直是大家非常喜欢的甜点之一，而且还能变幻出各式不同的甜点，像是酥皮蛋塔、酥皮派等等。可因为酥皮制作起来比较麻烦，所以也使好多的烘焙爱好者不敢尝试，其实只要严格按照配方中的制作过程来做，酥皮点心并不难做。下面我们就一起来做做看吧！材料、饼皮材料、高粉200克、低粉40克、黄油30克、糖1大匙、水1/2杯、麦淇淋150克菠萝馅、中型菠萝半个、糖60克、玉米淀粉2大匙另准备蛋黄1个。', N'~\Images\赣南千层酥Des.jpg', N'~\Images\赣南千层酥.jpg')
INSERT [dbo].[foodInfo] ([foodID], [villageID], [foodName], [foodTime], [foodDes], [foodDesImg], [foodImg]) VALUES (22, 13, N'黎蒿炒腊肉', N'六月      ', N'藜蒿炒腊肉
   藜蒿炒腊肉属赣菜系豫章菜一支，为江西省鄱阳县的一道汉族名菜，其主料藜蒿产自中国最大的淡水湖——鄱阳湖，腊肉选用鄱阳县本土特产腊肉。藜蒿炒腊肉以其“脆嫩爽口，醇香柔润”的特点而入选“十大赣菜”之一。在所有蔬菜与腊肉的组合中，要数藜蒿达到了最高境界。咸香柔软的腊肉，配上藜蒿独特的淡香。吃上一口，唇齿生香，回味无穷。也难怪上至宾馆酒楼，下至酒家排档家庭餐桌，都少不了它的身影。招待外地朋友，藜蒿炒腊肉也成了首选，是必备的一道压轴菜。
    本草纲目草部第十五卷记载：藜蒿气味甘甜无毒，主治五胀邪气，风寒湿脾，补中益气，长毛发，久食轻身，耳聪目明，防衰。中医认为其除食用之外还有清热、利湿、杀虫之功能。每年阳春三月，也是藜蒿盛产的季节。在《神农本草经》中，藜蒿被列为野蔬上品。用藜蒿炒腊肉，是每个江南人都爱吃的一道家常野菜，一直享有“登盘香脆嫩，风味冠春蔬”的美誉。其制作也简单。腊肉金黄，藜蒿青绿，脆嫩爽口，醇香柔润，且有一股特别的清香味道诱惑着食欲。食后有开胃理气、神清气爽的功效。藜蒿根部呈白色，较粗壮，味清香，取其根与腊肉合炒，腊肉咸香柔软，藜蒿脆嫩香甜，民间风味突出。是湘西北地区和洞庭湖区冬春两季的时令菜。', N'~\Images\黎蒿炒腊肉 Des.jpg', N'~\Images\黎蒿炒腊肉.jpg')
INSERT [dbo].[foodInfo] ([foodID], [villageID], [foodName], [foodTime], [foodDes], [foodDesImg], [foodImg]) VALUES (21, 13, N'春卷', N'八月      ', N'春卷
    春卷，又称春饼、薄饼。是汉族民间节日传统食品。流行于中国各地，江南等地尤盛。民间除供自己家食用外，常用于待客。历史悠久。春卷是由古代的春饼演化而来的。据古书陈元靓的《岁时广记》中记载：“在春日，食春饼，生菜，号春盘。”清代的《燕京岁时记》也有：“打春，是日富家多食春饼。”可见春日做春饼，食春饼的民俗风情由来已久。现在有关春卷的谚语很多，如“一卷不成春”，“隆盛堂的春卷---里外不是人”等等，春的意思在这里就是春天，有迎春喜庆之吉兆。
   每逢星期日或其他节日，南昌的公园和其它游览场所，可见常见来往游人，手拿着几个春卷，边走、边吃、边笑。  
    春卷也是南昌民间的传统小吃。传统的制法是用水调面加食盐，搅得面可挑起筋后再在平锅上烫成薄皮，加韭菜在新鲜肉馅中拌和，再将烫好的薄面粉皮一张，放入馅芯，包成二寸长、八九分宽的长卷，下到油锅内去炸。炸好的春卷呈金黄色，皮薄焦脆、香气四溢。', N'~\Images\春卷 Des.jpg', N'~\Images\春卷.jpg')
INSERT [dbo].[foodInfo] ([foodID], [villageID], [foodName], [foodTime], [foodDes], [foodDesImg], [foodImg]) VALUES (20, 13, N'炒螺丝', N'八月      ', N'炒螺丝
   炒螺丝，又名嗦螺，是一道客家风味的河鲜菜品。由螺丝和辣椒及各种调味料制成，味道鲜辣十分过瘾。', N'~\Images\炒螺丝 Des.jpg', N'~\Images\炒螺丝.jpg')
INSERT [dbo].[foodInfo] ([foodID], [villageID], [foodName], [foodTime], [foodDes], [foodDesImg], [foodImg]) VALUES (19, 13, N'包果米', N'七月      ', N'包米果
  这是江西赣南地区最有特色的地方美食之一，在上犹、南康、大余、信丰、龙南、赣县、于都等客家人聚集地区更是久负盛名。相传从元朝到现在已有七百多年的历史。包米果以四季时蔬为佐料、春之青菜、夏秋之瓜果、冬之萝卜，配以韭葱蒜肉泥，其味清爽可口。尤其是上犹包米果因“皮薄润滑、料多爽口”而美名远扬，成了许多外地游客到上犹的必吃小吃。
     说起包米果的由来，这里还有个故事。据《上犹县志》载：南宋灭亡一个多月后，元朝军队先后率兵攻打上犹城县，城里人死不降元军，元军恼怒不已，城破后进行了报复性的屠杀，全城死者有一千三百余人，当时有个幸存的客家媳妇，劫后寻找食物，惊喜地发现有一盆水浸着的米，用力一擦，全成了桨。用老办法煮饭是不可能的。怎样煮来吃呢？当年县城的背面山上，古木参天，干竹子遍地，有的是柴火。她动一动脑筋，拿一个本来是用来晒米谷的簸箕，淋上米桨，烧起旺火，蒸熟后，包上一点腌菜萝卜之类的，尝了一囗感觉十分好吃，这位客家媳妇还请左邻右舍的村民来吃，都说味道很好，大家都说她心灵手巧。问她用什么东西盛米桨蒸的？当时她不直说，而用手比划着说：“圆（元）篾（灭）！”引起众民一阵开心的笑，也附和着说：“元灭！元灭！” 在那个朝代，说错了话是要砍头的。因为元朝对汉民统治十分厉害，十家人共用一把菜刀。何况这小女子还当众说：“圆（元）篾（灭），不给点颜色她看看还得了？”官府拿这个妇人当堂审问，巧媳妇拿出簸箕解释“圆篾”之说，官府也无可奈何，只好把她放了。客家媳妇不畏强暴的故事知者不多，但从此江西上犹县客家美食－－－－－包米果却流传开了。', N'~\Images\包米果Des.jpg', N'~\Images\包米果.jpg')
INSERT [dbo].[foodInfo] ([foodID], [villageID], [foodName], [foodTime], [foodDes], [foodDesImg], [foodImg]) VALUES (18, 11, N'竹园鸡', N'六月      ', N'茶香豆酱竹园鸡
   将鸡“开窿”，不要破肚。将鸡掏空内脏，里外洗净，用干布擦干水，鸡杂洗净用盐和生粉腌着留用；
    用豆瓣酱将鸡里外抹匀，豆酱干后，再抹一层酱油或豉油鸡汁以添色，晾干后再抹一次豆瓣酱；
    将豆瓣酱内的黄豆塞进鸡肚子里，用保鲜纸把鸡连碟封好，放进冰箱下层腌制半天，腌过夜也不妨；
    将腌好的豆酱鸡取出，在碟底、鸡肚、鸡身面上分别放些已稍泡开的铁观音茶叶；
    将鸡放进蒸锅蒸半小时后，揭盖，用筷子插进鸡身查看是否熟透。熟透的鸡，筷子一插就入，筷子拔出，晶莹的鸡油随即涌出；
    待鸡放凉后斩件上桌(鸡放凉后才斩不易掉皮)；
    将腌好的鸡杂加些火腿丝煮娃娃菜或菜心，有菜有汤，伴鸡极佳；
    喜蘸料的话可将葱切成丝或姜剁成蓉，加入盐和鸡粉，淋上滚油即成。
     2.盐焗竹园鸡
    将鸡宰杀，除去内脏，洗净、晾干、不切碎。然后把整只鸡用竹制草纸包好，在炒过的热盐中用文火焖熟。盐焗鸡肉嫩、味香、清润滋补。
    3.竹园白斩鸡
    将杀净之鸡，入锅隔水蒸熟，或者直接将鸡放入冷水锅中，煮熟捞起，切成二指宽的小块装盘。然后，将嫩姜去皮，加盐捣成姜泥，放入锅内添上鸡汁，沸后马上起锅浇在鸡上。这道菜具有肉质细嫩，味道纯正的风味。
    4.竹园南瓜鸡
   主料是南瓜，子鸡。
　　要准备的辅料有葱姜，盐，整粒花椒，鸡精，白糖，麻油，酱油和料酒，怎么做呢，首先把子鸡清洗干净。
　　因为现在家里人口少，吃不了这么多的话，我们可以把鸡头和鸡爪剁下来，这样留着可以做一道汤。
　　接着把子鸡切开，清洗内脏，再把它切成一寸左右大小的块，如果觉着有辛味的话，可以用水焯一下。
　　把南瓜上面挖下一个圆的盖来，把里面的子清理干净。
　　现在关键一步暴炒子鸡，放油，烧开后放花椒葱姜，倒入子鸡翻炒，酱油，料酒，一点白糖，这样来回翻炒十分钟左右，再加入鸡精就可以出锅啦，然后把它们放入清理完的南瓜壳里摆好，再盖上盖子，放到锅里蒸20分钟左右就可以啦。
　　专家：南瓜有一个微量元素叫钴，有了它就可以帮助体内产生B12，对预防大细胞性贫血有好处，第二个就是它含有维生素E，含有维生素C，还有四黄素，还有胡萝卜素很丰富，这些微量元素的出现对预防很多疾病都是有好处的，比如说现在说的富贵病糖尿病高血压这些病，可能某种意义生也有一些间接的预防癌症的作用。', N'~\Images\竹园鸡 Des.jpg', N'~\Images\竹园鸡.jpg')
INSERT [dbo].[foodInfo] ([foodID], [villageID], [foodName], [foodTime], [foodDes], [foodDesImg], [foodImg]) VALUES (17, 10, N'竹筒粉蒸汤', N'三月      ', N'竹筒粉蒸肠是江西省汉族名菜，竹香味浓，酥烂鲜辣。
将净肥肠切成2厘米宽的菱形块，姜切片，炒锅上火放入水、料酒、姜片、烧沸后将肥肠焯水捞起。将余下的姜切末、干椒切末，将焯过水的肥肠装在瓷钵内用料酒、酱油、适量的盐、味精腌渍一个小时。将姜末、干椒末、五香米粉、腌渍好的肥肠，加上适量的水，拌匀待用。取竹筒一只（两端留节、从面上开一盖），刷上油，垫好生菜，把拌好的粉蒸肥肠生料放入竹筒内，盖上盖。然后将竹筒粉蒸肠上笼，用旺火长时间蒸至肥肠酥烂。上席前，浇上热红油即成', N'~\Images\竹筒蒸粉肠Des.jpg', N'~\Images\竹筒蒸粉肠.jpg')
INSERT [dbo].[foodInfo] ([foodID], [villageID], [foodName], [foodTime], [foodDes], [foodDesImg], [foodImg]) VALUES (16, 6, N'板栗烧土鸡', N'十月      ', N'天师板栗烧土鸡是江苏省传统的汉族名菜。江西鹰潭龙虎山出产的天师板栗，个大香甜，淀粉丰富，是历代天师特别喜爱的果品和滋补品，素有“人间仙果”之称。而这钵天师板栗与当地农家喂养的土鸡相配，在文火中慢慢地烧出来的“天师板栗烧土鸡”，油光发亮，清香思溢，是这里很有名的美味佳肴，能吃这道菜，可谓“国 宾”的待遇。
    这道菜的形成还有一个很有趣的故事。说是有一次天师在家宴请宾客，家厨用一般的烹调方式制作，当厨师配好料，将鸡块装入砂钵放炉灶上烧制时，天师的儿子乘厨师不注意，调皮地将正吃的去了壳的板栗放入砂钵内。烧熟后，整钵端上了桌，拿掉钵盖后，一股清香扑鼻，只见鸡块色泽淡黄，栗香酥烂，客人一品尝赞不绝口，天师也欣然得意。席后，命家厨进一步改进，使之成为安宴中必备的菜。', N'~\Images\天师板栗烧土鸡 Des.jpg', N'~\Images\天师板栗烧土鸡.jpg')
INSERT [dbo].[foodInfo] ([foodID], [villageID], [foodName], [foodTime], [foodDes], [foodDesImg], [foodImg]) VALUES (15, 5, N'鄱阳湖胖头鱼', N'九月      ', N'鄱湖胖鱼头是一道江西省九江市的汉族传统名菜，属于赣菜系浔阳菜一支。因其鲜辣微酸、肥嫩鲜美、营养丰富且主材胖鱼头乃是产自中国最大淡水湖暨江西人民的母亲湖鄱阳湖，赣味极其浓厚而位列十大赣菜之首。', N'~\Images\鄱湖胖头鱼Des.jpg', N'~\Images\鄱湖胖头鱼.jpg')
INSERT [dbo].[foodInfo] ([foodID], [villageID], [foodName], [foodTime], [foodDes], [foodDesImg], [foodImg]) VALUES (14, 4, N'萍乡小炒肉', N'七月      ', N'萍乡小炒肉是典型的江西萍乡汉族风味名菜，鲜香辣味美。主料：五花肉，瘦肉。配料：盐、味精，鸡精，高汤，干辣椒粉，大蒜，蒜子，酱油。
菜系

江西萍乡
2做法
编辑


1、首先，是准备工作，将瘦肉与肥肉分离，各自切成片。然后剁辣椒、剥大蒜子。 2、然后，在锅里放食用油，等油热了之后先放肥肉进去炸，将部分的肥油炸去，然后再放瘦肉进去炒。
3、等肉的颜色逐渐褪去红色后，将辣椒和大蒜放进锅内翻炒。注意的是要经常翻过，不要将肉炒糊了。 
　　4、接着在锅里放入适量的水和酱油，盖上锅盖煮，目的是使辣椒和大蒜的味道进入肉中，这样肉才会香。可以加入豆豉，这个看个人的偏好。 
　　5、等汤的颜色变得浓郁，香气四溢之后，加入适量的盐和鸡精调味，便可出锅了。', N'~\Images\萍乡小炒肉 Des.jpg', N'~\Images\萍乡小炒肉.jpg')
INSERT [dbo].[foodInfo] ([foodID], [villageID], [foodName], [foodTime], [foodDes], [foodDesImg], [foodImg]) VALUES (13, 1, N'酿豆腐', N'一月      ', N'酿豆腐又称广西客家酿豆腐，是汉族客家人的传统菜式，属于广西菜、粤菜，客家菜系。还是客家美食文化最具代表性的菜肴之一。该菜汤汁醇厚，鲜嫩滑润，口味鲜美，广受欢迎。
    据说这道菜源于北方饺子，因南方少麦，客家人便用酿豆腐寄托对北方饺子、中原文化的感情。每逢时节喜庆，或者闲忙之余，它是农村客家人的最爱。', N'~\Images\酿豆腐 Des.jpg', N'~\Images\酿豆腐.jpg')
INSERT [dbo].[foodInfo] ([foodID], [villageID], [foodName], [foodTime], [foodDes], [foodDesImg], [foodImg]) VALUES (12, 7, N'麻枣', N'五月      ', N'麻枣，又称为荖花、祭灶果。 是一种油炸点心类的小吃。荖花口感不怎么甜，有油香味却无腻味，酥松而不脆。形状也有趣，其状如卵，中空，个小，嘴大者，可一口吃一个。
   麻枣要以上等糯米、角棕芋、白糖、饴糖、花生油、白麻等为原料，分三道工序精制而成。第一道工序，先把角棕芋加工成粉末状，拌以糯米粉，制成麻枣胚（麻枣心）。这道工序的诀窍在于角棕芋和糯米搭配的比例，增其一份则太多，减其一份则太少，只有比例恰当才会使麻枣胚一炸即涨，入口即化。历来“秘方”只传媳妇，不传女儿。第二道工序和第三道工序，是把麻枣胚用花生油炸涨，迅速捞出，再醮糖浆，拌以白麻，成为枣糕。南胜麻枣的特点是皮酥而脆，质嫩而甜，富有韧性，独具风味，是人们馈赠亲友的佳品。', N'~\Images\麻枣 Des.jpg', N'~\Images\麻枣.jpg')
INSERT [dbo].[foodInfo] ([foodID], [villageID], [foodName], [foodTime], [foodDes], [foodDesImg], [foodImg]) VALUES (11, 4, N'绿豆饼', N'二月      ', N'绿豆饼用料精细，制作讲究，以其酥皮清晰多层、入口即融、馅心冰甜而闻名，是泉州传统的汉族名点之一，已有百年以上历史。采用纯天然东北绿豆为原料，按历代相传的手工工艺精制而成，制作讲究，卫生；不使用任何防腐剂和色素，以其皮酥、清晰多层，味道香浓酥软、入口即溶、馅心冰甜而闻名，老少皆宜，吃后口齿留香，', N'~\Images\绿豆饼 Des.jpg', N'~\Images\绿豆饼.jpg')
INSERT [dbo].[foodInfo] ([foodID], [villageID], [foodName], [foodTime], [foodDes], [foodDesImg], [foodImg]) VALUES (10, 11, N'老表土鸡汤', N'十二月    ', N'老表土鸡汤是江西省宜春市袁州区传统的汉族名菜，属于赣菜系袁州菜一支。因其肉质鲜嫩，鲜香爽口兼具滋补养身的神奇功效而被列入“十大赣菜”之一。老表土鸡汤的主料土鸡为袁州当地特产袁州土鸡。相传此菜于朱元璋有关。
   朱元璋率残兵后来逃到一个村庄，一个好心的村民将家中仅有的一只土鸡杀了，给朱元璋等人炖汤喝以解其饥渴，朱元璋很受感动。在得知村民的全村都姓陈后，朱元璋高兴极了，表示凤阳老家的娘舅也姓陈，如此说来，大家还是姑表兄弟！自此以后双方都亲切地称呼彼此为“老表”。 “江西老表”就有由此而来的一种说法，老表土鸡汤也从此成为了江西一道原汁原味的农家菜并闻名遐迩', N'~\Images\老表土鸡汤Des -.gif', N'~\Images\老表土鸡汤.gif')
INSERT [dbo].[foodInfo] ([foodID], [villageID], [foodName], [foodTime], [foodDes], [foodDesImg], [foodImg]) VALUES (9, 12, N'焦糖红酒红烧肉', N'十月      ', N'1.将带皮猪五花肉切成块在热水里焯过备用
2.锅里加入适量水，之后加入冰糖，开始熬焦糖 。
3.待冰糖完全融化糖水不断起泡之后，用勺子快速搅拌锅里的冰糖水 。
4.糖水完全熬成棕色之后焦糖就熬好了 。
5.焦糖熬好后将焯过水的五花肉倒入锅中
6.五花肉倒入锅中后快速翻炒让五花肉均匀包裹上焦糖
7.之后在锅里倒入啤酒，啤酒刚好没过五花肉即可，加适量盐。
8.大火加热，将葱切段姜切片放入锅中
9.将红辣椒用刀背轻轻拍几下之后扔入锅中
10.撇去浮沫，大火收汁
11.收汁时快速翻炒，即可出锅，用香芹也点缀一下即可
焦糖啤酒红烧肉的做法视频
4小贴士编辑焖烧过程中千万不要常起锅盖，否则肉质走油，味道都进汤里了，肉就不好吃了。起锅的时间也很重要，早了肉色还是黄的，晚了肉色由红变紫，瘦肉也变硬了，影响口感。做饭这事，全靠经验，搞多了熟能生巧，没事多练练。', N'~\Images\焦糖红酒红烧肉 Des.jpg', N'~\Images\焦糖红酒红烧肉.jpg')
INSERT [dbo].[foodInfo] ([foodID], [villageID], [foodName], [foodTime], [foodDes], [foodDesImg], [foodImg]) VALUES (8, 9, N'荷叶肉', N'八月      ', N'据宋代『东京梦华录』记载，宋朝时，已经有用荷叶包裹食品而成菜的了。荷叶，有清凉解热，去淤止血等功效，用它包裹食品，可制成多种美食，既可食疗， 又能增加美味，更可保鲜。“池塘十里尽荷塘，姊妹朝来采摘忙，不摘荷花摘荷叶，饭包荷叶比花香。”清末民初的这首词，表明了用荷叶制肴的最好写照。荷叶系春末至秋初（仲夏最好）的一款时令佳肴，用荷叶包裹五花肉、糯米蒸食，不仅有米香、肉香，更兼有荷叶之清香，沁人心脾，肉肥美清香，米软糯香浓，风味绕人，食后令人唇齿留香，回味无穷。', N'~\Images\荷叶肉Des.jpg', N'~\Images\荷叶肉 - 副本.jpg')
INSERT [dbo].[foodInfo] ([foodID], [villageID], [foodName], [foodTime], [foodDes], [foodDesImg], [foodImg]) VALUES (7, 6, N'粉蒸肉', N'七月      ', N'粉蒸肉（又名面面肉）是广泛流行于中国南方地区的（江西、四川、陕南、安徽、湖北、湖南、浙江、福建等地）的汉族传统名菜之一、是江西名菜，另在川菜、湘菜、浙菜等中都有这一菜式。以主料带皮五花肉加米粉和其他调味料制作而成。粉蒸肉糯而清香，酥而爽口，有肥有瘦，红白相间，嫩而不糜，米粉油润，五香味浓郁。根据烹饪方法，可以偏辣，也可以偏甜，配料可以辅以老藕、南瓜、红薯等配菜', N'~\Images\粉蒸肉 Des.jpg', N'~\Images\粉蒸肉.jpg')
INSERT [dbo].[foodInfo] ([foodID], [villageID], [foodName], [foodTime], [foodDes], [foodDesImg], [foodImg]) VALUES (6, 5, N'白糖糕', N'九月      ', N'白糖糕一种非常古老的汉族小吃。有江西白糖糕和广东白糖糕，是完全不同的两种美食。
    广东白糖糕最早始创于明朝广东顺德伦教，现今是广东，香港等地的汉族特色糕点。据说是一梁姓小贩蒸松糕时失手令粉质下坠而创出，它清甜爽口弹牙烟韧，看起来简简单单，实际工序繁琐到极：它是把大米磨浆，用米浆糕种发酵后，加入白砂糖蒸熟而成。
    江西白糖糕是一种流行于江西民间的传统糕类小吃，起源于明清时期的南昌，到民国时代，这种白糖糕已是南昌街头巷尾各大茶铺常备的佐茶食品，被誉为“江西五大传统名点”，其特点香韧、柔软、洁白，其表面沾有江西独特的冻米粉和糖份混合物，风味独特，是深受江西地区民众喜爱的传统糕点。', N'~\Images\白糖糕 Des.jpg', N'~\Images\白糖糕.jpg')
INSERT [dbo].[foodInfo] ([foodID], [villageID], [foodName], [foodTime], [foodDes], [foodDesImg], [foodImg]) VALUES (1, 1, N'农家小炒肉', N'一月      ', N'这个农家小炒肉真的很好吃，值得大家来品尝啊，', N'~\Images\food1.jpg', N'~\Images\农家小炒肉.jpg')
SET IDENTITY_INSERT [dbo].[foodInfo] OFF
SET IDENTITY_INSERT [dbo].[itemInfo] ON 

INSERT [dbo].[itemInfo] ([itemID], [villageID], [itemName], [itemTime], [itemDes], [itemDesImg], [itemImg], [isLight]) VALUES (21, 6, N'漂流', N'十月      ', N'漂流--漂于水上，顺水流动，曾是人类一种原始的涉水方式。
漂流最初起源于爱斯基摩人的皮船和中国的竹木筏，但那时候都是为了满足人们的生活和生存需要，随着社会的发展，生活水平的提高，回归自然，挑战自然成为现代人们追求的时尚。在忙碌的都市生活中，人们一直在寻找的就是这样的一种激动、一种区别于平凡生活的独特感受，就是这样一种感受，使都市人为之倾倒，使之成为生活的一部分，漂流成为一项真正的户外运动，漂流运动以其特有的运动形式成为现代人们融入自然，挑战自然的工具，当然，也能使得人们身心得到放松、愉悦，使得人们融入大自然之中，感受大自然的美好，融入大自然的环境之中。', N'~\Images\温泉.jpg', N'~\Images\漂流.jpg', N'是       ')
INSERT [dbo].[itemInfo] ([itemID], [villageID], [itemName], [itemTime], [itemDes], [itemDesImg], [itemImg], [isLight]) VALUES (20, 11, N'骑马', N'十月      ', N'骑马就是人对马的一种驾驭，让马来作为人的代步工具，从而达到长途跋涉，快速行进等目的,骑马不像开车给油就走，踩煞车就停，它能感觉到你不会骑，它知道你不会骑就会欺负你不听你的话，成心和你作对，你让他走非不走，故意低头吃东西，拉它起来他就故意的抗缰，原因是有的是由于马淘气，有的是因为马的脾气不好, 这没办法这就需要你的信心和驾驭它的信念感染它，就要让他服从你，就要让他听你的，当然，人马心理合一应当说是骑马的最高境界，对于现代人来说，学习骑马是为了放松自己，但如果当我们分明的感到自己的身体正随着马儿一起一伏，而且是那样和谐自然，我们就会感觉身心和悦、轻松感觉驰骋的那种自由自在，正因为如此，应当充分利用乡村那种宽阔的地域条件，从而设立一些地点来开发，促进乡村发展的同时也满足人们的需求。', N'~\Images\骑马1.jpg', N'~\Images\骑马.jpg', N'是       ')
INSERT [dbo].[itemInfo] ([itemID], [villageID], [itemName], [itemTime], [itemDes], [itemDesImg], [itemImg], [isLight]) VALUES (19, 11, N'烧烤', N'十一月    ', N'烧烤可能是人类最原始的烹调方式，是以燃料加热和干燥空气，并把食物放置于热干空气中一个比较接近热源的位置来加热食物。一般来说，烧烤是在火上将食物（多为肉类）烹调至可食用，因此台湾亦有称此为烤肉；现代社会，由于有多种用火方式，烧烤方式也逐渐多样化，烧烤本身也成为一种多人聚会休闲娱乐方式或者是生意，因而在乡村烧烤，食物比较新鲜而且天然无公害，适合多数人一起轻松、愉悦地边做边吃，营造出一种默契和谐的气氛，缓解工作的枯燥和压力，而且有利于大家对彼此更多方面的了解，而且乡村烧烤配合多种活动更加丰富人们的工作之余的生活和释放压力，还能培养小孩的动手能力，培养朋友感情，使得人们交流更加顺畅。', N'~\Images\烧烤1.jpg', N'~\Images\烧烤.jpg', N'        ')
INSERT [dbo].[itemInfo] ([itemID], [villageID], [itemName], [itemTime], [itemDes], [itemDesImg], [itemImg], [isLight]) VALUES (18, 12, N'温泉', N'十二月    ', N'温泉文化究竟起源于何处，这个答案也许已年代久远得不可考了。一开始，人类发现温泉，更发现动物在泉水中恢复疲惫。据说日本人一开始并不知道温泉具有治疗疾病的功能，后来是因为看到一只受伤的小动物在泡过温泉之后奇迹般地迅速复原，这才使他们开始认真地研究起温泉的功能。现代人渐渐把泡温泉作为休闲养生、解压甚至治疗的方法，这种趋势迅速在全球漫延。秦始皇建“骊山汤”是为了治疗疮伤，徐福为了山海寻找长生不老药，辗转漂流到了日本歌山县，至今当地仍保留了“徐福”之汤温泉浴场。到了唐朝，唐太宗特建“温泉宫”，诗人也留下了不少创作，描写脂粉美女从温泉出浴的情形，足见我国悠久的温泉历史文化。其水质符合温泉水质成分标准者，亦视为温泉，因而是当代人们普遍推荐的养生美容方法！', N'~\Images\温泉1.jpg', N'~\Images\温泉.jpg', N'是       ')
INSERT [dbo].[itemInfo] ([itemID], [villageID], [itemName], [itemTime], [itemDes], [itemDesImg], [itemImg], [isLight]) VALUES (17, 12, N'爬山', N'九月      ', N'爬山是一项运动，是以攀登至顶峰为目标的运动，爬山既可以锻炼身体，又可以陶冶人们的情操，是一项很好的健身项目。“发展体育运动，增强人民体质；锻炼身体，保卫祖国。”这个我们曾经非常熟悉的口号，蕴涵着一个民族的强烈愿望：身体是革命的本钱，尤其对于居住在闹市的人们，爬山已成为他们锻炼身体的首选方式。不论是老年人、少年还是青壮年，他们都可以根椐自己的体质安排爬山方式，如市区内的风光优美的小山包或郊外大山，或清晨或周末。因而乡村也发展当地特色的爬山运动，既能感受到树林的静谧和大自然的神秘，又体验到爬山带给他们健康的好处。爬山可以明显提高腰、腿部的力量，行进的速度、耐力，身体的协调平衡能力等身体素质，加强心、肺功能，增强抗病能力， "森林浴"--绿色健康法。进入森林，跋山涉水，静思养神，全身沐浴森林的精气和香气，洗净城市尘嚣，心旷神怡。', N'~\Images\爬山1.jpg', N'~\Images\爬山.gif', N'是       ')
INSERT [dbo].[itemInfo] ([itemID], [villageID], [itemName], [itemTime], [itemDes], [itemDesImg], [itemImg], [isLight]) VALUES (16, 12, N'划船', N'九月      ', N'划船：
划船是用人力划桨使船只在水面前进的一项运动。当代生活的人们更偏向生活的娱乐化、轻松化，而划船活动不仅具有趣味性，能使人的身心放松，而且能使得人们具有团队意识、增强默契度，并且掌握划船相关知识和操作方法，培养同舟共济、齐心协力、力争上游的精神。而且随着经济发展、科技进步，使得我国划船运动的迅速发展和运动技术水平的不断提高，人们对这项活动的重视意识不断增强！', N'~\Images\划船1.jpg', N'~\Images\划船.jpg', N'        ')
INSERT [dbo].[itemInfo] ([itemID], [villageID], [itemName], [itemTime], [itemDes], [itemDesImg], [itemImg], [isLight]) VALUES (15, 13, N'篝火晚会', N'          ', N'篝火晚会：
篝火晚会，是草原人民一种传统的欢庆形式。在用火烤熟食物的过程中，便互相拉手围着火堆跳舞以表达自己喜悦愉快的心情，这种欢庆的形式一直延续到今天，就形成了篝火晚会。当然，篝火晚会是近些年来在各乡村兴起的一个新兴活动模式,而且很是吸引游客，据了解活动的效果非常好,甚至引发起轰动性效果，因为篝火寓意--“众人抬柴火焰高”，因而人们很喜欢。而且火容易烘托情感，渲染气氛，增进情感，当然，现在各个乡村的篝火晚会安排各种游戏节目（如猜谜语、真心话大冒险、唱歌比赛等等），使得篝火晚会更具趣味性，也更人性化，更能吸引来着各个地方的游客，也更适合人们从压力大的城市生活快速缓解！', N'~\Images\篝火晚会1.jpg', N'~\Images\篝火晚会.jpg', N'        ')
INSERT [dbo].[itemInfo] ([itemID], [villageID], [itemName], [itemTime], [itemDes], [itemDesImg], [itemImg], [isLight]) VALUES (14, 13, N'垂钓', N'八月      ', N'垂钓：
高雅古朴的垂钓活动作为我们古老文明的一个小小侧面伴随着祖国的历史延续下来，历数千年而不衰，日益为广大人民所喜爱，一种充满趣味，充满智慧，充满活力，格调高雅，有益身心的文体活动。无数钓鱼爱好者陶醉于这项活动之中，他们怀著对大自然的热爱，深谷的清风吹走了城市的喧嚣，钓竿的颤动带给老人以童子般的欢乐，这项有益于身心健康的体育活动也越来越受到人民的青睐，发展形势十分喜人，一般地说，自然水域，如水塘、河沟、湖泊、河流等等，应选择有水草、芦苇的地方下钩，而乡村是不二选择的地方，因而乡村发展这项既能休养生息又能提供优质鱼肉的活动尤其重要。', N'~\Images\垂钓1.jpg', N'~\Images\垂钓.jpg', N'是       ')
INSERT [dbo].[itemInfo] ([itemID], [villageID], [itemName], [itemTime], [itemDes], [itemDesImg], [itemImg], [isLight]) VALUES (13, 13, N'菜地租用', N'六月      ', N'菜地租用：
都市人快速变幻的生活节奏注定难以与田园的理想步调一致，但是乡村果蔬采摘却提供了吃得好，玩得好，即摘即吃的活动，果蔬采摘让你游走在田间地头，认认似曾相识的蔬菜，农家气氛十足。果蔬采摘请农业专家帮忙种植无公害、纯绿色的蔬菜，除了供游客采摘，只供给周边的农家院，所以多数是在城里买不到的。采摘环境犹如置身大花园，宽敞舒适，采摘时有专人引路，绝对高端大气上档次，这里的巨型青椒树和美国茄子树特别有意思，栽在花盆里的红梗甜菜，球形茴香等也可任意采摘，甚至能从墙上采摘到立体种植的生菜。这些喝营养液的小家伙，绝对是绿色食品。到这里采摘，真是既得实惠又长知识。您自己采摘的果蔬可直接送到厨房加工成美味佳肴。果蔬采摘园的诚信、实力和产品质量获得业界的认可！', N'~\Images\菜地租用1.jpg', N'~\Images\菜地租用.jpg', N'        ')
INSERT [dbo].[itemInfo] ([itemID], [villageID], [itemName], [itemTime], [itemDes], [itemDesImg], [itemImg], [isLight]) VALUES (12, 13, N'采摘', N'七月      ', N'1.采摘：
草莓采摘园隶属于江西丰城种植园 ，以种植草莓为主，农民私营草莓大棚，其种植技术是经过专业的培训与指导的，因此，在果实的质量上是优百分之百保证的，绝对绿色的水果，种植品种优，价格优，面积大，不仅如此，更吸引顾客的是这里的所有草莓均为光照自然成熟，保证为无农药、无化肥的纯绿色水果，适合朋友游玩、家庭活动等等，以优质的果实、优质的服务和优惠的价格赢得了许多顾客朋友的好评，正因为没有经商人那种斤斤计较，全凭顾客自觉、主客互信，才迎来了一批又一批的回头客以及经人介绍和闻名而来的客人，只要您一品尝，便能感受到其口感与品味的特别，让您吃着舒心更放心！', N'~\Images\采摘1.jpg', N'~\Images\采摘.jpg', N'是       ')
INSERT [dbo].[itemInfo] ([itemID], [villageID], [itemName], [itemTime], [itemDes], [itemDesImg], [itemImg], [isLight]) VALUES (11, 7, N'采摘', N'八月      ', N'赣南脐橙，江西特产。赣南脐橙果大形正，橙红鲜艳，光洁美观，可食率达85%，肉质脆嫩、化渣，风味浓甜芳香，含果汁55%以上。
赣南脐橙年产量达百万吨，原产地江西省赣州市已经成为脐橙种植面积世界第一，年产量世界第三、全国最大的脐橙主产区。 
   赣州森林覆盖率达到76.2%，这里气候温和、雨量充沛、光照充足、昼夜温差大、无霜期长、土壤肥沃，为赣南脐橙的生长奠定了优越的气候和土壤条件。
1500多年前，柑橘就特别钟情于赣南这块肥沃的土地，南北朝刘敬业在《异苑》中记载：“南康有奚石山，有柑橘、橙、柚。”南康就是今天赣州一带。至北宋年间，柑、橘、橙、柚等果树已经蔚然成林。在清朝年间，是下方官员进贡给朝廷的水果之一，深得雍正帝喜食。', N'~\Images\摘脐橙Des.jpg', N'~\Images\摘脐橙.jpg', N'是       ')
INSERT [dbo].[itemInfo] ([itemID], [villageID], [itemName], [itemTime], [itemDes], [itemDesImg], [itemImg], [isLight]) VALUES (10, 11, N'骑马', N'七月      ', N'骑乘者在骑乘过程中，须耐心体会与马匹的沟通技巧，进而坚定但不粗暴的方式使马匹顺从骑乘者意愿，可培养充分的耐性与尊重生命的精神，而展现出不同一般人的气质。   马术运动是藉由马匹行进产生的律动、增进骑乘者的呼吸与血液循环、不但可消耗大量热量、也可促进心肺功能、达到强身的效果。   骑乘者控制行进的方向与马匹的动作，由于适当利用腰部及下肢的力量；除了可保持优美的体态外，也有助于臀部肌肉的紧缩，可说是一绝佳的塑身方法。  马术是休闲活动更是一种医疗方法，欧美先进国家已经充分肯定马术对肢体，甚至对于智能残障者的复健，都有一定的疗程。   大多数人因上班上课或读书，因姿势不良所引起的腰酸背痛，可透过马匹行进的律动加以矫正，同时对内脏器官也很有帮助。', N'~\Images\骑马Des.jpg', N'~\Images\骑马.jpg', N'是       ')
INSERT [dbo].[itemInfo] ([itemID], [villageID], [itemName], [itemTime], [itemDes], [itemDesImg], [itemImg], [isLight]) VALUES (9, 12, N'爬山', N'九月      ', N'爬山是一项运动，既可以锻炼身体，又可以陶冶人们的情操。爬山需要穿一双好鞋，还要有坚持不懈的耐力。爬山作为一种户外运动，对身体的有利因素是多方面的。它既是有氧运动，又有力量练习的成分，而且运动量、运动强度可以根据自己的体力、身体素质进行调节。可以说爬山是一项健身作用较全面而危险性相对较小的锻炼方式。
   爬山既可以锻炼身体，又可以陶冶人们的情操，是一项很好的健身项目。', N'~\Images\爬山Des.jpg', N'~\Images\爬山.jpg', N'        ')
INSERT [dbo].[itemInfo] ([itemID], [villageID], [itemName], [itemTime], [itemDes], [itemDesImg], [itemImg], [isLight]) VALUES (8, 5, N'温泉', N'一月      ', N'天沐温泉
    在《庐山方志》中，把庐山温泉记为庐山一绝；该温泉的补给高程在庐山海拔 1000 米 处。可以说庐山温泉是庐山的血液，是庐山的精髓。
庐山温泉是高热的弱矿化度含氟含硅质，碱性重碳酸钠型硫化氢氡泉。简单地称为复合泉。
经地质学家科学考察，证明庐山温泉是由大气降水深循环（下渗 3700 米 ，从补给区到出露点循环时间至少 20-30 年，经科学检测，我们现在使用的温泉水是 900 年前的大气降水形成的，所以说我们要 十分珍惜水资源，注意节约用水 ）被有关热源（构造热和放射元素衰变产生的能量）加温而成，在一定的蓄水构造中迳流循环，因受岩体及构造阻挡，被次级构造导出，并在适当的地形条件下出露于地表面形成温泉。
庐山温泉属于医疗矿泉，虽然它的可溶性固体并没有一克 （ 0.334 ），但她具有较高的温度，年平均温度在 62 度以上，含有特殊的成分，有良好的医疗作用及较高的应用价值。', N'~\Images\庐山天沐温泉Des.jpg', N'~\Images\庐山天沐温泉.jpg', N'是       ')
INSERT [dbo].[itemInfo] ([itemID], [villageID], [itemName], [itemTime], [itemDes], [itemDesImg], [itemImg], [isLight]) VALUES (7, 1, N'漂流', N'六月      ', N'漂流于水上，顺水流动。漂流，曾是人类一种原始的涉水方式。漂流最初起源于爱斯基摩人的皮船和中国的竹木筏，但那时候都是为了满足人们的生活和生存需要。漂流成为一项真正的户外运动，是在二战之后才开始发展起来的，一些喜欢户外活动的人尝试着把退役的充气橡皮艇作为漂流工具，逐渐演变成今天的水上漂流运动。', N'~\Images\江西大觉山漂流Des.jpg', N'~\Images\江西大觉山漂流.jpg', N'是       ')
INSERT [dbo].[itemInfo] ([itemID], [villageID], [itemName], [itemTime], [itemDes], [itemDesImg], [itemImg], [isLight]) VALUES (6, 2, N'划船', N'八月      ', N'进入夏天，室外阳光明媚，碧波荡漾的湖面，清澈见底的小河，陶醉着无数划船运动爱好者。划船运动是一项集娱乐，健身、健美于一体的全身性有氧运动，长期进行这项运动可使心血管系统和呼吸系统疾病得以改善。同时，经常进行划船运动，还可使全身肌力得到增强，对人的肩部、前臂，腰背部、股四头肌等肌群，及髋关节肌群都有很好的锻炼作用。划船运动过程中也能欣赏到沿岸的风景，身处大自然之中，心旷神怡，因而划船运动受到许多老年人的喜爱，尤其在初夏进行，更加适宜', N'~\Images\划船Des.jpg', N'~\Images\划船.jpg', N'        ')
INSERT [dbo].[itemInfo] ([itemID], [villageID], [itemName], [itemTime], [itemDes], [itemDesImg], [itemImg], [isLight]) VALUES (5, 10, N'烧烤', N'十二月    ', N'户外烧烤 可以使你体验到与在城市中生活完全不同的感觉，感受大自然，感受团体合作精神，感受自我动手能力，磨练自己的意志，锻炼自己的体力，感受野外清新的空气，嗨可以体验到在野外各种环境，现在户外运动成为人们除了旅游之外最喜爱玩的运动，不需要太奢侈的装备，只要你有信心和激情，就可以背起背包，到自然中去，相信你会喜欢在自然中的感觉。', N'~\Images\户外烧烤Des.jpg', N'~\Images\户外烧烤.jpg', N'是       ')
INSERT [dbo].[itemInfo] ([itemID], [villageID], [itemName], [itemTime], [itemDes], [itemDesImg], [itemImg], [isLight]) VALUES (4, 9, N'篝火晚会', N'十月      ', N'随着生活水平的日益提高，篝火晚会已经成为人们文化生活中不可或缺的一部分。它表达的不仅仅是欢庆的喜悦心情，更多的是草原人民对远方尊贵客人表示热情欢迎的一种形式。
    篝火晚会是草原人民一种传统的欢庆形式，相传在远古时代，人们学会了钻木取火之后，发现火不仅可以烤熟食物，还可以驱吓野兽，保护自己的生命安全，于是，对火产生了最初的崇敬之情。后来，人们外出打猎满载而归，互相庆祝获得了丰厚的战利品，傍晚，在用火烤熟食物的过程中，便互相拉手围着火堆跳舞以表达自己喜悦愉快的心情，这种欢庆的形式一直延续到今天，就形成了篝火晚会。', N'~\Images\垂钓Des.jpg', N'~\Images\篝火晚会.jpg', N'是       ')
INSERT [dbo].[itemInfo] ([itemID], [villageID], [itemName], [itemTime], [itemDes], [itemDesImg], [itemImg], [isLight]) VALUES (3, 6, N'垂钓', N'六月      ', N'传统医学举荐钓鱼是一种很好的医疗保健处方。它能祛虑，平衡心态，解除“心脾燥热”。现代医学把生理、心理和环境三种因素确定为人体致病的机理。而钓鱼恰对这三种致病机理具有“抗、控、防”的效应。许多有着多年钓鱼经历的人这样总结：钓鱼是一项多功能的文体运动，静中见动，集锻炼与娱乐于一身，其中的乐趣只有钓鱼者才能体验到。人们还对钓鱼总结了三乐四得：独钓有静乐。群钓有同乐、竞钓有比乐。一得精神愉快，身心健康；二得鱼鲜美味，补充营养；三得新鲜空气；四得充实生活。   “坐观垂钓者，徒有羡鱼情。”春暖花开，让我们走向大自然，到湖滨河畔，溪流塘边，绿茵之下，菱荷之侧垂钓去吧!', N'~\Images\垂钓Des.jpg', N'~\Images\垂钓.jpg', N'        ')
INSERT [dbo].[itemInfo] ([itemID], [villageID], [itemName], [itemTime], [itemDes], [itemDesImg], [itemImg], [isLight]) VALUES (2, 4, N'菜地租用', N'三月      ', N'租地种菜是现在兴起来的一个热门户外、户内活动，大家已经不单单满足于在网上偷菜、自己买菜了。郊区的农场给城市居民提供了一个平台，城市居民可以租用一块菜地种植自己喜欢的蔬菜。在这里，城市居民扮演的就是一个真真实实的农场主了，可以在自己的农场里开垦土地，种植各种蔬菜和水果。等到收获的季节，享受到的是自己的劳动果实和绿色蔬菜。又健康又开心，是开心农场一个现实版的完美体现。
城里人在城郊为了种菜租下的土地，健身、健心、健康，这是大多数“菜园主”选择加入现实版“周末农场”的原因。此外，日益受到关注食品安全问题也是越来越多人选择自己种植私家菜的原因。', N'~\Images\菜地租用Des.jpg', N'~\Images\菜地租用.jpg', N'是       ')
INSERT [dbo].[itemInfo] ([itemID], [villageID], [itemName], [itemTime], [itemDes], [itemDesImg], [itemImg], [isLight]) VALUES (1, 1, N'采摘', N'一月      ', N'武汉市最美的山寨——木兰清凉寨旅游风景区，座落于武汉市黄陂区蔡店乡刘家山村境内，距武汉市城区85公里，东与大悟县毗邻，北同孝昌县接壤。景区总面积约10平方公里，海拨最高处800余米，酷暑夏日（七月）平均气温20.1-20.7度，是武汉市海拔最高、方位最北、面积最大、游线最多、水体最优、植被最好、村寨最古、土产最丰的原始生态休闲首选处，也是武汉及其周边城区市民热捧的“云中水榭纳凉胜地、峡谷峰峦避暑山庄”。
 

　　景区开发建设始于2004年6月，计划分三期完成。一期开发项目于2006年4月26日正式开园迎宾，初步建成了清凉峡谷风情区、刘家山村民俗区、西峰古寨怀古区三条主导旅游线路，以及多功能的综合服务区，开发旅游景点55个，日接待游客能力达2万人次，住宿、餐饮可一次性接待500余人，是武汉市唯一可供3日游的旅游风景区。
 

　　在此基础上，新开发了享有“山依水活，水依山清；山水辉映，旅游胜境”美誉的通天湖原始生态休闲游线。
　　新开发的原始生态休闲游线以通天湖为主题板块，湖边漫山遍野的油茶林、桃李林、野生板栗树以及各种奇花异木，装扮着大山深处的原始野趣；湖面上造型别致的仿古木桥像雨后天霁的彩虹嫁接在一弯碧水之上，烘托出山水间的精妙之处；环水相依的通幽半岛，树高林密，鸟语花香，非水路莫能入，给人几分幽情遐思；气势恢弘的飞流大峡谷犹如一把利剑从山峦绿荫丛中直插湖中，描绘出湖光山色交相辉映的水墨丹青；古香古色的环湖亲水栈道和点缀其上的景观廊亭仿佛一条镶嵌宝石的金腰带环绕在美轮美奂的通天湖畔，为游客诠释着曲径通幽的真实含义。
 

　　原始生态休闲游线的开园迎客，从根本上解决了车辆抵达清凉寨坡陡弯急、车型受限的问题。新建的旅游公路，平缓宽敞，各类车辆安全畅通。同时，新建的停车场，面积约8000余平方米，加上原有的停车场，可一次性停车500辆。客房、餐厅也同步增加，使景区接待能力明显增强。
 

　　景区先后开发的旅游景点巧妙对接，融会贯通，使个性更加突出，特色更为鲜明。其中：清凉峡谷风情游线以大山深处的通天湖、酒醉湖为轴心，将汇聚原始生态青山绿水、奇木珍禽的牛郎谷、飞流谷、清香谷连成一体，给游人反扑归真、回归自然的原始野趣；
 
        西峰古寨怀古区为武汉市绝无仅有的登高览胜之地，这里既有现存的古寨墙、古寨井、古寨人家和古寨暗道等历史实物见证，又有花木兰荣归登高、太平军驻扎点兵和黎元洪故里寻根等民间传奇掌故，给人以凭栏勾沉、史海觅踪的缅思情怀；刘家山村民俗游线的刘家山村有近千年历史，是武汉市人居海拔最高、地域最远的深山古村落，这里民居建筑古朴、百年银杏成群、千亩茶树满山、连片竹林绕村，更有小桥流水、农家雅趣、田园风光，不失为“世外桃园”的现实版本。
 

　　尤其是景区独有的千年铁衣古松、珍稀名贵树种薄叶润兰、仙石树等极具观赏价值的生态景观；咬松岩、飞流谷、枫林湾等天公造物的自然景观；乡村状元刘炳士恩受道光皇帝御赐“木本水源”木匾，以及牛郎河、道人洞、浴仙池等俯首皆是的人文景观，折射出清凉寨风景区得天独厚、“人有我有，我有人无”的景观特色，烘托出“休闲胜地清凉寨，后花园中孔雀屏”的鲜明主题。
 

　　景区目前拥有各类单人间、标准间、三人间、豪华套间以及别墅商用楼，可一次性接待宾客近500人，并有为之配套的丰简由人的以黄陂地方特色农家菜为主的游客餐厅，副食、百货均有供应。同时，还备有分别能接纳20人到150人的宽敞会议厅。新颖别致的多功能厅具备先进的KTV功能，不失为纵情高歌、翩翩起舞的理想场所。游客在旅游、会务之余，还可以乘兴在茶园采茶、制茶、品茶，也可以在茗泉垂钓，登上城楼可以习古人射箭，漫步村头可以效仿村民那种原始的耕田、织布方式……', N'~\Images\xiangcun.jpg', N'~\Images\caizhai1.JPG', N'是       ')
SET IDENTITY_INSERT [dbo].[itemInfo] OFF
SET IDENTITY_INSERT [dbo].[massInfo] ON 

INSERT [dbo].[massInfo] ([massID], [userID], [massTitle], [massTime], [massDes]) VALUES (1014, 10001, N'我们去阿松放假时间叫我发觉搜救范围', CAST(0x0000A40000965714 AS DateTime), N'哦文件了四面佛请问然后就撒了放弃哦我怕哈数据库去哦无')
INSERT [dbo].[massInfo] ([massID], [userID], [massTitle], [massTime], [massDes]) VALUES (1013, 10001, N'阿斯顿分ss', CAST(0x0000A3FE01140A90 AS DateTime), N'阿文铁丝网发射点')
INSERT [dbo].[massInfo] ([massID], [userID], [massTitle], [massTime], [massDes]) VALUES (1012, 10001, N'有没有组队去婺源的啊 ，要驴友哦', CAST(0x0000A3FD00E0056F AS DateTime), N'七天后出发，望广大驴友转起来啊')
INSERT [dbo].[massInfo] ([massID], [userID], [massTitle], [massTime], [massDes]) VALUES (1011, 10001, N'我们去安义古村咯吧明天就出发', CAST(0x0000A3FB00D8EE49 AS DateTime), N'快来啊')
INSERT [dbo].[massInfo] ([massID], [userID], [massTitle], [massTime], [massDes]) VALUES (1010, 10016, N'我们去明月山', CAST(0x0000A3FB00944DB2 AS DateTime), N'我我我')
INSERT [dbo].[massInfo] ([massID], [userID], [massTitle], [massTime], [massDes]) VALUES (1009, 10017, N'我们去高安玩吧', CAST(0x0000A3FA0124185B AS DateTime), N'我送我我我w')
INSERT [dbo].[massInfo] ([massID], [userID], [massTitle], [massTime], [massDes]) VALUES (9, 10002, N'有没有一起去江西奉新的啊', CAST(0x0000A3F9010479CF AS DateTime), N'听说那里不错啊')
INSERT [dbo].[massInfo] ([massID], [userID], [massTitle], [massTime], [massDes]) VALUES (8, 10001, N'17号江西南昌王村走起，大伙行动起来啊', CAST(0x0000A3F901039603 AS DateTime), N'我我我哦呜哦呜我我为哦呜哦呜哦呜我为')
INSERT [dbo].[massInfo] ([massID], [userID], [massTitle], [massTime], [massDes]) VALUES (6, 10015, N'有写事现在不做就永远没有机会了', CAST(0x0000A3F900FFA3B2 AS DateTime), N'我们这样一些人，总要用梦想，有想法才能有所作为')
INSERT [dbo].[massInfo] ([massID], [userID], [massTitle], [massTime], [massDes]) VALUES (5, 10016, N'我们去熊村吧，那里很不错', CAST(0x0000A3F900DB88DA AS DateTime), N'')
INSERT [dbo].[massInfo] ([massID], [userID], [massTitle], [massTime], [massDes]) VALUES (4, 10016, N'我们去熊村吧，那里很不错', CAST(0x0000A3F900DB0FF3 AS DateTime), N'')
INSERT [dbo].[massInfo] ([massID], [userID], [massTitle], [massTime], [massDes]) VALUES (2, 10016, N'我们去熊村吧，那里很不错', CAST(0x0000A3F900DA2FCB AS DateTime), N'美丽的乡村。古朴自然 我们出发吧；七天后见咯')
INSERT [dbo].[massInfo] ([massID], [userID], [massTitle], [massTime], [massDes]) VALUES (1, 10016, N'我们去熊村吧，那里很不错', CAST(0x0000A3F900D948DD AS DateTime), N'美丽的乡村。古朴自然 我们出发吧；七天后见咯')
SET IDENTITY_INSERT [dbo].[massInfo] OFF
SET IDENTITY_INSERT [dbo].[newsInfo] ON 

INSERT [dbo].[newsInfo] ([newsID], [newsTitle], [newsTime], [newsCont]) VALUES (1037, N'中国休闲农业与乡村旅游联盟在海南正式成立', CAST(0x0000A3FC00D56CFA AS DateTime), N'中新网海南频道12月8日电(记者 王子谦)12月7日，“2014中国休闲农业与乡村旅游年度峰会”在海南结束。记者了解到，在这次年度峰会上，中国休闲农业与乡村旅游联盟正式成立。
　　在当天的成立仪式上，来自全国20个省区和台湾地区的休闲农业与乡村旅游精英汇聚一堂助推中国休闲农业与乡村旅游发展联盟的成立，成立联盟的宗旨意在为促进中国休闲农业与乡村旅游跨越式发展努力探索。联盟的目标旨在建立长效的交流交友、互学互助、互动互利、合力合作、共创共赢的大平台。由此提高中国休闲农业创意发展水平，提升中国乡村旅游创新发展潜质。
　　并且，联盟还第一次的发出“海南宣言”。向全国休闲农业与乡村旅游业界的人们发出倡议： 一要加强行业联合，推动产业发展。要打破区域界限，融化行业坚冰，全面加强全国各地业界的广泛联系，全方位开展研讨、交流和信息咨询活动，相互支撑，相互借鉴，共同发展。二要完善管理体系，促进产业升级。要坚持各级政府领导，依据国家和地方有关规定自主开展工作，并努力推动休闲农业与乡村旅游的标准管理体系建设，推动产业转型升级和健康发展。三要着力内涵建设，提高自律能力。严格行业质量管理，加强行业内涵建设，维护行业良好形象，紧紧围绕国家、地方确定的工作中心开展休闲农业与乡村旅游各项工作，规范市场行为，维护市场秩序，促进有序竞争。
　　据介绍，当前，我国“休闲时代” 已经快速袭来。具有悠久文化和优秀历史的中国农业，以及多姿多彩、风情浓郁的广大农村，正以前所未有的姿态呈现在世人面前，融合农业、旅游、娱乐、服务等多产业发展的休闲农业与乡村旅游已经走上前台，真正担当起我国休闲经济的重要载体，推动着美丽中国和新农村建设。休闲农业与乡村旅游的高速成长，也促进了人们生活形态、产业形态和社会形态深刻而重大的转变，创造了一种新的生活方式和生产方式。可以预见，中国即将进入休闲产业快速发展的黄金期，也即将进入休闲农业与乡村旅游快速成长的黄金期。
　　据悉，中国休闲农业与乡村旅游联盟成立后，将在海南和北京两地设立办事机构，并且以后将每年在海南固定的举行论坛，并且借用论坛扩大海南休闲农业在国内外的影响力，促进海南休闲农业又快又好的发展。同时，通过联盟和论坛，进一步带动全国休闲农业的发展。')
INSERT [dbo].[newsInfo] ([newsID], [newsTitle], [newsTime], [newsCont]) VALUES (1036, N'因地制宜创特色 打造乡村旅游精品', CAST(0x0000A3FC00D553F2 AS DateTime), N'中新新疆网12月8日电（朱 满）白杨河乡紧紧围绕“文化旅游活乡”的发展战略，做好乡村总体定位，集中力量，突出旅游特色，深挖立足本乡原生态的旅游资源，积极打造“南部山区旅游景点”为主体的特色旅游产业。努力打造老羊头泉子“神水泉”旅游观光景点，深入开发，创新产品，扩大骨雕厂生产规模及旅游观光点。
一、科学规划，规范管理。立足自身的发展现状和基本情况，有目标、有力度、有标准的合理策划白杨河乡特色的乡村旅游项目，制定因地制宜，合情合理的发展乡村旅游的实施方案。目前，在南部山区已建成一个集生态、旅游、餐饮、观光休闲文化娱乐为一体的旅游观光景点。
二、突出特色，树立品牌。做好总体定位，深挖乡村旅游资源，充分展示地方特色，创造一批知名度高，叫得响的乡村旅游品牌。将旅游产业与第一、二产业和第三产业以及现代服务业有机结合起来，与相关产业融合发展，发展旅游新产业，培育新产品，推动旅游产业由单一型向多样型旅游产品转变，促进旅游转型升级。多渠道扩大白杨河乡旅游业的知名度，教育广大党员干部群众人人争当旅游宣传员、服务员，采取选聘形象大使，在重点交通路口设置广告牌、举办开发生产清真和绿色无公害食品——牛羊驼鸡肉系列和山野菜系列食品等活动，努力扩大影响力，提高知名度和美誉度。
三、加大投入，全力推进。抢抓自治县确定2014年为“旅游发展促进年”历史机遇，立足实际，深度开发，要把发展旅游业作为调优结构、促进发展、增加收入的重要引擎。加大旅游资源开发力度，全力打造南部山区夏牧场生态旅游景区旅游品牌，推动乡村旅游业健康、快速发展。通过开展草原民族风情游，增设所需设施，提升服务质量，不断发挥民俗风情在旅游中的亮点，使每个景点都能拥有深厚的文化内涵，增强吸引力。
结合本乡农牧结合发展的实际情况，增强旅游政策制度解读，充分利用旅游政策、财政倾斜，加强了对乡村旅游的投入，进一步强化旅游产品策划和营销，持续打造“风情周末”和“休闲游”旅游品牌，全力推进乡村旅游健康快速发展，努力打造乡村旅游精品。')
INSERT [dbo].[newsInfo] ([newsID], [newsTitle], [newsTime], [newsCont]) VALUES (1035, N'乡村旅游成新疆玛纳斯县六户地镇旅游“生力军', CAST(0x0000A3FC00D533C6 AS DateTime), N'亚心网讯(通讯员 樊怡)“自采、自摘、自理的原生态模式，不仅让我们一家体验到了久违的田园风情，还可以增进家庭成员之间的感情，别有一番情趣。”近日，说起在六户地农家乐享受的乐趣，常年在外工作的王女士一家五口意犹未尽。如今在新疆玛纳斯县六户地，像追梦人农家乐一样火起来的乡村旅游点还有很多，乡村旅游已成为六户地旅游业的“生力军”。
近年来，六户地镇创新旅游发展思路，将乡村旅游作为统筹城乡发展和发展旅游经济的重要载体。以打造一批农业园、农家乐、民俗文化等综合性乡村旅游示范点为理念，充分发挥地理优势、人文优势和资源优势，打造六户地旅游品牌。
为使乡村旅游景点有品位、有层次，六户地镇一直坚持高标准规划建设，邀请规划设计院对各示范点进行规划设计，每个示范点均确立了各自的定位和建设主题，努力打造一村一景、一片一景。截至今年11月，六户地镇乡村旅游共接待游客1万人次，乡村旅游总收入达25万元，乡村旅游(含农家乐)从业人员的人数有80余人。通过发展乡村旅游，六户地镇生态环境和乡土文化得到了有效保护，农民收入也明显提高。')
INSERT [dbo].[newsInfo] ([newsID], [newsTitle], [newsTime], [newsCont]) VALUES (1034, N'我国将实施乡村旅游富民工程', CAST(0x0000A3FC00D517FB AS DateTime), N'近日，国家发展和改革委员会、国家旅游局等7部委下发了《关于实施乡村旅游富民工程推进旅游扶贫工作的通知》（以下简称《扶贫工作通知》），决定实施乡村旅游富民工程，扎实推进旅游扶贫工作，并公布了乡村旅游扶贫重点村的名单。
　　据悉，此次乡村旅游富民工程内容涉及旅游基础设施建设、乡村旅游开发、景区辐射带动、重点村旅游推介以及人才培训等。《扶贫工作通知》要求，各地要大力发展乡村旅游，提高规范管理水平，紧紧依托当地区位和资源优势，挖掘文化内涵，发挥生态优势，开发形式多样、特色鲜明的乡村旅游产品。鼓励有条件的重点村落建成有历史记忆、地域特色、民族特点的特色景观旅游名镇名村，大力发展休闲度假、养生养老和研学旅行。应特别重视对生态环境、古建筑、古民居等特色资源的保护，加强规划引导，保持传统乡村风貌和传承优秀民俗文化，着力提升乡村旅游的组织化、产业化、规范化发展水平。
　　按《扶贫工作通知》的计划，到2015年将扶持约2000个贫困村开展乡村旅游；到2020年，扶持约6000个贫困村开展乡村旅游，力争让每个重点村的乡村旅游年经营收入达到100万元。')
INSERT [dbo].[newsInfo] ([newsID], [newsTitle], [newsTime], [newsCont]) VALUES (1033, N'山东发展乡村旅游注重文化保护', CAST(0x0000A3FC00D4FDD1 AS DateTime), N'本报讯 近日，山东省副省长季缃绮就文化旅游融合发展相关问题接受本报记者采访时表示，推动乡村旅游提档升级是山东旅游业今后的重点发展方向。在实施乡村旅游提档升级进程中，山东将与新型城镇化建设、乡村文明建设、“乡村记忆”工程等紧密结合，在保护文化的前提下进行旅游元素包装。
　　季缃绮表示，未来山东将继续强化文化旅游融合发展，发挥山东作为文化大省的人文优势，挖掘旅游目的地的文化内涵，“让旅游有文化、有精神、有灵魂”。同时，山东还将按照错位发展原则，将文化建设与旅游项目相结合，做好文化与旅游产业融合发展规划，在旅游产品开发设计过程中融入更多文化元素。
　　今年初，山东启动“乡村记忆”工程，旨在采取措施保护古民居、古村落、古街巷。根据山东相关旅游业发展规划，山东拟在2017年前培育400个旅游强镇、2000个独具历史文化特色的旅游村。(清 风)')
INSERT [dbo].[newsInfo] ([newsID], [newsTitle], [newsTime], [newsCont]) VALUES (1032, N'沙湾县乌兰乌苏镇农家乐带活乡村旅游业', CAST(0x0000A3FC00D4D9CC AS DateTime), N'天山网讯（通讯员杨少华 刘雪报道）近年来，沙湾县大力发展以农家乐为重点的乡村旅游业，依托城郊农村自然景观、田园风光和农业资源，加强对农家乐的管理，全面提升旅游产品竞争力，并开展农家乐标准化创建工作，以评定星级农家乐为抓手，改善农家乐经营环境和服务质量。
    12月2日，在沙湾县乌兰乌苏镇李家坪村，笔者看到满庭芳农家乐负责人马义春正忙着给顾客准备各种食材。
    马义春告诉笔者，他在2011年开办了农家乐，当年的收入也就几万元。经过两年多的发展，他家农家乐在周边也渐渐地有了名气，现在一年能收入十几万元。
    马义春说：“开办农家乐最主要的是要有自己的特色，当然食材也很重要，夏天的蔬菜基本上都是自己种植的无公害绿色蔬菜。到了冬天，在肉类的选择上，都是自己看着屠宰、自己亲手制作的，所以顾客也很放心。目前，农家乐有许多顾客都是从石河子慕名而来的。”
    据了解，在乌兰乌苏镇像马义春这样上规模的农家乐达15家，主要集中在李家坪村、头浮村和小庙村及水磨沟村和泉源村等8个村。
    小庙村德兰农庄占地10余亩，属于高标准农家乐，由婚宴区、包间等组成，深受沙湾县、石河子等周边县市顾客的好评，也打响了乌兰乌苏镇农家乐的品牌。被评为三星级农家乐后，生意格外红火。
    据了解，沙湾县对农家乐的星级评定从价格合理性、口味特色性、服务优质性和娱乐内容朴实性等内容都做了有益地指导和规范，将有助于推动当地农家乐旅游项目迈上特色化、规范化和科学化发展的轨道。
    截至目前，沙湾县共评定三星级农家乐5家、二星级农家9家。')
INSERT [dbo].[newsInfo] ([newsID], [newsTitle], [newsTime], [newsCont]) VALUES (1031, N'全市乡村旅游建设工作座谈会召开', CAST(0x0000A3FC00D4B532 AS DateTime), N'本报讯（邹进记者黄露）12月2日，全市乡村旅游建设工作座谈会召开，深入贯彻落实全市旅游发展大会精神，交流经验做法，研究工作举措，推进全市乡村旅游快速健康发展。市政协主席李驰出席并讲话，市领导倪峰、朱传耿、张京麒等参加。
全市现有省星级乡村旅游区（点）29家，约占全市旅游景区（点）总数的1/4。会议肯定了全市乡村旅游建设取得的成效，分析了存在的问题。会议指出，要围绕市委、市政府提出的建成全省知名生态乡村旅游目的地的目标要求，准确把握乡村旅游发展定位，把促进新农村建设与拓展旅游业发展空间有机结合起来；充分发挥乡村旅游带动作用，把发挥休闲旅游优势与发展农业产业化和相关产业有机结合起来；加快完善乡村旅游发展设施条件，把休闲旅游建设与推进城乡综合整治和基础设施建设有机结合起来；不断丰富乡村旅游内容和功能，把开发休闲旅游资源与保护生态环境和历史文化有机结合起来；努力增强乡村旅游发展动力，把鼓励广大农民投资创业与吸引企业投资发展有机结合起来，加强科学规划布局，坚持统筹兼顾，使乡村旅游成为农村发展的新增长点和旅游产业的亮丽风景线。要坚持富农宗旨，充分发挥政府的主导作用、市场的决定作用和农民的主体作用，努力推进乡村旅游发展再上新台阶，实现全旅游产业加快发展，为加快建设创业开放生态幸福的美丽盐城作出新的贡献。
会前，与会人员观摩了盐都、东台、大丰等乡村旅游现场。')
INSERT [dbo].[newsInfo] ([newsID], [newsTitle], [newsTime], [newsCont]) VALUES (1030, N'平和一镇两村获省乡村旅游项目资金补助', CAST(0x0000A3FC00D49585 AS DateTime), N'东南网漳州12月3日讯（通讯员 黄水成）近日，省旅游局和省财政厅下发了福建省2014年乡村旅游休闲集镇、特色村第一批项目资金，平和县坂仔镇以及文峰镇三坪村、芦溪镇的蕉路村分别获得乡村旅游休闲集镇、特色村的项目资金补助。
　　据悉，坂仔镇依托“林语堂”这一世界级文化名片，投资10亿元建设林语堂文博园，着力打造文化旅游名镇、建设生态宜居新镇，项目建设取得持续进展，吸引各地关注的目光，有力促进该镇旅游事业的蓬勃发展。
　　三坪村坐拥闽南佛教千年古刹三平寺，三平寺历来香火不断，在全国各地久负盛名。如今，三坪村特有的朝圣旅游文化以及“富美乡村”的创建，将祖师文化、红色文化、生态文化与村部的建设有机结合，吸引了众多游客，也提升了当地村民的精神生活，带动了当地旅游产业的发展。
　　蕉路村围绕“国保”绳武楼，对村庄进行整治，拆除闲置的破旧房屋、猪舍等，硬化村庄内部道路，建设占地10亩的乡村公园，并保障了村民的生活、生产安全，为全村展现了一道亮丽风景线。当前这一镇两村均为平和对外开放的旅游热点。')
INSERT [dbo].[newsInfo] ([newsID], [newsTitle], [newsTime], [newsCont]) VALUES (1029, N'闽乡村旅游人才赴台培训', CAST(0x0000A3FC00D46FA7 AS DateTime), N'台海网 (微博)12月4日讯 （海峡导报记者 陈成沛）12月2日，来自平潭、武夷山、永春及各地乡镇的46位福建“百镇千村”乡村旅游人才培训班团员，抵达台湾。在接下来的7天时间里，这批团员将分成“古村名镇”和“清新山水”两个小组，在台展开休闲农业、乡村旅游实地考察及培训交流。
　　有着“台湾休闲农业推手”美誉的邱涌忠博士，拥有40多年台湾乡村旅游推广经验，苗栗知名的飞牛牧场，就是在他任职台湾“农委会”期间一手规划和大力支持下创立的。台湾其他一些知名休闲农场，也大多受过邱博士指导和协助。这次他将全程参与指导本梯次“百镇千村”乡村旅游人才培训活动。
　　为更好地借鉴台湾乡村旅游发展成功经验，深化闽台乡村旅游交流合作，自今年3月底开始，福建省旅游局组织开展的全省种子师资培训计划和“百镇千村”乡村旅游人才赴台湾培训计划正式启动，培训考察活动取得明显成效。
　　“百镇千村”乡村旅游人才培训团，采取实地考察加上2天案例分析和创意辅导形式赴台湾培训，学习借鉴台湾发展乡村旅游经验，特别是主题、创意、特色、精致、风情等方面的先进理念。与台湾乡村旅游经营业主、休闲农业和乡村旅游专家进行合作对接，实现闽台旅游深度合作、双方共赢。')
INSERT [dbo].[newsInfo] ([newsID], [newsTitle], [newsTime], [newsCont]) VALUES (1028, N'阆中市以项目为抓手 扎实推进乡村旅游业发展', CAST(0x0000A3FC00D44776 AS DateTime), N'四川新闻网南充12月7日讯(冉琼)初冬时节，笔者在阆中市沙溪街道办事处金鼓村看到，一幢幢川北民居依山而建，房前屋后的菜园果园青枝绿叶，宽敞的水泥村道旁停了不少外地车辆，这里的农家乐吸引了很多市内外游客，乡村旅游业红红火火。
　　近年来，阆中市坚持以项目为抓手，扎实推进全市乡村旅游业快速发展。今年阆中安排乡村旅游专项发展资金，全面启动建设1.2万亩的“江天农业农村综合示范区”，推进农耕文化体验园、四季采摘园、花卉苗木基地等一批重点项目的建设;启动建设集农产品展销、观光休闲于一体的广南高速公路阆中服务区大型综合体项目，加快中国生态休闲农业示范市建设，争创全国休闲农业与乡村旅游示范县。
　　据了解，阆中市计划用3至5年时间，建成以“休闲旅游拓展区、现代农业示范区、休闲食品基地、花卉苗木基地、养老养生基地”为支撑体系的中国生态休闲农业示范市。
　　与此同时，阆中市在推进乡村旅游发展时采取挖掘文化内涵、彰显农业特色、着眼游客消费等方面的举措，深入挖掘老观古镇巴国文化、天宫院风水文化、江南裕华农耕文化、沙溪生态体验文化内涵，打造集观光、休闲、娱乐、度假为一体的综合型乡村旅游区，带动沿线乡村旅游的发展;设立专项扶持资金，促进农(渔)家乐在庭院景观、餐饮文化、桌椅布局等方面突出农业特色;开展农(渔)家乐星级评定，今年共评定四星级农家乐1家，三星级农家乐2家。通过在江南裕华让游客亲身耕田犁地、在沙溪让游客亲自采摘果蔬等方式，增加乡村旅游参与、体验、互动内容，实现文化、体验与旅游有机结合。')
INSERT [dbo].[newsInfo] ([newsID], [newsTitle], [newsTime], [newsCont]) VALUES (1027, N'莒南打造“莒南人家”乡村旅游品牌', CAST(0x0000A3FC00D427A3 AS DateTime), N'□记者　高晓雷　报道
　　本报莒南讯　日前,莒南县旅游局统一设计、统一制作,为多家乡村旅游经营业户统一悬挂“莒南人家”牌,张贴旅游标识,打造个性鲜明、形象饱满的“莒南人家”旅游新形象。
　　莒南乡村旅游资源丰富,类型众多,有以磐龙湖农业生态园、渊子崖现代农业示范园为代表的生态观光旅游资源,有沂蒙玉芽茶文化苑、金龙湖茶文化园等茶文化旅游资源,有涝坡苹果、相沟蓝莓、莒南大樱桃等赏花采摘资源,以及各种土特产资源、休闲垂钓资源、民俗文化资源。下一步,莒南将继续依托丰富的乡村旅游资源优势,按照“莒南道路”发展模式,积极探寻乡村旅游差异化,着力打造精品工程。')
INSERT [dbo].[newsInfo] ([newsID], [newsTitle], [newsTime], [newsCont]) VALUES (1026, N'菏泽办培训班促进乡村旅游', CAST(0x0000A3FC00D409E7 AS DateTime), N'张建丽)　5日,菏泽市乡村旅游工作培训班举办。全市各县区旅游局局长、开发区商务局局长,各县区旅游主管部门业务科室负责人,旅游强乡镇、特色村、农业旅游示范点主要负责人等100余人参加了培训班。
据悉,本次培训班邀请了北京世纪大唐规划设计院张晓军院长作专题讲座。张晓军以“乡村旅游的开发与营销”为题,结合政策背景和工作实际,就政策背景、先进理念、行业规范和发展趋势等方面做了深入浅出的讲解
菏泽市旅游局相关负责人介绍,这次培训班使菏泽市乡村旅游从业人员对乡村旅游有了新的认识,提高了从业人员的整体素质,达到了预期目的。
作者：张建丽')
INSERT [dbo].[newsInfo] ([newsID], [newsTitle], [newsTime], [newsCont]) VALUES (1025, N'国家乡村旅游扶贫重点村宝鸡5县37村入选', CAST(0x0000A3FC00D3EC63 AS DateTime), N'华商报讯 （记者 万登峰）近日，国家发改委、国家旅游局、环境保护部等7部委下发了《关于实施乡村旅游富民工程推进旅游扶贫工作的通知》（以下简称《通知》），发布了全国乡村旅游扶贫重点村名单。宝鸡的陇县、麟游、扶风、千阳、太白5个县的37个村分两批入选全国乡村旅游扶贫重点村。
《通知》明确了在全国扶贫开发重点县和集中连片特困地区开展旅游产业扶贫工作，提出从基础设施建设、重点村旅游接待条件、大力发展乡村旅游、提高规范管理水平、发挥精品景区辐射作用、带动重点村脱贫致富、加强重点村旅游宣传推广、提高旅游市场竞争力、加强人才培训等方面为重点村旅游发展提供支持。')
INSERT [dbo].[newsInfo] ([newsID], [newsTitle], [newsTime], [newsCont]) VALUES (1024, N'放眼鲁中”最美乡村” 农家乐成旅游新热点', CAST(0x0000A3FC00D3BDEA AS DateTime), N'这桔梗真清脆，清香中还有咸味，一点也不腻”，坐在一旁的参观者吴笛口中边嚼着新鲜桔梗边说着。12月4日上午，记者来到山东省“最美乡村”淄博市博山区池上镇中郝峪村，中午时分与村民一起品尝了山村特产秸秆等美食。
　　桔梗俗称“小人参”，清脆甘甜，吃起来爽口，“中郝峪村为全国桔梗种植基地，产出的桔梗在全国各地销售很好，很多都销往韩国、日本等国家。”随行的博山区旅游局局长李淑贵对记者说，中郝峪村所在的池上镇大量种植桔梗，出口量约占全国的70%，是全国著名的“桔梗之乡”。
　　迎着嗖嗖寒风，记者走入中郝峪村，映入眼帘的山村房屋排列整齐，屋顶被统一刷成了深蓝色，墙面上画着孔孟名言、民间特产等图案，散发出浓郁的文化气息。远处的山坡上，五栋精美的别墅并列成排，格外亮眼，走近一看，原来是村民为接待山外游客盖起的高档住宿房屋，吃住游玩，功能齐全，俗称农家乐。
　　“屋内干净整洁，每栋可供6人居住，各种家具和服务设施一应俱全，配有保洁人员随叫随到。”陪同的工作人员赵胜建介绍说，全村农家乐旅游采取公司化运营模式，坚持突出农家特色，打造个性乡村旅游，紧紧围绕吃农家饭、住农家院、观农家景、享农家乐的主要特色，着力在吃、住、品、玩上下功夫。“除了特产桔梗外，中郝峪村还盛产桃子、板栗、柿子等，并通过公司化运营销往各地，增加了农民收入。”
　　中郝峪村位于鲁山主峰南麓，有十里桃花溪之美景，全村占地总面积2600余亩，森林覆盖率96%以上。近年来，中郝峪村在立足新农村建设、发展乡村旅游这条主线上，改造90余户危房并用于提供农家乐旅游住宿，不断完善各类软硬件设施，并进行道路两侧绿化美化工程、村民及农家乐安全饮水工程、垃圾回收处理等项目工程。山村农家乐美名远扬，吸引了周边淄博、东营、滨州、潍坊以及省城济南的众多游客，今年全村农家乐旅游营业额1640万元，全村农户平均收入4万多元。实现了人均收入十年翻了十倍。村内实行45岁以上中老年人医疗保险、70岁以上老人每年补助5000元、适龄儿童学费全村集体缴纳等一系列福利政策，都是中郝峪村通过发展特色新农村旅游业带来的新变化。
　　据李淑贵介绍，为更好地发挥全省乡村旅游的示范带头作用，中郝峪村制定了“一年起好步、两年打基础、三年见成效、五年大变样”的战略发展目标，不断提高旅游接待水平以及游客配套设施建设，让每一位来到中郝峪村的游客都能感受到“暖暖远人村，依依墟里烟”的田园韵律。2013年，中郝峪村被山东省旅游局授予“山东省乡村旅游示范村”“好客山东，最美乡村”等荣誉称号，成为当地农家乐旅游的新标杆。
　　沂蒙全羊香飘四野沂源农家乐遍布省内高原
　　12月4日下午，记者乘车进入山东省平均海拔最高的沂源县，进入眼帘的鲁山山脉蜿蜒巍峨，山间公路旁，不时掠过一座座农家乐，风格独具。
　　越过重重山峦，转过一道弯，眼前豁然出现大片桃林，进入了燕崖镇双泉村的“世外桃源”。双泉村位于沂源县最南端，曾是远近闻名的贫困村，经过30多年的摸索探索，村里人先后种植了花椒、桑树，以及目前的苹果、樱桃，成为远近闻名的“花果山”。
　　在“花果山”的边缘地带，记者看到矗立着的农家乐、爱情小镇、樱桃人家等景观，漂亮整洁，印象深刻。
　　在刚刚被评为“中国最美乡镇”的张家坡镇阳三峪村，记者踏进错落别致的农宅小院，感受到了山区农家乐的特有风味。该村依托毫山生态园优势打造生态旅游，着力打造集农业观光、休闲、度假、餐饮、住宿、会议为一体的都市农业示范园区，游客可以品尝到沂源全羊、沂源全蝎、小磨豆腐、沂蒙煎饼以及村民生产的有机苹果、有机玉米、有机野生山药、有机鸡蛋等当地特色农产品。
　　据阳三峪村村支书田月水介绍，为发展山村旅游业，村里聘请设计院进行实地测量考察后，根据阳三峪村独有特色和风俗量身打造，建成集旅游、采摘、狩猎、农事体验等于一体的“三峪一地一果园”综合性景区。去年12月动工的“吉羊福地”景区，对31户农村老宅子，进行了整体改造，为游客提供了更好的住宿、饮食环境。景区全部建成后，村集体的收入将大幅增长。
　　据悉，沂源山区的最美乡村和农家乐建设全面开花。与阳三峪村重点发展乡村旅游不同，鲁村镇于家石沟村的重点是建设现代农业示范园区和新型农村社区;安信农庄流转了该村及周边村庄的土地，建起了100亩有机蔬菜基地、320亩沂源红苹果示范园、200亩樱桃示范园、100亩草莓基地，以及办公、加工保鲜、农展馆等主体设施，一座现代农业示范园初步建成;南鲁山镇南水沟村的千亩花卉园、东里镇梅家坡村的现代化绿色清洁能源示范村居等首批16个示范点，个个都有产业支撑，宜农则农、宜工则工、宜游则游，特点鲜明、亮点突出，为推进沂源最美乡村建设起到了示范带头作用。
　　沂源属沂蒙山区腹地，是山东省平均海拔最高的县，素有“山东屋脊”、“山东高原”之称，境内有名的山头1983座，海拔最高的鲁山1108米。其地貌类型有中山、低山、丘陵、山前倾斜平地等，可利用土地面积240万亩，其中耕地52万亩。山区矿产资源和旅游资源丰富。林木资源143种，经济林主要有苹果、葡萄、花椒、柿子、板栗、桑、鲁源小枣、山楂、银杏等。沂源县饲草资源丰富，总载畜量16.2万个黄牛单位，其中“沂蒙黑山羊”远近闻名。
　　放眼山东高原旅游业，2014年，沂源县将完成重点片区、重点村庄的规划设计，初步形成一到两处规划科学、设施完善、特色鲜明的美丽乡村示范点。两三年后，基本形成“一圈多点”的乡村生态观光休闲游基本布局，全面激活农业农村跨越发展，基本形成生态休闲观光圈、生态休闲园区、最美乡村、旅游名镇多点开花、多层次推进的山区旅游新格局。')
INSERT [dbo].[newsInfo] ([newsID], [newsTitle], [newsTime], [newsCont]) VALUES (1023, N'翠屏区省级乡村旅游示范村通过专家组验收评定', CAST(0x0000A3FC00D39195 AS DateTime), N'1月28日，市旅游局组织专家组对我区申报的省级乡村旅游示范村李庄镇安石社区和南胜社区进行验收评定，通过现场查看、听取汇报、查阅资料等方式进行了检查验收，对申报单位的创建工作和全区乡村旅游发展工作给予了充分肯定。
近年来，我区结合自身实际，大力开展乡村游，以一批农业产业为龙头，积极推动乡村旅游产业发展，进一步完善基础设施建设，加大农业企业、旅游招商力度，以乡村旅游节庆活动为媒，加强全区乡村旅游宣传营销工作，形成了以凉姜乡村文化节、佛现山栀子花节、红高粱乡村游为代表的乡村旅游名片。
今年我区向省旅游局申报了2家省级乡村旅游示范村，即李庄镇安石社区和南胜社区。省级乡村旅游示范村的评定，共分旅游产品、旅游设施、宣传促销、服务质量、安全管理等十大项73小项的硬性指标评定，通过自评、初评、终评三次评定。市专家组实地查看了申报村的生态环境、基础设施，检查了旅游产品、旅游服务质量等重要环节，认真听取了汇报，验收小组认为申报村的自然资源好、品牌好，交通便捷，生态完整，通过创建工作，硬件设施和环境形象有了很大改观，最后专家组对翠屏区近两年乡村旅游工作所取得的成绩给予了充分肯定，希望再接再厉，加快翠屏区乡村旅游业的快速发展')
INSERT [dbo].[newsInfo] ([newsID], [newsTitle], [newsTime], [newsCont]) VALUES (1022, N'从江9村入列全国乡村旅游扶贫重点村名单', CAST(0x0000A3FC00D2AE09 AS DateTime), N'11月3日，国家发改委等七部委发布《关于实施乡村旅游富民工程推进旅游扶贫工作的通知》，同时发布了全国乡村旅游扶贫重点村名单，贵州省507个村被列入扶贫重点村名单，其中从江县有9个村列入，第一批入列有增冲村、岜沙村、高华村3个村，第二批入列有銮里村、小黄村、高增村、加车村、岜扒村、平求村6个村。')
INSERT [dbo].[newsInfo] ([newsID], [newsTitle], [newsTime], [newsCont]) VALUES (22, N'孩子身上实现零', CAST(0x0000A3A600000000 AS DateTime), N'曾一度被全世界所膜拜的神器——谷歌眼镜，也走到了被科技媒体一致吐槽的地步。最近，《连线》杂志在一篇评论文章中直言谷歌眼镜已经濒临失败，拯救它的唯一方法就是“干掉它”。路透社则报道称“很多谷歌眼镜的开发者正在放弃与其相关的项目”。腾讯科技的一篇文章也称“最酷的产品彻底沦为实验品”。')
INSERT [dbo].[newsInfo] ([newsID], [newsTitle], [newsTime], [newsCont]) VALUES (20, N'对“村官”的六点', CAST(0x0000A3AB00000000 AS DateTime), N'在感染科病房，李克强看望了一对艾滋病患者夫妇。通过母婴阻断治疗技术，夫妻俩两年多前生下了一个健康的宝宝。李克强与两位患者逐一握手，询问他们身体怎么样，生活有什么困难。患者告诉总理，刚得知感染时“特别绝望”，但因为小宝宝的到来，他们又重新燃起了生活的希望。')
SET IDENTITY_INSERT [dbo].[newsInfo] OFF
SET IDENTITY_INSERT [dbo].[postReturn] ON 

INSERT [dbo].[postReturn] ([postReturnID], [userID], [massID], [postReturnTime], [postReturnCont]) VALUES (1, 10001, 1, CAST(0x0000A3FE01462D54 AS DateTime), N'违法')
INSERT [dbo].[postReturn] ([postReturnID], [userID], [massID], [postReturnTime], [postReturnCont]) VALUES (2, 10001, 1013, CAST(0x0000A3FF00FCCF15 AS DateTime), N'阿斯顿分')
INSERT [dbo].[postReturn] ([postReturnID], [userID], [massID], [postReturnTime], [postReturnCont]) VALUES (3, 10001, 1012, CAST(0x0000A3FF00FDE5E6 AS DateTime), N'阿斯顿分')
INSERT [dbo].[postReturn] ([postReturnID], [userID], [massID], [postReturnTime], [postReturnCont]) VALUES (4, 10001, 1013, CAST(0x0000A3FF01021035 AS DateTime), N'手动阀')
INSERT [dbo].[postReturn] ([postReturnID], [userID], [massID], [postReturnTime], [postReturnCont]) VALUES (5, 10001, 1013, CAST(0x0000A3FF01022933 AS DateTime), N'福帅')
INSERT [dbo].[postReturn] ([postReturnID], [userID], [massID], [postReturnTime], [postReturnCont]) VALUES (6, 10001, 1013, CAST(0x0000A3FF01032B78 AS DateTime), N'手动阀')
INSERT [dbo].[postReturn] ([postReturnID], [userID], [massID], [postReturnTime], [postReturnCont]) VALUES (7, 10001, 1013, CAST(0x0000A3FF01036F76 AS DateTime), N'我饿哦')
INSERT [dbo].[postReturn] ([postReturnID], [userID], [massID], [postReturnTime], [postReturnCont]) VALUES (8, 10001, 1013, CAST(0x0000A3FF01045D28 AS DateTime), N'阿斯顿分')
INSERT [dbo].[postReturn] ([postReturnID], [userID], [massID], [postReturnTime], [postReturnCont]) VALUES (9, 10001, 1013, CAST(0x0000A3FF0104683B AS DateTime), N'阿斯顿分 微软我我')
INSERT [dbo].[postReturn] ([postReturnID], [userID], [massID], [postReturnTime], [postReturnCont]) VALUES (10, 10001, 1013, CAST(0x0000A3FF01046EDE AS DateTime), N'阿斯顿分 微软我我')
INSERT [dbo].[postReturn] ([postReturnID], [userID], [massID], [postReturnTime], [postReturnCont]) VALUES (11, 10001, 1013, CAST(0x0000A3FF01048BCA AS DateTime), N'位粉丝')
INSERT [dbo].[postReturn] ([postReturnID], [userID], [massID], [postReturnTime], [postReturnCont]) VALUES (12, 10001, 1012, CAST(0x0000A3FF0106C47C AS DateTime), N'阿斯顿')
INSERT [dbo].[postReturn] ([postReturnID], [userID], [massID], [postReturnTime], [postReturnCont]) VALUES (13, 10001, 1012, CAST(0x0000A3FF0106DE36 AS DateTime), N'啊手动阀是发生')
INSERT [dbo].[postReturn] ([postReturnID], [userID], [massID], [postReturnTime], [postReturnCont]) VALUES (14, 10001, 1013, CAST(0x0000A3FF0107F3A7 AS DateTime), N'我放假哦事件发生冬季')
INSERT [dbo].[postReturn] ([postReturnID], [userID], [massID], [postReturnTime], [postReturnCont]) VALUES (15, 10001, 1013, CAST(0x0000A3FF010BE69A AS DateTime), N'阿斯顿')
INSERT [dbo].[postReturn] ([postReturnID], [userID], [massID], [postReturnTime], [postReturnCont]) VALUES (16, 10001, 1013, CAST(0x0000A3FF010CBBEC AS DateTime), N'我')
INSERT [dbo].[postReturn] ([postReturnID], [userID], [massID], [postReturnTime], [postReturnCont]) VALUES (17, 10001, 1013, CAST(0x0000A3FF013201DA AS DateTime), N'我为')
INSERT [dbo].[postReturn] ([postReturnID], [userID], [massID], [postReturnTime], [postReturnCont]) VALUES (18, 10001, 1013, CAST(0x0000A3FF0132152F AS DateTime), N'我为 我回家覅哦圣诞节覅哦是')
INSERT [dbo].[postReturn] ([postReturnID], [userID], [massID], [postReturnTime], [postReturnCont]) VALUES (19, 10001, 1013, CAST(0x0000A4000090996D AS DateTime), N'阿斯顿')
INSERT [dbo].[postReturn] ([postReturnID], [userID], [massID], [postReturnTime], [postReturnCont]) VALUES (20, 10001, 1012, CAST(0x0000A4000090EBCF AS DateTime), N'阿斯顿')
INSERT [dbo].[postReturn] ([postReturnID], [userID], [massID], [postReturnTime], [postReturnCont]) VALUES (21, 10001, 1013, CAST(0x0000A400009231FF AS DateTime), N'阿斯顿分')
INSERT [dbo].[postReturn] ([postReturnID], [userID], [massID], [postReturnTime], [postReturnCont]) VALUES (22, 10001, 1013, CAST(0x0000A40000924096 AS DateTime), N'阿斯顿分')
INSERT [dbo].[postReturn] ([postReturnID], [userID], [massID], [postReturnTime], [postReturnCont]) VALUES (23, 10001, 1013, CAST(0x0000A40000928B5D AS DateTime), N'哇嘎时代为前提的风清热好呀的说法挺好')
INSERT [dbo].[postReturn] ([postReturnID], [userID], [massID], [postReturnTime], [postReturnCont]) VALUES (24, 10001, 1013, CAST(0x0000A4000092C0BB AS DateTime), N'撒地方')
INSERT [dbo].[postReturn] ([postReturnID], [userID], [massID], [postReturnTime], [postReturnCont]) VALUES (25, 10001, 1013, CAST(0x0000A400009300EA AS DateTime), N'阿斯顿分')
INSERT [dbo].[postReturn] ([postReturnID], [userID], [massID], [postReturnTime], [postReturnCont]) VALUES (26, 10001, 1013, CAST(0x0000A400009357BC AS DateTime), N'阿斯顿')
INSERT [dbo].[postReturn] ([postReturnID], [userID], [massID], [postReturnTime], [postReturnCont]) VALUES (27, 10001, 8, CAST(0x0000A4000093774A AS DateTime), N'阿斯顿')
INSERT [dbo].[postReturn] ([postReturnID], [userID], [massID], [postReturnTime], [postReturnCont]) VALUES (28, 10001, 6, CAST(0x0000A4000093B796 AS DateTime), N'五个请我去野外人呀大概')
INSERT [dbo].[postReturn] ([postReturnID], [userID], [massID], [postReturnTime], [postReturnCont]) VALUES (29, 10001, 1014, CAST(0x0000A40000967817 AS DateTime), N'阿斯顿嗡小城市we')
INSERT [dbo].[postReturn] ([postReturnID], [userID], [massID], [postReturnTime], [postReturnCont]) VALUES (30, 10001, 1014, CAST(0x0000A400009772F1 AS DateTime), N'微软')
INSERT [dbo].[postReturn] ([postReturnID], [userID], [massID], [postReturnTime], [postReturnCont]) VALUES (31, 10001, 1014, CAST(0x0000A40000977AAC AS DateTime), N'潍坊市潍坊')
INSERT [dbo].[postReturn] ([postReturnID], [userID], [massID], [postReturnTime], [postReturnCont]) VALUES (32, 10001, 1014, CAST(0x0000A4000097AAC8 AS DateTime), N'阿斯顿')
INSERT [dbo].[postReturn] ([postReturnID], [userID], [massID], [postReturnTime], [postReturnCont]) VALUES (33, 10001, 1014, CAST(0x0000A4000097B34D AS DateTime), N'手动阀顿')
INSERT [dbo].[postReturn] ([postReturnID], [userID], [massID], [postReturnTime], [postReturnCont]) VALUES (34, 10001, 1014, CAST(0x0000A4000097B77E AS DateTime), N'')
INSERT [dbo].[postReturn] ([postReturnID], [userID], [massID], [postReturnTime], [postReturnCont]) VALUES (35, 10001, 1, CAST(0x0000A40000980C74 AS DateTime), N'王国维')
INSERT [dbo].[postReturn] ([postReturnID], [userID], [massID], [postReturnTime], [postReturnCont]) VALUES (36, 10001, 1014, CAST(0x0000A400009C1D74 AS DateTime), N'撒')
INSERT [dbo].[postReturn] ([postReturnID], [userID], [massID], [postReturnTime], [postReturnCont]) VALUES (37, 10001, 1014, CAST(0x0000A40000A0D00D AS DateTime), N'师大')
INSERT [dbo].[postReturn] ([postReturnID], [userID], [massID], [postReturnTime], [postReturnCont]) VALUES (38, 10017, 1014, CAST(0x0000A40000AB88FA AS DateTime), N'士大夫')
INSERT [dbo].[postReturn] ([postReturnID], [userID], [massID], [postReturnTime], [postReturnCont]) VALUES (1019, 10001, 1014, CAST(0x0000A401009E2C07 AS DateTime), N'士大夫')
INSERT [dbo].[postReturn] ([postReturnID], [userID], [massID], [postReturnTime], [postReturnCont]) VALUES (1020, 10001, 1014, CAST(0x0000A40100A1DA86 AS DateTime), N'发射点')
INSERT [dbo].[postReturn] ([postReturnID], [userID], [massID], [postReturnTime], [postReturnCont]) VALUES (1021, 10001, 1014, CAST(0x0000A40100A1E062 AS DateTime), N'发射点')
INSERT [dbo].[postReturn] ([postReturnID], [userID], [massID], [postReturnTime], [postReturnCont]) VALUES (1022, 10001, 1014, CAST(0x0000A40100A1E135 AS DateTime), N'发射点')
INSERT [dbo].[postReturn] ([postReturnID], [userID], [massID], [postReturnTime], [postReturnCont]) VALUES (1023, 10001, 1014, CAST(0x0000A40100A1E19C AS DateTime), N'发射点')
INSERT [dbo].[postReturn] ([postReturnID], [userID], [massID], [postReturnTime], [postReturnCont]) VALUES (1024, 10001, 1014, CAST(0x0000A40100A207C5 AS DateTime), N'微软')
INSERT [dbo].[postReturn] ([postReturnID], [userID], [massID], [postReturnTime], [postReturnCont]) VALUES (1025, 10001, 1014, CAST(0x0000A4010124B768 AS DateTime), N'iwepfk')
INSERT [dbo].[postReturn] ([postReturnID], [userID], [massID], [postReturnTime], [postReturnCont]) VALUES (1026, 10001, 1014, CAST(0x0000A4010124B950 AS DateTime), N'iwepfk')
INSERT [dbo].[postReturn] ([postReturnID], [userID], [massID], [postReturnTime], [postReturnCont]) VALUES (1027, 10001, 1014, CAST(0x0000A4010124B9D3 AS DateTime), N'iwepfk')
INSERT [dbo].[postReturn] ([postReturnID], [userID], [massID], [postReturnTime], [postReturnCont]) VALUES (1028, 10001, 1014, CAST(0x0000A4010124BA98 AS DateTime), N'iwepfk')
INSERT [dbo].[postReturn] ([postReturnID], [userID], [massID], [postReturnTime], [postReturnCont]) VALUES (1029, 10001, 1014, CAST(0x0000A4010124BAC7 AS DateTime), N'iwepfk')
INSERT [dbo].[postReturn] ([postReturnID], [userID], [massID], [postReturnTime], [postReturnCont]) VALUES (1030, 10001, 1014, CAST(0x0000A4010124BCF0 AS DateTime), N'iwepfk')
INSERT [dbo].[postReturn] ([postReturnID], [userID], [massID], [postReturnTime], [postReturnCont]) VALUES (1031, 10001, 1014, CAST(0x0000A4010124BD1F AS DateTime), N'iwepfk')
INSERT [dbo].[postReturn] ([postReturnID], [userID], [massID], [postReturnTime], [postReturnCont]) VALUES (2025, 10001, 1014, CAST(0x0000A40900899ECA AS DateTime), N'阿斯顿分')
INSERT [dbo].[postReturn] ([postReturnID], [userID], [massID], [postReturnTime], [postReturnCont]) VALUES (2026, 10001, 1014, CAST(0x0000A4090089A570 AS DateTime), N'阿斯顿分')
INSERT [dbo].[postReturn] ([postReturnID], [userID], [massID], [postReturnTime], [postReturnCont]) VALUES (2027, 10001, 1012, CAST(0x0000A409008A18A4 AS DateTime), N'撒旦')
SET IDENTITY_INSERT [dbo].[postReturn] OFF
SET IDENTITY_INSERT [dbo].[userInfo] ON 

INSERT [dbo].[userInfo] ([userID], [userName], [userPassword], [userSex], [birthday], [Email], [userPhone], [userCity], [userAddr], [regTime]) VALUES (10001, N'熊墩', N'xiongduen123', N'男         ', CAST(0x000086E300000000 AS DateTime), N'1274328268@qq.com', 18146703353, N'江西南昌', N'江西师范大学瑶湖小区', CAST(0x0000A3F70094F311 AS DateTime))
INSERT [dbo].[userInfo] ([userID], [userName], [userPassword], [userSex], [birthday], [Email], [userPhone], [userCity], [userAddr], [regTime]) VALUES (10002, N'闵露', N'lulu', N'女         ', CAST(0x0000857600000000 AS DateTime), N'156456s@live.com', 18720955517, N'江西奉新', N'南大南苑', CAST(0x0000A3F70095C2A2 AS DateTime))
INSERT [dbo].[userInfo] ([userID], [userName], [userPassword], [userSex], [birthday], [Email], [userPhone], [userCity], [userAddr], [regTime]) VALUES (10013, N'小泽', N'xiaoze', N'男         ', CAST(0x0000854F00000000 AS DateTime), N'wj@qq.com', 12779723472, N'江西南昌', N'江西师范大学瑶湖小区', CAST(0x0000A3F8010C476B AS DateTime))
INSERT [dbo].[userInfo] ([userID], [userName], [userPassword], [userSex], [birthday], [Email], [userPhone], [userCity], [userAddr], [regTime]) VALUES (10014, N'李四', N'1234567', N'女         ', CAST(0x0000863400000000 AS DateTime), N'lzp9401@163.com', 18270839468, N'南昌', N'江西师大', CAST(0x0000A3F80132750C AS DateTime))
INSERT [dbo].[userInfo] ([userID], [userName], [userPassword], [userSex], [birthday], [Email], [userPhone], [userCity], [userAddr], [regTime]) VALUES (10015, N'ss', N'ss', N'男         ', CAST(0x0000A3F800000000 AS DateTime), N'ss@qq.com', 15151515151, N'江西', N'师大', CAST(0x0000A3F801465D39 AS DateTime))
INSERT [dbo].[userInfo] ([userID], [userName], [userPassword], [userSex], [birthday], [Email], [userPhone], [userCity], [userAddr], [regTime]) VALUES (10016, N'jack', N'jack', N'男         ', CAST(0x0000A3F700000000 AS DateTime), N'jack@qq.com', 18166779889, N'江西抚州', N'抚州临川', CAST(0x0000A3F801577ADC AS DateTime))
INSERT [dbo].[userInfo] ([userID], [userName], [userPassword], [userSex], [birthday], [Email], [userPhone], [userCity], [userAddr], [regTime]) VALUES (10017, N'裙飘起', N'123456', N'男         ', CAST(0x0000876900000000 AS DateTime), N'1344810806@qq.com', 18270839431, N'赣州', N'南昌', CAST(0x0000A3F900A0825E AS DateTime))
INSERT [dbo].[userInfo] ([userID], [userName], [userPassword], [userSex], [birthday], [Email], [userPhone], [userCity], [userAddr], [regTime]) VALUES (10018, N'qq465256447', N'qq465256447', N'男         ', CAST(0x0000A3FD00000000 AS DateTime), N'465256447@qq.com', 18166779889, N'南昌', N'师大', CAST(0x0000A3F900DE711A AS DateTime))
INSERT [dbo].[userInfo] ([userID], [userName], [userPassword], [userSex], [birthday], [Email], [userPhone], [userCity], [userAddr], [regTime]) VALUES (11016, N'熊歆瑶', N'691993', N'女         ', CAST(0x0000A3F700000000 AS DateTime), N'956597059@qq.com', 18179137329, N'南昌', N'江西师大', CAST(0x0000A40000D886F1 AS DateTime))
SET IDENTITY_INSERT [dbo].[userInfo] OFF
SET IDENTITY_INSERT [dbo].[villageInfo] ON 

INSERT [dbo].[villageInfo] ([villageID], [villageName], [villageAddr], [villageImg], [villageDesImg], [villageDes], [bestTime]) VALUES (20, N'钓源古村', N'位于江西省 吉安市', N'~\Images\QQ截图20150419133922.png', N'~\Images\QQ截图20150423081621.png', N'a''s''d', N'3月       ')
INSERT [dbo].[villageInfo] ([villageID], [villageName], [villageAddr], [villageImg], [villageDesImg], [villageDes], [bestTime]) VALUES (19, N'asdf', N'asdf', N'~\Images\QQ截图20150423081621.png', N'~\Images\QQ截图20150419133922.png', N'asdf', N'asdf      ')
INSERT [dbo].[villageInfo] ([villageID], [villageName], [villageAddr], [villageImg], [villageDesImg], [villageDes], [bestTime]) VALUES (18, N'阿斯顿分', N'江西省 吉安市', N'~\Images\QQ截图20150423081621.png', N'~\Images\QQ截图20150423081621.png', N'啊手动阀手动阀啊喂发射点发射点发射点发', N'1         ')
INSERT [dbo].[villageInfo] ([villageID], [villageName], [villageAddr], [villageImg], [villageDesImg], [villageDes], [bestTime]) VALUES (17, N'阿斯顿分', N'江西省 吉安市', N'~\Images\QQ截图20150423081621.png', N'~\Images\QQ截图20150423081621.png', N'啊手动阀手动阀啊喂发射点发射点发射点发', N'1         ')
INSERT [dbo].[villageInfo] ([villageID], [villageName], [villageAddr], [villageImg], [villageDesImg], [villageDes], [bestTime]) VALUES (13, N'熊家村', N'江西宜春', N'~\Images\game1.jpg', N'~\Images\xiangcun.jpg', N'一般来说，乡村聚落具有农舍、牲畜棚圈、仓库场院、道路、水渠、宅旁绿地，以及特定环境和专业化生产条件下特有的附属设施等。小村一般无服务职能，中心村落则有小商店、小医疗诊所、邮局、学校等生活服务和文化设施，可发挥最低层级的中心地职能。随着现代城市化的发展，在城市郊区还出现了城市化村这种类似城市的乡村聚落。', N'七月      ')
INSERT [dbo].[villageInfo] ([villageID], [villageName], [villageAddr], [villageImg], [villageDesImg], [villageDes], [bestTime]) VALUES (12, N'铅山河古村', N'江西九江', N'~\Images\铅山河口古镇.jpg', N'~\Images\铅山河口古镇Des.jpg', N'铅山县，东北界上饶县。西接弋阳县，南临福建省的崇安县北连横峰县。商、周时期，铅山这块土地上就有人类劳动生息，南唐保大十一年（公元953年）置县。
   因永平西四里有铅山产铅而得名铅山县，铅山地名YANSHAN。1949年7月，县治所迁河口镇,河口镇因地处闽浙赣边，有水运之便，形成周围省、县的货物集散地，明清时期商业盛极一时，号称“八省码头”，为江西四大名镇之一。鸦片战争以后，逐渐衰落，现在河口镇是是全县政治、经济、文化、交通的中心。早在明朝中叶，铅山已发展成为江南地区五大手工业区域之一，以手工造纸业与松江的棉纺、苏杭的丝织业、芜湖的浆染业、景德镇的制瓷业齐名。河口以纸张、茶叶之大宗集散，带来了百业之繁盛，而成为与景德镇、樟树镇、吴城镇齐名的江西四大名镇之一。铅山县城的河口镇，曾是历史上江西四大名镇之一。北宋时称“沙湾市”。明嘉靖年间，这里手工业发达，水路直通鄱阳湖,商品交换的扩大促进了"沙湾市"的繁荣.到了清乾隆年间,河口进入鼎盛时期,闽浙皖赣川广荆苏等货物集散于此,转销全国,成了商贾云集的“八省通衢”之地。
   如今，这里仍保留着旧时繁华的印记和古朴的风貌.沿河五米长的明清古街,层楼绵延,鳞次栉比,古老而典雅;青石板路面上的道道车辙,记录下当年小镇的繁荣。镇内小河蜿蜓迥转，一座座青石桥横跨两岸，增添了小镇的水乡情调。沿江码头的碑石上,字迹历历可见,令人回想起当年"货聚八闽川广，语杂两浙淮杨，舟楫夜泊，绕岸灯辉 " 之盛。
古镇北面，是闻名的九狮山，为县北门户，又称龙门。山下江水深不可测，据说从这里可以直达龙宫，故名“龙门第一关”，现镌刻在峭壁上的“龙门第一关“五个大字仍清晰可见。九狮第一山下的明代“天乳寺”为明代佛寺,寺边有一天然水池,上书"天乳寺",相传为康熙手迹。', N'四月      ')
INSERT [dbo].[villageInfo] ([villageID], [villageName], [villageAddr], [villageImg], [villageDesImg], [villageDes], [bestTime]) VALUES (11, N'婺源古村', N'江西上饶', N'~\Images\婺源古镇.jpg', N'~\Images\婺源古镇Des.jpg', N'婺源是江西省一个历史悠久的古县，历史上曾属安徽管辖。是古徽州一府六县之一。 婺源古镇 是南宋著名理学家朱熹的故里和中国铁路之父詹天佑的家乡。“一生痴绝处，无梦到徽州”。“徽州”是被越来越多人提及的字眼，有人说这里是中国传统文化的家园，地处偏僻山乡的婺源很幸运地保存了古徽州的所有气韵。
   婺源山明水秀，松竹连绵，飞檐翘角的古民居蜿蜒于青山绿水，或依山，隐现于古树青林之间；或傍水，倒映于溪池清泉之上；与层层梯田、缭绕云雾相映成趣，如诗如画。四季景色各呈千秋，尤其是春秋两季，漫山遍野的映山红和满山的红枫叶犹如一簇簇火苗争奇斗艳。置身于这样的景色之中，让你感觉到心旷神怡和留连忘返。这里以山川灵秀，土地肥沃，物产丰富，贤俊广众而著称。婺源不仅景色优美，更富有深厚的文化内涵，历来享有书乡之誉。这里人杰地灵，名人辈出，“一门九进士，六部四尚书”，足见其文风鼎盛。县境内纵横密布、碧而清澈的河溪山涧与怪石奇峰、古树茶亭、廊桥驿道相得益彰，融雄伟豁达与纤巧秀美于一体。著名景点有西北部的大鄣山与灵岩洞群，东北部的浙岭与石耳山，中部的福山和西部的大游山，唐宋以来就是游览胜地。苏东坡、黄庭坚、宗泽、岳飞、朱熹等在此留下了不少赞美的诗文。
  “半亩方塘一鉴开，天光云影共徘徊，问渠哪得清如许，为有源头活水来。”这是南宋著名理学家朱熹赞美家乡婺源的诗句。“两水夹明镜，双桥落彩虹”，因袭唐诗而得名的宋代古桥彩虹桥，是婺源廊桥的代表作。这里四周青山如黛，桥下绿水长流，桥的两旁有廊亭，廊亭的两旁有石桌石凳，在这里或品茶弈棋，或浏览风光，让你感受到世外的悠闲和宁静。
离县城西南30公里左右的文公山有朱熹回乡扫墓时亲手栽植的古杉24棵（寓24孝之意），至今逾800余年，长势依然旺盛，古杉之巨，为国内所罕见。婺源被称为“中国最美丽的农村”。以山、水、竹、石、树、木、桥、亭、涧、滩、岩洞、飞瀑、舟渡、古民居为组合的自然景观，有着世外桃源般的意境，犹如一幅韵味无穷的山水画，形成一个独特而美丽的田园风光游览区，给人们一种回归自然和超凡脱俗的感觉。对那些久经都市嘈杂喧闹的人们和爱好旅游、美术、摄影的艺术工作者来说，到婺源一游或收集创作素材，不能说不是一种美的享受和明智的选择。', N'十二月    ')
INSERT [dbo].[villageInfo] ([villageID], [villageName], [villageAddr], [villageImg], [villageDesImg], [villageDes], [bestTime]) VALUES (10, N'水南村', N'江西赣州', N'~\Images\水南村.jpg', N'~\Images\水南村Des.jpg', N'水南村：是安义古村群三个古村群落组成之一，水南村村民为古罗田村黄氏分支后裔。明初洪武七年（公元1369年）族祖一“能公”在此开新基拓水南村新村。
水南村该村现存古屋规模宏大，装修考究，雕饰精美，栩栩如生，令人叹服，驻足于当年张勋"辫帅"打工时所出入的古村古屋，流连于丹桂飘香的安义古村黄氏宗祠，游人们仿佛还能蝗到那渐渐消逝的历史的回音。这里的"水南民俗馆"，陈列有许多不可多得的展品，看见这些丰富的物件，不难想象先民们的生活和生产的情和景。
    安义古村群三大自然古村落有明清时期的古民居建筑86幢，面积21800余平方米。古村古建民居规模宏大、保存完整、雕饰精美、文化内涵厚重。主要景点有：占地八亩拥有48个天井的世大夫第；6人合抱不下距今110余年的唐代黄樟；再现昔日罗田繁华商贸景象的400余米长的古街道；反映江南农村民俗文化特点的水南民俗馆；商贾名媛起居的闺秀楼；雕有一百只形态各异蝙蝠堪称中国窗雕工艺一绝的"百福图"；体现忠孝节义的黄氏、刘氏祠堂；雕龙画凤江南农村少见安义古村群的古戏台；散发着浓郁书香气息的曦庐（墨庄）等等。千年安义古村群是古代赣文化和赣商文化的完美结合，是都市市民追溯历史、感受自然、体验农家生活的绝好去处，千年安义古村群它最有神秘风采，最有古郡风韵，最有田园风光，最有乡村风貌。
   珠崖风景水南村，山下人家林下门。
   鹦鹉巢时椰结子，鹧鸪啼处竹生孙。
   渔盐家给无墟市，禾黍年登有酒樽。
   远客杖藜来往熟，却疑身世在桃源。
为卢多逊所作，迁琼始祖卢多逊，河南洛阳人，北宋太宗年间，曾任兵部尚书、朝宰相，于太平兴国七年，因事逆太宗，流寓崖州，全家亲属随行，落籍三亚崖城水南村，雍熙二年(公元985年)卒年52岁。居崖州期间写有《水南村》诗，久为传诵。', N'十月      ')
INSERT [dbo].[villageInfo] ([villageID], [villageName], [villageAddr], [villageImg], [villageDesImg], [villageDes], [bestTime]) VALUES (9, N'密溪古村', N'江西赣州', N'~\Images\瑞金密溪古村.jpg', N'~\Images\瑞金密溪古村.jpg', N'罗家湖村位于鼎城区韩公渡镇，镇德桥与柳叶湖渡假区白鹤山乡的交接地段，共12个村民小组，人口千余人，总面积277.14公顷。

　　罗家湖村分为杜家垸和谈家垸两个大垸，早在清朝末年民国初期，杜家垸还是一片汪洋，仅存一小山头露出水面，当时不少过渡的人都埋葬在该山头，并有后人在此修建庙宇祭祀，于是该地也被称为大山庙，这也是罗家湖村最早的名称。后来，随着气候变化，地球的变迁，杜家垸的湖水逐渐退出，仅存一个仅三亩田的大湖。此村不少渔民都已离出，只有罗氏三兄弟一直住在湖边，靠在该湖打鱼为生，至至病死，后人为了纪念三兄弟便把该湖称为罗家湖，到本世纪三十年代，该地大山庙之称逐渐被罗家湖取代公元1130-1135年，南宋农民起义战争中，湖南义军首领钟相，杨么等率众人于洞庭湖地区连年抗击南宋宫军围剿的战争。义军屡战获捷，兵势日盛，使宋军愈加恐惧。公元135年，高宗调集20万大军，名张俊为诸路兵马都督，岳飞为荆湖南北路置制使，趋洞庭湖围剿义军。岳飞率所部鼎洲（现在常德）先对义军诱降，瓦解部分义军后对杨么实行围剿。杨么兵败至常德东，遇一河流（现在的低水诃）卸下盔甲稍后休整，因此得名卸甲洲，这个地方一直沿用到文化大革命，后改为万洲大队。在1983年后又起用了卸甲洲这个地名，我村现有人口1791人，全村总面积402.6公顷', N'九月      ')
INSERT [dbo].[villageInfo] ([villageID], [villageName], [villageAddr], [villageImg], [villageDesImg], [villageDes], [bestTime]) VALUES (7, N'罗田村', N'江西抚州', N'~\Images\罗田村.jpg', N'~\Images\罗田村Des.jpg', N'位于江西省乐安县牛田镇东南部的乌江之畔，距县城32公里。距今已有一千多年的历史，是一个董氏单姓聚族而居的血缘村落。
   董氏尊西汉大儒董仲舒为始祖，又认唐代宰相董晋是他们的先祖。宋代流坑董氏崇文重教，以科第而勃兴，成为江西大家族聚居的典型。元代，遇兵燹，村子遭毁。明、清时代，村中有识之士，兴教办学，修谱建祠，并发展竹木贸易，使流坑村又一次繁荣兴盛。从宋初到清末，全村出文，武状元各1名，进士34人，举人78人，进入仕途者，上至参知政事、尚书、下至主薄、教谕，超过百人。
   流坑村是中国封建宗法社会的一个缩影。在一千多年的漫长岁月里，董氏精英依靠严密的封建宗族制度来凝聚族众、维系秩序、稳定发展。保存有明万十年族谱3本，清代各房谱牒20多个版本，各种宗庙58座。大宗祠遗址更是一绝，五根高8米，直径0.7米的花岗岩石柱，傲视苍穹，被称为流坑的“圆明园”。流坑村以规模宏大的传统建筑、风格独特的村落布局而闻名遐迩。明代中叶村子经过规划，形成了七横一竖八条街巷，族人按房派宗支分巷居住、巷道设置门楼、门楼之间以村墙连接围合的整体布局，巷道用鹅卵石铺地，并建良好的排水系统，保存至今，别具一格，堪一绝。
    村中现存500余幢建筑中，明清占建筑及遗址计206余处，村中古建筑均为砖木结构楼房，质朴而简洁，但建筑装饰十分讲究。明代建筑怀德堂中的雀（爵）鹿（封）猴（侯）砖雕壁，堪称精品。数以百计的屋宇，堂上有匾，门旁有联。其中保存完好的木质油漆匾额188方，门头墙壁的各种题榜362方，祠堂名额近60处，楹联72副，共计628方（处）。 从流坑沿乌江顺流而下，有一片香樟林，夹杂少许青枫，总计有1万多棵，树龄大多在200-800年之间，其中500年以上的有3000多棵，800年以上的有1400多棵。具有极高的观赏价值', N'七月      ')
INSERT [dbo].[villageInfo] ([villageID], [villageName], [villageAddr], [villageImg], [villageDesImg], [villageDes], [bestTime]) VALUES (6, N'乐安流古村', N'江西吉安', N'~\Images\乐安流坑古村.jpg', N'~\Images\乐安流坑古村Des.jpg', N'位于江西省乐安县牛田镇东南部的乌江之畔，距县城32公里。距今已有一千多年的历史，是一个董氏单姓聚族而居的血缘村落。
   董氏尊西汉大儒董仲舒为始祖，又认唐代宰相董晋是他们的先祖。宋代流坑董氏崇文重教，以科第而勃兴，成为江西大家族聚居的典型。元代，遇兵燹，村子遭毁。明、清时代，村中有识之士，兴教办学，修谱建祠，并发展竹木贸易，使流坑村又一次繁荣兴盛。从宋初到清末，全村出文，武状元各1名，进士34人，举人78人，进入仕途者，上至参知政事、尚书、下至主薄、教谕，超过百人。
   流坑村是中国封建宗法社会的一个缩影。在一千多年的漫长岁月里，董氏精英依靠严密的封建宗族制度来凝聚族众、维系秩序、稳定发展。保存有明万十年族谱3本，清代各房谱牒20多个版本，各种宗庙58座。大宗祠遗址更是一绝，五根高8米，直径0.7米的花岗岩石柱，傲视苍穹，被称为流坑的“圆明园”。流坑村以规模宏大的传统建筑、风格独特的村落布局而闻名遐迩。明代中叶村子经过规划，形成了七横一竖八条街巷，族人按房派宗支分巷居住、巷道设置门楼、门楼之间以村墙连接围合的整体布局，巷道用鹅卵石铺地，并建良好的排水系统，保存至今，别具一格，堪一绝。
    村中现存500余幢建筑中，明清占建筑及遗址计206余处，村中古建筑均为砖木结构楼房，质朴而简洁，但建筑装饰十分讲究。明代建筑怀德堂中的雀（爵）鹿（封）猴（侯）砖雕壁，堪称精品。数以百计的屋宇，堂上有匾，门旁有联。其中保存完好的木质油漆匾额188方，门头墙壁的各种题榜362方，祠堂名额近60处，楹联72副，共计628方（处）。 从流坑沿乌江顺流而下，有一片香樟林，夹杂少许青枫，总计有1万多棵，树龄大多在200-800年之间，其中500年以上的有3000多棵，800年以上的有1400多棵。具有极高的观赏价值', N'六月      ')
INSERT [dbo].[villageInfo] ([villageID], [villageName], [villageAddr], [villageImg], [villageDesImg], [villageDes], [bestTime]) VALUES (5, N'景德镇瑶里', N'江西景德镇', N'~\Images\景德镇瑶里.jpg', N'~\Images\景德镇瑶里Des.jpg', N'景德镇瑶里
　瑶里的古名是“窑里”，因是景德镇陶瓷的发祥地而得名。这座古朴的村落，历经瓷器经商带来的喧嚣繁华，也享有清香绵长茶叶的宁静悠然。得天独厚的地理环境，山环水绕的区域位置，使得瑶里拥有“瓷之源，茶之乡，林之海”的美誉。如今的瑶里，更像是一位看淡过往的老者，静静在一旁，微笑着观望这里再次兴起的热闹与喧闹。
   瑶河流域是景德镇瓷业的发祥地，景德镇瓷器的主要原料――高岭土就产于瑶里附近的高岭山。在瑶河沿岸的山水之间，既有多处瓷业生产基地――矿坑、窑址和作坊，又有为之服务的交通体系――水运码头、古驿道，还有由瓷业及其贸易支撑起来的聚落体系――商业码头、集镇、村落。瑶里原名窑里，正由窑而得名。 近代之后，由于地处山区，又远离任何一条现代交通线――公路、铁路，瑶里进一步衰落，她曾经有过的那一段辉煌历史逐渐被凝固和尘封，被世人所遗忘。但正因为她被遗忘了，她的自然环境和聚落风貌都保存得较为完整，非常具有观赏性。 奇岩飞瀑,原始森林,江南古祠,明清建筑,古窑遗址,革命旧居无不让你流连忘返。瑶里古建筑群：瑶里村古建筑群规模庞大,至今保存完好的有明清商业街、宗祠、进士第、大夫第、翰林第、老屋、狮冈胜览等。其中以一步岭建筑群最具代表性，这里集中了一步岭牌楼、老屋、大夫第、狮冈胜览等。 瑶里历史上是景德镇制瓷原料的产地之一,又是皖,浙,赣边境大米,木柴 ,茶叶,茶油的集散地,还是景德镇通往浙江，安徽的古道。村中敬义堂是瑶里新四军留守处1938年陈毅同志在此组织了著名的新四军瑶里改编。在瑶里峡谷有气势磅礴的高际山瀑布。宽30米的瀑布,从60米的峭壁上倾泻直下。银纱飘渺,云雾蒸腾,声憾山谷。水石相搏，珠玉飞溅，景色万千。瑶里还是避暑的佳处。', N'五月      ')
INSERT [dbo].[villageInfo] ([villageID], [villageName], [villageAddr], [villageImg], [villageDesImg], [villageDes], [bestTime]) VALUES (4, N'京台村', N'江西宜春', N'~\Images\京台村.jpg', N'~\Images\京台村Des.jpg', N'京台村：是安义古村群三个古村群组成之一，至今已有一千四百年历史。该京台村古村有刘、李两大姓。刘姓村民，为汉代学者刘向后裔，初唐武德元年（公元618年）迁居此地。明初洪武年间，李氏　之祖则由朝廷授封而落户于此。千年安义古村群，远离嚣尘，许多古建民居至今保存完好，如古村石牌坊、古村古井石槽、古戏台、砖石大门、四十八天井古屋等。游人来到安义古村群，定能感受农耕生活之情，油然而生归园田居之趣。 
   沿着古道，进村。京台村巷道上矗立着高大的石牌坊，这是刘姓后人为纪念他们的祖先刘向所建，匾额上的“绩绍中垒”提示着刘向曾担任过的显赫职务“中垒大夫”。刘氏宗祠左右栅栏门上绘有太极图，两扇大门分别彩绘关羽张飞像，门前有高大的旗杆石，只有家族出了大官才能在门口设置，以备高官进祠时仪仗在门外插旗，刘姓的开基祖刘广德就任过豫章太守。京台村还有一座古戏台，现在在村小的里面，它以典雅的艺术造型、精致的斗拱藻井和巧妙的音箱设置享有“南国第一古戏台”之美称。屋顶上耸立着一个插着三支戟的彩瓶，寓意为平平安安、连升三级。古戏台自清乾隆十年创建以来，仅道光十七年，来这里演出的戏班子就有十几个。戏台的盛况当年生活富裕的安义人对文化娱乐的巨大需求。出小学，回到牌坊处，继续前行便是散发着浓郁书香气息的曦庐（墨庄）。曦庐为典型赣派风格明清建筑恢宏壮观:三重进五重进主体、天井、厅堂纵横、石刻门楣、雕镂门窗,这些无不让人赞叹古村当时高超的建筑水平和精湛的雕刻技艺。“曦庐”主体建筑破损严重，“墨庄”却保存相当完整。这里有四间教室，有先生居室及公子、小姐书屋，有被称之为“养拙斋”的藏书室，甚至有习练琴棋书画的场所—“守诚斋”。宽大的正厅里，庄严的孔子画像下，摆放着一张长长的书案，案上陈列着文房四宝。走进这里，仿佛闻到了翰墨的芳香，仿佛看见一个面容清癯的老者正面对一张张稚嫩的脸庞讲课，仿佛听见大厅里响起的琅琅读书声。', N'四月      ')
INSERT [dbo].[villageInfo] ([villageID], [villageName], [villageAddr], [villageImg], [villageDesImg], [villageDes], [bestTime]) VALUES (3, N'钓源古村', N'江西萍乡', N'~\Images\钓源古村.jpg', N'~\Images\钓源古村Des.jpg', N'钓源古村 ：位于江西省 吉安市西行20公里，至兴桥镇北行，古樟成林，茂密葱茏，绿叶掩映下，青砖黑瓦若隐若现。村里长幼妇孺，怡然自乐，仿佛陶渊明笔下的桃花源。是为钓源村。北宋年间，与欧阳修同宗的欧阳氏后裔在此肇基，距今近千年。村人尊欧阳修为宗，村内建有文忠公祠堂，“文行忠信”牌匾至今高悬。村庄建筑东西南北向，布局呈八卦图形，宛如迷宫。青石板铺成的巷子前窄后宽，150余幢至今犹存的古建筑的屋角皆为弧形，大门斜立，人戏称“歪门邪道”。依村七口水塘，取“七星伴月”之意。
    古建筑内外亦有木雕、石雕、木刻、石刻、彩绘和镏金字画。如镏金图《访贤才于渭滨》和《求富亦求钓源古村.寿考》，人物笑容可掬，服饰鲜活，车銮华盖、滩石树木、山水云霓，都完整生动。陈列于各家的朱红色鎏金雕花架子大床，分别雕饰了麒麟送子、喜鹊登梅、八仙过海、竹节梅花图。钓源人的人生理想、生活意趣，尽在其中。
   走近村庄，满眼是绿。延绵的岗地环绕幢幢青砖黑瓦的民居，仅北部小山上的林带，就有18000多棵葱葱笼笼的古樟树，分外醒目的是村祠“忠节第”前的4株古柏，直径1米有余，树龄近千年。民居依两边的坡势铺展，7口大小不一的水塘串联，把村庄分成南北两半。一条条青石板铺就的巷道，曲折迂回伸向各幢古宅。从平整、光洁的青石板上走去，只见老屋高低错落，排列有序，显得幽得与苍老，引人入胜。全村现有村民150多户，800余人，存有明清建筑150多处，宗祠、家祠9座，书舍5处，古石桥2座。风姿各异的历代建筑，如一幅幅淡淡的民俗风情画，令人赏心悦目。建筑风格的丰富多样，隐含太极八卦的结构布局，形成了钓源古村群落的显著特色。
   青石板铺成的巷道两旁，是四通八达的排水沟，天下大雨，巷中无积水，房屋前后瓦檐上的骑瓦封火墙，刺向蓝天。幢幢民居，既有常见的单檐屋面，又有不多见的垂檐瓦顶；既有1进2厢、2进4厢式厅房，又有庭园式、院墙式等风格迥罕的居室。令人不解的是，钓源村大多是“歪门邪道”，巷路、村道、塘岸没有一条是笔直到边的，建造者有意为之，巷道时宽时窄，院角有圆有方，墙面有正有侧，形成回环往复、参差跌宕的格局。专家们考证，这是应合古代阴阳八卦的理念，显现“天人合一”的道理。
钓源村的先祖崇尚遁世，建筑和装饰也无不透露出一种隐逸遁世的道家色彩。而村庄的历史却有过繁华和喧嚣。清咸丰年间，石刻、木刻、彩绘、楹联、牌匾、雕屏，有1300多户，人口近万，店铺60余家，此外还有戏园、赌场、跑马场等，号称“小南京”。方圆数百里的官宦富商，经常来这里博彩听戏，品茶饮酒。这当时远近闻名的乡间都市，昔日繁华至今依稀可辨。文宗遗迹、八卦村形、商贾世家冶游的场所，这些给钓源村抹上了一层迷人的色彩。', N'三月      ')
INSERT [dbo].[villageInfo] ([villageID], [villageName], [villageAddr], [villageImg], [villageDesImg], [villageDes], [bestTime]) VALUES (2, N'皖西村', N'江西赣州', N'~\Images\village2.jpg', N'~\Images\village22.jpg', N'白鹤山乡辖地。流溪湖原名流溪河，水源来自太阳山与麻王山两条山，溪水绕过苗人岗（现赵公桥村），并且在原来我村顾姓围障子（几百亩粮田）的北部汇合一条宽十几米的河道，河上修一座石拱桥（崇善桥），桥西端是开铺打铁做生意的于道，此是常德城通往澧阳古道，道2米多宽，用石板铺，途经镇德桥、石公桥、周家店—渡口，明末清初这里地势较高，后来由于洞庭湖及沅澧下游广兴堤围垸，使得这里积水和山洪难以消尽，最后顾姓人只得在围障子内将粮田改为渔堰，随水位逐年加高，尤在清宣统史辛亥两年间大水山洪终年不消，又在古道上添加一座石麻条长桥，从此以这围障子粮田再也未露水面了，这样由一条几十米宽的小河一下子变成了几千亩的水域，因此改名叫流溪湖了。我村故以此湖为名，现辖16个村民小组，人口1046人，总面积287.28公顷。', N'二月      ')
INSERT [dbo].[villageInfo] ([villageID], [villageName], [villageAddr], [villageImg], [villageDesImg], [villageDes], [bestTime]) VALUES (1, N'洪山村', N'江西南昌', N'~\Images\village1.jpg', N'~\Images\古朴乡村4.jpg', N'特色：洪山区位于长江之畔，东湖之滨，是武汉市以城带郊的中心城区。全区自西向东呈半圆形，东抵鄂州市，南与江夏区接壤，西与武昌、青山两区相邻，北与黄陂区、新洲区隔江相望，是武汉的东大门。全区版图面积570平方公里，户籍人口82.6万，常住人口超过100万，辖8个街道6个乡镇。洪山区人文特色浓郁，科教智力密集，交通发达便捷，山水资源丰富，发展空间广阔
5
本区推荐
?	 
九峰森林动物园
设有“熊虎盛会”和“梦幻剧场”两个大型表演场，可容纳5000游客[详细]
?	 
信阳鸡公山
鸡公山保护区内大地构造位于秦岭褶皱系东段桐柏山脉和大别山脉褶皱带[详细]
?	 
二妃山庄
二妃山庄酒店坐落于二妃山脚下，主要建筑位于中心湖畔，抬腿可拥山色[详细]
?	 
湖北测试
[详细]
舌尖上的洪山区
休闲中的洪山区
?	 
美景1
?	 
美景2
?	 
美景3
?	 
美景4
睡梦中的洪山区
?	 
信阳鸡公山
原价：￥388优惠价：￥360
由信阳鸡公山提供
电话：027-83328668
我要预订>>
洪山区最新活动', N'一月      ')
SET IDENTITY_INSERT [dbo].[villageInfo] OFF
ALTER TABLE [dbo].[actiInfo]  WITH CHECK ADD  CONSTRAINT [FK_actiInfo_villageInfo] FOREIGN KEY([villageID])
REFERENCES [dbo].[villageInfo] ([villageID])
GO
ALTER TABLE [dbo].[actiInfo] CHECK CONSTRAINT [FK_actiInfo_villageInfo]
GO
ALTER TABLE [dbo].[comInfo]  WITH CHECK ADD  CONSTRAINT [FK_comInfo_expInfo] FOREIGN KEY([expID])
REFERENCES [dbo].[expInfo] ([expID])
GO
ALTER TABLE [dbo].[comInfo] CHECK CONSTRAINT [FK_comInfo_expInfo]
GO
ALTER TABLE [dbo].[comReturn]  WITH CHECK ADD  CONSTRAINT [FK_returnOne_comInfo] FOREIGN KEY([comID])
REFERENCES [dbo].[comInfo] ([comID])
GO
ALTER TABLE [dbo].[comReturn] CHECK CONSTRAINT [FK_returnOne_comInfo]
GO
ALTER TABLE [dbo].[comReturn]  WITH CHECK ADD  CONSTRAINT [FK_returnOne_userInfo] FOREIGN KEY([userID])
REFERENCES [dbo].[userInfo] ([userID])
GO
ALTER TABLE [dbo].[comReturn] CHECK CONSTRAINT [FK_returnOne_userInfo]
GO
ALTER TABLE [dbo].[expInfo]  WITH CHECK ADD  CONSTRAINT [FK_expInfo_userInfo] FOREIGN KEY([userID])
REFERENCES [dbo].[userInfo] ([userID])
GO
ALTER TABLE [dbo].[expInfo] CHECK CONSTRAINT [FK_expInfo_userInfo]
GO
ALTER TABLE [dbo].[foodInfo]  WITH CHECK ADD  CONSTRAINT [FK_foodInfo_villageInfo] FOREIGN KEY([villageID])
REFERENCES [dbo].[villageInfo] ([villageID])
GO
ALTER TABLE [dbo].[foodInfo] CHECK CONSTRAINT [FK_foodInfo_villageInfo]
GO
ALTER TABLE [dbo].[itemInfo]  WITH CHECK ADD  CONSTRAINT [FK_itemInfo_villageInfo] FOREIGN KEY([villageID])
REFERENCES [dbo].[villageInfo] ([villageID])
GO
ALTER TABLE [dbo].[itemInfo] CHECK CONSTRAINT [FK_itemInfo_villageInfo]
GO
ALTER TABLE [dbo].[massInfo]  WITH CHECK ADD  CONSTRAINT [FK_massInfo_userInfo] FOREIGN KEY([userID])
REFERENCES [dbo].[userInfo] ([userID])
GO
ALTER TABLE [dbo].[massInfo] CHECK CONSTRAINT [FK_massInfo_userInfo]
GO
ALTER TABLE [dbo].[postReturn]  WITH CHECK ADD  CONSTRAINT [FK_postReturn_massInfo] FOREIGN KEY([massID])
REFERENCES [dbo].[massInfo] ([massID])
GO
ALTER TABLE [dbo].[postReturn] CHECK CONSTRAINT [FK_postReturn_massInfo]
GO
ALTER TABLE [dbo].[postReturn]  WITH CHECK ADD  CONSTRAINT [FK_postReturn_userInfo] FOREIGN KEY([userID])
REFERENCES [dbo].[userInfo] ([userID])
GO
ALTER TABLE [dbo].[postReturn] CHECK CONSTRAINT [FK_postReturn_userInfo]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[61] 4[4] 2[17] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "actiInfo"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 146
               Right = 192
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "villageInfo"
            Begin Extent = 
               Top = 153
               Left = 359
               Bottom = 293
               Right = 530
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[52] 4[25] 2[16] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "expInfo"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 261
               Right = 197
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "userInfo"
            Begin Extent = 
               Top = 6
               Left = 235
               Bottom = 243
               Right = 405
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "itemInfo"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 146
               Right = 197
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "villageInfo"
            Begin Extent = 
               Top = 6
               Left = 235
               Bottom = 146
               Right = 406
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_3'
GO
USE [master]
GO
ALTER DATABASE [VillagePraise] SET  READ_WRITE 
GO
