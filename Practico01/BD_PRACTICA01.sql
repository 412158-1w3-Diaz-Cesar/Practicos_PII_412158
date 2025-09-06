--SET IDENTITY_INSERT t_articulos ON;
--drop database DB_PRACTICA01

USE [master]
GO

CREATE DATABASE [DB_PRACTICA01]
GO
USE [DB_PRACTICA01]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_DETALLES_FACTURA](
	[id_detalle] [int] NOT NULL,
	[id_factura] [int] NOT NULL,
	[id_articulo] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[precio] [float] NOT NULL,
 CONSTRAINT [PK_Detalles_Factura] PRIMARY KEY CLUSTERED 
(
	[id_detalle] ASC,
	[id_factura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Facturas](
	[id_factura] [int] IDENTITY(1,1) NOT NULL,
	[cliente] [varchar](50) NOT NULL,
	[fecha] [datetime] NOT NULL,
 CONSTRAINT [PK_T_Presupuestos] PRIMARY KEY CLUSTERED 
(
	[id_factura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Productos]    Script Date: 8/25/2025 10:18:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Articulos](
	[id_articulo] [int] IDENTITY(1,1) NOT NULL,
	[n_articulo] [varchar](50) NOT NULL,
	[stock] [int] NOT NULL,
	[esta_activo] [bit] NOT NULL,
	[precio] [float] NULL,
 CONSTRAINT [PK_T_Articulos] PRIMARY KEY CLUSTERED 
(
	[id_articulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[T_Detalles_Factura] ([id_detalle], [id_factura], [id_articulo], [cantidad], [precio]) VALUES (1, 1, 1, 10, 100)
GO
INSERT [dbo].[T_Detalles_Factura] ([id_detalle], [id_factura], [id_articulo], [cantidad], [precio]) VALUES (1, 2, 1, 1, 500)
GO
INSERT [dbo].[T_Detalles_Factura] ([id_detalle], [id_factura], [id_articulo], [cantidad], [precio]) VALUES (2, 1, 2, 5, 200)
GO
SET IDENTITY_INSERT [dbo].[T_Facturas] ON 
GO
INSERT [dbo].[T_Facturas] ([id_factura], [cliente], [fecha]) VALUES (1, N'Cliente de prueba', CAST(N'2024-09-02T16:58:03.200' AS DateTime))
GO
INSERT [dbo].[T_Facturas] ([id_factura], [cliente], [fecha]) VALUES (2, N'Cliente 2', CAST(N'2024-09-02T17:08:18.470' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[T_facturas] OFF
GO
SET IDENTITY_INSERT [dbo].[T_articulos] ON 
GO
INSERT [dbo].[T_articulos] ([id_articulo], [n_articulo], [stock], [esta_activo], [precio]) VALUES (1, N'Coca Cola Zero 2.25 L', 200, 1, 4599.99)
GO
INSERT [dbo].[T_articulos] ([id_articulo], [n_articulo], [stock], [esta_activo], [precio]) VALUES (2, N'Pritty Limón 3L', 150, 1, 2346.75)
GO
INSERT [dbo].[T_articulos] ([id_articulo], [n_articulo], [stock], [esta_activo], [precio]) VALUES (3, N'Paso de los Toros Pomelo 1.5L', 250, 1, 2279.25)
GO
INSERT [dbo].[T_articulos] ([id_articulo], [n_articulo], [stock], [esta_activo], [precio]) VALUES (4, N'7up Lima Limón', 225, 1, 1823.4)
GO
INSERT [dbo].[T_articulos] ([id_articulo], [n_articulo], [stock], [esta_activo], [precio]) VALUES (5, N'Schweppes Zero Pomelo', 250, 1, 2990)
GO
SET IDENTITY_INSERT [dbo].[T_Articulos] OFF
GO
ALTER TABLE [dbo].[T_Detalles_Factura]  WITH CHECK ADD  CONSTRAINT [FK_Detalles_Factura_T_Facturas] FOREIGN KEY([id_factura])
REFERENCES [dbo].[T_facturas] ([id_factura])
GO
ALTER TABLE [dbo].[T_Detalles_Factura] CHECK CONSTRAINT [FK_Detalles_Factura_T_Facturas]
GO
ALTER TABLE [dbo].[T_Detalles_Factura]  WITH CHECK ADD  CONSTRAINT [FK_Detalles_Factura_T_Articulos] FOREIGN KEY([id_articulo])
REFERENCES [dbo].[T_articulos] ([id_articulo])
GO
ALTER TABLE [dbo].[T_Detalles_Factura] CHECK CONSTRAINT [FK_Detalles_Factura_T_Facturas]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GUARDAR_ARTICULO]
@id_articulo int ,
@nombre varchar(20),
@stock int
AS
BEGIN 
	IF @id_articulo = 0
		BEGIN
			insert into T_Articulos(n_articulo, stock, esta_activo) 
			values (@nombre,@stock, 1)	
		END
	ELSE
		BEGIN
			update T_Articulos 
			set n_articulo= @nombre, stock= @stock 
			where id_articulo=@id_articulo
		END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_INSERTAR_DETALLE]    Script Date: 8/25/2025 10:18:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_INSERTAR_DETALLE] 
	@factura int,
	@id_detalle int,
	@id_articulo int,
	@cantidad int,
	@precio float

AS
BEGIN
	INSERT INTO T_DETALLES_FACTURA(id_detalle, id_factura, id_articulo, cantidad, precio) VALUES (@id_detalle, @factura, @id_articulo, @cantidad, @precio);
	
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_INSERTAR_MAESTRO] 
	@cliente varchar(50),
	@id_factura int output
AS
BEGIN
	INSERT INTO T_Facturas(cliente, fecha) VALUES (@cliente, GETDATE());
	SET @id_factura = SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[SP_RECUPERAR_PRESUPUESTO_POR_ID]    Script Date: 8/25/2025 10:18:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_RECUPERAR_FACTURA_POR_ID]
	@id_factura int
AS
BEGIN
	SELECT F.*, df.precio, df.cantidad, A.*
	  FROM T_Facturas F
	  INNER JOIN T_DETALLES_FACTURA df ON df.id_factura =f.id_factura
	  INNER JOIN T_Articulos A ON (A.id_articulo = df.id_articulo)
	  WHERE f.id_factura = @id_factura;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_RECUPERAR_PRESUPUESTOS]    Script Date: 8/25/2025 10:18:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_RECUPERAR_FACTURAS]
AS
BEGIN
	SELECT f.*, df.precio, df.cantidad, A.*
	  FROM T_Facturas f
	  INNER JOIN T_DETALLES_FACTURA df ON df.id_factura =f.id_factura
	  INNER JOIN T_Articulos A ON (A.id_articulo = df.id_articulo)

	  ORDER BY F.id_factura;
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_RECUPERAR_ARTICULO_POR_CODIGO]
	@id_articulo int
AS
BEGIN
	SELECT * FROM T_Articulos WHERE id_articulo = @id_articulo;
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_RECUPERAR_ARTICULOS] 
AS
BEGIN
	SELECT * FROM T_Articulos
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_REGISTRAR_BAJA_ARTICULO] 
	@id_articulo int 

AS
BEGIN
	UPDATE T_Articulos SET esta_activo = 0 WHERE id_articulo = @id_articulo;
END
GO
USE [master]
GO
ALTER DATABASE [DB_PRACTICA01] SET  READ_WRITE 
GO
