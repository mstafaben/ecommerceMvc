USE [Store]
GO
/****** Object:  Table [dbo].[tTaxGroups]    Script Date: 09/03/2022 20:44:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tTaxGroups](
	[cdeTaxGroup] [varchar](8) NOT NULL,
	[dscTaxGroup] [varchar](50) NULL,
	[optDefault] [bit] NOT NULL,
	[optActive] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tTaxRates]    Script Date: 09/03/2022 20:44:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tTaxRates](
	[cdeTax] [varchar](8) NOT NULL,
	[dscShortTax] [varchar](5) NOT NULL,
	[dscLongTax] [varchar](25) NULL,
	[numRate] [float] NOT NULL,
	[numMinimum] [float] NOT NULL,
	[optDefault] [bit] NOT NULL,
	[optActive] [bit] NOT NULL,
	[cdeRounding] [varchar](1) NULL,
	[SyncStatus] [varchar](1) NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[tax_view]    Script Date: 09/03/2022 20:44:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[tax_view]
AS
SELECT tTaxGroups.cdeTaxGroup AS cdeTax, dscTaxGroup AS dscTax
FROM   tTaxGroups
UNION ALL
SELECT tTaxRates.cdeTax, dscLongTax
FROM   tTaxRates;
GO
/****** Object:  Table [dbo].[tProducts]    Script Date: 09/03/2022 20:44:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tProducts](
	[cdeProduct] [varchar](16) NOT NULL,
	[dscDescription] [varchar](25) NULL,
	[dscNOTE] [varchar](255) NULL,
	[cdeUOM] [varchar](3) NULL,
	[dscSerialNum] [varchar](50) NULL,
	[cdeTax] [varchar](8) NULL,
	[numInventory] [float] NULL,
	[curStnd_price] [float] NULL,
	[curSUG_RETAIL] [float] NULL,
	[numStnd_Qty] [float] NULL,
	[cdeVendor1] [varchar](16) NULL,
	[cdeV1SKU] [varchar](16) NULL,
	[cdeVendor2] [varchar](16) NULL,
	[cdeV2SKU] [varchar](16) NULL,
	[cdeVendor3] [varchar](16) NULL,
	[cdeV3SKU] [varchar](16) NULL,
	[cdeVendor4] [varchar](16) NULL,
	[cdeV4SKU] [varchar](16) NULL,
	[numDUE_IN] [float] NULL,
	[numRO_QTY] [float] NULL,
	[numORDERQTY] [float] NULL,
	[numORD_MULT1] [float] NULL,
	[curMULT_1COST] [float] NULL,
	[numORD_MULT2] [float] NULL,
	[curMULT_2COST] [float] NULL,
	[numORD_MULT3] [float] NULL,
	[curMULT_3COST] [float] NULL,
	[cdeMSKU] [varchar](16) NULL,
	[dscOPEN_1] [varchar](16) NULL,
	[dscOPEN_2] [varchar](16) NULL,
	[dscOPEN_3] [varchar](16) NULL,
	[dscOPEN_4] [varchar](16) NULL,
	[optSale] [bit] NOT NULL,
	[curSale_Price] [money] NULL,
	[cdeSale] [varchar](4) NULL,
	[dteLastSold] [datetime] NULL,
	[cdeTransaction] [varchar](50) NULL,
	[cdeDept] [varchar](4) NULL,
	[cdeSubDept] [smallint] NULL,
	[curAVG_Cost] [float] NULL,
	[curREPL_Cost] [float] NULL,
	[curSTND_Cost] [float] NULL,
	[curLAST_RECD_Cost] [float] NULL,
	[numDAY_QTY] [float] NULL,
	[curDAY_SALE] [float] NULL,
	[numMON_QTY] [float] NULL,
	[curMONTH_SALE] [float] NULL,
	[numYEAR_QTY] [float] NULL,
	[curYEAR_SALE] [float] NULL,
	[numTOTAL_QTY] [float] NULL,
	[curTOTAL_SALE] [float] NULL,
	[optRental] [bit] NOT NULL,
	[dteRentTimeOut] [datetime] NULL,
	[dteRentTimeIn] [datetime] NULL,
	[numTotRentTime] [int] NULL,
	[optInvAlert] [bit] NOT NULL,
	[optSalesLessCost] [bit] NOT NULL,
	[optDiscountAllowed] [bit] NOT NULL,
	[optAddNotesToReceipt] [bit] NOT NULL,
	[numMargin] [float] NULL,
	[optKit] [bit] NOT NULL,
	[cdeAltUOMDefault] [varchar](3) NULL,
	[cdePrice] [varchar](8) NULL,
	[optSetPriceByMargin] [bit] NOT NULL,
	[optDiscontinued] [bit] NOT NULL,
	[dteAction] [datetime] NULL,
	[optRoundTo9] [bit] NOT NULL,
	[cdePAR] [varchar](16) NULL,
	[dteAdded] [datetime] NULL,
	[cdeLastUSERID] [varchar](20) NULL,
	[optNoMoreDiscounts] [bit] NOT NULL,
	[cdeManu] [varchar](16) NULL,
	[cdeClass] [varchar](8) NULL,
	[cdeSubClass] [varchar](8) NULL,
	[cdeLoc] [varchar](8) NULL,
	[dscUpdateInfo] [varchar](50) NULL,
	[dteLastRec] [datetime] NULL,
	[numLastRecQty] [float] NULL,
	[cdeClaimType] [varchar](8) NULL,
	[cdePackStatus] [varchar](4) NULL,
	[cdeCvrsID] [varchar](16) NULL,
	[cdeQtyRank] [varchar](4) NULL,
	[cdePreviousQtyRank] [varchar](4) NULL,
	[cdeDolRank] [varchar](4) NULL,
	[cdePreviousDolRank] [varchar](4) NULL,
	[dteRankCalc] [datetime] NULL,
	[optRankLock] [bit] NOT NULL,
	[numRank] [float] NULL,
	[numMinWeeks] [float] NULL,
	[numMaxWeeks] [float] NULL,
	[optWeeksLock] [bit] NOT NULL,
	[optIncludePromo] [bit] NOT NULL,
	[optORD_MULT2_LOCK] [bit] NOT NULL,
	[optORD_MULT3_LOCK] [bit] NOT NULL,
	[numOrdMin] [float] NULL,
	[numOrdMax] [float] NULL,
	[dteMinMaxCalc] [datetime] NULL,
	[optEORetailLock] [bit] NOT NULL,
	[numDesMargin] [float] NULL,
	[cdeTruBlueInd] [varchar](1) NULL,
	[cdeNonStockSkuInd] [varchar](1) NULL,
	[cdeAssortmentInd] [varchar](1) NULL,
	[numLastCount] [float] NULL,
	[dteLastCount] [datetime] NULL,
	[SyncStatus] [varchar](1) NULL,
	[numORD_MULT4] [float] NULL,
	[curMULT_4COST] [float] NULL,
	[optTiered] [bit] NOT NULL,
	[optORD_MULT4_LOCK] [bit] NOT NULL,
	[cdeCoreItem] [varchar](1) NULL,
	[cdeRetailAssortment] [varchar](1) NULL,
	[cdeGreenItem] [varchar](1) NULL,
	[cdeImageID] [varchar](40) NULL,
	[cdeToBeDiscontinued] [varchar](1) NULL,
	[dteTBD] [datetime] NULL,
	[dteDiscontinued] [datetime] NULL,
	[cdeSubsItemTypeCD] [varchar](1) NULL,
	[cdeCouponSource] [varchar](3) NULL,
	[cdeCouponType] [varchar](1) NULL,
	[numUnitWt] [float] NULL,
	[cdeDIBStatus] [varchar](1) NULL,
	[cdeSubstitute] [varchar](16) NULL,
	[optAdder] [bit] NOT NULL,
	[curFreightCost] [float] NULL,
	[numQtyCommitted] [float] NULL,
	[optAGItem] [bit] NULL,
	[optCentrallyPriced] [bit] NULL,
	[optPriceByMargin] [bit] NOT NULL,
	[optFollowDIBRetail] [bit] NOT NULL,
	[cdeDiscontinueReason] [varchar](1) NULL,
	[curMinSelling_PRICE] [float] NULL,
	[cdeUnitOfMeasureItem] [varchar](1) NULL,
	[cdeECommerceFlag] [varchar](1) NULL,
	[curRPELevel1Retail] [float] NULL,
	[curRPELevel2Retail] [float] NULL,
	[curEcommercePrice] [float] NULL,
	[cdeCentralShipInd] [varchar](1) NULL,
	[cdeVariablePricingMethodCD] [varchar](1) NULL,
	[cdeBrandName] [varchar](20) NULL,
	[numUnitQty] [float] NULL,
	[cdeUnitText] [varchar](10) NULL,
	[cdeVisibilityFlag] [varchar](1) NULL,
	[optPOSAlertNote] [bit] NULL,
	[cdeMadeInUSA] [varchar](1) NULL,
	[cdeSubCategory] [varchar](8) NULL,
	[numRoundToX] [tinyint] NULL,
	[optAceInstantSavings] [bit] NULL,
	[cdeProductType] [varchar](20) NULL,
	[dteDIBRetailInventory] [datetime] NULL,
	[numDIBCaseMultCode] [tinyint] NULL,
	[cdeDIBCountryOfOrigin] [varchar](3) NULL,
	[cdeDIBUPSSwitch] [varchar](1) NULL,
	[cdeDIBCentralStockSwitch] [varchar](1) NULL,
	[numDIBExceptionQty] [int] NULL,
	[numDIBMaxQty] [int] NULL,
	[cdeDIBPriceCode] [varchar](1) NULL,
	[cdeDIBNewItemInd] [varchar](1) NULL,
	[cdeDIBPromoStatus] [varchar](1) NULL,
	[cdeDIBSubstitute2] [varchar](6) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tUOM]    Script Date: 09/03/2022 20:44:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tUOM](
	[cdeUOM] [varchar](3) NOT NULL,
	[dscUOM] [varchar](8) NULL,
	[dscLongUOM] [varchar](25) NULL,
	[dscDIBUOM] [varchar](2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tDept]    Script Date: 09/03/2022 20:44:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tDept](
	[cdeDept] [varchar](4) NOT NULL,
	[dscDepartment] [varchar](50) NULL,
	[numMarginDefault] [float] NULL,
	[SyncStatus] [varchar](1) NULL,
	[optLock] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ProductsInfo]    Script Date: 09/03/2022 20:44:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ProductsInfo]
AS
SELECT TOP 15
dbo.tProducts.cdeProduct			AS Id, 
		dbo.tProducts.dscDescription	AS Description, 
		dbo.tProducts.dscNOTE			AS Note,
	    dbo.tUOM.dscUOM                 AS UnitOfMesure,
		dbo.tProducts.dscSerialNum      AS SerialNumber, 
        dbo.tProducts.curStnd_price     AS StandardPrice, 
		dbo.tProducts.cdeVendor1        AS Vendor, 
		dbo.tDept.dscDepartment         AS DepartmentDescription, 
		dbo.tDept.cdeDept				AS DepartmentCode,
        dbo.tProducts.cdeImageID        AS ImageID
FROM   dbo.tProducts LEFT OUTER JOIN
           dbo.tDept ON dbo.tProducts.cdeDept = dbo.tDept.cdeDept LEFT OUTER JOIN
           dbo.tUOM ON dbo.tProducts.cdeUOM = dbo.tUOM.cdeUOM INNER JOIN
           dbo.tax_view ON dbo.tProducts.cdeTax = dbo.tax_view.cdeTax
GO
/****** Object:  View [dbo].[products_qry]    Script Date: 09/03/2022 20:44:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[products_qry]
AS
SELECT dbo.tProducts.cdeProduct AS [Product ID], dbo.tProducts.dscDescription AS Description, dbo.tProducts.dscNOTE AS Note, dbo.tUOM.dscUOM AS [Unit of Measure], dbo.tProducts.dscSerialNum AS [Serial Number], dbo.tax_view.dscTax AS Tax, dbo.tProducts.numInventory AS Inventory, 
           dbo.tProducts.curStnd_price AS [Standard Price], dbo.tProducts.curSUG_RETAIL AS [Suggested Retail], dbo.tProducts.numStnd_Qty AS [Standard Quantity], dbo.tProducts.cdeVendor1 AS [Vendor 1], dbo.tProducts.cdeV1SKU AS [Vendor 1 SKU], dbo.tProducts.cdeVendor2 AS [Vendor 2], dbo.tProducts.cdeV2SKU AS [Vendor 2 SKU], 
           dbo.tProducts.cdeVendor3 AS [Vendor 3], dbo.tProducts.cdeV3SKU AS [Vender 3 SKU], dbo.tProducts.cdeVendor4 AS [Vendor 4], dbo.tProducts.cdeV4SKU AS [Vendor 4 SKU], dbo.tDept.dscDepartment AS Department, dbo.tDept.cdeDept AS [Department Code], dbo.tProducts.dteLastSold AS [Date Last Sold], 
           dbo.tProducts.cdeImageID
FROM   dbo.tProducts LEFT OUTER JOIN
           dbo.tDept ON dbo.tProducts.cdeDept = dbo.tDept.cdeDept LEFT OUTER JOIN
           dbo.tUOM ON dbo.tProducts.cdeUOM = dbo.tUOM.cdeUOM INNER JOIN
           dbo.tax_view ON dbo.tProducts.cdeTax = dbo.tax_view.cdeTax
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 09/03/2022 20:44:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 09/03/2022 20:44:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 09/03/2022 20:44:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 09/03/2022 20:44:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 09/03/2022 20:44:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 09/03/2022 20:44:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 09/03/2022 20:44:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tDeptSub]    Script Date: 09/03/2022 20:44:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tDeptSub](
	[cdeDept] [varchar](4) NOT NULL,
	[cdeSubDept] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tDeptSubNames]    Script Date: 09/03/2022 20:44:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tDeptSubNames](
	[cdeSubDept] [int] NOT NULL,
	[dscSubDept] [varchar](25) NULL
) ON [PRIMARY]
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Name]) VALUES (N'533f7cd1-aeae-49d8-8f3c-ee3e0c2eaaad', N'benm', N'BENM', N'mus887@emvil.com', N'MUS887@EMVIL.COM', 0, N'AQAAAAEAACcQAAAAEBOEclGuxzx49c956Pn3EJinKDJn0aE69VrM/Mpznf4e/F8ExIj0Tcx86p87FOuj+g==', N'VC7VFGKS7PGQJG65ESWKD6ANMBIMUKQ4', N'b50ebe84-227d-4559-9145-015cfe407444', NULL, 0, 0, NULL, 1, 0, N'mus')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Name]) VALUES (N'b2c78de7-e3ac-4bcc-b662-437281cfbfee', N'ben', N'BEN', N'mus887@emvil.com', N'MUS887@EMVIL.COM', 0, N'AQAAAAEAACcQAAAAEDc/BmQPw1/u6VvpeJcBi+URHKiD/XT9/RLQDJH8kEJjIjqnczR3mCuIH41f+VIjFA==', N'5IM4GTNMY7JMLCN7PLIB6C4C36FN3NHQ', N'18a8dadb-5da3-416e-91da-ec9f167b7231', NULL, 0, 0, NULL, 1, 0, N'mus')
INSERT [dbo].[tDept] ([cdeDept], [dscDepartment], [numMarginDefault], [SyncStatus], [optLock]) VALUES (N'0', N'No Dept', 35, N'0', 0)
INSERT [dbo].[tDept] ([cdeDept], [dscDepartment], [numMarginDefault], [SyncStatus], [optLock]) VALUES (N'F', N'PLUMBING & HEATING SUPPLIES', 60, N'0', 0)
INSERT [dbo].[tDept] ([cdeDept], [dscDepartment], [numMarginDefault], [SyncStatus], [optLock]) VALUES (N'K', N'KEYS', 75, N'0', 0)
INSERT [dbo].[tDept] ([cdeDept], [dscDepartment], [numMarginDefault], [SyncStatus], [optLock]) VALUES (N'OB', N'Opening Balances', 0, N'0', 0)
INSERT [dbo].[tDept] ([cdeDept], [dscDepartment], [numMarginDefault], [SyncStatus], [optLock]) VALUES (N'PTA', N'Payments To Accounts', 0, N'0', 0)
INSERT [dbo].[tDept] ([cdeDept], [dscDepartment], [numMarginDefault], [SyncStatus], [optLock]) VALUES (N'A', N'AUTOMOTIVE', NULL, N'0', 0)
INSERT [dbo].[tDept] ([cdeDept], [dscDepartment], [numMarginDefault], [SyncStatus], [optLock]) VALUES (N'B', N'BUILDING MATERIALS', NULL, N'0', 0)
INSERT [dbo].[tDept] ([cdeDept], [dscDepartment], [numMarginDefault], [SyncStatus], [optLock]) VALUES (N'C', N'CLEANING & JANITORIAL SUPPLIES', NULL, N'0', 0)
INSERT [dbo].[tDept] ([cdeDept], [dscDepartment], [numMarginDefault], [SyncStatus], [optLock]) VALUES (N'E', N'ELECTRICAL & LIGHTING', NULL, N'0', 0)
INSERT [dbo].[tDept] ([cdeDept], [dscDepartment], [numMarginDefault], [SyncStatus], [optLock]) VALUES (N'H', N'HARDWARE & FARM SUPPLIES', NULL, N'0', 0)
INSERT [dbo].[tDept] ([cdeDept], [dscDepartment], [numMarginDefault], [SyncStatus], [optLock]) VALUES (N'L', N'LAWN & GARDEN', NULL, N'0', 0)
INSERT [dbo].[tDept] ([cdeDept], [dscDepartment], [numMarginDefault], [SyncStatus], [optLock]) VALUES (N'N', N'APPLIANCES & ELECTRONICS', NULL, N'0', 0)
INSERT [dbo].[tDept] ([cdeDept], [dscDepartment], [numMarginDefault], [SyncStatus], [optLock]) VALUES (N'O', N'OUTDOOR LIVING & POWER EQUIPMENT', NULL, N'0', 0)
INSERT [dbo].[tDept] ([cdeDept], [dscDepartment], [numMarginDefault], [SyncStatus], [optLock]) VALUES (N'P', N'PAINT, APPLICATORS, HOME DECOR & SUNDRIES', NULL, N'0', 0)
INSERT [dbo].[tDept] ([cdeDept], [dscDepartment], [numMarginDefault], [SyncStatus], [optLock]) VALUES (N'Q', N'RENTAL', NULL, N'0', 0)
INSERT [dbo].[tDept] ([cdeDept], [dscDepartment], [numMarginDefault], [SyncStatus], [optLock]) VALUES (N'R', N'HAND & POWER TOOLS', NULL, N'0', 0)
INSERT [dbo].[tDept] ([cdeDept], [dscDepartment], [numMarginDefault], [SyncStatus], [optLock]) VALUES (N'S', N'OUTDOOR SPORTS & RECREATION', NULL, N'0', 0)
INSERT [dbo].[tDept] ([cdeDept], [dscDepartment], [numMarginDefault], [SyncStatus], [optLock]) VALUES (N'T', N'CHRISTMAS TRIM, STATIONERY & TOYS', NULL, N'0', 0)
INSERT [dbo].[tDept] ([cdeDept], [dscDepartment], [numMarginDefault], [SyncStatus], [optLock]) VALUES (N'W', N'HOUSEWARES & CLEANING SUPPLIES', NULL, N'0', 0)
INSERT [dbo].[tDept] ([cdeDept], [dscDepartment], [numMarginDefault], [SyncStatus], [optLock]) VALUES (N'Z', N'STORE SUPPLIES', NULL, N'0', 0)
INSERT [dbo].[tDept] ([cdeDept], [dscDepartment], [numMarginDefault], [SyncStatus], [optLock]) VALUES (N'MW', N'MW Dept', NULL, N'0', 0)
INSERT [dbo].[tDept] ([cdeDept], [dscDepartment], [numMarginDefault], [SyncStatus], [optLock]) VALUES (N'D', N'D Dept', NULL, N'0', 0)
INSERT [dbo].[tDept] ([cdeDept], [dscDepartment], [numMarginDefault], [SyncStatus], [optLock]) VALUES (N'G', N'G Dept', NULL, N'0', 0)
INSERT [dbo].[tDept] ([cdeDept], [dscDepartment], [numMarginDefault], [SyncStatus], [optLock]) VALUES (N'I', N'I Dept', NULL, N'0', 0)
INSERT [dbo].[tDeptSub] ([cdeDept], [cdeSubDept]) VALUES (N'15', 1)
INSERT [dbo].[tDeptSubNames] ([cdeSubDept], [dscSubDept]) VALUES (1, N'Summer')
INSERT [dbo].[tDeptSubNames] ([cdeSubDept], [dscSubDept]) VALUES (2, N'Winter')
INSERT [dbo].[tDeptSubNames] ([cdeSubDept], [dscSubDept]) VALUES (3, N'Fall')
INSERT [dbo].[tDeptSubNames] ([cdeSubDept], [dscSubDept]) VALUES (4, N'Spring')
INSERT [dbo].[tDeptSubNames] ([cdeSubDept], [dscSubDept]) VALUES (5, N'DIB DISCONTINUED')
INSERT [dbo].[tDeptSubNames] ([cdeSubDept], [dscSubDept]) VALUES (6, N'Discontinued')
INSERT [dbo].[tDeptSubNames] ([cdeSubDept], [dscSubDept]) VALUES (7, N'Discontinued')
INSERT [dbo].[tDeptSubNames] ([cdeSubDept], [dscSubDept]) VALUES (9, N'Adder')
INSERT [dbo].[tProducts] ([cdeProduct], [dscDescription], [dscNOTE], [cdeUOM], [dscSerialNum], [cdeTax], [numInventory], [curStnd_price], [curSUG_RETAIL], [numStnd_Qty], [cdeVendor1], [cdeV1SKU], [cdeVendor2], [cdeV2SKU], [cdeVendor3], [cdeV3SKU], [cdeVendor4], [cdeV4SKU], [numDUE_IN], [numRO_QTY], [numORDERQTY], [numORD_MULT1], [curMULT_1COST], [numORD_MULT2], [curMULT_2COST], [numORD_MULT3], [curMULT_3COST], [cdeMSKU], [dscOPEN_1], [dscOPEN_2], [dscOPEN_3], [dscOPEN_4], [optSale], [curSale_Price], [cdeSale], [dteLastSold], [cdeTransaction], [cdeDept], [cdeSubDept], [curAVG_Cost], [curREPL_Cost], [curSTND_Cost], [curLAST_RECD_Cost], [numDAY_QTY], [curDAY_SALE], [numMON_QTY], [curMONTH_SALE], [numYEAR_QTY], [curYEAR_SALE], [numTOTAL_QTY], [curTOTAL_SALE], [optRental], [dteRentTimeOut], [dteRentTimeIn], [numTotRentTime], [optInvAlert], [optSalesLessCost], [optDiscountAllowed], [optAddNotesToReceipt], [numMargin], [optKit], [cdeAltUOMDefault], [cdePrice], [optSetPriceByMargin], [optDiscontinued], [dteAction], [optRoundTo9], [cdePAR], [dteAdded], [cdeLastUSERID], [optNoMoreDiscounts], [cdeManu], [cdeClass], [cdeSubClass], [cdeLoc], [dscUpdateInfo], [dteLastRec], [numLastRecQty], [cdeClaimType], [cdePackStatus], [cdeCvrsID], [cdeQtyRank], [cdePreviousQtyRank], [cdeDolRank], [cdePreviousDolRank], [dteRankCalc], [optRankLock], [numRank], [numMinWeeks], [numMaxWeeks], [optWeeksLock], [optIncludePromo], [optORD_MULT2_LOCK], [optORD_MULT3_LOCK], [numOrdMin], [numOrdMax], [dteMinMaxCalc], [optEORetailLock], [numDesMargin], [cdeTruBlueInd], [cdeNonStockSkuInd], [cdeAssortmentInd], [numLastCount], [dteLastCount], [SyncStatus], [numORD_MULT4], [curMULT_4COST], [optTiered], [optORD_MULT4_LOCK], [cdeCoreItem], [cdeRetailAssortment], [cdeGreenItem], [cdeImageID], [cdeToBeDiscontinued], [dteTBD], [dteDiscontinued], [cdeSubsItemTypeCD], [cdeCouponSource], [cdeCouponType], [numUnitWt], [cdeDIBStatus], [cdeSubstitute], [optAdder], [curFreightCost], [numQtyCommitted], [optAGItem], [optCentrallyPriced], [optPriceByMargin], [optFollowDIBRetail], [cdeDiscontinueReason], [curMinSelling_PRICE], [cdeUnitOfMeasureItem], [cdeECommerceFlag], [curRPELevel1Retail], [curRPELevel2Retail], [curEcommercePrice], [cdeCentralShipInd], [cdeVariablePricingMethodCD], [cdeBrandName], [numUnitQty], [cdeUnitText], [cdeVisibilityFlag], [optPOSAlertNote], [cdeMadeInUSA], [cdeSubCategory], [numRoundToX], [optAceInstantSavings], [cdeProductType], [dteDIBRetailInventory], [numDIBCaseMultCode], [cdeDIBCountryOfOrigin], [cdeDIBUPSSwitch], [cdeDIBCentralStockSwitch], [numDIBExceptionQty], [numDIBMaxQty], [cdeDIBPriceCode], [cdeDIBNewItemInd], [cdeDIBPromoStatus], [cdeDIBSubstitute2]) VALUES (N'M', N'MISC. MDSE.', NULL, N'17', N'0', N'NY', 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, 0.0000, N'0', NULL, NULL, N'0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 1, 1, 0, 0, 0, N'17', NULL, 0, 0, CAST(N'2002-02-13T16:41:16.000' AS DateTime), 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'X', N'X', N'X', N'X', CAST(N'2017-11-30T13:48:26.000' AS DateTime), 0, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, N'0', 0, 0, 0, 0, NULL, NULL, NULL, N'~/images/0001.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, 0, N'N', NULL, 9, 0, NULL, CAST(N'2016-12-05T13:56:05.633' AS DateTime), 0, N'', NULL, N'', 0, 0, N'', N'', N'', N'')
INSERT [dbo].[tProducts] ([cdeProduct], [dscDescription], [dscNOTE], [cdeUOM], [dscSerialNum], [cdeTax], [numInventory], [curStnd_price], [curSUG_RETAIL], [numStnd_Qty], [cdeVendor1], [cdeV1SKU], [cdeVendor2], [cdeV2SKU], [cdeVendor3], [cdeV3SKU], [cdeVendor4], [cdeV4SKU], [numDUE_IN], [numRO_QTY], [numORDERQTY], [numORD_MULT1], [curMULT_1COST], [numORD_MULT2], [curMULT_2COST], [numORD_MULT3], [curMULT_3COST], [cdeMSKU], [dscOPEN_1], [dscOPEN_2], [dscOPEN_3], [dscOPEN_4], [optSale], [curSale_Price], [cdeSale], [dteLastSold], [cdeTransaction], [cdeDept], [cdeSubDept], [curAVG_Cost], [curREPL_Cost], [curSTND_Cost], [curLAST_RECD_Cost], [numDAY_QTY], [curDAY_SALE], [numMON_QTY], [curMONTH_SALE], [numYEAR_QTY], [curYEAR_SALE], [numTOTAL_QTY], [curTOTAL_SALE], [optRental], [dteRentTimeOut], [dteRentTimeIn], [numTotRentTime], [optInvAlert], [optSalesLessCost], [optDiscountAllowed], [optAddNotesToReceipt], [numMargin], [optKit], [cdeAltUOMDefault], [cdePrice], [optSetPriceByMargin], [optDiscontinued], [dteAction], [optRoundTo9], [cdePAR], [dteAdded], [cdeLastUSERID], [optNoMoreDiscounts], [cdeManu], [cdeClass], [cdeSubClass], [cdeLoc], [dscUpdateInfo], [dteLastRec], [numLastRecQty], [cdeClaimType], [cdePackStatus], [cdeCvrsID], [cdeQtyRank], [cdePreviousQtyRank], [cdeDolRank], [cdePreviousDolRank], [dteRankCalc], [optRankLock], [numRank], [numMinWeeks], [numMaxWeeks], [optWeeksLock], [optIncludePromo], [optORD_MULT2_LOCK], [optORD_MULT3_LOCK], [numOrdMin], [numOrdMax], [dteMinMaxCalc], [optEORetailLock], [numDesMargin], [cdeTruBlueInd], [cdeNonStockSkuInd], [cdeAssortmentInd], [numLastCount], [dteLastCount], [SyncStatus], [numORD_MULT4], [curMULT_4COST], [optTiered], [optORD_MULT4_LOCK], [cdeCoreItem], [cdeRetailAssortment], [cdeGreenItem], [cdeImageID], [cdeToBeDiscontinued], [dteTBD], [dteDiscontinued], [cdeSubsItemTypeCD], [cdeCouponSource], [cdeCouponType], [numUnitWt], [cdeDIBStatus], [cdeSubstitute], [optAdder], [curFreightCost], [numQtyCommitted], [optAGItem], [optCentrallyPriced], [optPriceByMargin], [optFollowDIBRetail], [cdeDiscontinueReason], [curMinSelling_PRICE], [cdeUnitOfMeasureItem], [cdeECommerceFlag], [curRPELevel1Retail], [curRPELevel2Retail], [curEcommercePrice], [cdeCentralShipInd], [cdeVariablePricingMethodCD], [cdeBrandName], [numUnitQty], [cdeUnitText], [cdeVisibilityFlag], [optPOSAlertNote], [cdeMadeInUSA], [cdeSubCategory], [numRoundToX], [optAceInstantSavings], [cdeProductType], [dteDIBRetailInventory], [numDIBCaseMultCode], [cdeDIBCountryOfOrigin], [cdeDIBUPSSwitch], [cdeDIBCentralStockSwitch], [numDIBExceptionQty], [numDIBMaxQty], [cdeDIBPriceCode], [cdeDIBNewItemInd], [cdeDIBPromoStatus], [cdeDIBSubstitute2]) VALUES (N'OB', N'OPENING BALANCE', N'BALANCE TRANSFER TO NEW ACCOUNTING SYSTEM', N'17', N'0', N'0', 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, 0.0000, N'0', NULL, NULL, N'0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 1, 0, 0, N'17', NULL, 0, 0, NULL, 0, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'X', N'X', N'X', N'X', CAST(N'2017-11-30T13:48:26.000' AS DateTime), 0, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, N'0', 0, 0, 0, 0, NULL, NULL, NULL, N'~/images/0001.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, 0, N'N', NULL, 9, 0, NULL, CAST(N'2016-12-05T13:56:05.633' AS DateTime), 0, N'', NULL, N'', 0, 0, N'', N'', N'', N'')
INSERT [dbo].[tProducts] ([cdeProduct], [dscDescription], [dscNOTE], [cdeUOM], [dscSerialNum], [cdeTax], [numInventory], [curStnd_price], [curSUG_RETAIL], [numStnd_Qty], [cdeVendor1], [cdeV1SKU], [cdeVendor2], [cdeV2SKU], [cdeVendor3], [cdeV3SKU], [cdeVendor4], [cdeV4SKU], [numDUE_IN], [numRO_QTY], [numORDERQTY], [numORD_MULT1], [curMULT_1COST], [numORD_MULT2], [curMULT_2COST], [numORD_MULT3], [curMULT_3COST], [cdeMSKU], [dscOPEN_1], [dscOPEN_2], [dscOPEN_3], [dscOPEN_4], [optSale], [curSale_Price], [cdeSale], [dteLastSold], [cdeTransaction], [cdeDept], [cdeSubDept], [curAVG_Cost], [curREPL_Cost], [curSTND_Cost], [curLAST_RECD_Cost], [numDAY_QTY], [curDAY_SALE], [numMON_QTY], [curMONTH_SALE], [numYEAR_QTY], [curYEAR_SALE], [numTOTAL_QTY], [curTOTAL_SALE], [optRental], [dteRentTimeOut], [dteRentTimeIn], [numTotRentTime], [optInvAlert], [optSalesLessCost], [optDiscountAllowed], [optAddNotesToReceipt], [numMargin], [optKit], [cdeAltUOMDefault], [cdePrice], [optSetPriceByMargin], [optDiscontinued], [dteAction], [optRoundTo9], [cdePAR], [dteAdded], [cdeLastUSERID], [optNoMoreDiscounts], [cdeManu], [cdeClass], [cdeSubClass], [cdeLoc], [dscUpdateInfo], [dteLastRec], [numLastRecQty], [cdeClaimType], [cdePackStatus], [cdeCvrsID], [cdeQtyRank], [cdePreviousQtyRank], [cdeDolRank], [cdePreviousDolRank], [dteRankCalc], [optRankLock], [numRank], [numMinWeeks], [numMaxWeeks], [optWeeksLock], [optIncludePromo], [optORD_MULT2_LOCK], [optORD_MULT3_LOCK], [numOrdMin], [numOrdMax], [dteMinMaxCalc], [optEORetailLock], [numDesMargin], [cdeTruBlueInd], [cdeNonStockSkuInd], [cdeAssortmentInd], [numLastCount], [dteLastCount], [SyncStatus], [numORD_MULT4], [curMULT_4COST], [optTiered], [optORD_MULT4_LOCK], [cdeCoreItem], [cdeRetailAssortment], [cdeGreenItem], [cdeImageID], [cdeToBeDiscontinued], [dteTBD], [dteDiscontinued], [cdeSubsItemTypeCD], [cdeCouponSource], [cdeCouponType], [numUnitWt], [cdeDIBStatus], [cdeSubstitute], [optAdder], [curFreightCost], [numQtyCommitted], [optAGItem], [optCentrallyPriced], [optPriceByMargin], [optFollowDIBRetail], [cdeDiscontinueReason], [curMinSelling_PRICE], [cdeUnitOfMeasureItem], [cdeECommerceFlag], [curRPELevel1Retail], [curRPELevel2Retail], [curEcommercePrice], [cdeCentralShipInd], [cdeVariablePricingMethodCD], [cdeBrandName], [numUnitQty], [cdeUnitText], [cdeVisibilityFlag], [optPOSAlertNote], [cdeMadeInUSA], [cdeSubCategory], [numRoundToX], [optAceInstantSavings], [cdeProductType], [dteDIBRetailInventory], [numDIBCaseMultCode], [cdeDIBCountryOfOrigin], [cdeDIBUPSSwitch], [cdeDIBCentralStockSwitch], [numDIBExceptionQty], [numDIBMaxQty], [cdeDIBPriceCode], [cdeDIBNewItemInd], [cdeDIBPromoStatus], [cdeDIBSubstitute2]) VALUES (N'PTA', N'PAYMENT TO ACCOUNT', N'15', N'17', N'0', N'0', 0, 0, 0, 1, N'', N'', N'', N'', N'', N'', N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, 0.0000, N'0', CAST(N'2022-02-04T13:27:48.000' AS DateTime), N'A193773', N'PTA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, N'17', NULL, 0, 0, CAST(N'2005-07-16T10:14:26.000' AS DateTime), 0, NULL, CAST(N'2004-09-21T14:46:41.000' AS DateTime), N'Employee', 1, NULL, N'', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'X', N'X', N'X', N'X', CAST(N'2017-11-30T13:48:26.000' AS DateTime), 0, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, N'0', 0, 0, 0, 0, NULL, NULL, NULL, N'~/images/0001.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, 0, N'N', NULL, 9, 0, NULL, CAST(N'2016-12-05T13:56:05.633' AS DateTime), 0, N'', NULL, N'', 0, 0, N'', N'', N'', N'')
INSERT [dbo].[tProducts] ([cdeProduct], [dscDescription], [dscNOTE], [cdeUOM], [dscSerialNum], [cdeTax], [numInventory], [curStnd_price], [curSUG_RETAIL], [numStnd_Qty], [cdeVendor1], [cdeV1SKU], [cdeVendor2], [cdeV2SKU], [cdeVendor3], [cdeV3SKU], [cdeVendor4], [cdeV4SKU], [numDUE_IN], [numRO_QTY], [numORDERQTY], [numORD_MULT1], [curMULT_1COST], [numORD_MULT2], [curMULT_2COST], [numORD_MULT3], [curMULT_3COST], [cdeMSKU], [dscOPEN_1], [dscOPEN_2], [dscOPEN_3], [dscOPEN_4], [optSale], [curSale_Price], [cdeSale], [dteLastSold], [cdeTransaction], [cdeDept], [cdeSubDept], [curAVG_Cost], [curREPL_Cost], [curSTND_Cost], [curLAST_RECD_Cost], [numDAY_QTY], [curDAY_SALE], [numMON_QTY], [curMONTH_SALE], [numYEAR_QTY], [curYEAR_SALE], [numTOTAL_QTY], [curTOTAL_SALE], [optRental], [dteRentTimeOut], [dteRentTimeIn], [numTotRentTime], [optInvAlert], [optSalesLessCost], [optDiscountAllowed], [optAddNotesToReceipt], [numMargin], [optKit], [cdeAltUOMDefault], [cdePrice], [optSetPriceByMargin], [optDiscontinued], [dteAction], [optRoundTo9], [cdePAR], [dteAdded], [cdeLastUSERID], [optNoMoreDiscounts], [cdeManu], [cdeClass], [cdeSubClass], [cdeLoc], [dscUpdateInfo], [dteLastRec], [numLastRecQty], [cdeClaimType], [cdePackStatus], [cdeCvrsID], [cdeQtyRank], [cdePreviousQtyRank], [cdeDolRank], [cdePreviousDolRank], [dteRankCalc], [optRankLock], [numRank], [numMinWeeks], [numMaxWeeks], [optWeeksLock], [optIncludePromo], [optORD_MULT2_LOCK], [optORD_MULT3_LOCK], [numOrdMin], [numOrdMax], [dteMinMaxCalc], [optEORetailLock], [numDesMargin], [cdeTruBlueInd], [cdeNonStockSkuInd], [cdeAssortmentInd], [numLastCount], [dteLastCount], [SyncStatus], [numORD_MULT4], [curMULT_4COST], [optTiered], [optORD_MULT4_LOCK], [cdeCoreItem], [cdeRetailAssortment], [cdeGreenItem], [cdeImageID], [cdeToBeDiscontinued], [dteTBD], [dteDiscontinued], [cdeSubsItemTypeCD], [cdeCouponSource], [cdeCouponType], [numUnitWt], [cdeDIBStatus], [cdeSubstitute], [optAdder], [curFreightCost], [numQtyCommitted], [optAGItem], [optCentrallyPriced], [optPriceByMargin], [optFollowDIBRetail], [cdeDiscontinueReason], [curMinSelling_PRICE], [cdeUnitOfMeasureItem], [cdeECommerceFlag], [curRPELevel1Retail], [curRPELevel2Retail], [curEcommercePrice], [cdeCentralShipInd], [cdeVariablePricingMethodCD], [cdeBrandName], [numUnitQty], [cdeUnitText], [cdeVisibilityFlag], [optPOSAlertNote], [cdeMadeInUSA], [cdeSubCategory], [numRoundToX], [optAceInstantSavings], [cdeProductType], [dteDIBRetailInventory], [numDIBCaseMultCode], [cdeDIBCountryOfOrigin], [cdeDIBUPSSwitch], [cdeDIBCentralStockSwitch], [numDIBExceptionQty], [numDIBMaxQty], [cdeDIBPriceCode], [cdeDIBNewItemInd], [cdeDIBPromoStatus], [cdeDIBSubstitute2]) VALUES (N'TVR_LUC', N'', N'Bon produit', N'17', NULL, N'NY', 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, 0.0000, N'0', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'X', N'X', N'X', N'X', CAST(N'2017-11-30T13:48:26.000' AS DateTime), 0, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, NULL, N'0', 0, 0, 0, 0, NULL, NULL, NULL, N'~/images/0001.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, 0, N'N', NULL, 9, 0, N'GEN_COUPON', CAST(N'2016-12-05T13:56:08.870' AS DateTime), 0, N'', NULL, N'', 0, 0, N'', N'', N'', N'')
INSERT [dbo].[tProducts] ([cdeProduct], [dscDescription], [dscNOTE], [cdeUOM], [dscSerialNum], [cdeTax], [numInventory], [curStnd_price], [curSUG_RETAIL], [numStnd_Qty], [cdeVendor1], [cdeV1SKU], [cdeVendor2], [cdeV2SKU], [cdeVendor3], [cdeV3SKU], [cdeVendor4], [cdeV4SKU], [numDUE_IN], [numRO_QTY], [numORDERQTY], [numORD_MULT1], [curMULT_1COST], [numORD_MULT2], [curMULT_2COST], [numORD_MULT3], [curMULT_3COST], [cdeMSKU], [dscOPEN_1], [dscOPEN_2], [dscOPEN_3], [dscOPEN_4], [optSale], [curSale_Price], [cdeSale], [dteLastSold], [cdeTransaction], [cdeDept], [cdeSubDept], [curAVG_Cost], [curREPL_Cost], [curSTND_Cost], [curLAST_RECD_Cost], [numDAY_QTY], [curDAY_SALE], [numMON_QTY], [curMONTH_SALE], [numYEAR_QTY], [curYEAR_SALE], [numTOTAL_QTY], [curTOTAL_SALE], [optRental], [dteRentTimeOut], [dteRentTimeIn], [numTotRentTime], [optInvAlert], [optSalesLessCost], [optDiscountAllowed], [optAddNotesToReceipt], [numMargin], [optKit], [cdeAltUOMDefault], [cdePrice], [optSetPriceByMargin], [optDiscontinued], [dteAction], [optRoundTo9], [cdePAR], [dteAdded], [cdeLastUSERID], [optNoMoreDiscounts], [cdeManu], [cdeClass], [cdeSubClass], [cdeLoc], [dscUpdateInfo], [dteLastRec], [numLastRecQty], [cdeClaimType], [cdePackStatus], [cdeCvrsID], [cdeQtyRank], [cdePreviousQtyRank], [cdeDolRank], [cdePreviousDolRank], [dteRankCalc], [optRankLock], [numRank], [numMinWeeks], [numMaxWeeks], [optWeeksLock], [optIncludePromo], [optORD_MULT2_LOCK], [optORD_MULT3_LOCK], [numOrdMin], [numOrdMax], [dteMinMaxCalc], [optEORetailLock], [numDesMargin], [cdeTruBlueInd], [cdeNonStockSkuInd], [cdeAssortmentInd], [numLastCount], [dteLastCount], [SyncStatus], [numORD_MULT4], [curMULT_4COST], [optTiered], [optORD_MULT4_LOCK], [cdeCoreItem], [cdeRetailAssortment], [cdeGreenItem], [cdeImageID], [cdeToBeDiscontinued], [dteTBD], [dteDiscontinued], [cdeSubsItemTypeCD], [cdeCouponSource], [cdeCouponType], [numUnitWt], [cdeDIBStatus], [cdeSubstitute], [optAdder], [curFreightCost], [numQtyCommitted], [optAGItem], [optCentrallyPriced], [optPriceByMargin], [optFollowDIBRetail], [cdeDiscontinueReason], [curMinSelling_PRICE], [cdeUnitOfMeasureItem], [cdeECommerceFlag], [curRPELevel1Retail], [curRPELevel2Retail], [curEcommercePrice], [cdeCentralShipInd], [cdeVariablePricingMethodCD], [cdeBrandName], [numUnitQty], [cdeUnitText], [cdeVisibilityFlag], [optPOSAlertNote], [cdeMadeInUSA], [cdeSubCategory], [numRoundToX], [optAceInstantSavings], [cdeProductType], [dteDIBRetailInventory], [numDIBCaseMultCode], [cdeDIBCountryOfOrigin], [cdeDIBUPSSwitch], [cdeDIBCentralStockSwitch], [numDIBExceptionQty], [numDIBMaxQty], [cdeDIBPriceCode], [cdeDIBNewItemInd], [cdeDIBPromoStatus], [cdeDIBSubstitute2]) VALUES (N'RRCERTAUTO', N'REPEAT REWARD CERTIFICATE', NULL, N'17', NULL, N'NY', 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, 0.0000, N'0', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, NULL, 0, NULL, CAST(N'2016-12-05T13:56:09.517' AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'X', N'X', N'X', N'X', CAST(N'2017-11-30T13:48:26.000' AS DateTime), 0, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, NULL, N'0', 0, 0, 0, 0, NULL, NULL, NULL, N'~/images/0001.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, 0, N'N', NULL, 9, 0, N'RRCERTIFICATE', CAST(N'2016-12-05T13:56:09.517' AS DateTime), 0, N'', NULL, N'', 0, 0, N'', N'', N'', N'')
INSERT [dbo].[tProducts] ([cdeProduct], [dscDescription], [dscNOTE], [cdeUOM], [dscSerialNum], [cdeTax], [numInventory], [curStnd_price], [curSUG_RETAIL], [numStnd_Qty], [cdeVendor1], [cdeV1SKU], [cdeVendor2], [cdeV2SKU], [cdeVendor3], [cdeV3SKU], [cdeVendor4], [cdeV4SKU], [numDUE_IN], [numRO_QTY], [numORDERQTY], [numORD_MULT1], [curMULT_1COST], [numORD_MULT2], [curMULT_2COST], [numORD_MULT3], [curMULT_3COST], [cdeMSKU], [dscOPEN_1], [dscOPEN_2], [dscOPEN_3], [dscOPEN_4], [optSale], [curSale_Price], [cdeSale], [dteLastSold], [cdeTransaction], [cdeDept], [cdeSubDept], [curAVG_Cost], [curREPL_Cost], [curSTND_Cost], [curLAST_RECD_Cost], [numDAY_QTY], [curDAY_SALE], [numMON_QTY], [curMONTH_SALE], [numYEAR_QTY], [curYEAR_SALE], [numTOTAL_QTY], [curTOTAL_SALE], [optRental], [dteRentTimeOut], [dteRentTimeIn], [numTotRentTime], [optInvAlert], [optSalesLessCost], [optDiscountAllowed], [optAddNotesToReceipt], [numMargin], [optKit], [cdeAltUOMDefault], [cdePrice], [optSetPriceByMargin], [optDiscontinued], [dteAction], [optRoundTo9], [cdePAR], [dteAdded], [cdeLastUSERID], [optNoMoreDiscounts], [cdeManu], [cdeClass], [cdeSubClass], [cdeLoc], [dscUpdateInfo], [dteLastRec], [numLastRecQty], [cdeClaimType], [cdePackStatus], [cdeCvrsID], [cdeQtyRank], [cdePreviousQtyRank], [cdeDolRank], [cdePreviousDolRank], [dteRankCalc], [optRankLock], [numRank], [numMinWeeks], [numMaxWeeks], [optWeeksLock], [optIncludePromo], [optORD_MULT2_LOCK], [optORD_MULT3_LOCK], [numOrdMin], [numOrdMax], [dteMinMaxCalc], [optEORetailLock], [numDesMargin], [cdeTruBlueInd], [cdeNonStockSkuInd], [cdeAssortmentInd], [numLastCount], [dteLastCount], [SyncStatus], [numORD_MULT4], [curMULT_4COST], [optTiered], [optORD_MULT4_LOCK], [cdeCoreItem], [cdeRetailAssortment], [cdeGreenItem], [cdeImageID], [cdeToBeDiscontinued], [dteTBD], [dteDiscontinued], [cdeSubsItemTypeCD], [cdeCouponSource], [cdeCouponType], [numUnitWt], [cdeDIBStatus], [cdeSubstitute], [optAdder], [curFreightCost], [numQtyCommitted], [optAGItem], [optCentrallyPriced], [optPriceByMargin], [optFollowDIBRetail], [cdeDiscontinueReason], [curMinSelling_PRICE], [cdeUnitOfMeasureItem], [cdeECommerceFlag], [curRPELevel1Retail], [curRPELevel2Retail], [curEcommercePrice], [cdeCentralShipInd], [cdeVariablePricingMethodCD], [cdeBrandName], [numUnitQty], [cdeUnitText], [cdeVisibilityFlag], [optPOSAlertNote], [cdeMadeInUSA], [cdeSubCategory], [numRoundToX], [optAceInstantSavings], [cdeProductType], [dteDIBRetailInventory], [numDIBCaseMultCode], [cdeDIBCountryOfOrigin], [cdeDIBUPSSwitch], [cdeDIBCentralStockSwitch], [numDIBExceptionQty], [numDIBMaxQty], [cdeDIBPriceCode], [cdeDIBNewItemInd], [cdeDIBPromoStatus], [cdeDIBSubstitute2]) VALUES (N'RRCERT', N'REPEAT REWARD CERTIFICATE', NULL, N'17', NULL, N'NY', 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, 0.0000, N'0', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, NULL, 0, NULL, CAST(N'2016-12-05T13:56:09.520' AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'X', N'X', N'X', N'X', CAST(N'2017-11-30T13:48:26.000' AS DateTime), 0, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, NULL, N'0', 0, 0, 0, 0, NULL, NULL, NULL, N'~/images/0001.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, 0, N'N', NULL, 9, 0, N'RRCERTIFICATE', CAST(N'2016-12-05T13:56:09.520' AS DateTime), 0, N'', NULL, N'', 0, 0, N'', N'', N'', N'')
INSERT [dbo].[tProducts] ([cdeProduct], [dscDescription], [dscNOTE], [cdeUOM], [dscSerialNum], [cdeTax], [numInventory], [curStnd_price], [curSUG_RETAIL], [numStnd_Qty], [cdeVendor1], [cdeV1SKU], [cdeVendor2], [cdeV2SKU], [cdeVendor3], [cdeV3SKU], [cdeVendor4], [cdeV4SKU], [numDUE_IN], [numRO_QTY], [numORDERQTY], [numORD_MULT1], [curMULT_1COST], [numORD_MULT2], [curMULT_2COST], [numORD_MULT3], [curMULT_3COST], [cdeMSKU], [dscOPEN_1], [dscOPEN_2], [dscOPEN_3], [dscOPEN_4], [optSale], [curSale_Price], [cdeSale], [dteLastSold], [cdeTransaction], [cdeDept], [cdeSubDept], [curAVG_Cost], [curREPL_Cost], [curSTND_Cost], [curLAST_RECD_Cost], [numDAY_QTY], [curDAY_SALE], [numMON_QTY], [curMONTH_SALE], [numYEAR_QTY], [curYEAR_SALE], [numTOTAL_QTY], [curTOTAL_SALE], [optRental], [dteRentTimeOut], [dteRentTimeIn], [numTotRentTime], [optInvAlert], [optSalesLessCost], [optDiscountAllowed], [optAddNotesToReceipt], [numMargin], [optKit], [cdeAltUOMDefault], [cdePrice], [optSetPriceByMargin], [optDiscontinued], [dteAction], [optRoundTo9], [cdePAR], [dteAdded], [cdeLastUSERID], [optNoMoreDiscounts], [cdeManu], [cdeClass], [cdeSubClass], [cdeLoc], [dscUpdateInfo], [dteLastRec], [numLastRecQty], [cdeClaimType], [cdePackStatus], [cdeCvrsID], [cdeQtyRank], [cdePreviousQtyRank], [cdeDolRank], [cdePreviousDolRank], [dteRankCalc], [optRankLock], [numRank], [numMinWeeks], [numMaxWeeks], [optWeeksLock], [optIncludePromo], [optORD_MULT2_LOCK], [optORD_MULT3_LOCK], [numOrdMin], [numOrdMax], [dteMinMaxCalc], [optEORetailLock], [numDesMargin], [cdeTruBlueInd], [cdeNonStockSkuInd], [cdeAssortmentInd], [numLastCount], [dteLastCount], [SyncStatus], [numORD_MULT4], [curMULT_4COST], [optTiered], [optORD_MULT4_LOCK], [cdeCoreItem], [cdeRetailAssortment], [cdeGreenItem], [cdeImageID], [cdeToBeDiscontinued], [dteTBD], [dteDiscontinued], [cdeSubsItemTypeCD], [cdeCouponSource], [cdeCouponType], [numUnitWt], [cdeDIBStatus], [cdeSubstitute], [optAdder], [curFreightCost], [numQtyCommitted], [optAGItem], [optCentrallyPriced], [optPriceByMargin], [optFollowDIBRetail], [cdeDiscontinueReason], [curMinSelling_PRICE], [cdeUnitOfMeasureItem], [cdeECommerceFlag], [curRPELevel1Retail], [curRPELevel2Retail], [curEcommercePrice], [cdeCentralShipInd], [cdeVariablePricingMethodCD], [cdeBrandName], [numUnitQty], [cdeUnitText], [cdeVisibilityFlag], [optPOSAlertNote], [cdeMadeInUSA], [cdeSubCategory], [numRoundToX], [optAceInstantSavings], [cdeProductType], [dteDIBRetailInventory], [numDIBCaseMultCode], [cdeDIBCountryOfOrigin], [cdeDIBUPSSwitch], [cdeDIBCentralStockSwitch], [numDIBExceptionQty], [numDIBMaxQty], [cdeDIBPriceCode], [cdeDIBNewItemInd], [cdeDIBPromoStatus], [cdeDIBSubstitute2]) VALUES (N'RRPROMOAUTO', N'REPEAT REWARD PROMOTION', NULL, N'17', NULL, N'NY', 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, 0.0000, N'0', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, NULL, 0, NULL, CAST(N'2016-12-05T13:56:09.520' AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'X', N'X', N'X', N'X', CAST(N'2017-11-30T13:48:26.000' AS DateTime), 0, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, NULL, N'0', 0, 0, 0, 0, NULL, NULL, NULL, N'~/images/0001.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, 0, N'N', NULL, 9, 0, N'RRPROMOTION', CAST(N'2016-12-05T13:56:09.520' AS DateTime), 0, N'', NULL, N'', 0, 0, N'', N'', N'', N'')
INSERT [dbo].[tProducts] ([cdeProduct], [dscDescription], [dscNOTE], [cdeUOM], [dscSerialNum], [cdeTax], [numInventory], [curStnd_price], [curSUG_RETAIL], [numStnd_Qty], [cdeVendor1], [cdeV1SKU], [cdeVendor2], [cdeV2SKU], [cdeVendor3], [cdeV3SKU], [cdeVendor4], [cdeV4SKU], [numDUE_IN], [numRO_QTY], [numORDERQTY], [numORD_MULT1], [curMULT_1COST], [numORD_MULT2], [curMULT_2COST], [numORD_MULT3], [curMULT_3COST], [cdeMSKU], [dscOPEN_1], [dscOPEN_2], [dscOPEN_3], [dscOPEN_4], [optSale], [curSale_Price], [cdeSale], [dteLastSold], [cdeTransaction], [cdeDept], [cdeSubDept], [curAVG_Cost], [curREPL_Cost], [curSTND_Cost], [curLAST_RECD_Cost], [numDAY_QTY], [curDAY_SALE], [numMON_QTY], [curMONTH_SALE], [numYEAR_QTY], [curYEAR_SALE], [numTOTAL_QTY], [curTOTAL_SALE], [optRental], [dteRentTimeOut], [dteRentTimeIn], [numTotRentTime], [optInvAlert], [optSalesLessCost], [optDiscountAllowed], [optAddNotesToReceipt], [numMargin], [optKit], [cdeAltUOMDefault], [cdePrice], [optSetPriceByMargin], [optDiscontinued], [dteAction], [optRoundTo9], [cdePAR], [dteAdded], [cdeLastUSERID], [optNoMoreDiscounts], [cdeManu], [cdeClass], [cdeSubClass], [cdeLoc], [dscUpdateInfo], [dteLastRec], [numLastRecQty], [cdeClaimType], [cdePackStatus], [cdeCvrsID], [cdeQtyRank], [cdePreviousQtyRank], [cdeDolRank], [cdePreviousDolRank], [dteRankCalc], [optRankLock], [numRank], [numMinWeeks], [numMaxWeeks], [optWeeksLock], [optIncludePromo], [optORD_MULT2_LOCK], [optORD_MULT3_LOCK], [numOrdMin], [numOrdMax], [dteMinMaxCalc], [optEORetailLock], [numDesMargin], [cdeTruBlueInd], [cdeNonStockSkuInd], [cdeAssortmentInd], [numLastCount], [dteLastCount], [SyncStatus], [numORD_MULT4], [curMULT_4COST], [optTiered], [optORD_MULT4_LOCK], [cdeCoreItem], [cdeRetailAssortment], [cdeGreenItem], [cdeImageID], [cdeToBeDiscontinued], [dteTBD], [dteDiscontinued], [cdeSubsItemTypeCD], [cdeCouponSource], [cdeCouponType], [numUnitWt], [cdeDIBStatus], [cdeSubstitute], [optAdder], [curFreightCost], [numQtyCommitted], [optAGItem], [optCentrallyPriced], [optPriceByMargin], [optFollowDIBRetail], [cdeDiscontinueReason], [curMinSelling_PRICE], [cdeUnitOfMeasureItem], [cdeECommerceFlag], [curRPELevel1Retail], [curRPELevel2Retail], [curEcommercePrice], [cdeCentralShipInd], [cdeVariablePricingMethodCD], [cdeBrandName], [numUnitQty], [cdeUnitText], [cdeVisibilityFlag], [optPOSAlertNote], [cdeMadeInUSA], [cdeSubCategory], [numRoundToX], [optAceInstantSavings], [cdeProductType], [dteDIBRetailInventory], [numDIBCaseMultCode], [cdeDIBCountryOfOrigin], [cdeDIBUPSSwitch], [cdeDIBCentralStockSwitch], [numDIBExceptionQty], [numDIBMaxQty], [cdeDIBPriceCode], [cdeDIBNewItemInd], [cdeDIBPromoStatus], [cdeDIBSubstitute2]) VALUES (N'RRPROMO', N'REPEAT REWARD PROMOTION', NULL, N'17', NULL, N'NY', 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, 0.0000, N'0', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, NULL, 0, NULL, CAST(N'2016-12-05T13:56:09.520' AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'X', N'X', N'X', N'X', CAST(N'2017-11-30T13:48:26.000' AS DateTime), 0, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, NULL, N'0', 0, 0, 0, 0, NULL, NULL, NULL, N'~/images/0001.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, NULL, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, 0, N'N', NULL, 9, 0, N'RRPROMOTION', CAST(N'2016-12-05T13:56:09.520' AS DateTime), 0, N'', NULL, N'', 0, 0, N'', N'', N'', N'')
INSERT [dbo].[tProducts] ([cdeProduct], [dscDescription], [dscNOTE], [cdeUOM], [dscSerialNum], [cdeTax], [numInventory], [curStnd_price], [curSUG_RETAIL], [numStnd_Qty], [cdeVendor1], [cdeV1SKU], [cdeVendor2], [cdeV2SKU], [cdeVendor3], [cdeV3SKU], [cdeVendor4], [cdeV4SKU], [numDUE_IN], [numRO_QTY], [numORDERQTY], [numORD_MULT1], [curMULT_1COST], [numORD_MULT2], [curMULT_2COST], [numORD_MULT3], [curMULT_3COST], [cdeMSKU], [dscOPEN_1], [dscOPEN_2], [dscOPEN_3], [dscOPEN_4], [optSale], [curSale_Price], [cdeSale], [dteLastSold], [cdeTransaction], [cdeDept], [cdeSubDept], [curAVG_Cost], [curREPL_Cost], [curSTND_Cost], [curLAST_RECD_Cost], [numDAY_QTY], [curDAY_SALE], [numMON_QTY], [curMONTH_SALE], [numYEAR_QTY], [curYEAR_SALE], [numTOTAL_QTY], [curTOTAL_SALE], [optRental], [dteRentTimeOut], [dteRentTimeIn], [numTotRentTime], [optInvAlert], [optSalesLessCost], [optDiscountAllowed], [optAddNotesToReceipt], [numMargin], [optKit], [cdeAltUOMDefault], [cdePrice], [optSetPriceByMargin], [optDiscontinued], [dteAction], [optRoundTo9], [cdePAR], [dteAdded], [cdeLastUSERID], [optNoMoreDiscounts], [cdeManu], [cdeClass], [cdeSubClass], [cdeLoc], [dscUpdateInfo], [dteLastRec], [numLastRecQty], [cdeClaimType], [cdePackStatus], [cdeCvrsID], [cdeQtyRank], [cdePreviousQtyRank], [cdeDolRank], [cdePreviousDolRank], [dteRankCalc], [optRankLock], [numRank], [numMinWeeks], [numMaxWeeks], [optWeeksLock], [optIncludePromo], [optORD_MULT2_LOCK], [optORD_MULT3_LOCK], [numOrdMin], [numOrdMax], [dteMinMaxCalc], [optEORetailLock], [numDesMargin], [cdeTruBlueInd], [cdeNonStockSkuInd], [cdeAssortmentInd], [numLastCount], [dteLastCount], [SyncStatus], [numORD_MULT4], [curMULT_4COST], [optTiered], [optORD_MULT4_LOCK], [cdeCoreItem], [cdeRetailAssortment], [cdeGreenItem], [cdeImageID], [cdeToBeDiscontinued], [dteTBD], [dteDiscontinued], [cdeSubsItemTypeCD], [cdeCouponSource], [cdeCouponType], [numUnitWt], [cdeDIBStatus], [cdeSubstitute], [optAdder], [curFreightCost], [numQtyCommitted], [optAGItem], [optCentrallyPriced], [optPriceByMargin], [optFollowDIBRetail], [cdeDiscontinueReason], [curMinSelling_PRICE], [cdeUnitOfMeasureItem], [cdeECommerceFlag], [curRPELevel1Retail], [curRPELevel2Retail], [curEcommercePrice], [cdeCentralShipInd], [cdeVariablePricingMethodCD], [cdeBrandName], [numUnitQty], [cdeUnitText], [cdeVisibilityFlag], [optPOSAlertNote], [cdeMadeInUSA], [cdeSubCategory], [numRoundToX], [optAceInstantSavings], [cdeProductType], [dteDIBRetailInventory], [numDIBCaseMultCode], [cdeDIBCountryOfOrigin], [cdeDIBUPSSwitch], [cdeDIBCentralStockSwitch], [numDIBExceptionQty], [numDIBMaxQty], [cdeDIBPriceCode], [cdeDIBNewItemInd], [cdeDIBPromoStatus], [cdeDIBSubstitute2]) VALUES (N'076501074130', N'33x75 Fleece Sleep Bag', N'Bon produit', N'17', N'1300054148', N'NY', 0, 19.99, 30.99, 1, N'TRU', N'123456', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1, 13.32, 6, 12.87, 0, 0, N'2000036337', NULL, NULL, NULL, NULL, 0, 0.0000, N'0', CAST(N'2016-12-06T17:10:08.000' AS DateTime), N'', N'S', NULL, 13.32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 1, 1, 1, 0, 33.37, 0, NULL, N'S', 0, 0, CAST(N'2022-02-14T10:56:38.393' AS DateTime), 0, NULL, CAST(N'2016-12-06T14:16:54.000' AS DateTime), N'FMNT', 1, N'07344', N'35', N'03', NULL, NULL, NULL, NULL, N'A', N'B', NULL, N'X', N'X', N'X', N'X', CAST(N'2017-11-30T13:48:26.000' AS DateTime), 0, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, N'', N'', N'', 0, NULL, N'0', 0, 0, 0, 0, N'N', N'2', N'N', N'~/images/0001.jpg', NULL, NULL, NULL, NULL, NULL, NULL, 1.96, NULL, N'', 0, NULL, 0, 0, 0, 0, 0, NULL, 0, NULL, NULL, 33.99, 35.99, 0, NULL, N'', NULL, 0, NULL, NULL, 0, N'N', NULL, 9, 0, N'', CAST(N'2016-12-06T14:16:54.860' AS DateTime), 0, N'', N'', N'', 0, 0, N'', N'', N'', N'')
INSERT [dbo].[tProducts] ([cdeProduct], [dscDescription], [dscNOTE], [cdeUOM], [dscSerialNum], [cdeTax], [numInventory], [curStnd_price], [curSUG_RETAIL], [numStnd_Qty], [cdeVendor1], [cdeV1SKU], [cdeVendor2], [cdeV2SKU], [cdeVendor3], [cdeV3SKU], [cdeVendor4], [cdeV4SKU], [numDUE_IN], [numRO_QTY], [numORDERQTY], [numORD_MULT1], [curMULT_1COST], [numORD_MULT2], [curMULT_2COST], [numORD_MULT3], [curMULT_3COST], [cdeMSKU], [dscOPEN_1], [dscOPEN_2], [dscOPEN_3], [dscOPEN_4], [optSale], [curSale_Price], [cdeSale], [dteLastSold], [cdeTransaction], [cdeDept], [cdeSubDept], [curAVG_Cost], [curREPL_Cost], [curSTND_Cost], [curLAST_RECD_Cost], [numDAY_QTY], [curDAY_SALE], [numMON_QTY], [curMONTH_SALE], [numYEAR_QTY], [curYEAR_SALE], [numTOTAL_QTY], [curTOTAL_SALE], [optRental], [dteRentTimeOut], [dteRentTimeIn], [numTotRentTime], [optInvAlert], [optSalesLessCost], [optDiscountAllowed], [optAddNotesToReceipt], [numMargin], [optKit], [cdeAltUOMDefault], [cdePrice], [optSetPriceByMargin], [optDiscontinued], [dteAction], [optRoundTo9], [cdePAR], [dteAdded], [cdeLastUSERID], [optNoMoreDiscounts], [cdeManu], [cdeClass], [cdeSubClass], [cdeLoc], [dscUpdateInfo], [dteLastRec], [numLastRecQty], [cdeClaimType], [cdePackStatus], [cdeCvrsID], [cdeQtyRank], [cdePreviousQtyRank], [cdeDolRank], [cdePreviousDolRank], [dteRankCalc], [optRankLock], [numRank], [numMinWeeks], [numMaxWeeks], [optWeeksLock], [optIncludePromo], [optORD_MULT2_LOCK], [optORD_MULT3_LOCK], [numOrdMin], [numOrdMax], [dteMinMaxCalc], [optEORetailLock], [numDesMargin], [cdeTruBlueInd], [cdeNonStockSkuInd], [cdeAssortmentInd], [numLastCount], [dteLastCount], [SyncStatus], [numORD_MULT4], [curMULT_4COST], [optTiered], [optORD_MULT4_LOCK], [cdeCoreItem], [cdeRetailAssortment], [cdeGreenItem], [cdeImageID], [cdeToBeDiscontinued], [dteTBD], [dteDiscontinued], [cdeSubsItemTypeCD], [cdeCouponSource], [cdeCouponType], [numUnitWt], [cdeDIBStatus], [cdeSubstitute], [optAdder], [curFreightCost], [numQtyCommitted], [optAGItem], [optCentrallyPriced], [optPriceByMargin], [optFollowDIBRetail], [cdeDiscontinueReason], [curMinSelling_PRICE], [cdeUnitOfMeasureItem], [cdeECommerceFlag], [curRPELevel1Retail], [curRPELevel2Retail], [curEcommercePrice], [cdeCentralShipInd], [cdeVariablePricingMethodCD], [cdeBrandName], [numUnitQty], [cdeUnitText], [cdeVisibilityFlag], [optPOSAlertNote], [cdeMadeInUSA], [cdeSubCategory], [numRoundToX], [optAceInstantSavings], [cdeProductType], [dteDIBRetailInventory], [numDIBCaseMultCode], [cdeDIBCountryOfOrigin], [cdeDIBUPSSwitch], [cdeDIBCentralStockSwitch], [numDIBExceptionQty], [numDIBMaxQty], [cdeDIBPriceCode], [cdeDIBNewItemInd], [cdeDIBPromoStatus], [cdeDIBSubstitute2]) VALUES (N'041333424019', N'DURA4PK AAA Alk Battery', N'BALANCE XYZ', N'17', N'ABC1234564', N'NY', 37, 6.99, 6.29, 1, N'TRU', N'197137', N'', N'', N'', N'', N'', N'', 0, 4, 18, 1, 3.56, 18, 3.44, 0, 0, N'MN2400B4Z', NULL, NULL, NULL, N'TRU120142', 0, 0.0000, N'0', CAST(N'2022-02-19T17:06:51.000' AS DateTime), N'A195135', N'E', NULL, 4.32, 0, 0, 4.32, 0, 0, 5, 34.95, 14, 96.395, 352, 2280.7695, 0, NULL, NULL, 0, 1, 1, 1, 0, 38.2, 0, N'17', N'S', 0, 0, CAST(N'2022-01-08T15:58:26.450' AS DateTime), 0, NULL, CAST(N'2016-12-07T10:51:41.000' AS DateTime), N'FMNT', 1, N'36483', N'80', N'54', NULL, NULL, CAST(N'2021-12-10T14:48:46.000' AS DateTime), 18, N'A', N'B', NULL, N'A', N'A', N'A', N'A', CAST(N'2017-11-30T13:48:26.000' AS DateTime), 0, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, N'', N'', N'', 0, NULL, N'0', 0, 0, 0, 0, N'Y', N'1', N'N', N'~/images/0001.jpg', NULL, NULL, NULL, NULL, NULL, NULL, 0.12, NULL, N'', 0, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, NULL, 6.29, 6.29, 0, NULL, N'', NULL, 0, NULL, N'V', 0, N'1', N'', 9, 0, N'', CAST(N'2016-12-07T10:51:41.800' AS DateTime), 0, N'', N'', N'', 0, 0, N'', N'', N'', N'')
INSERT [dbo].[tProducts] ([cdeProduct], [dscDescription], [dscNOTE], [cdeUOM], [dscSerialNum], [cdeTax], [numInventory], [curStnd_price], [curSUG_RETAIL], [numStnd_Qty], [cdeVendor1], [cdeV1SKU], [cdeVendor2], [cdeV2SKU], [cdeVendor3], [cdeV3SKU], [cdeVendor4], [cdeV4SKU], [numDUE_IN], [numRO_QTY], [numORDERQTY], [numORD_MULT1], [curMULT_1COST], [numORD_MULT2], [curMULT_2COST], [numORD_MULT3], [curMULT_3COST], [cdeMSKU], [dscOPEN_1], [dscOPEN_2], [dscOPEN_3], [dscOPEN_4], [optSale], [curSale_Price], [cdeSale], [dteLastSold], [cdeTransaction], [cdeDept], [cdeSubDept], [curAVG_Cost], [curREPL_Cost], [curSTND_Cost], [curLAST_RECD_Cost], [numDAY_QTY], [curDAY_SALE], [numMON_QTY], [curMONTH_SALE], [numYEAR_QTY], [curYEAR_SALE], [numTOTAL_QTY], [curTOTAL_SALE], [optRental], [dteRentTimeOut], [dteRentTimeIn], [numTotRentTime], [optInvAlert], [optSalesLessCost], [optDiscountAllowed], [optAddNotesToReceipt], [numMargin], [optKit], [cdeAltUOMDefault], [cdePrice], [optSetPriceByMargin], [optDiscontinued], [dteAction], [optRoundTo9], [cdePAR], [dteAdded], [cdeLastUSERID], [optNoMoreDiscounts], [cdeManu], [cdeClass], [cdeSubClass], [cdeLoc], [dscUpdateInfo], [dteLastRec], [numLastRecQty], [cdeClaimType], [cdePackStatus], [cdeCvrsID], [cdeQtyRank], [cdePreviousQtyRank], [cdeDolRank], [cdePreviousDolRank], [dteRankCalc], [optRankLock], [numRank], [numMinWeeks], [numMaxWeeks], [optWeeksLock], [optIncludePromo], [optORD_MULT2_LOCK], [optORD_MULT3_LOCK], [numOrdMin], [numOrdMax], [dteMinMaxCalc], [optEORetailLock], [numDesMargin], [cdeTruBlueInd], [cdeNonStockSkuInd], [cdeAssortmentInd], [numLastCount], [dteLastCount], [SyncStatus], [numORD_MULT4], [curMULT_4COST], [optTiered], [optORD_MULT4_LOCK], [cdeCoreItem], [cdeRetailAssortment], [cdeGreenItem], [cdeImageID], [cdeToBeDiscontinued], [dteTBD], [dteDiscontinued], [cdeSubsItemTypeCD], [cdeCouponSource], [cdeCouponType], [numUnitWt], [cdeDIBStatus], [cdeSubstitute], [optAdder], [curFreightCost], [numQtyCommitted], [optAGItem], [optCentrallyPriced], [optPriceByMargin], [optFollowDIBRetail], [cdeDiscontinueReason], [curMinSelling_PRICE], [cdeUnitOfMeasureItem], [cdeECommerceFlag], [curRPELevel1Retail], [curRPELevel2Retail], [curEcommercePrice], [cdeCentralShipInd], [cdeVariablePricingMethodCD], [cdeBrandName], [numUnitQty], [cdeUnitText], [cdeVisibilityFlag], [optPOSAlertNote], [cdeMadeInUSA], [cdeSubCategory], [numRoundToX], [optAceInstantSavings], [cdeProductType], [dteDIBRetailInventory], [numDIBCaseMultCode], [cdeDIBCountryOfOrigin], [cdeDIBUPSSwitch], [cdeDIBCentralStockSwitch], [numDIBExceptionQty], [numDIBMaxQty], [cdeDIBPriceCode], [cdeDIBNewItemInd], [cdeDIBPromoStatus], [cdeDIBSubstitute2]) VALUES (N'045242343225', N'16'' HD Tape Measure', NULL, N'17', NULL, N'NY', 0, 15.99, 11.99, 1, N'TRU', N'211222', N'', N'', N'', N'', N'', N'', 0, 0, 0, 1, 7.82, 24, 7.56, 0, 0, N'48-22-6616', NULL, NULL, NULL, N'TRU050146', 0, 0.0000, N'0', CAST(N'2019-12-09T11:12:55.000' AS DateTime), N'A122706', N'R', NULL, 8.11, 0, 0, 8.11, 0, 0, 0, 0, 0, 0, 36, 575.64, 0, NULL, NULL, 0, 1, 1, 1, 0, 49.28, 0, N'17', N'S', 0, 1, CAST(N'2021-03-15T17:38:30.943' AS DateTime), 0, NULL, CAST(N'2016-12-06T15:54:13.000' AS DateTime), N'FMNT', 1, N'36202', N'22', N'21', NULL, NULL, CAST(N'2019-05-07T15:36:01.000' AS DateTime), 3, N'', N'B', NULL, N'B', N'B', N'B', N'B', CAST(N'2017-11-30T13:48:26.000' AS DateTime), 0, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, N'', N'', N'', 0, NULL, N'0', 0, 0, 0, 0, N'N', N'', N'N', N'~/images/0001.jpg', N'D', NULL, NULL, N'3', NULL, NULL, 0.63, NULL, N'', 0, 0, 0, 0, 0, 0, 0, N'A', 0, NULL, NULL, 12.99, 13.99, 0, N'1', N'', NULL, 0, NULL, NULL, 0, N'N', N'', 9, 0, N'', CAST(N'2016-12-06T15:54:13.767' AS DateTime), 0, N'', N'', N'', 0, 0, N'', N'', N'', N'')
INSERT [dbo].[tProducts] ([cdeProduct], [dscDescription], [dscNOTE], [cdeUOM], [dscSerialNum], [cdeTax], [numInventory], [curStnd_price], [curSUG_RETAIL], [numStnd_Qty], [cdeVendor1], [cdeV1SKU], [cdeVendor2], [cdeV2SKU], [cdeVendor3], [cdeV3SKU], [cdeVendor4], [cdeV4SKU], [numDUE_IN], [numRO_QTY], [numORDERQTY], [numORD_MULT1], [curMULT_1COST], [numORD_MULT2], [curMULT_2COST], [numORD_MULT3], [curMULT_3COST], [cdeMSKU], [dscOPEN_1], [dscOPEN_2], [dscOPEN_3], [dscOPEN_4], [optSale], [curSale_Price], [cdeSale], [dteLastSold], [cdeTransaction], [cdeDept], [cdeSubDept], [curAVG_Cost], [curREPL_Cost], [curSTND_Cost], [curLAST_RECD_Cost], [numDAY_QTY], [curDAY_SALE], [numMON_QTY], [curMONTH_SALE], [numYEAR_QTY], [curYEAR_SALE], [numTOTAL_QTY], [curTOTAL_SALE], [optRental], [dteRentTimeOut], [dteRentTimeIn], [numTotRentTime], [optInvAlert], [optSalesLessCost], [optDiscountAllowed], [optAddNotesToReceipt], [numMargin], [optKit], [cdeAltUOMDefault], [cdePrice], [optSetPriceByMargin], [optDiscontinued], [dteAction], [optRoundTo9], [cdePAR], [dteAdded], [cdeLastUSERID], [optNoMoreDiscounts], [cdeManu], [cdeClass], [cdeSubClass], [cdeLoc], [dscUpdateInfo], [dteLastRec], [numLastRecQty], [cdeClaimType], [cdePackStatus], [cdeCvrsID], [cdeQtyRank], [cdePreviousQtyRank], [cdeDolRank], [cdePreviousDolRank], [dteRankCalc], [optRankLock], [numRank], [numMinWeeks], [numMaxWeeks], [optWeeksLock], [optIncludePromo], [optORD_MULT2_LOCK], [optORD_MULT3_LOCK], [numOrdMin], [numOrdMax], [dteMinMaxCalc], [optEORetailLock], [numDesMargin], [cdeTruBlueInd], [cdeNonStockSkuInd], [cdeAssortmentInd], [numLastCount], [dteLastCount], [SyncStatus], [numORD_MULT4], [curMULT_4COST], [optTiered], [optORD_MULT4_LOCK], [cdeCoreItem], [cdeRetailAssortment], [cdeGreenItem], [cdeImageID], [cdeToBeDiscontinued], [dteTBD], [dteDiscontinued], [cdeSubsItemTypeCD], [cdeCouponSource], [cdeCouponType], [numUnitWt], [cdeDIBStatus], [cdeSubstitute], [optAdder], [curFreightCost], [numQtyCommitted], [optAGItem], [optCentrallyPriced], [optPriceByMargin], [optFollowDIBRetail], [cdeDiscontinueReason], [curMinSelling_PRICE], [cdeUnitOfMeasureItem], [cdeECommerceFlag], [curRPELevel1Retail], [curRPELevel2Retail], [curEcommercePrice], [cdeCentralShipInd], [cdeVariablePricingMethodCD], [cdeBrandName], [numUnitQty], [cdeUnitText], [cdeVisibilityFlag], [optPOSAlertNote], [cdeMadeInUSA], [cdeSubCategory], [numRoundToX], [optAceInstantSavings], [cdeProductType], [dteDIBRetailInventory], [numDIBCaseMultCode], [cdeDIBCountryOfOrigin], [cdeDIBUPSSwitch], [cdeDIBCentralStockSwitch], [numDIBExceptionQty], [numDIBMaxQty], [cdeDIBPriceCode], [cdeDIBNewItemInd], [cdeDIBPromoStatus], [cdeDIBSubstitute2]) VALUES (N'092503270455', N'3/8x9/16x100 Tubing', NULL, N'34', NULL, N'NY', 0.67, 72.99, 56.99, 1, N'TRU', N'246207', N'', N'', N'', N'', N'', N'', 0, 0, 0, 1, 24.35, 0, 0, 0, 0, N'T10004009', NULL, NULL, NULL, N'0711160243', 0, 0.0000, N'0', CAST(N'2022-01-14T14:09:54.000' AS DateTime), N'A191828', N'F', NULL, 26.04, 0, 0, 26.04, 0, 0, 0, 0, 0.06, 8.67, 2.923, 309.614, 0, NULL, NULL, 0, 1, 1, 1, 0, 64.32, 0, N'19', N'S', 0, 0, CAST(N'2022-02-14T12:22:23.783' AS DateTime), 0, NULL, CAST(N'2016-12-06T15:55:14.000' AS DateTime), N'FMNT', 1, N'08308', N'11', N'37', NULL, NULL, CAST(N'2021-08-16T13:10:33.000' AS DateTime), 1, N'A', N'', NULL, N'D', N'D', N'C', N'C', CAST(N'2017-11-30T13:48:26.000' AS DateTime), 0, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, N'', N'', N'', 0, NULL, N'0', 0, 0, 0, 0, N'Y', N'1', N'N', N'~/images/0001.jpg', NULL, NULL, NULL, NULL, NULL, NULL, 7.9, NULL, N'', 0, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, NULL, 60.99, 65.99, 0, NULL, N'', NULL, 0, NULL, NULL, 0, N'1', N'', 9, 0, N'', CAST(N'2016-12-06T15:55:14.813' AS DateTime), 0, N'', N'', N'', 0, 0, N'', N'', N'', N'')
INSERT [dbo].[tProducts] ([cdeProduct], [dscDescription], [dscNOTE], [cdeUOM], [dscSerialNum], [cdeTax], [numInventory], [curStnd_price], [curSUG_RETAIL], [numStnd_Qty], [cdeVendor1], [cdeV1SKU], [cdeVendor2], [cdeV2SKU], [cdeVendor3], [cdeV3SKU], [cdeVendor4], [cdeV4SKU], [numDUE_IN], [numRO_QTY], [numORDERQTY], [numORD_MULT1], [curMULT_1COST], [numORD_MULT2], [curMULT_2COST], [numORD_MULT3], [curMULT_3COST], [cdeMSKU], [dscOPEN_1], [dscOPEN_2], [dscOPEN_3], [dscOPEN_4], [optSale], [curSale_Price], [cdeSale], [dteLastSold], [cdeTransaction], [cdeDept], [cdeSubDept], [curAVG_Cost], [curREPL_Cost], [curSTND_Cost], [curLAST_RECD_Cost], [numDAY_QTY], [curDAY_SALE], [numMON_QTY], [curMONTH_SALE], [numYEAR_QTY], [curYEAR_SALE], [numTOTAL_QTY], [curTOTAL_SALE], [optRental], [dteRentTimeOut], [dteRentTimeIn], [numTotRentTime], [optInvAlert], [optSalesLessCost], [optDiscountAllowed], [optAddNotesToReceipt], [numMargin], [optKit], [cdeAltUOMDefault], [cdePrice], [optSetPriceByMargin], [optDiscontinued], [dteAction], [optRoundTo9], [cdePAR], [dteAdded], [cdeLastUSERID], [optNoMoreDiscounts], [cdeManu], [cdeClass], [cdeSubClass], [cdeLoc], [dscUpdateInfo], [dteLastRec], [numLastRecQty], [cdeClaimType], [cdePackStatus], [cdeCvrsID], [cdeQtyRank], [cdePreviousQtyRank], [cdeDolRank], [cdePreviousDolRank], [dteRankCalc], [optRankLock], [numRank], [numMinWeeks], [numMaxWeeks], [optWeeksLock], [optIncludePromo], [optORD_MULT2_LOCK], [optORD_MULT3_LOCK], [numOrdMin], [numOrdMax], [dteMinMaxCalc], [optEORetailLock], [numDesMargin], [cdeTruBlueInd], [cdeNonStockSkuInd], [cdeAssortmentInd], [numLastCount], [dteLastCount], [SyncStatus], [numORD_MULT4], [curMULT_4COST], [optTiered], [optORD_MULT4_LOCK], [cdeCoreItem], [cdeRetailAssortment], [cdeGreenItem], [cdeImageID], [cdeToBeDiscontinued], [dteTBD], [dteDiscontinued], [cdeSubsItemTypeCD], [cdeCouponSource], [cdeCouponType], [numUnitWt], [cdeDIBStatus], [cdeSubstitute], [optAdder], [curFreightCost], [numQtyCommitted], [optAGItem], [optCentrallyPriced], [optPriceByMargin], [optFollowDIBRetail], [cdeDiscontinueReason], [curMinSelling_PRICE], [cdeUnitOfMeasureItem], [cdeECommerceFlag], [curRPELevel1Retail], [curRPELevel2Retail], [curEcommercePrice], [cdeCentralShipInd], [cdeVariablePricingMethodCD], [cdeBrandName], [numUnitQty], [cdeUnitText], [cdeVisibilityFlag], [optPOSAlertNote], [cdeMadeInUSA], [cdeSubCategory], [numRoundToX], [optAceInstantSavings], [cdeProductType], [dteDIBRetailInventory], [numDIBCaseMultCode], [cdeDIBCountryOfOrigin], [cdeDIBUPSSwitch], [cdeDIBCentralStockSwitch], [numDIBExceptionQty], [numDIBMaxQty], [cdeDIBPriceCode], [cdeDIBNewItemInd], [cdeDIBPromoStatus], [cdeDIBSubstitute2]) VALUES (N'041333216010', N'DURA 2PK 9V Alk Battery', NULL, N'17', NULL, N'NY', 6, 11.99, 11.99, 1, N'TRU', N'196615', N'', N'', N'', N'', N'', N'', 0, 4, 6, 1, 7.3, 12, 7.06, 0, 0, N'MN1604B2Z', NULL, NULL, NULL, N'TRU011254', 0, 0.0000, N'0', CAST(N'2022-02-04T12:58:35.000' AS DateTime), N'A193770', N'E', NULL, 8.7, 0, 0, 8.7, 0, 0, 2, 23.98, 10, 119.9, 217, 2379.433, 0, NULL, NULL, 0, 1, 1, 1, 0, 27.44, 0, N'17', N'S', 0, 0, CAST(N'2022-02-14T12:22:16.270' AS DateTime), 0, NULL, CAST(N'2016-12-07T10:52:38.000' AS DateTime), N'FMNT', 1, N'36483', N'80', N'51', NULL, NULL, CAST(N'2022-01-24T15:28:37.000' AS DateTime), 6, N'A', N'B', NULL, N'A', N'A', N'A', N'A', CAST(N'2017-11-30T13:48:26.000' AS DateTime), 0, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, N'', N'', N'', 0, NULL, N'0', 0, 0, 0, 0, N'Y', N'1', N'N', N'~/images/0001.jpg', NULL, NULL, NULL, NULL, NULL, NULL, 0.24, NULL, N'', 0, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, NULL, 11.99, 11.99, 0, NULL, N'', NULL, 0, NULL, N'V', 0, N'1', N'', 9, 0, N'', CAST(N'2016-12-07T10:52:38.253' AS DateTime), 0, N'', N'', N'', 0, 0, N'', N'', N'', N'')
INSERT [dbo].[tProducts] ([cdeProduct], [dscDescription], [dscNOTE], [cdeUOM], [dscSerialNum], [cdeTax], [numInventory], [curStnd_price], [curSUG_RETAIL], [numStnd_Qty], [cdeVendor1], [cdeV1SKU], [cdeVendor2], [cdeV2SKU], [cdeVendor3], [cdeV3SKU], [cdeVendor4], [cdeV4SKU], [numDUE_IN], [numRO_QTY], [numORDERQTY], [numORD_MULT1], [curMULT_1COST], [numORD_MULT2], [curMULT_2COST], [numORD_MULT3], [curMULT_3COST], [cdeMSKU], [dscOPEN_1], [dscOPEN_2], [dscOPEN_3], [dscOPEN_4], [optSale], [curSale_Price], [cdeSale], [dteLastSold], [cdeTransaction], [cdeDept], [cdeSubDept], [curAVG_Cost], [curREPL_Cost], [curSTND_Cost], [curLAST_RECD_Cost], [numDAY_QTY], [curDAY_SALE], [numMON_QTY], [curMONTH_SALE], [numYEAR_QTY], [curYEAR_SALE], [numTOTAL_QTY], [curTOTAL_SALE], [optRental], [dteRentTimeOut], [dteRentTimeIn], [numTotRentTime], [optInvAlert], [optSalesLessCost], [optDiscountAllowed], [optAddNotesToReceipt], [numMargin], [optKit], [cdeAltUOMDefault], [cdePrice], [optSetPriceByMargin], [optDiscontinued], [dteAction], [optRoundTo9], [cdePAR], [dteAdded], [cdeLastUSERID], [optNoMoreDiscounts], [cdeManu], [cdeClass], [cdeSubClass], [cdeLoc], [dscUpdateInfo], [dteLastRec], [numLastRecQty], [cdeClaimType], [cdePackStatus], [cdeCvrsID], [cdeQtyRank], [cdePreviousQtyRank], [cdeDolRank], [cdePreviousDolRank], [dteRankCalc], [optRankLock], [numRank], [numMinWeeks], [numMaxWeeks], [optWeeksLock], [optIncludePromo], [optORD_MULT2_LOCK], [optORD_MULT3_LOCK], [numOrdMin], [numOrdMax], [dteMinMaxCalc], [optEORetailLock], [numDesMargin], [cdeTruBlueInd], [cdeNonStockSkuInd], [cdeAssortmentInd], [numLastCount], [dteLastCount], [SyncStatus], [numORD_MULT4], [curMULT_4COST], [optTiered], [optORD_MULT4_LOCK], [cdeCoreItem], [cdeRetailAssortment], [cdeGreenItem], [cdeImageID], [cdeToBeDiscontinued], [dteTBD], [dteDiscontinued], [cdeSubsItemTypeCD], [cdeCouponSource], [cdeCouponType], [numUnitWt], [cdeDIBStatus], [cdeSubstitute], [optAdder], [curFreightCost], [numQtyCommitted], [optAGItem], [optCentrallyPriced], [optPriceByMargin], [optFollowDIBRetail], [cdeDiscontinueReason], [curMinSelling_PRICE], [cdeUnitOfMeasureItem], [cdeECommerceFlag], [curRPELevel1Retail], [curRPELevel2Retail], [curEcommercePrice], [cdeCentralShipInd], [cdeVariablePricingMethodCD], [cdeBrandName], [numUnitQty], [cdeUnitText], [cdeVisibilityFlag], [optPOSAlertNote], [cdeMadeInUSA], [cdeSubCategory], [numRoundToX], [optAceInstantSavings], [cdeProductType], [dteDIBRetailInventory], [numDIBCaseMultCode], [cdeDIBCountryOfOrigin], [cdeDIBUPSSwitch], [cdeDIBCentralStockSwitch], [numDIBExceptionQty], [numDIBMaxQty], [cdeDIBPriceCode], [cdeDIBNewItemInd], [cdeDIBPromoStatus], [cdeDIBSubstitute2]) VALUES (N'071649320705', N'1-1/2 LS Padlock', NULL, N'17', NULL, N'NY', 6, 12.99, 12.99, 1, N'TRU', N'176891', N'', N'', N'', N'', N'', N'', 0, 2, 4, 1, 6.59, 4, 6.37, 0, 0, N'3DLF', NULL, NULL, NULL, N'TRU020928', 0, 0.0000, N'0', CAST(N'2022-02-08T15:45:27.000' AS DateTime), N'A194070', N'H', NULL, 7.04, 0, 0, 7.04, 0, 0, 2, 25.98, 4, 51.96, 85, 1102.851, 0, NULL, NULL, 0, 1, 1, 1, 0, 45.8, 0, N'17', N'S', 0, 0, CAST(N'2022-02-14T10:56:54.517' AS DateTime), 0, NULL, CAST(N'2016-12-07T10:53:49.000' AS DateTime), N'FMNT', 1, N'36863', N'28', N'15', NULL, NULL, CAST(N'2022-02-14T10:37:18.000' AS DateTime), 4, N'A', N'B', NULL, N'A', N'A', N'A', N'A', CAST(N'2017-11-30T13:48:26.000' AS DateTime), 0, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, N'', N'', N'', 0, NULL, N'0', 0, 0, 0, 0, N'Y', N'1', N'N', N'~/images/0001.jpg', NULL, NULL, NULL, NULL, NULL, NULL, 0.5, NULL, N'', 0, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, NULL, 13.99, 14.99, 0, NULL, N'', NULL, 0, NULL, N'V', 0, N'N', N'', 9, 0, N'', CAST(N'2016-12-07T10:53:49.713' AS DateTime), 0, N'', N'', N'', 0, 0, N'', N'', N'', N'')
INSERT [dbo].[tProducts] ([cdeProduct], [dscDescription], [dscNOTE], [cdeUOM], [dscSerialNum], [cdeTax], [numInventory], [curStnd_price], [curSUG_RETAIL], [numStnd_Qty], [cdeVendor1], [cdeV1SKU], [cdeVendor2], [cdeV2SKU], [cdeVendor3], [cdeV3SKU], [cdeVendor4], [cdeV4SKU], [numDUE_IN], [numRO_QTY], [numORDERQTY], [numORD_MULT1], [curMULT_1COST], [numORD_MULT2], [curMULT_2COST], [numORD_MULT3], [curMULT_3COST], [cdeMSKU], [dscOPEN_1], [dscOPEN_2], [dscOPEN_3], [dscOPEN_4], [optSale], [curSale_Price], [cdeSale], [dteLastSold], [cdeTransaction], [cdeDept], [cdeSubDept], [curAVG_Cost], [curREPL_Cost], [curSTND_Cost], [curLAST_RECD_Cost], [numDAY_QTY], [curDAY_SALE], [numMON_QTY], [curMONTH_SALE], [numYEAR_QTY], [curYEAR_SALE], [numTOTAL_QTY], [curTOTAL_SALE], [optRental], [dteRentTimeOut], [dteRentTimeIn], [numTotRentTime], [optInvAlert], [optSalesLessCost], [optDiscountAllowed], [optAddNotesToReceipt], [numMargin], [optKit], [cdeAltUOMDefault], [cdePrice], [optSetPriceByMargin], [optDiscontinued], [dteAction], [optRoundTo9], [cdePAR], [dteAdded], [cdeLastUSERID], [optNoMoreDiscounts], [cdeManu], [cdeClass], [cdeSubClass], [cdeLoc], [dscUpdateInfo], [dteLastRec], [numLastRecQty], [cdeClaimType], [cdePackStatus], [cdeCvrsID], [cdeQtyRank], [cdePreviousQtyRank], [cdeDolRank], [cdePreviousDolRank], [dteRankCalc], [optRankLock], [numRank], [numMinWeeks], [numMaxWeeks], [optWeeksLock], [optIncludePromo], [optORD_MULT2_LOCK], [optORD_MULT3_LOCK], [numOrdMin], [numOrdMax], [dteMinMaxCalc], [optEORetailLock], [numDesMargin], [cdeTruBlueInd], [cdeNonStockSkuInd], [cdeAssortmentInd], [numLastCount], [dteLastCount], [SyncStatus], [numORD_MULT4], [curMULT_4COST], [optTiered], [optORD_MULT4_LOCK], [cdeCoreItem], [cdeRetailAssortment], [cdeGreenItem], [cdeImageID], [cdeToBeDiscontinued], [dteTBD], [dteDiscontinued], [cdeSubsItemTypeCD], [cdeCouponSource], [cdeCouponType], [numUnitWt], [cdeDIBStatus], [cdeSubstitute], [optAdder], [curFreightCost], [numQtyCommitted], [optAGItem], [optCentrallyPriced], [optPriceByMargin], [optFollowDIBRetail], [cdeDiscontinueReason], [curMinSelling_PRICE], [cdeUnitOfMeasureItem], [cdeECommerceFlag], [curRPELevel1Retail], [curRPELevel2Retail], [curEcommercePrice], [cdeCentralShipInd], [cdeVariablePricingMethodCD], [cdeBrandName], [numUnitQty], [cdeUnitText], [cdeVisibilityFlag], [optPOSAlertNote], [cdeMadeInUSA], [cdeSubCategory], [numRoundToX], [optAceInstantSavings], [cdeProductType], [dteDIBRetailInventory], [numDIBCaseMultCode], [cdeDIBCountryOfOrigin], [cdeDIBUPSSwitch], [cdeDIBCentralStockSwitch], [numDIBExceptionQty], [numDIBMaxQty], [cdeDIBPriceCode], [cdeDIBNewItemInd], [cdeDIBPromoStatus], [cdeDIBSubstitute2]) VALUES (N'035355464078', N'LED Glow Stick', NULL, N'17', NULL, N'NY', -4, 3.99, 3.49, 1, N'TRU', N'127899', N'', N'', N'', N'', N'', N'', 0, 0, 0, 0, 1.75, 20, 1.75, 0, 0, N'41-6407', NULL, NULL, NULL, N'OS ELEC', 0, 0.0000, N'0', CAST(N'2018-11-12T16:01:55.000' AS DateTime), N'A67331', N'E', NULL, 1.75, 0, 0, 1.75, 0, 0, 0, 0, 0, 0, 11, 43.89, 0, NULL, NULL, 0, 1, 1, 1, 0, 56.14, 0, N'17', N'S', 0, 0, CAST(N'2022-01-17T11:10:34.123' AS DateTime), 0, NULL, CAST(N'2016-12-07T11:43:34.000' AS DateTime), N'FMNT', 1, N'36368', N'79', N'03', NULL, NULL, CAST(N'2016-12-13T19:02:41.000' AS DateTime), 20, N'A', N'F', NULL, N'B', N'B', N'C', N'C', CAST(N'2017-11-30T13:48:26.000' AS DateTime), 0, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, N'', N'', N'', 0, NULL, N'0', 0, 0, 0, 0, N'N', N'', N'N', N'~/images/0001.jpg', N'D', NULL, NULL, N'1', NULL, NULL, 0.1, NULL, N'', 0, 0, 0, 0, 0, 0, 0, N'A', 0, NULL, NULL, 3.99, 4.29, 0, NULL, N'', NULL, 0, NULL, NULL, 0, N'N', N'', 9, 0, N'', CAST(N'2016-12-07T11:43:34.967' AS DateTime), 0, N'', N'', N'', 0, 0, N'', N'', N'', N'')
INSERT [dbo].[tProducts] ([cdeProduct], [dscDescription], [dscNOTE], [cdeUOM], [dscSerialNum], [cdeTax], [numInventory], [curStnd_price], [curSUG_RETAIL], [numStnd_Qty], [cdeVendor1], [cdeV1SKU], [cdeVendor2], [cdeV2SKU], [cdeVendor3], [cdeV3SKU], [cdeVendor4], [cdeV4SKU], [numDUE_IN], [numRO_QTY], [numORDERQTY], [numORD_MULT1], [curMULT_1COST], [numORD_MULT2], [curMULT_2COST], [numORD_MULT3], [curMULT_3COST], [cdeMSKU], [dscOPEN_1], [dscOPEN_2], [dscOPEN_3], [dscOPEN_4], [optSale], [curSale_Price], [cdeSale], [dteLastSold], [cdeTransaction], [cdeDept], [cdeSubDept], [curAVG_Cost], [curREPL_Cost], [curSTND_Cost], [curLAST_RECD_Cost], [numDAY_QTY], [curDAY_SALE], [numMON_QTY], [curMONTH_SALE], [numYEAR_QTY], [curYEAR_SALE], [numTOTAL_QTY], [curTOTAL_SALE], [optRental], [dteRentTimeOut], [dteRentTimeIn], [numTotRentTime], [optInvAlert], [optSalesLessCost], [optDiscountAllowed], [optAddNotesToReceipt], [numMargin], [optKit], [cdeAltUOMDefault], [cdePrice], [optSetPriceByMargin], [optDiscontinued], [dteAction], [optRoundTo9], [cdePAR], [dteAdded], [cdeLastUSERID], [optNoMoreDiscounts], [cdeManu], [cdeClass], [cdeSubClass], [cdeLoc], [dscUpdateInfo], [dteLastRec], [numLastRecQty], [cdeClaimType], [cdePackStatus], [cdeCvrsID], [cdeQtyRank], [cdePreviousQtyRank], [cdeDolRank], [cdePreviousDolRank], [dteRankCalc], [optRankLock], [numRank], [numMinWeeks], [numMaxWeeks], [optWeeksLock], [optIncludePromo], [optORD_MULT2_LOCK], [optORD_MULT3_LOCK], [numOrdMin], [numOrdMax], [dteMinMaxCalc], [optEORetailLock], [numDesMargin], [cdeTruBlueInd], [cdeNonStockSkuInd], [cdeAssortmentInd], [numLastCount], [dteLastCount], [SyncStatus], [numORD_MULT4], [curMULT_4COST], [optTiered], [optORD_MULT4_LOCK], [cdeCoreItem], [cdeRetailAssortment], [cdeGreenItem], [cdeImageID], [cdeToBeDiscontinued], [dteTBD], [dteDiscontinued], [cdeSubsItemTypeCD], [cdeCouponSource], [cdeCouponType], [numUnitWt], [cdeDIBStatus], [cdeSubstitute], [optAdder], [curFreightCost], [numQtyCommitted], [optAGItem], [optCentrallyPriced], [optPriceByMargin], [optFollowDIBRetail], [cdeDiscontinueReason], [curMinSelling_PRICE], [cdeUnitOfMeasureItem], [cdeECommerceFlag], [curRPELevel1Retail], [curRPELevel2Retail], [curEcommercePrice], [cdeCentralShipInd], [cdeVariablePricingMethodCD], [cdeBrandName], [numUnitQty], [cdeUnitText], [cdeVisibilityFlag], [optPOSAlertNote], [cdeMadeInUSA], [cdeSubCategory], [numRoundToX], [optAceInstantSavings], [cdeProductType], [dteDIBRetailInventory], [numDIBCaseMultCode], [cdeDIBCountryOfOrigin], [cdeDIBUPSSwitch], [cdeDIBCentralStockSwitch], [numDIBExceptionQty], [numDIBMaxQty], [cdeDIBPriceCode], [cdeDIBNewItemInd], [cdeDIBPromoStatus], [cdeDIBSubstitute2]) VALUES (N'032076068400', N'Non-Contact Volt Tester', NULL, N'17', NULL, N'NY', 2, 14.99, 14.99, 1, N'TRU', N'766214', N'', N'', N'', N'', N'', N'', 0, 0, 0, 1, 6.81, 5, 6.58, 0, 0, N'GVD-3504', NULL, NULL, NULL, N'TRU020928', 0, 0.0000, N'0', CAST(N'2021-10-27T15:05:22.000' AS DateTime), N'A183985', N'E', NULL, 8.17, 0, 0, 8.17, 0, 0, 0, 0, 0, 0, 6, 83.94, 0, NULL, NULL, 0, 1, 1, 1, 0, 45.5, 0, N'17', N'S', 0, 0, CAST(N'2022-02-14T10:47:08.623' AS DateTime), 0, NULL, CAST(N'2016-12-07T13:25:52.000' AS DateTime), N'FMNT', 1, N'17467', N'75', N'11', NULL, NULL, CAST(N'2022-02-14T10:37:18.000' AS DateTime), 5, N'A', N'B', NULL, N'B', N'B', N'C', N'C', CAST(N'2017-11-30T13:48:26.000' AS DateTime), 0, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, N'', N'', N'', 0, NULL, N'0', 0, 0, 0, 0, N'Y', N'1', N'N', N'~/images/0001.jpg', NULL, NULL, NULL, NULL, NULL, NULL, 0.09, NULL, N'', 0, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, NULL, 16.99, 17.99, 0, NULL, N'', NULL, 0, NULL, NULL, 0, N'N', N'', 9, 0, N'', CAST(N'2016-12-07T13:25:53.237' AS DateTime), 0, N'', N'', N'', 0, 0, N'', N'', N'', N'')
INSERT [dbo].[tProducts] ([cdeProduct], [dscDescription], [dscNOTE], [cdeUOM], [dscSerialNum], [cdeTax], [numInventory], [curStnd_price], [curSUG_RETAIL], [numStnd_Qty], [cdeVendor1], [cdeV1SKU], [cdeVendor2], [cdeV2SKU], [cdeVendor3], [cdeV3SKU], [cdeVendor4], [cdeV4SKU], [numDUE_IN], [numRO_QTY], [numORDERQTY], [numORD_MULT1], [curMULT_1COST], [numORD_MULT2], [curMULT_2COST], [numORD_MULT3], [curMULT_3COST], [cdeMSKU], [dscOPEN_1], [dscOPEN_2], [dscOPEN_3], [dscOPEN_4], [optSale], [curSale_Price], [cdeSale], [dteLastSold], [cdeTransaction], [cdeDept], [cdeSubDept], [curAVG_Cost], [curREPL_Cost], [curSTND_Cost], [curLAST_RECD_Cost], [numDAY_QTY], [curDAY_SALE], [numMON_QTY], [curMONTH_SALE], [numYEAR_QTY], [curYEAR_SALE], [numTOTAL_QTY], [curTOTAL_SALE], [optRental], [dteRentTimeOut], [dteRentTimeIn], [numTotRentTime], [optInvAlert], [optSalesLessCost], [optDiscountAllowed], [optAddNotesToReceipt], [numMargin], [optKit], [cdeAltUOMDefault], [cdePrice], [optSetPriceByMargin], [optDiscontinued], [dteAction], [optRoundTo9], [cdePAR], [dteAdded], [cdeLastUSERID], [optNoMoreDiscounts], [cdeManu], [cdeClass], [cdeSubClass], [cdeLoc], [dscUpdateInfo], [dteLastRec], [numLastRecQty], [cdeClaimType], [cdePackStatus], [cdeCvrsID], [cdeQtyRank], [cdePreviousQtyRank], [cdeDolRank], [cdePreviousDolRank], [dteRankCalc], [optRankLock], [numRank], [numMinWeeks], [numMaxWeeks], [optWeeksLock], [optIncludePromo], [optORD_MULT2_LOCK], [optORD_MULT3_LOCK], [numOrdMin], [numOrdMax], [dteMinMaxCalc], [optEORetailLock], [numDesMargin], [cdeTruBlueInd], [cdeNonStockSkuInd], [cdeAssortmentInd], [numLastCount], [dteLastCount], [SyncStatus], [numORD_MULT4], [curMULT_4COST], [optTiered], [optORD_MULT4_LOCK], [cdeCoreItem], [cdeRetailAssortment], [cdeGreenItem], [cdeImageID], [cdeToBeDiscontinued], [dteTBD], [dteDiscontinued], [cdeSubsItemTypeCD], [cdeCouponSource], [cdeCouponType], [numUnitWt], [cdeDIBStatus], [cdeSubstitute], [optAdder], [curFreightCost], [numQtyCommitted], [optAGItem], [optCentrallyPriced], [optPriceByMargin], [optFollowDIBRetail], [cdeDiscontinueReason], [curMinSelling_PRICE], [cdeUnitOfMeasureItem], [cdeECommerceFlag], [curRPELevel1Retail], [curRPELevel2Retail], [curEcommercePrice], [cdeCentralShipInd], [cdeVariablePricingMethodCD], [cdeBrandName], [numUnitQty], [cdeUnitText], [cdeVisibilityFlag], [optPOSAlertNote], [cdeMadeInUSA], [cdeSubCategory], [numRoundToX], [optAceInstantSavings], [cdeProductType], [dteDIBRetailInventory], [numDIBCaseMultCode], [cdeDIBCountryOfOrigin], [cdeDIBUPSSwitch], [cdeDIBCentralStockSwitch], [numDIBExceptionQty], [numDIBMaxQty], [cdeDIBPriceCode], [cdeDIBNewItemInd], [cdeDIBPromoStatus], [cdeDIBSubstitute2]) VALUES (N'032076068776', N'8" Pro Wire Stripper', NULL, N'17', NULL, N'NY', 2, 18.99, 14.99, 1, N'TRU', N'752386', N'', N'', N'', N'', N'', N'', 0, 1, 1, 1, 7.68, 5, 7.42, 0, 0, N'GS-370', NULL, NULL, NULL, N'TRU12130', 0, 0.0000, N'0', CAST(N'2021-11-19T14:30:43.000' AS DateTime), N'A186641', N'E', NULL, 8.3, 0, 0, 8.3, 0, 0, 0, 0, 0, 0, 33, 590.67, 0, NULL, NULL, 0, 1, 1, 1, 0, 56.29, 0, N'17', N'S', 0, 0, CAST(N'2022-02-14T10:57:21.813' AS DateTime), 0, NULL, CAST(N'2016-12-07T13:35:31.000' AS DateTime), N'FMNT', 1, N'17467', N'75', N'02', NULL, NULL, CAST(N'2021-12-24T13:46:26.000' AS DateTime), 1, N'A', N'B', NULL, N'C', N'C', N'D', N'D', CAST(N'2017-11-30T13:48:26.000' AS DateTime), 0, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, N'', N'', N'', 0, NULL, N'0', 0, 0, 0, 0, N'Y', N'1', N'N', N'~/images/0001.jpg', NULL, NULL, NULL, NULL, NULL, NULL, 0.45, NULL, N'', 0, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, NULL, 16.99, 17.99, 0, NULL, N'', NULL, 0, NULL, NULL, 0, N'1', N'', 9, 0, N'', CAST(N'2016-12-07T13:35:32.070' AS DateTime), 0, N'', N'', N'', 0, 0, N'', N'', N'', N'')
INSERT [dbo].[tProducts] ([cdeProduct], [dscDescription], [dscNOTE], [cdeUOM], [dscSerialNum], [cdeTax], [numInventory], [curStnd_price], [curSUG_RETAIL], [numStnd_Qty], [cdeVendor1], [cdeV1SKU], [cdeVendor2], [cdeV2SKU], [cdeVendor3], [cdeV3SKU], [cdeVendor4], [cdeV4SKU], [numDUE_IN], [numRO_QTY], [numORDERQTY], [numORD_MULT1], [curMULT_1COST], [numORD_MULT2], [curMULT_2COST], [numORD_MULT3], [curMULT_3COST], [cdeMSKU], [dscOPEN_1], [dscOPEN_2], [dscOPEN_3], [dscOPEN_4], [optSale], [curSale_Price], [cdeSale], [dteLastSold], [cdeTransaction], [cdeDept], [cdeSubDept], [curAVG_Cost], [curREPL_Cost], [curSTND_Cost], [curLAST_RECD_Cost], [numDAY_QTY], [curDAY_SALE], [numMON_QTY], [curMONTH_SALE], [numYEAR_QTY], [curYEAR_SALE], [numTOTAL_QTY], [curTOTAL_SALE], [optRental], [dteRentTimeOut], [dteRentTimeIn], [numTotRentTime], [optInvAlert], [optSalesLessCost], [optDiscountAllowed], [optAddNotesToReceipt], [numMargin], [optKit], [cdeAltUOMDefault], [cdePrice], [optSetPriceByMargin], [optDiscontinued], [dteAction], [optRoundTo9], [cdePAR], [dteAdded], [cdeLastUSERID], [optNoMoreDiscounts], [cdeManu], [cdeClass], [cdeSubClass], [cdeLoc], [dscUpdateInfo], [dteLastRec], [numLastRecQty], [cdeClaimType], [cdePackStatus], [cdeCvrsID], [cdeQtyRank], [cdePreviousQtyRank], [cdeDolRank], [cdePreviousDolRank], [dteRankCalc], [optRankLock], [numRank], [numMinWeeks], [numMaxWeeks], [optWeeksLock], [optIncludePromo], [optORD_MULT2_LOCK], [optORD_MULT3_LOCK], [numOrdMin], [numOrdMax], [dteMinMaxCalc], [optEORetailLock], [numDesMargin], [cdeTruBlueInd], [cdeNonStockSkuInd], [cdeAssortmentInd], [numLastCount], [dteLastCount], [SyncStatus], [numORD_MULT4], [curMULT_4COST], [optTiered], [optORD_MULT4_LOCK], [cdeCoreItem], [cdeRetailAssortment], [cdeGreenItem], [cdeImageID], [cdeToBeDiscontinued], [dteTBD], [dteDiscontinued], [cdeSubsItemTypeCD], [cdeCouponSource], [cdeCouponType], [numUnitWt], [cdeDIBStatus], [cdeSubstitute], [optAdder], [curFreightCost], [numQtyCommitted], [optAGItem], [optCentrallyPriced], [optPriceByMargin], [optFollowDIBRetail], [cdeDiscontinueReason], [curMinSelling_PRICE], [cdeUnitOfMeasureItem], [cdeECommerceFlag], [curRPELevel1Retail], [curRPELevel2Retail], [curEcommercePrice], [cdeCentralShipInd], [cdeVariablePricingMethodCD], [cdeBrandName], [numUnitQty], [cdeUnitText], [cdeVisibilityFlag], [optPOSAlertNote], [cdeMadeInUSA], [cdeSubCategory], [numRoundToX], [optAceInstantSavings], [cdeProductType], [dteDIBRetailInventory], [numDIBCaseMultCode], [cdeDIBCountryOfOrigin], [cdeDIBUPSSwitch], [cdeDIBCentralStockSwitch], [numDIBExceptionQty], [numDIBMaxQty], [cdeDIBPriceCode], [cdeDIBNewItemInd], [cdeDIBPromoStatus], [cdeDIBSubstitute2]) VALUES (N'032076068462', N'3WY HD Voltage Tester', NULL, N'17', NULL, N'NY', 1, 8.99, 10.99, 1, N'TRU', N'766145', N'', N'', N'', N'', N'', N'', 0, 0, 2, 1, 3.57, 5, 3.45, 0, 0, N'GET-3213', NULL, NULL, NULL, N'TRU011254', 0, 0.0000, N'0', CAST(N'2022-01-31T10:25:51.000' AS DateTime), N'A193224', N'E', NULL, 4.35, 0, 0, 4.35, 0, 0, 0, 0, 1, 8.99, 27, 206.483, 0, NULL, NULL, 0, 1, 1, 1, 0, 51.61, 0, N'17', N'S', 0, 0, CAST(N'2022-02-14T10:47:08.593' AS DateTime), 0, NULL, CAST(N'2016-12-07T13:37:18.000' AS DateTime), N'FMNT', 1, N'17467', N'75', N'11', NULL, NULL, CAST(N'2022-01-17T10:58:34.000' AS DateTime), 2, N'A', N'B', NULL, N'B', N'B', N'D', N'D', CAST(N'2017-11-30T13:48:26.000' AS DateTime), 0, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, N'', N'', N'', 0, NULL, N'0', 0, 0, 0, 0, N'Y', N'2', N'N', N'~/images/0001.jpg', NULL, NULL, NULL, NULL, NULL, NULL, 0.2, NULL, N'', 0, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, NULL, 12.99, 12.99, 0, NULL, N'', NULL, 0, NULL, NULL, 0, N'N', N'', 9, 0, N'', CAST(N'2016-12-07T13:37:18.723' AS DateTime), 0, N'', N'', N'', 0, 0, N'', N'', N'', N'')
INSERT [dbo].[tProducts] ([cdeProduct], [dscDescription], [dscNOTE], [cdeUOM], [dscSerialNum], [cdeTax], [numInventory], [curStnd_price], [curSUG_RETAIL], [numStnd_Qty], [cdeVendor1], [cdeV1SKU], [cdeVendor2], [cdeV2SKU], [cdeVendor3], [cdeV3SKU], [cdeVendor4], [cdeV4SKU], [numDUE_IN], [numRO_QTY], [numORDERQTY], [numORD_MULT1], [curMULT_1COST], [numORD_MULT2], [curMULT_2COST], [numORD_MULT3], [curMULT_3COST], [cdeMSKU], [dscOPEN_1], [dscOPEN_2], [dscOPEN_3], [dscOPEN_4], [optSale], [curSale_Price], [cdeSale], [dteLastSold], [cdeTransaction], [cdeDept], [cdeSubDept], [curAVG_Cost], [curREPL_Cost], [curSTND_Cost], [curLAST_RECD_Cost], [numDAY_QTY], [curDAY_SALE], [numMON_QTY], [curMONTH_SALE], [numYEAR_QTY], [curYEAR_SALE], [numTOTAL_QTY], [curTOTAL_SALE], [optRental], [dteRentTimeOut], [dteRentTimeIn], [numTotRentTime], [optInvAlert], [optSalesLessCost], [optDiscountAllowed], [optAddNotesToReceipt], [numMargin], [optKit], [cdeAltUOMDefault], [cdePrice], [optSetPriceByMargin], [optDiscontinued], [dteAction], [optRoundTo9], [cdePAR], [dteAdded], [cdeLastUSERID], [optNoMoreDiscounts], [cdeManu], [cdeClass], [cdeSubClass], [cdeLoc], [dscUpdateInfo], [dteLastRec], [numLastRecQty], [cdeClaimType], [cdePackStatus], [cdeCvrsID], [cdeQtyRank], [cdePreviousQtyRank], [cdeDolRank], [cdePreviousDolRank], [dteRankCalc], [optRankLock], [numRank], [numMinWeeks], [numMaxWeeks], [optWeeksLock], [optIncludePromo], [optORD_MULT2_LOCK], [optORD_MULT3_LOCK], [numOrdMin], [numOrdMax], [dteMinMaxCalc], [optEORetailLock], [numDesMargin], [cdeTruBlueInd], [cdeNonStockSkuInd], [cdeAssortmentInd], [numLastCount], [dteLastCount], [SyncStatus], [numORD_MULT4], [curMULT_4COST], [optTiered], [optORD_MULT4_LOCK], [cdeCoreItem], [cdeRetailAssortment], [cdeGreenItem], [cdeImageID], [cdeToBeDiscontinued], [dteTBD], [dteDiscontinued], [cdeSubsItemTypeCD], [cdeCouponSource], [cdeCouponType], [numUnitWt], [cdeDIBStatus], [cdeSubstitute], [optAdder], [curFreightCost], [numQtyCommitted], [optAGItem], [optCentrallyPriced], [optPriceByMargin], [optFollowDIBRetail], [cdeDiscontinueReason], [curMinSelling_PRICE], [cdeUnitOfMeasureItem], [cdeECommerceFlag], [curRPELevel1Retail], [curRPELevel2Retail], [curEcommercePrice], [cdeCentralShipInd], [cdeVariablePricingMethodCD], [cdeBrandName], [numUnitQty], [cdeUnitText], [cdeVisibilityFlag], [optPOSAlertNote], [cdeMadeInUSA], [cdeSubCategory], [numRoundToX], [optAceInstantSavings], [cdeProductType], [dteDIBRetailInventory], [numDIBCaseMultCode], [cdeDIBCountryOfOrigin], [cdeDIBUPSSwitch], [cdeDIBCentralStockSwitch], [numDIBExceptionQty], [numDIBMaxQty], [cdeDIBPriceCode], [cdeDIBNewItemInd], [cdeDIBPromoStatus], [cdeDIBSubstitute2]) VALUES (N'032076068448', N'6/12V Circuit Tester', NULL, N'17', NULL, N'NY', 2, 7.99, 8.29, 1, N'TRU', N'766065', N'', N'', N'', N'', N'', N'', 0, 2, 5, 1, 3.37, 5, 3.26, 0, 0, N'GAT-3400', NULL, NULL, NULL, N'TRU111522', 0, 0.0000, N'0', CAST(N'2021-11-15T15:32:09.000' AS DateTime), N'A186093', N'E', NULL, 3.66, 0, 0, 3.66, 0, 0, 0, 0, 0, 0, 7, 50.93, 0, NULL, NULL, 0, 1, 1, 1, 0, 54.19, 0, N'17', N'S', 0, 0, CAST(N'2022-02-14T11:51:57.260' AS DateTime), 0, NULL, CAST(N'2016-12-07T13:38:42.000' AS DateTime), N'FMNT', 1, N'17467', N'75', N'11', NULL, NULL, CAST(N'2021-11-26T11:51:37.000' AS DateTime), 2, N'A', N'B', NULL, N'X', N'X', N'X', N'X', CAST(N'2017-11-30T13:48:26.000' AS DateTime), 0, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, N'', N'', N'', 0, NULL, N'0', 0, 0, 0, 0, N'Y', N'1', N'N', N'~/images/0001.jpg', NULL, NULL, NULL, NULL, NULL, NULL, 0.1, NULL, N'', 0, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, NULL, 9.49, 9.99, 0, NULL, N'', NULL, 0, NULL, NULL, 0, N'N', N'', 9, 0, N'', CAST(N'2016-12-07T13:38:42.447' AS DateTime), 0, N'', N'', N'', 0, 0, N'', N'', N'', N'')
INSERT [dbo].[tProducts] ([cdeProduct], [dscDescription], [dscNOTE], [cdeUOM], [dscSerialNum], [cdeTax], [numInventory], [curStnd_price], [curSUG_RETAIL], [numStnd_Qty], [cdeVendor1], [cdeV1SKU], [cdeVendor2], [cdeV2SKU], [cdeVendor3], [cdeV3SKU], [cdeVendor4], [cdeV4SKU], [numDUE_IN], [numRO_QTY], [numORDERQTY], [numORD_MULT1], [curMULT_1COST], [numORD_MULT2], [curMULT_2COST], [numORD_MULT3], [curMULT_3COST], [cdeMSKU], [dscOPEN_1], [dscOPEN_2], [dscOPEN_3], [dscOPEN_4], [optSale], [curSale_Price], [cdeSale], [dteLastSold], [cdeTransaction], [cdeDept], [cdeSubDept], [curAVG_Cost], [curREPL_Cost], [curSTND_Cost], [curLAST_RECD_Cost], [numDAY_QTY], [curDAY_SALE], [numMON_QTY], [curMONTH_SALE], [numYEAR_QTY], [curYEAR_SALE], [numTOTAL_QTY], [curTOTAL_SALE], [optRental], [dteRentTimeOut], [dteRentTimeIn], [numTotRentTime], [optInvAlert], [optSalesLessCost], [optDiscountAllowed], [optAddNotesToReceipt], [numMargin], [optKit], [cdeAltUOMDefault], [cdePrice], [optSetPriceByMargin], [optDiscontinued], [dteAction], [optRoundTo9], [cdePAR], [dteAdded], [cdeLastUSERID], [optNoMoreDiscounts], [cdeManu], [cdeClass], [cdeSubClass], [cdeLoc], [dscUpdateInfo], [dteLastRec], [numLastRecQty], [cdeClaimType], [cdePackStatus], [cdeCvrsID], [cdeQtyRank], [cdePreviousQtyRank], [cdeDolRank], [cdePreviousDolRank], [dteRankCalc], [optRankLock], [numRank], [numMinWeeks], [numMaxWeeks], [optWeeksLock], [optIncludePromo], [optORD_MULT2_LOCK], [optORD_MULT3_LOCK], [numOrdMin], [numOrdMax], [dteMinMaxCalc], [optEORetailLock], [numDesMargin], [cdeTruBlueInd], [cdeNonStockSkuInd], [cdeAssortmentInd], [numLastCount], [dteLastCount], [SyncStatus], [numORD_MULT4], [curMULT_4COST], [optTiered], [optORD_MULT4_LOCK], [cdeCoreItem], [cdeRetailAssortment], [cdeGreenItem], [cdeImageID], [cdeToBeDiscontinued], [dteTBD], [dteDiscontinued], [cdeSubsItemTypeCD], [cdeCouponSource], [cdeCouponType], [numUnitWt], [cdeDIBStatus], [cdeSubstitute], [optAdder], [curFreightCost], [numQtyCommitted], [optAGItem], [optCentrallyPriced], [optPriceByMargin], [optFollowDIBRetail], [cdeDiscontinueReason], [curMinSelling_PRICE], [cdeUnitOfMeasureItem], [cdeECommerceFlag], [curRPELevel1Retail], [curRPELevel2Retail], [curEcommercePrice], [cdeCentralShipInd], [cdeVariablePricingMethodCD], [cdeBrandName], [numUnitQty], [cdeUnitText], [cdeVisibilityFlag], [optPOSAlertNote], [cdeMadeInUSA], [cdeSubCategory], [numRoundToX], [optAceInstantSavings], [cdeProductType], [dteDIBRetailInventory], [numDIBCaseMultCode], [cdeDIBCountryOfOrigin], [cdeDIBUPSSwitch], [cdeDIBCentralStockSwitch], [numDIBExceptionQty], [numDIBMaxQty], [cdeDIBPriceCode], [cdeDIBNewItemInd], [cdeDIBPromoStatus], [cdeDIBSubstitute2]) VALUES (N'032076068417', N'Twin Probe Tester', NULL, N'17', NULL, N'NY', 1, 4.99, 5.29, 1, N'TRU', N'766123', N'', N'', N'', N'', N'', N'', 0, 2, 5, 1, 1.76, 5, 1.7, 0, 0, N'GET-3100', NULL, NULL, NULL, N'TRU020453', 0, 0.0000, N'0', CAST(N'2021-05-18T13:05:07.000' AS DateTime), N'A167392', N'E', NULL, 1.86, 0, 0, 1.88, 0, 0, 0, 0, 0, 0, 20, 89.301, 0, NULL, NULL, 0, 1, 1, 1, 0, 62.73, 0, N'17', N'S', 0, 0, CAST(N'2022-02-14T10:47:08.583' AS DateTime), 0, NULL, CAST(N'2016-12-07T13:38:58.000' AS DateTime), N'FMNT', 1, N'17467', N'75', N'11', NULL, NULL, CAST(N'2020-02-10T14:34:02.000' AS DateTime), 2, N'A', N'B', NULL, N'B', N'B', N'D', N'D', CAST(N'2017-11-30T13:48:26.000' AS DateTime), 0, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, N'', N'', N'', 0, NULL, N'0', 0, 0, 0, 0, N'Y', N'1', N'N', N'~/images/0001.jpg', NULL, NULL, NULL, NULL, NULL, NULL, 0.05, NULL, N'', 0, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, NULL, 5.99, 6.49, 0, NULL, N'', NULL, 0, NULL, NULL, 0, N'N', N'', 9, 0, N'', CAST(N'2016-12-07T13:38:58.610' AS DateTime), 0, N'', N'', N'', 0, 0, N'', N'', N'', N'')
INSERT [dbo].[tProducts] ([cdeProduct], [dscDescription], [dscNOTE], [cdeUOM], [dscSerialNum], [cdeTax], [numInventory], [curStnd_price], [curSUG_RETAIL], [numStnd_Qty], [cdeVendor1], [cdeV1SKU], [cdeVendor2], [cdeV2SKU], [cdeVendor3], [cdeV3SKU], [cdeVendor4], [cdeV4SKU], [numDUE_IN], [numRO_QTY], [numORDERQTY], [numORD_MULT1], [curMULT_1COST], [numORD_MULT2], [curMULT_2COST], [numORD_MULT3], [curMULT_3COST], [cdeMSKU], [dscOPEN_1], [dscOPEN_2], [dscOPEN_3], [dscOPEN_4], [optSale], [curSale_Price], [cdeSale], [dteLastSold], [cdeTransaction], [cdeDept], [cdeSubDept], [curAVG_Cost], [curREPL_Cost], [curSTND_Cost], [curLAST_RECD_Cost], [numDAY_QTY], [curDAY_SALE], [numMON_QTY], [curMONTH_SALE], [numYEAR_QTY], [curYEAR_SALE], [numTOTAL_QTY], [curTOTAL_SALE], [optRental], [dteRentTimeOut], [dteRentTimeIn], [numTotRentTime], [optInvAlert], [optSalesLessCost], [optDiscountAllowed], [optAddNotesToReceipt], [numMargin], [optKit], [cdeAltUOMDefault], [cdePrice], [optSetPriceByMargin], [optDiscontinued], [dteAction], [optRoundTo9], [cdePAR], [dteAdded], [cdeLastUSERID], [optNoMoreDiscounts], [cdeManu], [cdeClass], [cdeSubClass], [cdeLoc], [dscUpdateInfo], [dteLastRec], [numLastRecQty], [cdeClaimType], [cdePackStatus], [cdeCvrsID], [cdeQtyRank], [cdePreviousQtyRank], [cdeDolRank], [cdePreviousDolRank], [dteRankCalc], [optRankLock], [numRank], [numMinWeeks], [numMaxWeeks], [optWeeksLock], [optIncludePromo], [optORD_MULT2_LOCK], [optORD_MULT3_LOCK], [numOrdMin], [numOrdMax], [dteMinMaxCalc], [optEORetailLock], [numDesMargin], [cdeTruBlueInd], [cdeNonStockSkuInd], [cdeAssortmentInd], [numLastCount], [dteLastCount], [SyncStatus], [numORD_MULT4], [curMULT_4COST], [optTiered], [optORD_MULT4_LOCK], [cdeCoreItem], [cdeRetailAssortment], [cdeGreenItem], [cdeImageID], [cdeToBeDiscontinued], [dteTBD], [dteDiscontinued], [cdeSubsItemTypeCD], [cdeCouponSource], [cdeCouponType], [numUnitWt], [cdeDIBStatus], [cdeSubstitute], [optAdder], [curFreightCost], [numQtyCommitted], [optAGItem], [optCentrallyPriced], [optPriceByMargin], [optFollowDIBRetail], [cdeDiscontinueReason], [curMinSelling_PRICE], [cdeUnitOfMeasureItem], [cdeECommerceFlag], [curRPELevel1Retail], [curRPELevel2Retail], [curEcommercePrice], [cdeCentralShipInd], [cdeVariablePricingMethodCD], [cdeBrandName], [numUnitQty], [cdeUnitText], [cdeVisibilityFlag], [optPOSAlertNote], [cdeMadeInUSA], [cdeSubCategory], [numRoundToX], [optAceInstantSavings], [cdeProductType], [dteDIBRetailInventory], [numDIBCaseMultCode], [cdeDIBCountryOfOrigin], [cdeDIBUPSSwitch], [cdeDIBCentralStockSwitch], [numDIBExceptionQty], [numDIBMaxQty], [cdeDIBPriceCode], [cdeDIBNewItemInd], [cdeDIBPromoStatus], [cdeDIBSubstitute2]) VALUES (N'041333827018', N'URA 4PK 9V Alk Battery', NULL, N'17', NULL, N'NY', 4, 19.99, 18.99, 1, N'TRU', N'850674', N'', N'', N'', N'', N'', N'', 0, 1, 4, 1, 12, 12, 12.55, 0, 0, N'MN16B4DW', NULL, NULL, NULL, N'TRU011254', 0, 0.0000, N'0', CAST(N'2022-01-27T12:08:29.000' AS DateTime), N'A192947', N'E', NULL, 13.918, 0, 0, 13.548, 0, 0, 0, 0, 1, 19.99, 121, 2214.792, 0, NULL, NULL, 0, 1, 1, 1, 0, 30.38, 0, N'17', N'S', 0, 0, CAST(N'2022-02-14T12:22:44.547' AS DateTime), 0, NULL, CAST(N'2016-12-07T10:50:09.000' AS DateTime), N'FMNT', 1, N'36483', N'80', N'51', NULL, NULL, CAST(N'2022-01-24T15:28:37.000' AS DateTime), 4, N'A', N'B', NULL, N'A', N'A', N'B', N'B', CAST(N'2017-11-30T13:48:26.000' AS DateTime), 0, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, N'', N'', N'', 0, NULL, N'0', 0, 0, 0, 0, N'Y', N'1', N'N', N'~/images/0001.jpg', NULL, NULL, NULL, NULL, NULL, NULL, 0.47, NULL, N'', 0, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, NULL, 18.99, 18.99, 0, NULL, N'', NULL, 0, NULL, N'V', 0, N'1', N'', 9, 0, N'', CAST(N'2016-12-07T10:50:09.750' AS DateTime), 0, N'', N'', N'', 0, 0, N'', N'', N'', N'')
INSERT [dbo].[tProducts] ([cdeProduct], [dscDescription], [dscNOTE], [cdeUOM], [dscSerialNum], [cdeTax], [numInventory], [curStnd_price], [curSUG_RETAIL], [numStnd_Qty], [cdeVendor1], [cdeV1SKU], [cdeVendor2], [cdeV2SKU], [cdeVendor3], [cdeV3SKU], [cdeVendor4], [cdeV4SKU], [numDUE_IN], [numRO_QTY], [numORDERQTY], [numORD_MULT1], [curMULT_1COST], [numORD_MULT2], [curMULT_2COST], [numORD_MULT3], [curMULT_3COST], [cdeMSKU], [dscOPEN_1], [dscOPEN_2], [dscOPEN_3], [dscOPEN_4], [optSale], [curSale_Price], [cdeSale], [dteLastSold], [cdeTransaction], [cdeDept], [cdeSubDept], [curAVG_Cost], [curREPL_Cost], [curSTND_Cost], [curLAST_RECD_Cost], [numDAY_QTY], [curDAY_SALE], [numMON_QTY], [curMONTH_SALE], [numYEAR_QTY], [curYEAR_SALE], [numTOTAL_QTY], [curTOTAL_SALE], [optRental], [dteRentTimeOut], [dteRentTimeIn], [numTotRentTime], [optInvAlert], [optSalesLessCost], [optDiscountAllowed], [optAddNotesToReceipt], [numMargin], [optKit], [cdeAltUOMDefault], [cdePrice], [optSetPriceByMargin], [optDiscontinued], [dteAction], [optRoundTo9], [cdePAR], [dteAdded], [cdeLastUSERID], [optNoMoreDiscounts], [cdeManu], [cdeClass], [cdeSubClass], [cdeLoc], [dscUpdateInfo], [dteLastRec], [numLastRecQty], [cdeClaimType], [cdePackStatus], [cdeCvrsID], [cdeQtyRank], [cdePreviousQtyRank], [cdeDolRank], [cdePreviousDolRank], [dteRankCalc], [optRankLock], [numRank], [numMinWeeks], [numMaxWeeks], [optWeeksLock], [optIncludePromo], [optORD_MULT2_LOCK], [optORD_MULT3_LOCK], [numOrdMin], [numOrdMax], [dteMinMaxCalc], [optEORetailLock], [numDesMargin], [cdeTruBlueInd], [cdeNonStockSkuInd], [cdeAssortmentInd], [numLastCount], [dteLastCount], [SyncStatus], [numORD_MULT4], [curMULT_4COST], [optTiered], [optORD_MULT4_LOCK], [cdeCoreItem], [cdeRetailAssortment], [cdeGreenItem], [cdeImageID], [cdeToBeDiscontinued], [dteTBD], [dteDiscontinued], [cdeSubsItemTypeCD], [cdeCouponSource], [cdeCouponType], [numUnitWt], [cdeDIBStatus], [cdeSubstitute], [optAdder], [curFreightCost], [numQtyCommitted], [optAGItem], [optCentrallyPriced], [optPriceByMargin], [optFollowDIBRetail], [cdeDiscontinueReason], [curMinSelling_PRICE], [cdeUnitOfMeasureItem], [cdeECommerceFlag], [curRPELevel1Retail], [curRPELevel2Retail], [curEcommercePrice], [cdeCentralShipInd], [cdeVariablePricingMethodCD], [cdeBrandName], [numUnitQty], [cdeUnitText], [cdeVisibilityFlag], [optPOSAlertNote], [cdeMadeInUSA], [cdeSubCategory], [numRoundToX], [optAceInstantSavings], [cdeProductType], [dteDIBRetailInventory], [numDIBCaseMultCode], [cdeDIBCountryOfOrigin], [cdeDIBUPSSwitch], [cdeDIBCentralStockSwitch], [numDIBExceptionQty], [numDIBMaxQty], [cdeDIBPriceCode], [cdeDIBNewItemInd], [cdeDIBPromoStatus], [cdeDIBSubstitute2]) VALUES (N'032076068431', N'Receptacle Tester', NULL, N'17', NULL, N'NY', 1, 6.99, 7.99, 1, N'TRU', N'766186', N'', N'', N'', N'', N'', N'', 0, 0, 2, 1, 3.19, 5, 3.08, 0, 0, N'GRT-3500', NULL, NULL, NULL, N'TRU012648', 0, 0.0000, N'0', CAST(N'2021-07-26T17:12:04.000' AS DateTime), N'A174370', N'E', NULL, 3.35, 0, 0, 3.35, 0, 0, 0, 0, 0, 0, 18, 125.82, 0, NULL, NULL, 0, 1, 1, 1, 0, 52.07, 0, N'17', N'S', 0, 0, CAST(N'2022-02-14T12:22:40.653' AS DateTime), 0, NULL, CAST(N'2016-12-07T13:39:13.000' AS DateTime), N'FMNT', 1, N'17467', N'75', N'10', NULL, NULL, CAST(N'2021-02-02T14:15:14.000' AS DateTime), 2, N'A', N'B', NULL, N'B', N'B', N'C', N'C', CAST(N'2017-11-30T13:48:26.000' AS DateTime), 0, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, N'', N'', N'', 0, NULL, N'0', 0, 0, 0, 0, N'N', N'', N'N', N'~/images/0001.jpg', NULL, NULL, NULL, NULL, NULL, NULL, 0.13, NULL, N'', 0, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, NULL, 8.99, 9.49, 0, NULL, N'', NULL, 0, NULL, NULL, 0, N'N', N'', 9, 0, N'', CAST(N'2016-12-07T13:39:14.267' AS DateTime), 0, N'', N'', N'', 0, 0, N'', N'', N'', N'')
INSERT [dbo].[tProducts] ([cdeProduct], [dscDescription], [dscNOTE], [cdeUOM], [dscSerialNum], [cdeTax], [numInventory], [curStnd_price], [curSUG_RETAIL], [numStnd_Qty], [cdeVendor1], [cdeV1SKU], [cdeVendor2], [cdeV2SKU], [cdeVendor3], [cdeV3SKU], [cdeVendor4], [cdeV4SKU], [numDUE_IN], [numRO_QTY], [numORDERQTY], [numORD_MULT1], [curMULT_1COST], [numORD_MULT2], [curMULT_2COST], [numORD_MULT3], [curMULT_3COST], [cdeMSKU], [dscOPEN_1], [dscOPEN_2], [dscOPEN_3], [dscOPEN_4], [optSale], [curSale_Price], [cdeSale], [dteLastSold], [cdeTransaction], [cdeDept], [cdeSubDept], [curAVG_Cost], [curREPL_Cost], [curSTND_Cost], [curLAST_RECD_Cost], [numDAY_QTY], [curDAY_SALE], [numMON_QTY], [curMONTH_SALE], [numYEAR_QTY], [curYEAR_SALE], [numTOTAL_QTY], [curTOTAL_SALE], [optRental], [dteRentTimeOut], [dteRentTimeIn], [numTotRentTime], [optInvAlert], [optSalesLessCost], [optDiscountAllowed], [optAddNotesToReceipt], [numMargin], [optKit], [cdeAltUOMDefault], [cdePrice], [optSetPriceByMargin], [optDiscontinued], [dteAction], [optRoundTo9], [cdePAR], [dteAdded], [cdeLastUSERID], [optNoMoreDiscounts], [cdeManu], [cdeClass], [cdeSubClass], [cdeLoc], [dscUpdateInfo], [dteLastRec], [numLastRecQty], [cdeClaimType], [cdePackStatus], [cdeCvrsID], [cdeQtyRank], [cdePreviousQtyRank], [cdeDolRank], [cdePreviousDolRank], [dteRankCalc], [optRankLock], [numRank], [numMinWeeks], [numMaxWeeks], [optWeeksLock], [optIncludePromo], [optORD_MULT2_LOCK], [optORD_MULT3_LOCK], [numOrdMin], [numOrdMax], [dteMinMaxCalc], [optEORetailLock], [numDesMargin], [cdeTruBlueInd], [cdeNonStockSkuInd], [cdeAssortmentInd], [numLastCount], [dteLastCount], [SyncStatus], [numORD_MULT4], [curMULT_4COST], [optTiered], [optORD_MULT4_LOCK], [cdeCoreItem], [cdeRetailAssortment], [cdeGreenItem], [cdeImageID], [cdeToBeDiscontinued], [dteTBD], [dteDiscontinued], [cdeSubsItemTypeCD], [cdeCouponSource], [cdeCouponType], [numUnitWt], [cdeDIBStatus], [cdeSubstitute], [optAdder], [curFreightCost], [numQtyCommitted], [optAGItem], [optCentrallyPriced], [optPriceByMargin], [optFollowDIBRetail], [cdeDiscontinueReason], [curMinSelling_PRICE], [cdeUnitOfMeasureItem], [cdeECommerceFlag], [curRPELevel1Retail], [curRPELevel2Retail], [curEcommercePrice], [cdeCentralShipInd], [cdeVariablePricingMethodCD], [cdeBrandName], [numUnitQty], [cdeUnitText], [cdeVisibilityFlag], [optPOSAlertNote], [cdeMadeInUSA], [cdeSubCategory], [numRoundToX], [optAceInstantSavings], [cdeProductType], [dteDIBRetailInventory], [numDIBCaseMultCode], [cdeDIBCountryOfOrigin], [cdeDIBUPSSwitch], [cdeDIBCentralStockSwitch], [numDIBExceptionQty], [numDIBMaxQty], [cdeDIBPriceCode], [cdeDIBNewItemInd], [cdeDIBPromoStatus], [cdeDIBSubstitute2]) VALUES (N'032076068424', N'GRND Fault Out Tester', NULL, N'17', NULL, N'NY', 2, 11.99, 9.99, 1, N'TRU', N'766156', N'', N'', N'', N'', N'', N'', 0, 0, 1, 1, 4.67, 10, 4.51, 0, 0, N'GFI-3501', NULL, NULL, NULL, N'TRU020928', 0, 0.0000, N'0', CAST(N'2022-02-02T09:38:28.000' AS DateTime), N'A193472', N'E', NULL, 5.59, 0, 0, 5.59, 0, 0, 1, 11.99, 1, 11.99, 30, 341.7, 0, NULL, NULL, 0, 1, 1, 1, 0, 53.38, 0, N'17', N'S', 0, 0, CAST(N'2022-02-14T12:22:40.643' AS DateTime), 0, NULL, CAST(N'2016-12-07T13:39:58.000' AS DateTime), N'FMNT', 1, N'17467', N'75', N'10', NULL, NULL, CAST(N'2022-02-14T10:37:18.000' AS DateTime), 2, N'A', N'B', NULL, N'B', N'B', N'B', N'B', CAST(N'2017-11-30T13:48:26.000' AS DateTime), 0, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, N'', N'', N'', 0, NULL, N'0', 0, 0, 0, 0, N'Y', N'1', N'N', N'~/images/0001.jpg', NULL, NULL, NULL, NULL, NULL, NULL, 0.12, NULL, N'', 0, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, NULL, 10.99, 11.99, 0, NULL, N'', NULL, 0, NULL, NULL, 0, N'N', N'', 9, 0, N'', CAST(N'2016-12-07T13:39:58.437' AS DateTime), 0, N'', N'', N'', 0, 0, N'', N'', N'', N'')
INSERT [dbo].[tProducts] ([cdeProduct], [dscDescription], [dscNOTE], [cdeUOM], [dscSerialNum], [cdeTax], [numInventory], [curStnd_price], [curSUG_RETAIL], [numStnd_Qty], [cdeVendor1], [cdeV1SKU], [cdeVendor2], [cdeV2SKU], [cdeVendor3], [cdeV3SKU], [cdeVendor4], [cdeV4SKU], [numDUE_IN], [numRO_QTY], [numORDERQTY], [numORD_MULT1], [curMULT_1COST], [numORD_MULT2], [curMULT_2COST], [numORD_MULT3], [curMULT_3COST], [cdeMSKU], [dscOPEN_1], [dscOPEN_2], [dscOPEN_3], [dscOPEN_4], [optSale], [curSale_Price], [cdeSale], [dteLastSold], [cdeTransaction], [cdeDept], [cdeSubDept], [curAVG_Cost], [curREPL_Cost], [curSTND_Cost], [curLAST_RECD_Cost], [numDAY_QTY], [curDAY_SALE], [numMON_QTY], [curMONTH_SALE], [numYEAR_QTY], [curYEAR_SALE], [numTOTAL_QTY], [curTOTAL_SALE], [optRental], [dteRentTimeOut], [dteRentTimeIn], [numTotRentTime], [optInvAlert], [optSalesLessCost], [optDiscountAllowed], [optAddNotesToReceipt], [numMargin], [optKit], [cdeAltUOMDefault], [cdePrice], [optSetPriceByMargin], [optDiscontinued], [dteAction], [optRoundTo9], [cdePAR], [dteAdded], [cdeLastUSERID], [optNoMoreDiscounts], [cdeManu], [cdeClass], [cdeSubClass], [cdeLoc], [dscUpdateInfo], [dteLastRec], [numLastRecQty], [cdeClaimType], [cdePackStatus], [cdeCvrsID], [cdeQtyRank], [cdePreviousQtyRank], [cdeDolRank], [cdePreviousDolRank], [dteRankCalc], [optRankLock], [numRank], [numMinWeeks], [numMaxWeeks], [optWeeksLock], [optIncludePromo], [optORD_MULT2_LOCK], [optORD_MULT3_LOCK], [numOrdMin], [numOrdMax], [dteMinMaxCalc], [optEORetailLock], [numDesMargin], [cdeTruBlueInd], [cdeNonStockSkuInd], [cdeAssortmentInd], [numLastCount], [dteLastCount], [SyncStatus], [numORD_MULT4], [curMULT_4COST], [optTiered], [optORD_MULT4_LOCK], [cdeCoreItem], [cdeRetailAssortment], [cdeGreenItem], [cdeImageID], [cdeToBeDiscontinued], [dteTBD], [dteDiscontinued], [cdeSubsItemTypeCD], [cdeCouponSource], [cdeCouponType], [numUnitWt], [cdeDIBStatus], [cdeSubstitute], [optAdder], [curFreightCost], [numQtyCommitted], [optAGItem], [optCentrallyPriced], [optPriceByMargin], [optFollowDIBRetail], [cdeDiscontinueReason], [curMinSelling_PRICE], [cdeUnitOfMeasureItem], [cdeECommerceFlag], [curRPELevel1Retail], [curRPELevel2Retail], [curEcommercePrice], [cdeCentralShipInd], [cdeVariablePricingMethodCD], [cdeBrandName], [numUnitQty], [cdeUnitText], [cdeVisibilityFlag], [optPOSAlertNote], [cdeMadeInUSA], [cdeSubCategory], [numRoundToX], [optAceInstantSavings], [cdeProductType], [dteDIBRetailInventory], [numDIBCaseMultCode], [cdeDIBCountryOfOrigin], [cdeDIBUPSSwitch], [cdeDIBCentralStockSwitch], [numDIBExceptionQty], [numDIBMaxQty], [cdeDIBPriceCode], [cdeDIBNewItemInd], [cdeDIBPromoStatus], [cdeDIBSubstitute2]) VALUES (N'035632064717', N'80-250Vac VoltageTester', NULL, N'17', NULL, N'NY', 0, 6.49, 7.29, 1, N'TRU', N'675142', N'', N'', N'', N'', N'', N'', 0, 0, 0, 1, 3.03, 5, 2.93, 0, 0, N'ET6102', NULL, NULL, NULL, N'OS ELEC', 0, 0.0000, N'0', CAST(N'2017-11-14T09:58:56.000' AS DateTime), N'A17882', N'E', NULL, 3.03, 0, 0, 3.03, 0, 0, 0, 0, 0, 0, 2, 12.98, 0, NULL, NULL, 0, 1, 1, 1, 0, 53.31, 0, N'17', N'S', 0, 0, CAST(N'2022-02-14T12:22:37.470' AS DateTime), 0, NULL, CAST(N'2016-12-07T13:40:13.000' AS DateTime), N'FMNT', 1, N'17467', N'75', N'11', NULL, NULL, CAST(N'2016-12-13T19:02:41.000' AS DateTime), 2, N'A', N'B', NULL, N'B', N'B', N'D', N'D', CAST(N'2017-11-30T13:48:26.000' AS DateTime), 0, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, N'', N'', N'', 0, NULL, N'0', 0, 0, 0, 0, N'N', N'', N'N', N'~/images/0001.jpg', NULL, NULL, NULL, NULL, NULL, NULL, 0.1, NULL, N'', 0, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, NULL, 8.49, 8.99, 0, NULL, N'', NULL, 0, NULL, NULL, 0, N'N', N'', 9, 0, N'', CAST(N'2016-12-07T13:40:14.193' AS DateTime), 0, N'', N'', N'', 0, 0, N'', N'', N'', N'')
INSERT [dbo].[tProducts] ([cdeProduct], [dscDescription], [dscNOTE], [cdeUOM], [dscSerialNum], [cdeTax], [numInventory], [curStnd_price], [curSUG_RETAIL], [numStnd_Qty], [cdeVendor1], [cdeV1SKU], [cdeVendor2], [cdeV2SKU], [cdeVendor3], [cdeV3SKU], [cdeVendor4], [cdeV4SKU], [numDUE_IN], [numRO_QTY], [numORDERQTY], [numORD_MULT1], [curMULT_1COST], [numORD_MULT2], [curMULT_2COST], [numORD_MULT3], [curMULT_3COST], [cdeMSKU], [dscOPEN_1], [dscOPEN_2], [dscOPEN_3], [dscOPEN_4], [optSale], [curSale_Price], [cdeSale], [dteLastSold], [cdeTransaction], [cdeDept], [cdeSubDept], [curAVG_Cost], [curREPL_Cost], [curSTND_Cost], [curLAST_RECD_Cost], [numDAY_QTY], [curDAY_SALE], [numMON_QTY], [curMONTH_SALE], [numYEAR_QTY], [curYEAR_SALE], [numTOTAL_QTY], [curTOTAL_SALE], [optRental], [dteRentTimeOut], [dteRentTimeIn], [numTotRentTime], [optInvAlert], [optSalesLessCost], [optDiscountAllowed], [optAddNotesToReceipt], [numMargin], [optKit], [cdeAltUOMDefault], [cdePrice], [optSetPriceByMargin], [optDiscontinued], [dteAction], [optRoundTo9], [cdePAR], [dteAdded], [cdeLastUSERID], [optNoMoreDiscounts], [cdeManu], [cdeClass], [cdeSubClass], [cdeLoc], [dscUpdateInfo], [dteLastRec], [numLastRecQty], [cdeClaimType], [cdePackStatus], [cdeCvrsID], [cdeQtyRank], [cdePreviousQtyRank], [cdeDolRank], [cdePreviousDolRank], [dteRankCalc], [optRankLock], [numRank], [numMinWeeks], [numMaxWeeks], [optWeeksLock], [optIncludePromo], [optORD_MULT2_LOCK], [optORD_MULT3_LOCK], [numOrdMin], [numOrdMax], [dteMinMaxCalc], [optEORetailLock], [numDesMargin], [cdeTruBlueInd], [cdeNonStockSkuInd], [cdeAssortmentInd], [numLastCount], [dteLastCount], [SyncStatus], [numORD_MULT4], [curMULT_4COST], [optTiered], [optORD_MULT4_LOCK], [cdeCoreItem], [cdeRetailAssortment], [cdeGreenItem], [cdeImageID], [cdeToBeDiscontinued], [dteTBD], [dteDiscontinued], [cdeSubsItemTypeCD], [cdeCouponSource], [cdeCouponType], [numUnitWt], [cdeDIBStatus], [cdeSubstitute], [optAdder], [curFreightCost], [numQtyCommitted], [optAGItem], [optCentrallyPriced], [optPriceByMargin], [optFollowDIBRetail], [cdeDiscontinueReason], [curMinSelling_PRICE], [cdeUnitOfMeasureItem], [cdeECommerceFlag], [curRPELevel1Retail], [curRPELevel2Retail], [curEcommercePrice], [cdeCentralShipInd], [cdeVariablePricingMethodCD], [cdeBrandName], [numUnitQty], [cdeUnitText], [cdeVisibilityFlag], [optPOSAlertNote], [cdeMadeInUSA], [cdeSubCategory], [numRoundToX], [optAceInstantSavings], [cdeProductType], [dteDIBRetailInventory], [numDIBCaseMultCode], [cdeDIBCountryOfOrigin], [cdeDIBUPSSwitch], [cdeDIBCentralStockSwitch], [numDIBExceptionQty], [numDIBMaxQty], [cdeDIBPriceCode], [cdeDIBNewItemInd], [cdeDIBPromoStatus], [cdeDIBSubstitute2]) VALUES (N'035632064786', N'NonCont Voltage Sensor', NULL, N'17', NULL, N'NY', 0, 17.99, 17.99, 1, N'TRU', N'675316', N'', N'', N'', N'', N'', N'', 0, 0, 0, 1, 8.19, 5, 7.91, 0, 0, N'VD6504', NULL, NULL, NULL, N'TRU050146', 0, 0.0000, N'0', CAST(N'2019-06-01T16:04:37.000' AS DateTime), N'A95020', N'E', NULL, 8.73, 0, 0, 8.73, 0, 0, 0, 0, 0, 0, 41, 698.59, 0, NULL, NULL, 0, 1, 1, 1, 0, 51.47, 0, N'17', N'S', 0, 1, CAST(N'2019-09-10T14:21:08.607' AS DateTime), 0, NULL, CAST(N'2016-12-07T13:40:28.000' AS DateTime), N'FMNT', 1, N'17467', N'75', N'11', NULL, NULL, CAST(N'2019-05-07T15:36:01.000' AS DateTime), 1, N'A', N'B', NULL, N'A', N'A', N'A', N'A', CAST(N'2017-11-30T13:48:26.000' AS DateTime), 0, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, N'', N'', N'', 0, NULL, N'0', 0, 0, 0, 0, N'N', N'', N'N', N'~/images/0001.jpg', N'D', NULL, NULL, N'1', NULL, NULL, 0.12, NULL, N'', 0, 0, 0, 0, 0, 0, 0, N'B', 0, NULL, NULL, 19.99, 21.99, 0, NULL, N'', NULL, 0, NULL, NULL, 0, N'N', N'', 9, 0, N'', CAST(N'2016-12-07T13:40:28.653' AS DateTime), 0, N'', N'', N'', 0, 0, N'', N'', N'', N'')
INSERT [dbo].[tProducts] ([cdeProduct], [dscDescription], [dscNOTE], [cdeUOM], [dscSerialNum], [cdeTax], [numInventory], [curStnd_price], [curSUG_RETAIL], [numStnd_Qty], [cdeVendor1], [cdeV1SKU], [cdeVendor2], [cdeV2SKU], [cdeVendor3], [cdeV3SKU], [cdeVendor4], [cdeV4SKU], [numDUE_IN], [numRO_QTY], [numORDERQTY], [numORD_MULT1], [curMULT_1COST], [numORD_MULT2], [curMULT_2COST], [numORD_MULT3], [curMULT_3COST], [cdeMSKU], [dscOPEN_1], [dscOPEN_2], [dscOPEN_3], [dscOPEN_4], [optSale], [curSale_Price], [cdeSale], [dteLastSold], [cdeTransaction], [cdeDept], [cdeSubDept], [curAVG_Cost], [curREPL_Cost], [curSTND_Cost], [curLAST_RECD_Cost], [numDAY_QTY], [curDAY_SALE], [numMON_QTY], [curMONTH_SALE], [numYEAR_QTY], [curYEAR_SALE], [numTOTAL_QTY], [curTOTAL_SALE], [optRental], [dteRentTimeOut], [dteRentTimeIn], [numTotRentTime], [optInvAlert], [optSalesLessCost], [optDiscountAllowed], [optAddNotesToReceipt], [numMargin], [optKit], [cdeAltUOMDefault], [cdePrice], [optSetPriceByMargin], [optDiscontinued], [dteAction], [optRoundTo9], [cdePAR], [dteAdded], [cdeLastUSERID], [optNoMoreDiscounts], [cdeManu], [cdeClass], [cdeSubClass], [cdeLoc], [dscUpdateInfo], [dteLastRec], [numLastRecQty], [cdeClaimType], [cdePackStatus], [cdeCvrsID], [cdeQtyRank], [cdePreviousQtyRank], [cdeDolRank], [cdePreviousDolRank], [dteRankCalc], [optRankLock], [numRank], [numMinWeeks], [numMaxWeeks], [optWeeksLock], [optIncludePromo], [optORD_MULT2_LOCK], [optORD_MULT3_LOCK], [numOrdMin], [numOrdMax], [dteMinMaxCalc], [optEORetailLock], [numDesMargin], [cdeTruBlueInd], [cdeNonStockSkuInd], [cdeAssortmentInd], [numLastCount], [dteLastCount], [SyncStatus], [numORD_MULT4], [curMULT_4COST], [optTiered], [optORD_MULT4_LOCK], [cdeCoreItem], [cdeRetailAssortment], [cdeGreenItem], [cdeImageID], [cdeToBeDiscontinued], [dteTBD], [dteDiscontinued], [cdeSubsItemTypeCD], [cdeCouponSource], [cdeCouponType], [numUnitWt], [cdeDIBStatus], [cdeSubstitute], [optAdder], [curFreightCost], [numQtyCommitted], [optAGItem], [optCentrallyPriced], [optPriceByMargin], [optFollowDIBRetail], [cdeDiscontinueReason], [curMinSelling_PRICE], [cdeUnitOfMeasureItem], [cdeECommerceFlag], [curRPELevel1Retail], [curRPELevel2Retail], [curEcommercePrice], [cdeCentralShipInd], [cdeVariablePricingMethodCD], [cdeBrandName], [numUnitQty], [cdeUnitText], [cdeVisibilityFlag], [optPOSAlertNote], [cdeMadeInUSA], [cdeSubCategory], [numRoundToX], [optAceInstantSavings], [cdeProductType], [dteDIBRetailInventory], [numDIBCaseMultCode], [cdeDIBCountryOfOrigin], [cdeDIBUPSSwitch], [cdeDIBCentralStockSwitch], [numDIBExceptionQty], [numDIBMaxQty], [cdeDIBPriceCode], [cdeDIBNewItemInd], [cdeDIBPromoStatus], [cdeDIBSubstitute2]) VALUES (N'032076068363', N'3Func DGTL Multimeter', NULL, N'17', NULL, N'NY', 2, 24.99, 20.99, 1, N'TRU', N'766095', N'', N'', N'', N'', N'', N'', 0, 1, 1, 1, 10.53, 4, 10.17, 0, 0, N'GDT-311', NULL, NULL, NULL, N'TRU120142', 0, 0.0000, N'0', CAST(N'2021-12-01T10:05:51.000' AS DateTime), N'A187734', N'E', NULL, 10.849, 0, 0, 10.91, 0, 0, 0, 0, 0, 0, 37, 924.63, 0, NULL, NULL, 0, 1, 1, 1, 0, 56.59, 0, N'17', N'S', 0, 0, CAST(N'2022-02-14T10:57:22.273' AS DateTime), 0, NULL, CAST(N'2016-12-07T13:40:36.000' AS DateTime), N'FMNT', 1, N'17467', N'75', N'16', NULL, NULL, CAST(N'2021-12-10T14:48:46.000' AS DateTime), 1, N'A', N'B', NULL, N'B', N'B', N'A', N'A', CAST(N'2017-11-30T13:48:26.000' AS DateTime), 0, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, 0, 0, N'', N'', N'', 0, NULL, N'0', 0, 0, 0, 0, N'Y', N'1', N'N', N'~/images/0001.jpg', NULL, NULL, NULL, NULL, NULL, NULL, 0.06, NULL, N'', 0, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, NULL, 22.99, 24.99, 0, NULL, N'', NULL, 0, NULL, NULL, 0, N'N', N'', 9, 0, N'', CAST(N'2016-12-07T13:40:37.090' AS DateTime), 0, N'', N'', N'', 0, 0, N'', N'', N'', N'')
INSERT [dbo].[tTaxRates] ([cdeTax], [dscShortTax], [dscLongTax], [numRate], [numMinimum], [optDefault], [optActive], [cdeRounding], [SyncStatus]) VALUES (N'0', N'NonTX', N'Non Taxable', 0, 0, 0, 1, N'U', NULL)
INSERT [dbo].[tTaxRates] ([cdeTax], [dscShortTax], [dscLongTax], [numRate], [numMinimum], [optDefault], [optActive], [cdeRounding], [SyncStatus]) VALUES (N'1', N'State', N'State Tax', 8.875, 0.01, 0, 0, N'N', NULL)
INSERT [dbo].[tTaxRates] ([cdeTax], [dscShortTax], [dscLongTax], [numRate], [numMinimum], [optDefault], [optActive], [cdeRounding], [SyncStatus]) VALUES (N'8', N'EXEMT', N'Tax Exempt', 0, 0, 0, 1, N'U', NULL)
INSERT [dbo].[tTaxRates] ([cdeTax], [dscShortTax], [dscLongTax], [numRate], [numMinimum], [optDefault], [optActive], [cdeRounding], [SyncStatus]) VALUES (N'NY', N'NY TX', N'New York Sales Tax', 8.875, 0.1, 1, 1, N'N', N'0')
INSERT [dbo].[tUOM] ([cdeUOM], [dscUOM], [dscLongUOM], [dscDIBUOM]) VALUES (N'01', N'ASMT', N'ASSORTMENT', N'AS')
INSERT [dbo].[tUOM] ([cdeUOM], [dscUOM], [dscLongUOM], [dscDIBUOM]) VALUES (N'02', N'BAG', N'BAG', N'BG')
INSERT [dbo].[tUOM] ([cdeUOM], [dscUOM], [dscLongUOM], [dscDIBUOM]) VALUES (N'03', N'BALL', N'BALL', NULL)
INSERT [dbo].[tUOM] ([cdeUOM], [dscUOM], [dscLongUOM], [dscDIBUOM]) VALUES (N'04', N'BALE', N'BALE', N'BL')
INSERT [dbo].[tUOM] ([cdeUOM], [dscUOM], [dscLongUOM], [dscDIBUOM]) VALUES (N'05', N'BDFT', N'BOARD FEET', N'BF')
INSERT [dbo].[tUOM] ([cdeUOM], [dscUOM], [dscLongUOM], [dscDIBUOM]) VALUES (N'06', N'BOX', N'BOX', N'BX')
INSERT [dbo].[tUOM] ([cdeUOM], [dscUOM], [dscLongUOM], [dscDIBUOM]) VALUES (N'07', N'CAN', N'CAN', N'CN')
INSERT [dbo].[tUOM] ([cdeUOM], [dscUOM], [dscLongUOM], [dscDIBUOM]) VALUES (N'08', N'CARD', N'CARD', N'CD')
INSERT [dbo].[tUOM] ([cdeUOM], [dscUOM], [dscLongUOM], [dscDIBUOM]) VALUES (N'09', N'CTN', N'CARTON', N'CT')
INSERT [dbo].[tUOM] ([cdeUOM], [dscUOM], [dscLongUOM], [dscDIBUOM]) VALUES (N'10', N'CASE', N'CASE', N'CS')
INSERT [dbo].[tUOM] ([cdeUOM], [dscUOM], [dscLongUOM], [dscDIBUOM]) VALUES (N'11', N'C.I.', N'COMBINED INCH', NULL)
INSERT [dbo].[tUOM] ([cdeUOM], [dscUOM], [dscLongUOM], [dscDIBUOM]) VALUES (N'12', N'COIL', N'COIL', N'CL')
INSERT [dbo].[tUOM] ([cdeUOM], [dscUOM], [dscLongUOM], [dscDIBUOM]) VALUES (N'13', N'CONE', N'CONE', NULL)
INSERT [dbo].[tUOM] ([cdeUOM], [dscUOM], [dscLongUOM], [dscDIBUOM]) VALUES (N'14', N'DEAL', N'DEAL', N'DL')
INSERT [dbo].[tUOM] ([cdeUOM], [dscUOM], [dscLongUOM], [dscDIBUOM]) VALUES (N'16', N'DRUM', N'DRUM', N'DR')
INSERT [dbo].[tUOM] ([cdeUOM], [dscUOM], [dscLongUOM], [dscDIBUOM]) VALUES (N'17', N'EACH', N'EACH', N'EA')
INSERT [dbo].[tUOM] ([cdeUOM], [dscUOM], [dscLongUOM], [dscDIBUOM]) VALUES (N'18', N'ENV', N'ENVELOPE', N'EN')
INSERT [dbo].[tUOM] ([cdeUOM], [dscUOM], [dscLongUOM], [dscDIBUOM]) VALUES (N'19', N'FOOT', N'FOOT, LINEAR', N'FT')
INSERT [dbo].[tUOM] ([cdeUOM], [dscUOM], [dscLongUOM], [dscDIBUOM]) VALUES (N'20', N'FRAM', N'FRAME', NULL)
INSERT [dbo].[tUOM] ([cdeUOM], [dscUOM], [dscLongUOM], [dscDIBUOM]) VALUES (N'21', N'GAL', N'GALLON', N'GL')
INSERT [dbo].[tUOM] ([cdeUOM], [dscUOM], [dscLongUOM], [dscDIBUOM]) VALUES (N'22', N'KIT', N'KIT', N'KT')
INSERT [dbo].[tUOM] ([cdeUOM], [dscUOM], [dscLongUOM], [dscDIBUOM]) VALUES (N'23', N'LB', N'POUND', N'LB')
INSERT [dbo].[tUOM] ([cdeUOM], [dscUOM], [dscLongUOM], [dscDIBUOM]) VALUES (N'24', N'LGTH', N'LENGTH', N'LG')
INSERT [dbo].[tUOM] ([cdeUOM], [dscUOM], [dscLongUOM], [dscDIBUOM]) VALUES (N'25', N'LOT', N'LOT', NULL)
INSERT [dbo].[tUOM] ([cdeUOM], [dscUOM], [dscLongUOM], [dscDIBUOM]) VALUES (N'26', N'M-FT', N'1000 FEET', NULL)
INSERT [dbo].[tUOM] ([cdeUOM], [dscUOM], [dscLongUOM], [dscDIBUOM]) VALUES (N'27', N'PKG', N'PACK', N'PK')
INSERT [dbo].[tUOM] ([cdeUOM], [dscUOM], [dscLongUOM], [dscDIBUOM]) VALUES (N'28', N'PAIR', N'PAIR', N'PR')
INSERT [dbo].[tUOM] ([cdeUOM], [dscUOM], [dscLongUOM], [dscDIBUOM]) VALUES (N'29', N'PAIL', N'PAIL', NULL)
INSERT [dbo].[tUOM] ([cdeUOM], [dscUOM], [dscLongUOM], [dscDIBUOM]) VALUES (N'30', N'PC', N'PIECE', N'PC')
INSERT [dbo].[tUOM] ([cdeUOM], [dscUOM], [dscLongUOM], [dscDIBUOM]) VALUES (N'32', N'RACK', N'RACK', N'RK')
INSERT [dbo].[tUOM] ([cdeUOM], [dscUOM], [dscLongUOM], [dscDIBUOM]) VALUES (N'33', N'REEL', N'REEL', N'RE')
INSERT [dbo].[tUOM] ([cdeUOM], [dscUOM], [dscLongUOM], [dscDIBUOM]) VALUES (N'34', N'ROLL', N'ROLL', N'RL')
INSERT [dbo].[tUOM] ([cdeUOM], [dscUOM], [dscLongUOM], [dscDIBUOM]) VALUES (N'35', N'SET', N'SET', N'ST')
INSERT [dbo].[tUOM] ([cdeUOM], [dscUOM], [dscLongUOM], [dscDIBUOM]) VALUES (N'36', N'SHT', N'SHEET', N'SH')
INSERT [dbo].[tUOM] ([cdeUOM], [dscUOM], [dscLongUOM], [dscDIBUOM]) VALUES (N'37', N'SLEV', N'SLEEVE', NULL)
INSERT [dbo].[tUOM] ([cdeUOM], [dscUOM], [dscLongUOM], [dscDIBUOM]) VALUES (N'38', N'SPL', N'SPOOL', N'SP')
INSERT [dbo].[tUOM] ([cdeUOM], [dscUOM], [dscLongUOM], [dscDIBUOM]) VALUES (N'39', N'SQFT', N'SQUARE FEET', N'SF')
INSERT [dbo].[tUOM] ([cdeUOM], [dscUOM], [dscLongUOM], [dscDIBUOM]) VALUES (N'41', N'TUBE', N'TUBE', N'TB')
INSERT [dbo].[tUOM] ([cdeUOM], [dscUOM], [dscLongUOM], [dscDIBUOM]) VALUES (N'42', N'YARD', N'YARD, LINEAR', N'YD')
INSERT [dbo].[tUOM] ([cdeUOM], [dscUOM], [dscLongUOM], [dscDIBUOM]) VALUES (N'44', N'DISP', N'DISPLAY', NULL)
INSERT [dbo].[tUOM] ([cdeUOM], [dscUOM], [dscLongUOM], [dscDIBUOM]) VALUES (N'45', N'PT', N'PINT', N'PT')
INSERT [dbo].[tUOM] ([cdeUOM], [dscUOM], [dscLongUOM], [dscDIBUOM]) VALUES (N'46', N'QT', N'QUART', N'QT')
INSERT [dbo].[tUOM] ([cdeUOM], [dscUOM], [dscLongUOM], [dscDIBUOM]) VALUES (N'47', N'HPT', N'HALF PINT', N'HP')
INSERT [dbo].[tUOM] ([cdeUOM], [dscUOM], [dscLongUOM], [dscDIBUOM]) VALUES (N'48', N'SQ', N'SQUARE', N'SQ')
INSERT [dbo].[tUOM] ([cdeUOM], [dscUOM], [dscLongUOM], [dscDIBUOM]) VALUES (N'49', N'MILE', N'MILE', NULL)
INSERT [dbo].[tUOM] ([cdeUOM], [dscUOM], [dscLongUOM], [dscDIBUOM]) VALUES (N'4H', N'4HR', N'4 HOUR RATE', NULL)
INSERT [dbo].[tUOM] ([cdeUOM], [dscUOM], [dscLongUOM], [dscDIBUOM]) VALUES (N'50', N'BNDL', N'BUNDLE', NULL)
INSERT [dbo].[tUOM] ([cdeUOM], [dscUOM], [dscLongUOM], [dscDIBUOM]) VALUES (N'51', N'BULB', N'BULB', NULL)
INSERT [dbo].[tUOM] ([cdeUOM], [dscUOM], [dscLongUOM], [dscDIBUOM]) VALUES (N'5G', N'5GAL', N'5 GALLON', N'5G')
INSERT [dbo].[tUOM] ([cdeUOM], [dscUOM], [dscLongUOM], [dscDIBUOM]) VALUES (N'62', N'DUOM', N'DUOM', NULL)
INSERT [dbo].[tUOM] ([cdeUOM], [dscUOM], [dscLongUOM], [dscDIBUOM]) VALUES (N'AL', N'ALL', N'ALL UOM', NULL)
INSERT [dbo].[tUOM] ([cdeUOM], [dscUOM], [dscLongUOM], [dscDIBUOM]) VALUES (N'BAT', N'BATTS', N'BATTS', NULL)
INSERT [dbo].[tUOM] ([cdeUOM], [dscUOM], [dscLongUOM], [dscDIBUOM]) VALUES (N'BV', N'BEVEL', N'BEVEL', NULL)
INSERT [dbo].[tUOM] ([cdeUOM], [dscUOM], [dscLongUOM], [dscDIBUOM]) VALUES (N'DA', N'DAY', N'DAY RATE', N'DY')
INSERT [dbo].[tUOM] ([cdeUOM], [dscUOM], [dscLongUOM], [dscDIBUOM]) VALUES (N'HR', N'HOUR', N'HOURLY RATE', N'HR')
INSERT [dbo].[tUOM] ([cdeUOM], [dscUOM], [dscLongUOM], [dscDIBUOM]) VALUES (N'IN', N'INCH', N'INCH', N'IN')
INSERT [dbo].[tUOM] ([cdeUOM], [dscUOM], [dscLongUOM], [dscDIBUOM]) VALUES (N'JR', N'JAR', N'JAR', N'JR')
INSERT [dbo].[tUOM] ([cdeUOM], [dscUOM], [dscLongUOM], [dscDIBUOM]) VALUES (N'JT', N'JOINT', N'JOINT', N'JT')
INSERT [dbo].[tUOM] ([cdeUOM], [dscUOM], [dscLongUOM], [dscDIBUOM]) VALUES (N'MR', N'M-ROLL', N'1000 ROLL', N'MR')
INSERT [dbo].[tUOM] ([cdeUOM], [dscUOM], [dscLongUOM], [dscDIBUOM]) VALUES (N'MS', N'1000SqFt', N'1000 Square Feet', N'MS')
INSERT [dbo].[tUOM] ([cdeUOM], [dscUOM], [dscLongUOM], [dscDIBUOM]) VALUES (N'MT', N'MONTH', N'MONTHLY RATE', NULL)
INSERT [dbo].[tUOM] ([cdeUOM], [dscUOM], [dscLongUOM], [dscDIBUOM]) VALUES (N'PD', N'PAD', N'PAD', NULL)
INSERT [dbo].[tUOM] ([cdeUOM], [dscUOM], [dscLongUOM], [dscDIBUOM]) VALUES (N'PT', N'PALLT', N'PALLET', N'PL')
INSERT [dbo].[tUOM] ([cdeUOM], [dscUOM], [dscLongUOM], [dscDIBUOM]) VALUES (N'SYD', N'SQYD', N'SQUARE YARD', NULL)
INSERT [dbo].[tUOM] ([cdeUOM], [dscUOM], [dscLongUOM], [dscDIBUOM]) VALUES (N'WK', N'WEEK', N'WEEKLY RATE', N'WK')
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[18] 4[42] 2[20] 3) )"
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
         Begin Table = "tProducts"
            Begin Extent = 
               Top = 10
               Left = 67
               Bottom = 550
               Right = 449
            End
            DisplayFlags = 280
            TopColumn = 103
         End
         Begin Table = "tDept"
            Begin Extent = 
               Top = 10
               Left = 516
               Bottom = 240
               Right = 802
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tUOM"
            Begin Extent = 
               Top = 10
               Left = 869
               Bottom = 240
               Right = 1117
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tax_view"
            Begin Extent = 
               Top = 10
               Left = 1184
               Bottom = 176
               Right = 1432
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
      Begin ColumnWidths = 9
         Width = 284
         Width = 857
         Width = 857
         Width = 857
         Width = 857
         Width = 857
         Width = 857
         Width = 857
         Width = 857
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
   End' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'products_qry'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'products_qry'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'products_qry'
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'tax_view'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'tax_view'
GO
