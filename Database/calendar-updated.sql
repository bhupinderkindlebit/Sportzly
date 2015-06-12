USE [Stance_Sportzly]
GO

/****** Object:  Table [dbo].[CalendarAttendees]    Script Date: 10/28/2013 1:56:02 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[CalendarAttendees](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[calendarId] [bigint] NOT NULL,
	[attendeesEmail] [varchar](200) NOT NULL,
	[response] [varchar](10) NULL,
	[lastUpdated] [datetime] NULL,
 CONSTRAINT [PK_CalendarAttendees] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[Calendar](
	[calendarId] [bigint] IDENTITY(1,1) NOT NULL,
	[Subject] [varchar](max) NULL,
	[Location] [varchar](max) NULL,
	[Description] [varchar](max) NULL,
	[StartTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[IsAllDayEvent] [tinyint] NOT NULL,
	[Color] [tinyint] NOT NULL,
	[IsRecurring] [tinyint] NOT NULL,
	[IsEditable] [tinyint] NOT NULL,
	[CalendarType] [nvarchar](10) NOT NULL,
	[TeamId] [bigint] NOT NULL,
	[Season] [varchar](8000) NULL,
	[AddressLine] [varchar](8000) NULL,
	[City] [varchar](200) NULL,
	[Country] [varchar](200) NULL,
	[State] [varchar](200) NULL,
	[userId] [numeric](10, 0) NOT NULL,
	[parentId] [bigint] NULL,
 CONSTRAINT [PK_calendar] PRIMARY KEY CLUSTERED 
(
	[calendarId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[Calendar] ADD  CONSTRAINT [DF__Calendar__IsAllD__3DE82FB7]  DEFAULT ((0)) FOR [IsAllDayEvent]
GO

ALTER TABLE [dbo].[Calendar] ADD  CONSTRAINT [DF__Calendar__Color__3EDC53F0]  DEFAULT ((1)) FOR [Color]
GO

ALTER TABLE [dbo].[Calendar] ADD  CONSTRAINT [DF__Calendar__IsRecu__3FD07829]  DEFAULT ((0)) FOR [IsRecurring]
GO

ALTER TABLE [dbo].[Calendar] ADD  CONSTRAINT [DF__Calendar__IsEdit__40C49C62]  DEFAULT ((1)) FOR [IsEditable]
GO

ALTER TABLE [dbo].[Calendar] ADD  CONSTRAINT [DF__Calendar__Calend__41B8C09B]  DEFAULT ('u') FOR [CalendarType]
GO

ALTER TABLE [dbo].[Calendar] ADD  CONSTRAINT [DF__Calendar__TypeId__42ACE4D4]  DEFAULT ((1)) FOR [TeamId]
GO

ALTER TABLE [dbo].[Calendar]  WITH CHECK ADD  CONSTRAINT [FK_Calendar_Calendar] FOREIGN KEY([parentId])
REFERENCES [dbo].[Calendar] ([calendarId])
GO

ALTER TABLE [dbo].[Calendar] CHECK CONSTRAINT [FK_Calendar_Calendar]
GO

ALTER TABLE [dbo].[Calendar]  WITH CHECK ADD  CONSTRAINT [FK_Calendar_Users] FOREIGN KEY([userId])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[Calendar] CHECK CONSTRAINT [FK_Calendar_Users]
GO


SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[CalendarAttendees]  WITH CHECK ADD  CONSTRAINT [FK_CalendarAttendees_Calendar] FOREIGN KEY([calendarId])
REFERENCES [dbo].[Calendar] ([calendarId])
GO

ALTER TABLE [dbo].[CalendarAttendees] CHECK CONSTRAINT [FK_CalendarAttendees_Calendar]
GO


