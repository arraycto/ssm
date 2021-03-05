/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2020/1/26 18:54:23                           */
/*==============================================================*/


/*==============================================================*/
/* Table: DEP                                                   */
/*==============================================================*/
create table DEP
(
   UUID                 numeric(8,0) not null comment '编号',
   NAME                 varchar(30) comment '部门名称',
   TELE                 varchar(30) comment '联系电话',
   primary key (UUID)
);

alter table DEP comment '部门';

/*==============================================================*/
/* Table: EMP                                                   */
/*==============================================================*/
create table EMP
(
   UUID                 numeric(8,0) not null comment '编号',
   USERNAME             varchar(15) comment '登陆名',
   PWD                  varchar(32) comment '登陆密码',
   NAME                 varchar(28) comment '真实姓名',
   GENDER               numeric(8,0) comment '性别',
   EMAIL                varchar(255) comment '邮件地址',
   TELE                 varchar(30) comment '联系电话',
   ADDRESS              varchar(255) comment '联系地址',
   BIRTHDAY             datetime comment '出生年月日',
   DEPUUID              numeric(8,0) comment '部门编号',
   primary key (UUID)
);

alter table EMP comment '员工';

/*==============================================================*/
/* Table: EMP_ROLE                                              */
/*==============================================================*/
create table EMP_ROLE
(
   UUID                 numeric(8,0) not null comment '编号',
   EMPUUID              numeric(8,0) comment '员工编号',
   ROLEUUID             numeric(8,0) comment '角色编号',
   primary key (UUID)
);

alter table EMP_ROLE comment '员工角色';

/*==============================================================*/
/* Table: GOODS                                                 */
/*==============================================================*/
create table GOODS
(
   UUID                 numeric(8,0) not null comment '编号',
   NAME                 varchar(30) comment '名称',
   ORIGIN               varchar(30) comment '产地',
   PRODUCER             varchar(30) comment '厂家',
   UNIT                 varchar(30) comment '计量单位',
   INPRICE              numeric(8,2) comment '进货价格',
   OUTPRICE             numeric(8,2) comment '销售价格',
   GOODSTYPEUUID        numeric(8,0) comment '商品类型',
   primary key (UUID)
);

alter table GOODS comment '商品';

/*==============================================================*/
/* Table: GOODSTYPE                                             */
/*==============================================================*/
create table GOODSTYPE
(
   UUID                 numeric(8,0) not null comment '商品类型编号',
   NAME                 varchar(30) comment '商品类型名称',
   primary key (UUID)
);

alter table GOODSTYPE comment '商品分类';

/*==============================================================*/
/* Table: INVENTORY                                             */
/*==============================================================*/
create table INVENTORY
(
   UUID                 numeric(8,0) not null comment '编号',
   GOODSUUID            numeric(8,0) comment '商品',
   STOREUUID            numeric(8,0) comment '仓库',
   NUM                  numeric(8,0) comment '数量',
   TYPE                 char(1) comment '类型',
   CREATETIME           datetime comment '登记日期',
   CHECKTIME            datetime comment '审核日期',
   CREATER              numeric(8,0) comment '登记人',
   CHECKER              numeric(8,0) comment '审核人',
   STATE                char(1) comment '状态',
   REMARK               varchar(200) comment '备注',
   primary key (UUID)
);

alter table INVENTORY comment '盘盈盘亏';

/*==============================================================*/
/* Table: MENU                                                  */
/*==============================================================*/
create table MENU
(
   MENUID               varchar(20) not null comment '菜单ID',
   MENUNAME             varchar(30) comment '菜单名称',
   ICON                 varchar(20) comment '图标',
   URL                  varchar(255) comment 'URL',
   PID                  varchar(20) comment '上级菜单ID',
   primary key (MENUID)
);

alter table MENU comment '菜单';

/*==============================================================*/
/* Table: ORDERDETAIL                                           */
/*==============================================================*/
create table ORDERDETAIL
(
   UUID                 numeric(8,0) not null comment '编号',
   GOODSUUID            numeric(8,0) comment '商品编号',
   GOODSNAME            varchar(50) comment '商品名称',
   PRICE                numeric(10,2) comment '价格',
   NUM                  numeric(8,0) comment '数量',
   MONEY                numeric(10,2) comment '金额',
   ENDTIME              datetime comment '结束日期',
   ENDER                numeric(8,0) comment '库管员',
   STOREUUID            numeric(8,0) comment '仓库编号',
   STATE                char(1) comment '采购：0=未入库，1=已入库  销售：0=未出库，1=已出库',
   ORDERSUUID           numeric(8,0) comment '订单编号',
   primary key (UUID)
);

alter table ORDERDETAIL comment '订单明细';

/*==============================================================*/
/* Table: ORDERS                                                */
/*==============================================================*/
create table ORDERS
(
   UUID                 numeric(8,0) not null comment '编号',
   CREATETIME           datetime comment '生成日期',
   CHECKTIME            datetime comment '审核日期',
   STARTTIME            datetime comment '确认日期',
   ENDTIME              datetime comment '入库或出库日期',
   TYPE                 char(1) comment '1:采购 2:销售',
   CREATER              numeric(8,0) comment '下单员',
   CHECKER              numeric(8,0) comment '审核员',
   STARTER              numeric(8,0) comment '采购员',
   ENDER                numeric(8,0) comment '库管员',
   SUPPLIERUUID         numeric(8,0) comment '供应商或客户',
   TOTALMONEY           numeric(10,2) comment '合计金额',
   STATE                char(1) comment '采购: 0:未审核 1:已审核, 2:已确认, 3:已入库；销售：0:未出库 1:已出库',
   WAYBILLSN            numeric(8,0) comment '运单号',
   primary key (UUID)
);

alter table ORDERS comment '订单';

/*==============================================================*/
/* Table: RETURNORDERDETAIL                                     */
/*==============================================================*/
create table RETURNORDERDETAIL
(
   UUID                 numeric(8,0) not null comment '编号',
   GOODSUUID            numeric(8,0) comment '商品编号',
   GOODSNAME            varchar(50) comment '商品名称',
   PRICE                numeric(10,2) comment '价格',
   NUM                  numeric(8,0) comment '数量',
   MONEY                numeric(10,2) comment '金额',
   ENDTIME              datetime comment '结束日期',
   ENDER                numeric(8,0) comment '库管员',
   STOREUUID            numeric(8,0) comment '仓库编号',
   STATE                char(1) comment '状态',
   ORDERSUUID           numeric(8,0) comment '退货订单编号',
   primary key (UUID)
);

alter table RETURNORDERDETAIL comment '退货订单明细';

/*==============================================================*/
/* Table: RETURNORDERS                                          */
/*==============================================================*/
create table RETURNORDERS
(
   UUID                 numeric(8,0) not null comment '编号',
   CREATETIME           datetime comment '生成日期',
   CHECKTIME            datetime comment '检查日期',
   ENDTIME              datetime comment '结束日期',
   TYPE                 char(1) comment '订单类型',
   CREATER              numeric(8,0) comment '下单员',
   CHECKER              numeric(8,0) comment '审核员工编号',
   ENDER                numeric(8,0) comment '库管员',
   SUPPLIERUUID         numeric(8,0) comment '供应商及客户编号',
   TOTALMONEY           numeric(10,2) comment '合计金额',
   STATE                char(1) comment '订单状态',
   WAYBILLSN            numeric(8,0) comment '运单号',
   ORDERSUUID           numeric(8,0) comment '原订单编号',
   primary key (UUID)
);

alter table RETURNORDERS comment '退货订单';

/*==============================================================*/
/* Table: ROLE                                                  */
/*==============================================================*/
create table ROLE
(
   UUID                 numeric(8,0) not null comment '编号',
   NAME                 varchar(30) comment '名称',
   primary key (UUID)
);

alter table ROLE comment '角色';

/*==============================================================*/
/* Table: ROLE_MENU                                             */
/*==============================================================*/
create table ROLE_MENU
(
   UUID                 numeric(8,0) not null,
   ROLEUUID             numeric(8,0),
   MENUUUID             varchar(10),
   primary key (UUID)
);

alter table ROLE_MENU comment '角色菜单';

/*==============================================================*/
/* Table: STORE                                                 */
/*==============================================================*/
create table STORE
(
   UUID                 numeric(8,0) not null comment '编号',
   NAME                 varchar(30) comment '名称',
   EMPUUID              numeric(8,0) comment '员工编号',
   primary key (UUID)
);

alter table STORE comment '仓库';

/*==============================================================*/
/* Table: STOREDETAIL                                           */
/*==============================================================*/
create table STOREDETAIL
(
   UUID                 numeric(8,0) not null comment '编号',
   STOREUUID            numeric(8,0) comment '仓库编号',
   GOODSUUID            numeric(8,0) comment '商品编号',
   NUM                  numeric(8,0) comment '数量',
   primary key (UUID)
);

alter table STOREDETAIL comment '仓库库存';

/*==============================================================*/
/* Table: STOREOPER                                             */
/*==============================================================*/
create table STOREOPER
(
   UUID                 numeric(8,0) not null comment '编号',
   EMPUUID              numeric(8,0) comment '操作员工编号',
   OPERTIME             datetime comment '操作日期',
   STOREUUID            numeric(8,0) comment '仓库编号',
   GOODSUUID            numeric(8,0) comment '商品编号',
   NUM                  numeric(8,0) comment '数量',
   TYPE                 char(1) comment '1：入库 2：出库',
   primary key (UUID)
);

alter table STOREOPER comment '仓库操作记录';

/*==============================================================*/
/* Table: SUPPLIER                                              */
/*==============================================================*/
create table SUPPLIER
(
   UUID                 numeric(8,0) not null comment '编号',
   NAME                 varchar(30) comment '名称',
   ADDRESS              varchar(100) comment '联系地址',
   CONTACT              varchar(30) comment '联系人',
   TELE                 varchar(30) comment '联系电话',
   EMAIL                varchar(100) comment '邮件地址',
   TYPE                 char(1) comment '1：供应商 2：客户',
   primary key (UUID)
);

alter table SUPPLIER comment '供应商';

alter table EMP add constraint FK_Reference_6 foreign key (DEPUUID)
      references DEP (UUID) on delete restrict on update restrict;

alter table EMP_ROLE add constraint FK_Reference_4 foreign key (ROLEUUID)
      references ROLE (UUID) on delete restrict on update restrict;

alter table GOODS add constraint FK_Reference_7 foreign key (GOODSTYPEUUID)
      references GOODSTYPE (UUID) on delete restrict on update restrict;

alter table ORDERDETAIL add constraint FK_Reference_14 foreign key (GOODSUUID)
      references GOODS (UUID) on delete restrict on update restrict;

alter table ORDERDETAIL add constraint FK_Reference_18 foreign key (ORDERSUUID)
      references ORDERS (UUID) on delete restrict on update restrict;

alter table ORDERS add constraint FK_Reference_12 foreign key (SUPPLIERUUID)
      references SUPPLIER (UUID) on delete restrict on update restrict;

alter table RETURNORDERDETAIL add constraint FK_Reference_16 foreign key (ORDERSUUID)
      references RETURNORDERS (UUID) on delete restrict on update restrict;

alter table RETURNORDERS add constraint FK_Reference_15 foreign key (ORDERSUUID)
      references ORDERS (UUID) on delete restrict on update restrict;

alter table ROLE_MENU add constraint FK_Reference_13 foreign key (MENUUUID)
      references MENU (MENUID) on delete restrict on update restrict;

alter table ROLE_MENU add constraint FK_Reference_19 foreign key (ROLEUUID)
      references ROLE (UUID) on delete restrict on update restrict;

alter table STORE add constraint FK_Reference_17 foreign key (EMPUUID)
      references EMP (UUID) on delete restrict on update restrict;

alter table STOREDETAIL add constraint FK_Reference_10 foreign key (GOODSUUID)
      references GOODS (UUID) on delete restrict on update restrict;

alter table STOREDETAIL add constraint FK_Reference_11 foreign key (GOODSUUID)
      references EMP (UUID) on delete restrict on update restrict;

alter table STOREDETAIL add constraint FK_Reference_8 foreign key (STOREUUID)
      references STORE (UUID) on delete restrict on update restrict;

