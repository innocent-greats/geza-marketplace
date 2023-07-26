--
-- Class BookingMessage as table booking_message
--

CREATE TABLE "booking_message" (
  "id" serial,
  "bookingChatId" integer NOT NULL,
  "chatMessage" json NOT NULL
);

ALTER TABLE ONLY "booking_message"
  ADD CONSTRAINT booking_message_pkey PRIMARY KEY (id);


--
-- Class Channel as table channel
--

CREATE TABLE "channel" (
  "id" serial,
  "name" text NOT NULL,
  "channel" text NOT NULL
);

ALTER TABLE ONLY "channel"
  ADD CONSTRAINT channel_pkey PRIMARY KEY (id);


--
-- Class Location as table location
--

CREATE TABLE "location" (
  "id" serial,
  "cityName" text NOT NULL,
  "neighbourhoodName" text NOT NULL,
  "mapName" text NOT NULL,
  "lat" text NOT NULL,
  "long" text NOT NULL
);

ALTER TABLE ONLY "location"
  ADD CONSTRAINT location_pkey PRIMARY KEY (id);


--
-- Class OrderChat as table order_chat
--

CREATE TABLE "order_chat" (
  "id" serial,
  "dateCreated" timestamp without time zone,
  "order" json NOT NULL,
  "messages" json NOT NULL
);

ALTER TABLE ONLY "order_chat"
  ADD CONSTRAINT order_chat_pkey PRIMARY KEY (id);


--
-- Class Person as table person
--

CREATE TABLE "person" (
  "id" serial,
  "firstName" text NOT NULL,
  "lastName" text NOT NULL,
  "phone" text NOT NULL,
  "email" text,
  "password" text,
  "pin" text,
  "city" text,
  "neighbourhood" text,
  "locationCoordinate" integer,
  "walletId" text,
  "specialization" json,
  "rating" double precision,
  "accountType" text,
  "isCustomer" boolean,
  "isTrader" boolean,
  "followers" json,
  "searchTerm" text,
  "profileImagePathLocation" text,
  "createdDate" text
);

ALTER TABLE ONLY "person"
  ADD CONSTRAINT person_pkey PRIMARY KEY (id);

ALTER TABLE ONLY "person"
  ADD CONSTRAINT person_fk_0
    FOREIGN KEY("locationCoordinate")
      REFERENCES location(id)
        ON DELETE CASCADE;

--
-- Class Message as table message
--

CREATE TABLE "message" (
  "id" serial,
  "topicId" integer NOT NULL,
  "topic" text NOT NULL,
  "createdDate" timestamp without time zone,
  "senderId" integer NOT NULL,
  "sender" json NOT NULL,
  "recieverId" integer NOT NULL,
  "reciever" json NOT NULL,
  "message" text NOT NULL
);

ALTER TABLE ONLY "message"
  ADD CONSTRAINT message_pkey PRIMARY KEY (id);

ALTER TABLE ONLY "message"
  ADD CONSTRAINT message_fk_0
    FOREIGN KEY("senderId")
      REFERENCES person(id)
        ON DELETE CASCADE;
ALTER TABLE ONLY "message"
  ADD CONSTRAINT message_fk_1
    FOREIGN KEY("recieverId")
      REFERENCES person(id)
        ON DELETE CASCADE;

--
-- Class ChatMessage as table chat_message
--

CREATE TABLE "chat_message" (
  "id" serial,
  "bookingChatId" integer NOT NULL,
  "senderId" integer NOT NULL,
  "sender" json NOT NULL,
  "recieverId" integer NOT NULL,
  "reciever" json NOT NULL,
  "message" text NOT NULL,
  "dateCreated" timestamp without time zone NOT NULL
);

ALTER TABLE ONLY "chat_message"
  ADD CONSTRAINT chat_message_pkey PRIMARY KEY (id);

ALTER TABLE ONLY "chat_message"
  ADD CONSTRAINT chat_message_fk_0
    FOREIGN KEY("senderId")
      REFERENCES person(id)
        ON DELETE CASCADE;
ALTER TABLE ONLY "chat_message"
  ADD CONSTRAINT chat_message_fk_1
    FOREIGN KEY("recieverId")
      REFERENCES person(id)
        ON DELETE CASCADE;

--
-- Class BookingOrderChat as table booking_order_chat
--

CREATE TABLE "booking_order_chat" (
  "id" serial,
  "orderedItem" json NOT NULL,
  "chatDate" timestamp without time zone,
  "orderDate" timestamp without time zone,
  "orderId" integer NOT NULL,
  "customer" json NOT NULL,
  "vendor" json NOT NULL,
  "customerId" integer NOT NULL,
  "vendorId" integer NOT NULL,
  "messages" json NOT NULL,
  "chatStatus" text
);

ALTER TABLE ONLY "booking_order_chat"
  ADD CONSTRAINT booking_order_chat_pkey PRIMARY KEY (id);

ALTER TABLE ONLY "booking_order_chat"
  ADD CONSTRAINT booking_order_chat_fk_0
    FOREIGN KEY("customerId")
      REFERENCES person(id)
        ON DELETE CASCADE;
ALTER TABLE ONLY "booking_order_chat"
  ADD CONSTRAINT booking_order_chat_fk_1
    FOREIGN KEY("vendorId")
      REFERENCES person(id)
        ON DELETE CASCADE;

--
-- Class BookingOrder as table booking_order
--

CREATE TABLE "booking_order" (
  "id" serial,
  "selectedDate" text NOT NULL,
  "selectedTime" text NOT NULL,
  "orderStatus" text,
  "customerId" integer NOT NULL,
  "customerType" text NOT NULL,
  "vendorId" integer NOT NULL,
  "beautyStyleId" integer NOT NULL,
  "dateCreated" timestamp without time zone
);

ALTER TABLE ONLY "booking_order"
  ADD CONSTRAINT booking_order_pkey PRIMARY KEY (id);

ALTER TABLE ONLY "booking_order"
  ADD CONSTRAINT booking_order_fk_0
    FOREIGN KEY("customerId")
      REFERENCES person(id)
        ON DELETE CASCADE;
ALTER TABLE ONLY "booking_order"
  ADD CONSTRAINT booking_order_fk_1
    FOREIGN KEY("vendorId")
      REFERENCES person(id)
        ON DELETE CASCADE;

--
-- Class BeautyStyle as table beauty_style
--

CREATE TABLE "beauty_style" (
  "id" serial,
  "name" text NOT NULL,
  "category" text NOT NULL,
  "description" text,
  "cityName" text NOT NULL,
  "neighbourhoodName" text NOT NULL,
  "dateAdded" text,
  "amount" double precision,
  "images" json NOT NULL,
  "tags" json,
  "shares" json,
  "stylistId" integer,
  "customerId" integer,
  "searchTerm" text
);

ALTER TABLE ONLY "beauty_style"
  ADD CONSTRAINT beauty_style_pkey PRIMARY KEY (id);

ALTER TABLE ONLY "beauty_style"
  ADD CONSTRAINT beauty_style_fk_0
    FOREIGN KEY("stylistId")
      REFERENCES person(id)
        ON DELETE CASCADE;
ALTER TABLE ONLY "beauty_style"
  ADD CONSTRAINT beauty_style_fk_1
    FOREIGN KEY("customerId")
      REFERENCES person(id)
        ON DELETE CASCADE;

--
-- Class Images as table images
--

CREATE TABLE "images" (
  "id" serial,
  "dateAdded" timestamp without time zone,
  "uploaderId" integer NOT NULL,
  "beautyStyleId" integer,
  "pathLocation" text NOT NULL
);

ALTER TABLE ONLY "images"
  ADD CONSTRAINT images_pkey PRIMARY KEY (id);

ALTER TABLE ONLY "images"
  ADD CONSTRAINT images_fk_0
    FOREIGN KEY("uploaderId")
      REFERENCES person(id)
        ON DELETE CASCADE;
ALTER TABLE ONLY "images"
  ADD CONSTRAINT images_fk_1
    FOREIGN KEY("beautyStyleId")
      REFERENCES beauty_style(id)
        ON DELETE CASCADE;

--
-- Class Product as table product
--

CREATE TABLE "product" (
  "id" serial,
  "name" text NOT NULL,
  "category" text NOT NULL,
  "description" text,
  "cityName" text NOT NULL,
  "neighbourhoodName" text NOT NULL,
  "dateAdded" timestamp without time zone,
  "amount" double precision,
  "images" json,
  "tags" json,
  "shares" json,
  "stylistId" integer,
  "customerId" integer,
  "searchTerm" text,
  "createdDate" text
);

ALTER TABLE ONLY "product"
  ADD CONSTRAINT product_pkey PRIMARY KEY (id);

ALTER TABLE ONLY "product"
  ADD CONSTRAINT product_fk_0
    FOREIGN KEY("stylistId")
      REFERENCES person(id)
        ON DELETE CASCADE;
ALTER TABLE ONLY "product"
  ADD CONSTRAINT product_fk_1
    FOREIGN KEY("customerId")
      REFERENCES person(id)
        ON DELETE CASCADE;

--
-- Class ProfileImages as table profile_images
--

CREATE TABLE "profile_images" (
  "id" serial,
  "dateAdded" timestamp without time zone,
  "personId" integer NOT NULL,
  "pathLocation" text NOT NULL
);

ALTER TABLE ONLY "profile_images"
  ADD CONSTRAINT profile_images_pkey PRIMARY KEY (id);

ALTER TABLE ONLY "profile_images"
  ADD CONSTRAINT profile_images_fk_0
    FOREIGN KEY("personId")
      REFERENCES person(id)
        ON DELETE CASCADE;

--
-- Class SaleOrder as table sale_order
--

CREATE TABLE "sale_order" (
  "id" serial,
  "bookingOrderId" integer NOT NULL,
  "orderType" text NOT NULL,
  "orderedItem" json NOT NULL,
  "orderCreatedDate" timestamp without time zone,
  "orderCornfirmedDate" timestamp without time zone,
  "orderBookedTime" text NOT NULL,
  "orderBookedDate" text NOT NULL,
  "customer" json NOT NULL,
  "orderingFor" text NOT NULL,
  "vendor" json NOT NULL,
  "customerId" integer NOT NULL,
  "vendorId" integer NOT NULL,
  "customerRating" text,
  "stylistRating" text,
  "searchTerm" text,
  "orderStatus" text
);

ALTER TABLE ONLY "sale_order"
  ADD CONSTRAINT sale_order_pkey PRIMARY KEY (id);

ALTER TABLE ONLY "sale_order"
  ADD CONSTRAINT sale_order_fk_0
    FOREIGN KEY("bookingOrderId")
      REFERENCES booking_order(id)
        ON DELETE CASCADE;
ALTER TABLE ONLY "sale_order"
  ADD CONSTRAINT sale_order_fk_1
    FOREIGN KEY("customerId")
      REFERENCES person(id)
        ON DELETE CASCADE;
ALTER TABLE ONLY "sale_order"
  ADD CONSTRAINT sale_order_fk_2
    FOREIGN KEY("vendorId")
      REFERENCES person(id)
        ON DELETE CASCADE;

--
-- Class OrderMessage as table order_message
--

CREATE TABLE "order_message" (
  "id" serial,
  "createdDate" timestamp without time zone,
  "orderType" text NOT NULL,
  "orderId" integer NOT NULL,
  "essage" json NOT NULL
);

ALTER TABLE ONLY "order_message"
  ADD CONSTRAINT order_message_pkey PRIMARY KEY (id);

ALTER TABLE ONLY "order_message"
  ADD CONSTRAINT order_message_fk_0
    FOREIGN KEY("orderId")
      REFERENCES sale_order(id)
        ON DELETE CASCADE;

--
-- Class Share as table share
--

CREATE TABLE "share" (
  "id" serial,
  "dateAdded" timestamp without time zone,
  "stylistId" integer NOT NULL,
  "beautyStyleId" integer,
  "shareBy" integer,
  "sharewith" integer
);

ALTER TABLE ONLY "share"
  ADD CONSTRAINT share_pkey PRIMARY KEY (id);

ALTER TABLE ONLY "share"
  ADD CONSTRAINT share_fk_0
    FOREIGN KEY("stylistId")
      REFERENCES person(id)
        ON DELETE CASCADE;
ALTER TABLE ONLY "share"
  ADD CONSTRAINT share_fk_1
    FOREIGN KEY("beautyStyleId")
      REFERENCES beauty_style(id)
        ON DELETE CASCADE;
ALTER TABLE ONLY "share"
  ADD CONSTRAINT share_fk_2
    FOREIGN KEY("shareBy")
      REFERENCES person(id)
        ON DELETE CASCADE;
ALTER TABLE ONLY "share"
  ADD CONSTRAINT share_fk_3
    FOREIGN KEY("sharewith")
      REFERENCES person(id)
        ON DELETE CASCADE;

--
-- Class Tag as table tag
--

CREATE TABLE "tag" (
  "id" serial,
  "dateAdded" timestamp without time zone,
  "stylistId" integer NOT NULL,
  "beautyStyleId" integer,
  "personTaggedId" integer
);

ALTER TABLE ONLY "tag"
  ADD CONSTRAINT tag_pkey PRIMARY KEY (id);

ALTER TABLE ONLY "tag"
  ADD CONSTRAINT tag_fk_0
    FOREIGN KEY("stylistId")
      REFERENCES person(id)
        ON DELETE CASCADE;
ALTER TABLE ONLY "tag"
  ADD CONSTRAINT tag_fk_1
    FOREIGN KEY("beautyStyleId")
      REFERENCES beauty_style(id)
        ON DELETE CASCADE;
ALTER TABLE ONLY "tag"
  ADD CONSTRAINT tag_fk_2
    FOREIGN KEY("personTaggedId")
      REFERENCES person(id)
        ON DELETE CASCADE;

