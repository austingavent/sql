-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


SET XACT_ABORT ON

BEGIN TRANSACTION QUICKDBD

CREATE TABLE [card_holder] (
    [id] INT  NOT NULL ,
    [name] VARCHAR(288)  NOT NULL ,
    CONSTRAINT [PK_card_holder] PRIMARY KEY CLUSTERED (
        [id] ASC
    )
)

CREATE TABLE [credit_card] (
    [card] VARCHAR(28)  NOT NULL ,
    [id_card_holder] INT  NOT NULL ,
    CONSTRAINT [PK_credit_card] PRIMARY KEY CLUSTERED (
        [card] ASC
    )
)

CREATE TABLE [merchant_category] (
    [id] INT  NOT NULL ,
    [name] VARCHAR(100)  NOT NULL ,
    CONSTRAINT [PK_merchant_category] PRIMARY KEY CLUSTERED (
        [id] ASC
    )
)

CREATE TABLE [merchant] (
    [id] INT  NOT NULL ,
    [name] VARCHAR(288)  NOT NULL ,
    [id_merchant_category] INT  NOT NULL ,
    CONSTRAINT [PK_merchant] PRIMARY KEY CLUSTERED (
        [id] ASC
    )
)

CREATE TABLE [transaction] (
    [id] INT  NOT NULL ,
    [date] TIMESTAMP  NOT NULL ,
    [amount] FLOAT  NOT NULL ,
    [card] VARCHAR(20)  NOT NULL ,
    [id_merchant] INT  NOT NULL ,
    CONSTRAINT [PK_transaction] PRIMARY KEY CLUSTERED (
        [id] ASC
    )
)

ALTER TABLE [credit_card] WITH CHECK ADD CONSTRAINT [FK_credit_card_id_card_holder] FOREIGN KEY([id_card_holder])
REFERENCES [card_holder] ([id])

ALTER TABLE [credit_card] CHECK CONSTRAINT [FK_credit_card_id_card_holder]

ALTER TABLE [merchant] WITH CHECK ADD CONSTRAINT [FK_merchant_id_merchant_category] FOREIGN KEY([id_merchant_category])
REFERENCES [merchant_category] ([id])

ALTER TABLE [merchant] CHECK CONSTRAINT [FK_merchant_id_merchant_category]

ALTER TABLE [transaction] WITH CHECK ADD CONSTRAINT [FK_transaction_card] FOREIGN KEY([card])
REFERENCES [credit_card] ([card])

ALTER TABLE [transaction] CHECK CONSTRAINT [FK_transaction_card]

ALTER TABLE [transaction] WITH CHECK ADD CONSTRAINT [FK_transaction_id_merchant] FOREIGN KEY([id_merchant])
REFERENCES [merchant] ([id])

ALTER TABLE [transaction] CHECK CONSTRAINT [FK_transaction_id_merchant]

COMMIT TRANSACTION QUICKDBD