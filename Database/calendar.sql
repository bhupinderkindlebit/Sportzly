-- drop table Calendar

/****** Object:  Table [dbo].[calendar]    Script Date: 04/27/2012 19:48:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Calendar](
	[calendarId] [bigint] IDENTITY(1,1) NOT NULL,
	[Subject] [varchar](max) NULL,
	[Location] [varchar](max) NULL,
	[Description] [varchar](max) NULL,
	[StartTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[IsAllDayEvent] [tinyint] NOT NULL default(0),
	[Color] [tinyint] NOT NULL default(1),
	[IsRecurring] [tinyint] NOT NULL default(0),
	[IsEditable] [tinyint] NOT NULL default(1),
	[CalendarType] [nvarchar](10) NOT NULL default 'u',
	[TypeId] [bigint] NOT NULL default(1),
 CONSTRAINT [PK_calendar] PRIMARY KEY CLUSTERED 
(
	[calendarId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO



SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[calendar] ON
INSERT [dbo].[calendar] ([calendarId], [Subject], [Location], [Description], [StartTime], [EndTime], [IsAllDayEvent], [Color], [IsRecurring], [IsEditable]) VALUES (1, N'Merry Christmas!', N'Merry Christmas!', N'Merry Christmas!', CAST(0x00009FC400000000 AS DateTime), CAST(0x00009FC400000000 AS DateTime), 1, 9, 0, 1)
INSERT [dbo].[calendar] ([calendarId], [Subject], [Location], [Description], [StartTime], [EndTime], [IsAllDayEvent], [Color], [IsRecurring], [IsEditable]) VALUES (2, N'Adamson University Christmas Vacation!', N'Adamson University', NULL, CAST(0x00009FBC00000000 AS DateTime), CAST(0x00009FCA00000000 AS DateTime), 1, 5, 0, 1)
INSERT [dbo].[calendar] ([calendarId], [Subject], [Location], [Description], [StartTime], [EndTime], [IsAllDayEvent], [Color], [IsRecurring], [IsEditable]) VALUES (3, N'Rizal Day!', NULL, NULL, CAST(0x00009FC900000000 AS DateTime), CAST(0x00009FC900000000 AS DateTime), 1, 14, 0, 1)
INSERT [dbo].[calendar] ([calendarId], [Subject], [Location], [Description], [StartTime], [EndTime], [IsAllDayEvent], [Color], [IsRecurring], [IsEditable]) VALUES (4, N'Done with wdCalendar ASP .Net MVC 2 Conversion', N'', N'', CAST(0x00009FBF00000000 AS DateTime), CAST(0x00009FBF00000000 AS DateTime), 1, 3, 0, 1)
INSERT [dbo].[calendar] ([calendarId], [Subject], [Location], [Description], [StartTime], [EndTime], [IsAllDayEvent], [Color], [IsRecurring], [IsEditable]) VALUES (5, N'CME! Happy Monsary Mi!', NULL, NULL, CAST(0x00009FB500000000 AS DateTime), CAST(0x00009FB500000000 AS DateTime), 1, 13, 0, 1)
INSERT [dbo].[calendar] ([calendarId], [Subject], [Location], [Description], [StartTime], [EndTime], [IsAllDayEvent], [Color], [IsRecurring], [IsEditable]) VALUES (6, N'Bonifacio Day!', NULL, NULL, CAST(0x00009FAB00000000 AS DateTime), CAST(0x00009FAB00000000 AS DateTime), 1, 17, 0, 1)
INSERT [dbo].[calendar] ([calendarId], [Subject], [Location], [Description], [StartTime], [EndTime], [IsAllDayEvent], [Color], [IsRecurring], [IsEditable]) VALUES (8, N'Blue Field', N'North Bound', N'Field Clearance Operations', CAST(0x00009FE900000000 AS DateTime), CAST(0x00009FEA00000000 AS DateTime), 1, 6, 0, 1)
INSERT [dbo].[calendar] ([calendarId], [Subject], [Location], [Description], [StartTime], [EndTime], [IsAllDayEvent], [Color], [IsRecurring], [IsEditable]) VALUES (19, N'new event', NULL, NULL, CAST(0x00009FE900000000 AS DateTime), CAST(0x00009FE900000000 AS DateTime), 1, 4, 0, 1)
INSERT [dbo].[calendar] ([calendarId], [Subject], [Location], [Description], [StartTime], [EndTime], [IsAllDayEvent], [Color], [IsRecurring], [IsEditable]) VALUES (21, N'event 2', N'ddd', NULL, CAST(0x0000A03700000000 AS DateTime), CAST(0x0000A03700000000 AS DateTime), 1, 1, 0, 1)
INSERT [dbo].[calendar] ([calendarId], [Subject], [Location], [Description], [StartTime], [EndTime], [IsAllDayEvent], [Color], [IsRecurring], [IsEditable]) VALUES (23, N'Christmas Day!', N'SAI', N'Happy Ako', CAST(0x0000A13200000000 AS DateTime), CAST(0x0000A13200000000 AS DateTime), 1, 18, 0, 1)
INSERT [dbo].[calendar] ([calendarId], [Subject], [Location], [Description], [StartTime], [EndTime], [IsAllDayEvent], [Color], [IsRecurring], [IsEditable]) VALUES (27, N'sad', NULL, NULL, CAST(0x0000A03700000000 AS DateTime), CAST(0x0000A03700000000 AS DateTime), 1, 11, 0, 1)
INSERT [dbo].[calendar] ([calendarId], [Subject], [Location], [Description], [StartTime], [EndTime], [IsAllDayEvent], [Color], [IsRecurring], [IsEditable]) VALUES (32, N'asd', N'sss', NULL, CAST(0x0000A0370128A180 AS DateTime), CAST(0x0000A03701391C40 AS DateTime), 0, 2, 0, 1)
INSERT [dbo].[calendar] ([calendarId], [Subject], [Location], [Description], [StartTime], [EndTime], [IsAllDayEvent], [Color], [IsRecurring], [IsEditable]) VALUES (36, N'Another Post with additional column', NULL, NULL, CAST(0x0000A03100000000 AS DateTime), CAST(0x0000A03100000000 AS DateTime), 1, 3, 0, 1)
INSERT [dbo].[calendar] ([Subject], [Location], [Description], [StartTime], [EndTime], [IsAllDayEvent], [Color], [IsRecurring], [IsEditable]) 
VALUES ( N'This is my event!1111', N'Merry Christmas!', N'Merry Christmas!', getdate(), getdate(), 1, 9, 0, 1)
INSERT [dbo].[calendar] ([Subject], [Location], [Description], [StartTime], [EndTime], [IsAllDayEvent], [Color], [IsRecurring], [IsEditable]) 
VALUES ( N'Merry Christmas!___TEST', N'Merry Christmas!', N'Merry Christmas!', getdate(), getdate(), 1, 9, 0, 1)
SET IDENTITY_INSERT [dbo].[calendar] OFF
/****** Object:  StoredProcedure [dbo].[usp_getCalendars]    Script Date: 04/27/2012 19:48:04 ******/


