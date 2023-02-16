create table gulimail.oms_order
(
    id                      bigint auto_increment comment 'id'
        primary key,
    member_id               bigint         null comment 'member_id',
    order_sn                char(32)       null comment '订单号',
    coupon_id               bigint         null comment '使用的优惠券',
    create_time             datetime       null comment 'create_time',
    member_username         varchar(200)   null comment '用户名',
    total_amount            decimal(18, 4) null comment '订单总额',
    pay_amount              decimal(18, 4) null comment '应付总额',
    freight_amount          decimal(18, 4) null comment '运费金额',
    promotion_amount        decimal(18, 4) null comment '促销优化金额（促销价、满减、阶梯价）',
    integration_amount      decimal(18, 4) null comment '积分抵扣金额',
    coupon_amount           decimal(18, 4) null comment '优惠券抵扣金额',
    discount_amount         decimal(18, 4) null comment '后台调整订单使用的折扣金额',
    pay_type                tinyint        null comment '支付方式【1->支付宝；2->微信；3->银联； 4->货到付款；】',
    source_type             tinyint        null comment '订单来源[0->PC订单；1->app订单]',
    status                  tinyint        null comment '订单状态【0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单】',
    delivery_company        varchar(64)    null comment '物流公司(配送方式)',
    delivery_sn             varchar(64)    null comment '物流单号',
    auto_confirm_day        int            null comment '自动确认时间（天）',
    integration             int            null comment '可以获得的积分',
    growth                  int            null comment '可以获得的成长值',
    bill_type               tinyint        null comment '发票类型[0->不开发票；1->电子发票；2->纸质发票]',
    bill_header             varchar(255)   null comment '发票抬头',
    bill_content            varchar(255)   null comment '发票内容',
    bill_receiver_phone     varchar(32)    null comment '收票人电话',
    bill_receiver_email     varchar(64)    null comment '收票人邮箱',
    receiver_name           varchar(100)   null comment '收货人姓名',
    receiver_phone          varchar(32)    null comment '收货人电话',
    receiver_post_code      varchar(32)    null comment '收货人邮编',
    receiver_province       varchar(32)    null comment '省份/直辖市',
    receiver_city           varchar(32)    null comment '城市',
    receiver_region         varchar(32)    null comment '区',
    receiver_detail_address varchar(200)   null comment '详细地址',
    note                    varchar(500)   null comment '订单备注',
    confirm_status          tinyint        null comment '确认收货状态[0->未确认；1->已确认]',
    delete_status           tinyint        null comment '删除状态【0->未删除；1->已删除】',
    use_integration         int            null comment '下单时使用的积分',
    payment_time            datetime       null comment '支付时间',
    delivery_time           datetime       null comment '发货时间',
    receive_time            datetime       null comment '确认收货时间',
    comment_time            datetime       null comment '评价时间',
    modify_time             datetime       null comment '修改时间'
)
    comment '订单';

create table gulimail.oms_order_item
(
    id                 bigint auto_increment comment 'id'
        primary key,
    order_id           bigint         null comment 'order_id',
    order_sn           char(32)       null comment 'order_sn',
    spu_id             bigint         null comment 'spu_id',
    spu_name           varchar(255)   null comment 'spu_name',
    spu_pic            varchar(500)   null comment 'spu_pic',
    spu_brand          varchar(200)   null comment '品牌',
    category_id        bigint         null comment '商品分类id',
    sku_id             bigint         null comment '商品sku编号',
    sku_name           varchar(255)   null comment '商品sku名字',
    sku_pic            varchar(500)   null comment '商品sku图片',
    sku_price          decimal(18, 4) null comment '商品sku价格',
    sku_quantity       int            null comment '商品购买的数量',
    sku_attrs_vals     varchar(500)   null comment '商品销售属性组合（JSON）',
    promotion_amount   decimal(18, 4) null comment '商品促销分解金额',
    coupon_amount      decimal(18, 4) null comment '优惠券优惠分解金额',
    integration_amount decimal(18, 4) null comment '积分优惠分解金额',
    real_amount        decimal(18, 4) null comment '该商品经过优惠后的分解金额',
    gift_integration   int            null comment '赠送积分',
    gift_growth        int            null comment '赠送成长值'
)
    comment '订单项信息';

create table gulimail.oms_order_operate_history
(
    id           bigint auto_increment comment 'id'
        primary key,
    order_id     bigint       null comment '订单id',
    operate_man  varchar(100) null comment '操作人[用户；系统；后台管理员]',
    create_time  datetime     null comment '操作时间',
    order_status tinyint      null comment '订单状态【0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单】',
    note         varchar(500) null comment '备注'
)
    comment '订单操作历史记录';

create table gulimail.oms_order_return_apply
(
    id              bigint auto_increment comment 'id'
        primary key,
    order_id        bigint         null comment 'order_id',
    sku_id          bigint         null comment '退货商品id',
    order_sn        char(32)       null comment '订单编号',
    create_time     datetime       null comment '申请时间',
    member_username varchar(64)    null comment '会员用户名',
    return_amount   decimal(18, 4) null comment '退款金额',
    return_name     varchar(100)   null comment '退货人姓名',
    return_phone    varchar(20)    null comment '退货人电话',
    status          tinyint(1)     null comment '申请状态[0->待处理；1->退货中；2->已完成；3->已拒绝]',
    handle_time     datetime       null comment '处理时间',
    sku_img         varchar(500)   null comment '商品图片',
    sku_name        varchar(200)   null comment '商品名称',
    sku_brand       varchar(200)   null comment '商品品牌',
    sku_attrs_vals  varchar(500)   null comment '商品销售属性(JSON)',
    sku_count       int            null comment '退货数量',
    sku_price       decimal(18, 4) null comment '商品单价',
    sku_real_price  decimal(18, 4) null comment '商品实际支付单价',
    reason          varchar(200)   null comment '原因',
    description述   varchar(500)   null comment '描述',
    desc_pics       varchar(2000)  null comment '凭证图片，以逗号隔开',
    handle_note     varchar(500)   null comment '处理备注',
    handle_man      varchar(200)   null comment '处理人员',
    receive_man     varchar(100)   null comment '收货人',
    receive_time    datetime       null comment '收货时间',
    receive_note    varchar(500)   null comment '收货备注',
    receive_phone   varchar(20)    null comment '收货电话',
    company_address varchar(500)   null comment '公司收货地址'
)
    comment '订单退货申请';

create table gulimail.oms_order_return_reason
(
    id          bigint auto_increment comment 'id'
        primary key,
    name        varchar(200) null comment '退货原因名',
    sort        int          null comment '排序',
    status      tinyint(1)   null comment '启用状态',
    create_time datetime     null comment 'create_time'
)
    comment '退货原因';

create table gulimail.oms_order_setting
(
    id                    bigint auto_increment comment 'id'
        primary key,
    flash_order_overtime  int        null comment '秒杀订单超时关闭时间(分)',
    normal_order_overtime int        null comment '正常订单超时时间(分)',
    confirm_overtime      int        null comment '发货后自动确认收货时间（天）',
    finish_overtime       int        null comment '自动完成交易时间，不能申请退货（天）',
    comment_overtime      int        null comment '订单完成后自动好评时间（天）',
    member_level          tinyint(2) null comment '会员等级【0-不限会员等级，全部通用；其他-对应的其他会员等级】'
)
    comment '订单配置信息';

create table gulimail.oms_payment_info
(
    id               bigint auto_increment comment 'id'
        primary key,
    order_sn         char(32)       null comment '订单号（对外业务号）',
    order_id         bigint         null comment '订单id',
    alipay_trade_no  varchar(50)    null comment '支付宝交易流水号',
    total_amount     decimal(18, 4) null comment '支付总金额',
    subject          varchar(200)   null comment '交易内容',
    payment_status   varchar(20)    null comment '支付状态',
    create_time      datetime       null comment '创建时间',
    confirm_time     datetime       null comment '确认时间',
    callback_content varchar(4000)  null comment '回调内容',
    callback_time    datetime       null comment '回调时间'
)
    comment '支付信息表';

create table gulimail.oms_refund_info
(
    id              bigint auto_increment comment 'id'
        primary key,
    order_return_id bigint         null comment '退款的订单',
    refund          decimal(18, 4) null comment '退款金额',
    refund_sn       varchar(64)    null comment '退款交易流水号',
    refund_status   tinyint(1)     null comment '退款状态',
    refund_channel  tinyint        null comment '退款渠道[1-支付宝，2-微信，3-银联，4-汇款]',
    refund_content  varchar(5000)  null
)
    comment '退款信息';

create table gulimail.pms_attr
(
    attr_id      bigint auto_increment comment '属性id'
        primary key,
    attr_name    char(30)     null comment '属性名',
    search_type  tinyint      null comment '是否需要检索[0-不需要，1-需要]',
    icon         varchar(255) null comment '属性图标',
    value_select char(255)    null comment '可选值列表[用逗号分隔]',
    attr_type    tinyint      null comment '属性类型[0-销售属性，1-基本属性，2-既是销售属性又是基本属性]',
    enable       bigint       null comment '启用状态[0 - 禁用，1 - 启用]',
    catelog_id   bigint       null comment '所属分类',
    show_desc    tinyint      null comment '快速展示【是否展示在介绍上；0-否 1-是】，在sku中仍然可以调整'
)
    comment '商品属性';

create table gulimail.pms_attr_attrgroup_relation
(
    id            bigint auto_increment comment 'id'
        primary key,
    attr_id       bigint null comment '属性id',
    attr_group_id bigint null comment '属性分组id',
    attr_sort     int    null comment '属性组内排序'
)
    comment '属性&属性分组关联';

create table gulimail.pms_attr_group
(
    attr_group_id   bigint auto_increment comment '分组id'
        primary key,
    attr_group_name char(20)     null comment '组名',
    sort            int          null comment '排序',
    descript        varchar(255) null comment '描述',
    icon            varchar(255) null comment '组图标',
    catelog_id      bigint       null comment '所属分类id'
)
    comment '属性分组';

create table gulimail.pms_brand
(
    brand_id     bigint auto_increment comment '品牌id'
        primary key,
    name         char(50)      null comment '品牌名',
    logo         varchar(2000) null comment '品牌logo地址',
    descript     longtext      null comment '介绍',
    show_status  tinyint       null comment '显示状态[0-不显示；1-显示]',
    first_letter char          null comment '检索首字母',
    sort         int           null comment '排序'
)
    comment '品牌';

create table gulimail.pms_category
(
    cat_id        bigint auto_increment comment '分类id'
        primary key,
    name          char(50)  null comment '分类名称',
    parent_cid    bigint    null comment '父分类id',
    cat_level     int       null comment '层级',
    show_status   tinyint   null comment '是否显示[0-不显示，1显示]',
    sort          int       null comment '排序',
    icon          char(255) null comment '图标地址',
    product_unit  char(50)  null comment '计量单位',
    product_count int       null comment '商品数量'
)
    comment '商品三级分类';

create table gulimail.pms_comment_replay
(
    id         bigint auto_increment comment 'id'
        primary key,
    comment_id bigint null comment '评论id',
    reply_id   bigint null comment '回复id'
)
    comment '商品评价回复关系';

create table gulimail.pms_product_attr_value
(
    id         bigint auto_increment comment 'id'
        primary key,
    spu_id     bigint       null comment '商品id',
    attr_id    bigint       null comment '属性id',
    attr_name  varchar(200) null comment '属性名',
    attr_value varchar(200) null comment '属性值',
    attr_sort  int          null comment '顺序',
    quick_show tinyint      null comment '快速展示【是否展示在介绍上；0-否 1-是】'
)
    comment 'spu属性值';

create table gulimail.pms_sku_images
(
    id          bigint auto_increment comment 'id'
        primary key,
    sku_id      bigint       null comment 'sku_id',
    img_url     varchar(255) null comment '图片地址',
    img_sort    int          null comment '排序',
    default_img int          null comment '默认图[0 - 不是默认图，1 - 是默认图]'
)
    comment 'sku图片';

create table gulimail.pms_sku_info
(
    sku_id          bigint auto_increment comment 'skuId'
        primary key,
    spu_id          bigint         null comment 'spuId',
    sku_name        varchar(255)   null comment 'sku名称',
    sku_desc        varchar(2000)  null comment 'sku介绍描述',
    catalog_id      bigint         null comment '所属分类id',
    brand_id        bigint         null comment '品牌id',
    sku_default_img varchar(255)   null comment '默认图片',
    sku_title       varchar(255)   null comment '标题',
    sku_subtitle    varchar(2000)  null comment '副标题',
    price           decimal(18, 4) null comment '价格',
    sale_count      bigint         null comment '销量'
)
    comment 'sku信息';

create table gulimail.pms_sku_sale_attr_value
(
    id         bigint auto_increment comment 'id'
        primary key,
    sku_id     bigint       null comment 'sku_id',
    attr_id    bigint       null comment 'attr_id',
    attr_name  varchar(200) null comment '销售属性名',
    attr_value varchar(200) null comment '销售属性值',
    attr_sort  int          null comment '顺序'
)
    comment 'sku销售属性&值';

create table gulimail.pms_spu_comment
(
    id               bigint auto_increment comment 'id'
        primary key,
    sku_id           bigint        null comment 'sku_id',
    spu_id           bigint        null comment 'spu_id',
    spu_name         varchar(255)  null comment '商品名字',
    member_nick_name varchar(255)  null comment '会员昵称',
    star             tinyint(1)    null comment '星级',
    member_ip        varchar(64)   null comment '会员ip',
    create_time      datetime      null comment '创建时间',
    show_status      tinyint(1)    null comment '显示状态[0-不显示，1-显示]',
    spu_attributes   varchar(255)  null comment '购买时属性组合',
    likes_count      int           null comment '点赞数',
    reply_count      int           null comment '回复数',
    resources        varchar(1000) null comment '评论图片/视频[json数据；[{type:文件类型,url:资源路径}]]',
    content          text          null comment '内容',
    member_icon      varchar(255)  null comment '用户头像',
    comment_type     tinyint       null comment '评论类型[0 - 对商品的直接评论，1 - 对评论的回复]'
)
    comment '商品评价';

create table gulimail.pms_spu_images
(
    id          bigint auto_increment comment 'id'
        primary key,
    spu_id      bigint       null comment 'spu_id',
    img_name    varchar(200) null comment '图片名',
    img_url     varchar(255) null comment '图片地址',
    img_sort    int          null comment '顺序',
    default_img tinyint      null comment '是否默认图'
)
    comment 'spu图片';

create table gulimail.pms_spu_info
(
    id              bigint auto_increment comment '商品id'
        primary key,
    spu_name        varchar(200)   null comment '商品名称',
    spu_description varchar(1000)  null comment '商品描述',
    catalog_id      bigint         null comment '所属分类id',
    brand_id        bigint         null comment '品牌id',
    weight          decimal(18, 4) null,
    publish_status  tinyint        null comment '上架状态[0 - 下架，1 - 上架]',
    create_time     datetime       null,
    update_time     datetime       null
)
    comment 'spu信息';

create table gulimail.pms_spu_info_desc
(
    spu_id  bigint   not null comment '商品id'
        primary key,
    decript longtext null comment '商品介绍'
)
    comment 'spu信息介绍';

create table gulimail.sms_category_bounds
(
    id          bigint auto_increment comment 'id'
        primary key,
    category_id bigint         null,
    grow_bounds decimal(18, 4) null comment '成长积分',
    buy_bounds  decimal(18, 4) null comment '购物积分',
    work        tinyint(1)     null comment '优惠生效情况[1111（四个状态位，从右到左）;0 - 无优惠，成长积分是否赠送;1 - 无优惠，购物积分是否赠送;2 - 有优惠，成长积分是否赠送;3 - 有优惠，购物积分是否赠送【状态位0：不赠送，1：赠送】]'
)
    comment '商品分类积分设置';

create table gulimail.sms_coupon
(
    id                bigint auto_increment comment 'id'
        primary key,
    coupon_type       tinyint(1)     null comment '优惠卷类型[0->全场赠券；1->会员赠券；2->购物赠券；3->注册赠券]',
    coupon_img        varchar(2000)  null comment '优惠券图片',
    coupon_name       varchar(100)   null comment '优惠卷名字',
    num               int            null comment '数量',
    amount            decimal(18, 4) null comment '金额',
    per_limit         int            null comment '每人限领张数',
    min_point         decimal(18, 4) null comment '使用门槛',
    start_time        datetime       null comment '开始时间',
    end_time          datetime       null comment '结束时间',
    use_type          tinyint(1)     null comment '使用类型[0->全场通用；1->指定分类；2->指定商品]',
    note              varchar(200)   null comment '备注',
    publish_count     int            null comment '发行数量',
    use_count         int            null comment '已使用数量',
    receive_count     int            null comment '领取数量',
    enable_start_time datetime       null comment '可以领取的开始日期',
    enable_end_time   datetime       null comment '可以领取的结束日期',
    code              varchar(64)    null comment '优惠码',
    member_level      tinyint(1)     null comment '可以领取的会员等级[0->不限等级，其他-对应等级]',
    publish           tinyint(1)     null comment '发布状态[0-未发布，1-已发布]'
)
    comment '优惠券信息';

create table gulimail.sms_coupon_history
(
    id               bigint auto_increment comment 'id'
        primary key,
    coupon_id        bigint      null comment '优惠券id',
    member_id        bigint      null comment '会员id',
    member_nick_name varchar(64) null comment '会员名字',
    get_type         tinyint(1)  null comment '获取方式[0->后台赠送；1->主动领取]',
    create_time      datetime    null comment '创建时间',
    use_type         tinyint(1)  null comment '使用状态[0->未使用；1->已使用；2->已过期]',
    use_time         datetime    null comment '使用时间',
    order_id         bigint      null comment '订单id',
    order_sn         bigint      null comment '订单号'
)
    comment '优惠券领取历史记录';

create table gulimail.sms_coupon_spu_category_relation
(
    id            bigint auto_increment comment 'id'
        primary key,
    coupon_id     bigint      null comment '优惠券id',
    category_id   bigint      null comment '产品分类id',
    category_name varchar(64) null comment '产品分类名称'
)
    comment '优惠券分类关联';

create table gulimail.sms_coupon_spu_relation
(
    id        bigint auto_increment comment 'id'
        primary key,
    coupon_id bigint       null comment '优惠券id',
    spu_id    bigint       null comment 'spu_id',
    spu_name  varchar(255) null comment 'spu_name'
)
    comment '优惠券与产品关联';

create table gulimail.sms_home_adv
(
    id           bigint auto_increment comment 'id'
        primary key,
    name         varchar(100) null comment '名字',
    pic          varchar(500) null comment '图片地址',
    start_time   datetime     null comment '开始时间',
    end_time     datetime     null comment '结束时间',
    status       tinyint(1)   null comment '状态',
    click_count  int          null comment '点击数',
    url          varchar(500) null comment '广告详情连接地址',
    note         varchar(500) null comment '备注',
    sort         int          null comment '排序',
    publisher_id bigint       null comment '发布者',
    auth_id      bigint       null comment '审核者'
)
    comment '首页轮播广告';

create table gulimail.sms_home_subject
(
    id        bigint auto_increment comment 'id'
        primary key,
    name      varchar(200) null comment '专题名字',
    title     varchar(255) null comment '专题标题',
    sub_title varchar(255) null comment '专题副标题',
    status    tinyint(1)   null comment '显示状态',
    url       varchar(500) null comment '详情连接',
    sort      int          null comment '排序',
    img       varchar(500) null comment '专题图片地址'
)
    comment '首页专题表【jd首页下面很多专题，每个专题链接新的页面，展示专题商品信息】';

create table gulimail.sms_home_subject_spu
(
    id         bigint auto_increment comment 'id'
        primary key,
    name       varchar(200) null comment '专题名字',
    subject_id bigint       null comment '专题id',
    spu_id     bigint       null comment 'spu_id',
    sort       int          null comment '排序'
)
    comment '专题商品';

create table gulimail.sms_member_price
(
    id                bigint auto_increment comment 'id'
        primary key,
    sku_id            bigint         null comment 'sku_id',
    member_level_id   bigint         null comment '会员等级id',
    member_level_name varchar(100)   null comment '会员等级名',
    member_price      decimal(18, 4) null comment '会员对应价格',
    add_other         tinyint(1)     null comment '可否叠加其他优惠[0-不可叠加优惠，1-可叠加]'
)
    comment '商品会员价格';

create table gulimail.sms_seckill_promotion
(
    id          bigint auto_increment comment 'id'
        primary key,
    title       varchar(255) null comment '活动标题',
    start_time  datetime     null comment '开始日期',
    end_time    datetime     null comment '结束日期',
    status      tinyint      null comment '上下线状态',
    create_time datetime     null comment '创建时间',
    user_id     bigint       null comment '创建人'
)
    comment '秒杀活动';

create table gulimail.sms_seckill_session
(
    id          bigint auto_increment comment 'id'
        primary key,
    name        varchar(200) null comment '场次名称',
    start_time  datetime     null comment '每日开始时间',
    end_time    datetime     null comment '每日结束时间',
    status      tinyint(1)   null comment '启用状态',
    create_time datetime     null comment '创建时间'
)
    comment '秒杀活动场次';

create table gulimail.sms_seckill_sku_notice
(
    id            bigint auto_increment comment 'id'
        primary key,
    member_id     bigint     null comment 'member_id',
    sku_id        bigint     null comment 'sku_id',
    session_id    bigint     null comment '活动场次id',
    subcribe_time datetime   null comment '订阅时间',
    send_time     datetime   null comment '发送时间',
    notice_type   tinyint(1) null comment '通知方式[0-短信，1-邮件]'
)
    comment '秒杀商品通知订阅';

create table gulimail.sms_seckill_sku_relation
(
    id                   bigint auto_increment comment 'id'
        primary key,
    promotion_id         bigint  null comment '活动id',
    promotion_session_id bigint  null comment '活动场次id',
    sku_id               bigint  null comment '商品id',
    seckill_price        decimal null comment '秒杀价格',
    seckill_count        decimal null comment '秒杀总量',
    seckill_limit        decimal null comment '每人限购数量',
    seckill_sort         int     null comment '排序'
)
    comment '秒杀活动商品关联';

create table gulimail.sms_sku_bounds
(
    id          bigint auto_increment comment 'id'
        primary key,
    sku_id      bigint         null,
    grow_bounds decimal(18, 4) null comment '成长积分',
    buy_bounds  decimal(18, 4) null comment '购物积分',
    work        tinyint(1)     null comment '优惠生效情况[1111（四个状态位，从右到左）;0 - 无优惠，成长积分是否赠送;1 - 无优惠，购物积分是否赠送;2 - 有优惠，成长积分是否赠送;3 - 有优惠，购物积分是否赠送【状态位0：不赠送，1：赠送】]'
)
    comment '商品sku积分设置';

create table gulimail.sms_sku_full_reduction
(
    id           bigint auto_increment comment 'id'
        primary key,
    sku_id       bigint         null comment 'spu_id',
    full_price   decimal(18, 4) null comment '满多少',
    reduce_price decimal(18, 4) null comment '减多少',
    add_other    tinyint(1)     null comment '是否参与其他优惠'
)
    comment '商品满减信息';

create table gulimail.sms_sku_ladder
(
    id         bigint auto_increment comment 'id'
        primary key,
    sku_id     bigint         null comment 'spu_id',
    full_count int            null comment '满几件',
    discount   decimal(4, 2)  null comment '打几折',
    price      decimal(18, 4) null comment '折后价',
    add_other  tinyint(1)     null comment '是否叠加其他优惠[0-不可叠加，1-可叠加]'
)
    comment '商品阶梯价格';

create table gulimail.sms_spu_bounds
(
    id          bigint auto_increment comment 'id'
        primary key,
    spu_id      bigint         null,
    grow_bounds decimal(18, 4) null comment '成长积分',
    buy_bounds  decimal(18, 4) null comment '购物积分',
    work        tinyint(1)     null comment '优惠生效情况[1111（四个状态位，从右到左）;0 - 无优惠，成长积分是否赠送;1 - 无优惠，购物积分是否赠送;2 - 有优惠，成长积分是否赠送;3 - 有优惠，购物积分是否赠送【状态位0：不赠送，1：赠送】]'
)
    comment '商品spu积分设置';

create table gulimail.ums_growth_change_history
(
    id           bigint auto_increment comment 'id'
        primary key,
    member_id    bigint     null comment 'member_id',
    create_time  datetime   null comment 'create_time',
    change_count int        null comment '改变的值（正负计数）',
    note         varchar(0) null comment '备注',
    source_type  tinyint    null comment '积分来源[0-购物，1-管理员修改]'
)
    comment '成长值变化历史记录';

create table gulimail.ums_integration_change_history
(
    id           bigint auto_increment comment 'id'
        primary key,
    member_id    bigint       null comment 'member_id',
    create_time  datetime     null comment 'create_time',
    change_count int          null comment '变化的值',
    note         varchar(255) null comment '备注',
    source_tyoe  tinyint      null comment '来源[0->购物；1->管理员修改;2->活动]'
)
    comment '积分变化历史记录';

create table gulimail.ums_member
(
    id          bigint auto_increment comment 'id'
        primary key,
    level_id    bigint       null comment '会员等级id',
    username    char(64)     null comment '用户名',
    password    varchar(64)  null comment '密码',
    nickname    varchar(64)  null comment '昵称',
    mobile      varchar(20)  null comment '手机号码',
    email       varchar(64)  null comment '邮箱',
    header      varchar(500) null comment '头像',
    gender      tinyint      null comment '性别',
    birth       date         null comment '生日',
    city        varchar(500) null comment '所在城市',
    job         varchar(255) null comment '职业',
    sign        varchar(255) null comment '个性签名',
    source_type tinyint      null comment '用户来源',
    integration int          null comment '积分',
    growth      int          null comment '成长值',
    status      tinyint      null comment '启用状态',
    create_time datetime     null comment '注册时间'
)
    comment '会员';

create table gulimail.ums_member_collect_spu
(
    id          bigint       not null comment 'id'
        primary key,
    member_id   bigint       null comment '会员id',
    spu_id      bigint       null comment 'spu_id',
    spu_name    varchar(500) null comment 'spu_name',
    spu_img     varchar(500) null comment 'spu_img',
    create_time datetime     null comment 'create_time'
)
    comment '会员收藏的商品';

create table gulimail.ums_member_collect_subject
(
    id           bigint auto_increment comment 'id'
        primary key,
    subject_id   bigint       null comment 'subject_id',
    subject_name varchar(255) null comment 'subject_name',
    subject_img  varchar(500) null comment 'subject_img',
    subject_urll varchar(500) null comment '活动url'
)
    comment '会员收藏的专题活动';

create table gulimail.ums_member_level
(
    id                      bigint auto_increment comment 'id'
        primary key,
    name                    varchar(100)   null comment '等级名称',
    growth_point            int            null comment '等级需要的成长值',
    default_status          tinyint        null comment '是否为默认等级[0->不是；1->是]',
    free_freight_point      decimal(18, 4) null comment '免运费标准',
    comment_growth_point    int            null comment '每次评价获取的成长值',
    priviledge_free_freight tinyint        null comment '是否有免邮特权',
    priviledge_member_price tinyint        null comment '是否有会员价格特权',
    priviledge_birthday     tinyint        null comment '是否有生日特权',
    note                    varchar(255)   null comment '备注'
)
    comment '会员等级';

create table gulimail.ums_member_login_log
(
    id          bigint auto_increment comment 'id'
        primary key,
    member_id   bigint      null comment 'member_id',
    create_time datetime    null comment '创建时间',
    ip          varchar(64) null comment 'ip',
    city        varchar(64) null comment 'city',
    login_type  tinyint(1)  null comment '登录类型[1-web，2-app]'
)
    comment '会员登录记录';

create table gulimail.ums_member_receive_address
(
    id             bigint auto_increment comment 'id'
        primary key,
    member_id      bigint       null comment 'member_id',
    name           varchar(255) null comment '收货人姓名',
    phone          varchar(64)  null comment '电话',
    post_code      varchar(64)  null comment '邮政编码',
    province       varchar(100) null comment '省份/直辖市',
    city           varchar(100) null comment '城市',
    region         varchar(100) null comment '区',
    detail_address varchar(255) null comment '详细地址(街道)',
    areacode       varchar(15)  null comment '省市区代码',
    default_status tinyint(1)   null comment '是否默认'
)
    comment '会员收货地址';

create table gulimail.ums_member_statistics_info
(
    id                    bigint auto_increment comment 'id'
        primary key,
    member_id             bigint         null comment '会员id',
    consume_amount        decimal(18, 4) null comment '累计消费金额',
    coupon_amount         decimal(18, 4) null comment '累计优惠金额',
    order_count           int            null comment '订单数量',
    coupon_count          int            null comment '优惠券数量',
    comment_count         int            null comment '评价数',
    return_order_count    int            null comment '退货数量',
    login_count           int            null comment '登录次数',
    attend_count          int            null comment '关注数量',
    fans_count            int            null comment '粉丝数量',
    collect_product_count int            null comment '收藏的商品数量',
    collect_subject_count int            null comment '收藏的专题活动数量',
    collect_comment_count int            null comment '收藏的评论数量',
    invite_friend_count   int            null comment '邀请的朋友数量'
)
    comment '会员统计信息';

create table gulimail.wms_purchase
(
    id            bigint auto_increment
        primary key,
    assignee_id   bigint         null,
    assignee_name varchar(255)   null,
    phone         char(13)       null,
    priority      int(4)         null,
    status        int(4)         null,
    ware_id       bigint         null,
    amount        decimal(18, 4) null,
    create_time   datetime       null,
    update_time   datetime       null
)
    comment '采购信息';

create table gulimail.wms_purchase_detail
(
    id          bigint auto_increment
        primary key,
    purchase_id bigint         null comment '采购单id',
    sku_id      bigint         null comment '采购商品id',
    sku_num     int            null comment '采购数量',
    sku_price   decimal(18, 4) null comment '采购金额',
    ware_id     bigint         null comment '仓库id',
    status      int            null comment '状态[0新建，1已分配，2正在采购，3已完成，4采购失败]'
);

create table gulimail.wms_ware_info
(
    id       bigint auto_increment comment 'id'
        primary key,
    name     varchar(255) null comment '仓库名',
    address  varchar(255) null comment '仓库地址',
    areacode varchar(20)  null comment '区域编码'
)
    comment '仓库信息';

create table gulimail.wms_ware_order_task
(
    id               bigint auto_increment comment 'id'
        primary key,
    order_id         bigint       null comment 'order_id',
    order_sn         varchar(255) null comment 'order_sn',
    consignee        varchar(100) null comment '收货人',
    consignee_tel    char(15)     null comment '收货人电话',
    delivery_address varchar(500) null comment '配送地址',
    order_comment    varchar(200) null comment '订单备注',
    payment_way      tinyint(1)   null comment '付款方式【 1:在线付款 2:货到付款】',
    task_status      tinyint(2)   null comment '任务状态',
    order_body       varchar(255) null comment '订单描述',
    tracking_no      char(30)     null comment '物流单号',
    create_time      datetime     null comment 'create_time',
    ware_id          bigint       null comment '仓库id',
    task_comment     varchar(500) null comment '工作单备注'
)
    comment '库存工作单';

create table gulimail.wms_ware_order_task_detail
(
    id       bigint auto_increment comment 'id'
        primary key,
    sku_id   bigint       null comment 'sku_id',
    sku_name varchar(255) null comment 'sku_name',
    sku_num  int          null comment '购买个数',
    task_id  bigint       null comment '工作单id'
)
    comment '库存工作单';

create table gulimail.wms_ware_sku
(
    id           bigint auto_increment comment 'id'
        primary key,
    sku_id       bigint       null comment 'sku_id',
    ware_id      bigint       null comment '仓库id',
    stock        int          null comment '库存数',
    sku_name     varchar(200) null comment 'sku_name',
    stock_locked int          null comment '锁定库存'
)
    comment '商品库存';

