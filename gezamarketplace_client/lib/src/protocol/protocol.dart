/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'beauty_style.dart' as _i2;
import 'beauty_style_generate_message.dart' as _i3;
import 'beauty_style_images.dart' as _i4;
import 'beauty_style_message.dart' as _i5;
import 'beauty_style_state_message.dart' as _i6;
import 'beauty_stylists_state.dart' as _i7;
import 'beauty_stylists_state_message.dart' as _i8;
import 'booking.dart' as _i9;
import 'booking_append_booking_message.dart' as _i10;
import 'booking_append_order.dart' as _i11;
import 'booking_append_order_chat.dart' as _i12;
import 'booking_message.dart' as _i13;
import 'booking_new_order.dart' as _i14;
import 'booking_order_chat.dart' as _i15;
import 'booking_order_list.dart' as _i16;
import 'channel.dart' as _i17;
import 'chat_message.dart' as _i18;
import 'create_chat_state.dart' as _i19;
import 'example.dart' as _i20;
import 'locations.dart' as _i21;
import 'message.dart' as _i22;
import 'order_chat.dart' as _i23;
import 'order_chat_message.dart' as _i24;
import 'order_message.dart' as _i25;
import 'orders.dart' as _i26;
import 'persons.dart' as _i27;
import 'product.dart' as _i28;
import 'profile_images.dart' as _i29;
import 'shares.dart' as _i30;
import 'tags.dart' as _i31;
import 'protocol.dart' as _i32;
import 'package:gezamarketplace_client/src/protocol/booking.dart' as _i33;
import 'package:gezamarketplace_client/src/protocol/chat_message.dart' as _i34;
import 'package:gezamarketplace_client/src/protocol/booking_order_chat.dart'
    as _i35;
import 'package:gezamarketplace_client/src/protocol/persons.dart' as _i36;
import 'package:gezamarketplace_client/src/protocol/product.dart' as _i37;
import 'package:gezamarketplace_client/src/protocol/beauty_style.dart' as _i38;
import 'package:serverpod_auth_client/module.dart' as _i39;
import 'package:serverpod_chat_client/module.dart' as _i40;
export 'beauty_style.dart';
export 'beauty_style_generate_message.dart';
export 'beauty_style_images.dart';
export 'beauty_style_message.dart';
export 'beauty_style_state_message.dart';
export 'beauty_stylists_state.dart';
export 'beauty_stylists_state_message.dart';
export 'booking.dart';
export 'booking_append_booking_message.dart';
export 'booking_append_order.dart';
export 'booking_append_order_chat.dart';
export 'booking_message.dart';
export 'booking_new_order.dart';
export 'booking_order_chat.dart';
export 'booking_order_list.dart';
export 'channel.dart';
export 'chat_message.dart';
export 'create_chat_state.dart';
export 'example.dart';
export 'locations.dart';
export 'message.dart';
export 'order_chat.dart';
export 'order_chat_message.dart';
export 'order_message.dart';
export 'orders.dart';
export 'persons.dart';
export 'product.dart';
export 'profile_images.dart';
export 'shares.dart';
export 'tags.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Map<Type, _i1.constructor> customConstructors = {};

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (customConstructors.containsKey(t)) {
      return customConstructors[t]!(data, this) as T;
    }
    if (t == _i2.BeautyStyle) {
      return _i2.BeautyStyle.fromJson(data, this) as T;
    }
    if (t == _i3.BeautyStyleCreateMessage) {
      return _i3.BeautyStyleCreateMessage.fromJson(data, this) as T;
    }
    if (t == _i4.Images) {
      return _i4.Images.fromJson(data, this) as T;
    }
    if (t == _i5.BeautyStyleAppendMessage) {
      return _i5.BeautyStyleAppendMessage.fromJson(data, this) as T;
    }
    if (t == _i6.BeautyStyleStateMessage) {
      return _i6.BeautyStyleStateMessage.fromJson(data, this) as T;
    }
    if (t == _i7.BeautyStylistsState) {
      return _i7.BeautyStylistsState.fromJson(data, this) as T;
    }
    if (t == _i8.BeautyStylistsStateMessage) {
      return _i8.BeautyStylistsStateMessage.fromJson(data, this) as T;
    }
    if (t == _i9.BookingOrder) {
      return _i9.BookingOrder.fromJson(data, this) as T;
    }
    if (t == _i10.AppendBookingMessage) {
      return _i10.AppendBookingMessage.fromJson(data, this) as T;
    }
    if (t == _i11.BookingOrderAppendMessage) {
      return _i11.BookingOrderAppendMessage.fromJson(data, this) as T;
    }
    if (t == _i12.BookingOrderChatAppendMessage) {
      return _i12.BookingOrderChatAppendMessage.fromJson(data, this) as T;
    }
    if (t == _i13.BookingMessage) {
      return _i13.BookingMessage.fromJson(data, this) as T;
    }
    if (t == _i14.BookingOrderCreateMessage) {
      return _i14.BookingOrderCreateMessage.fromJson(data, this) as T;
    }
    if (t == _i15.BookingOrderChat) {
      return _i15.BookingOrderChat.fromJson(data, this) as T;
    }
    if (t == _i16.BookingOrderStateMessage) {
      return _i16.BookingOrderStateMessage.fromJson(data, this) as T;
    }
    if (t == _i17.Channel) {
      return _i17.Channel.fromJson(data, this) as T;
    }
    if (t == _i18.ChatMessage) {
      return _i18.ChatMessage.fromJson(data, this) as T;
    }
    if (t == _i19.ChatMessageCreateMessage) {
      return _i19.ChatMessageCreateMessage.fromJson(data, this) as T;
    }
    if (t == _i20.Example) {
      return _i20.Example.fromJson(data, this) as T;
    }
    if (t == _i21.Location) {
      return _i21.Location.fromJson(data, this) as T;
    }
    if (t == _i22.Message) {
      return _i22.Message.fromJson(data, this) as T;
    }
    if (t == _i23.OrderChat) {
      return _i23.OrderChat.fromJson(data, this) as T;
    }
    if (t == _i24.OrderChatAppendMessage) {
      return _i24.OrderChatAppendMessage.fromJson(data, this) as T;
    }
    if (t == _i25.OrderMessage) {
      return _i25.OrderMessage.fromJson(data, this) as T;
    }
    if (t == _i26.SaleOrder) {
      return _i26.SaleOrder.fromJson(data, this) as T;
    }
    if (t == _i27.Person) {
      return _i27.Person.fromJson(data, this) as T;
    }
    if (t == _i28.Product) {
      return _i28.Product.fromJson(data, this) as T;
    }
    if (t == _i29.ProfileImages) {
      return _i29.ProfileImages.fromJson(data, this) as T;
    }
    if (t == _i30.Share) {
      return _i30.Share.fromJson(data, this) as T;
    }
    if (t == _i31.Tag) {
      return _i31.Tag.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i2.BeautyStyle?>()) {
      return (data != null ? _i2.BeautyStyle.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i3.BeautyStyleCreateMessage?>()) {
      return (data != null
          ? _i3.BeautyStyleCreateMessage.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i4.Images?>()) {
      return (data != null ? _i4.Images.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i5.BeautyStyleAppendMessage?>()) {
      return (data != null
          ? _i5.BeautyStyleAppendMessage.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i6.BeautyStyleStateMessage?>()) {
      return (data != null
          ? _i6.BeautyStyleStateMessage.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i7.BeautyStylistsState?>()) {
      return (data != null
          ? _i7.BeautyStylistsState.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i8.BeautyStylistsStateMessage?>()) {
      return (data != null
          ? _i8.BeautyStylistsStateMessage.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i9.BookingOrder?>()) {
      return (data != null ? _i9.BookingOrder.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i10.AppendBookingMessage?>()) {
      return (data != null
          ? _i10.AppendBookingMessage.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i11.BookingOrderAppendMessage?>()) {
      return (data != null
          ? _i11.BookingOrderAppendMessage.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i12.BookingOrderChatAppendMessage?>()) {
      return (data != null
          ? _i12.BookingOrderChatAppendMessage.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i13.BookingMessage?>()) {
      return (data != null ? _i13.BookingMessage.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i14.BookingOrderCreateMessage?>()) {
      return (data != null
          ? _i14.BookingOrderCreateMessage.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i15.BookingOrderChat?>()) {
      return (data != null ? _i15.BookingOrderChat.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i16.BookingOrderStateMessage?>()) {
      return (data != null
          ? _i16.BookingOrderStateMessage.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i17.Channel?>()) {
      return (data != null ? _i17.Channel.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i18.ChatMessage?>()) {
      return (data != null ? _i18.ChatMessage.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i19.ChatMessageCreateMessage?>()) {
      return (data != null
          ? _i19.ChatMessageCreateMessage.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i20.Example?>()) {
      return (data != null ? _i20.Example.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i21.Location?>()) {
      return (data != null ? _i21.Location.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i22.Message?>()) {
      return (data != null ? _i22.Message.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i23.OrderChat?>()) {
      return (data != null ? _i23.OrderChat.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i24.OrderChatAppendMessage?>()) {
      return (data != null
          ? _i24.OrderChatAppendMessage.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i25.OrderMessage?>()) {
      return (data != null ? _i25.OrderMessage.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i26.SaleOrder?>()) {
      return (data != null ? _i26.SaleOrder.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i27.Person?>()) {
      return (data != null ? _i27.Person.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i28.Product?>()) {
      return (data != null ? _i28.Product.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i29.ProfileImages?>()) {
      return (data != null ? _i29.ProfileImages.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i30.Share?>()) {
      return (data != null ? _i30.Share.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i31.Tag?>()) {
      return (data != null ? _i31.Tag.fromJson(data, this) : null) as T;
    }
    if (t == List<_i32.Images>) {
      return (data as List).map((e) => deserialize<_i32.Images>(e)).toList()
          as dynamic;
    }
    if (t == _i1.getType<List<_i32.Tag>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i32.Tag>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i32.Share>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i32.Share>(e)).toList()
          : null) as dynamic;
    }
    if (t == List<_i32.BeautyStyle>) {
      return (data as List)
          .map((e) => deserialize<_i32.BeautyStyle>(e))
          .toList() as dynamic;
    }
    if (t == List<_i32.BeautyStylistsState>) {
      return (data as List)
          .map((e) => deserialize<_i32.BeautyStylistsState>(e))
          .toList() as dynamic;
    }
    if (t == List<_i32.BookingMessage>) {
      return (data as List)
          .map((e) => deserialize<_i32.BookingMessage>(e))
          .toList() as dynamic;
    }
    if (t == List<_i32.BookingOrder>) {
      return (data as List)
          .map((e) => deserialize<_i32.BookingOrder>(e))
          .toList() as dynamic;
    }
    if (t == List<_i32.Message>) {
      return (data as List).map((e) => deserialize<_i32.Message>(e)).toList()
          as dynamic;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i32.Person>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i32.Person>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i32.Images>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i32.Images>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i32.Tag>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i32.Tag>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i32.Share>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i32.Share>(e)).toList()
          : null) as dynamic;
    }
    if (t == List<_i33.BookingOrder>) {
      return (data as List)
          .map((e) => deserialize<_i33.BookingOrder>(e))
          .toList() as dynamic;
    }
    if (t == List<_i34.ChatMessage>) {
      return (data as List)
          .map((e) => deserialize<_i34.ChatMessage>(e))
          .toList() as dynamic;
    }
    if (t == List<_i35.BookingOrderChat>) {
      return (data as List)
          .map((e) => deserialize<_i35.BookingOrderChat>(e))
          .toList() as dynamic;
    }
    if (t == List<_i36.Person>) {
      return (data as List).map((e) => deserialize<_i36.Person>(e)).toList()
          as dynamic;
    }
    if (t == List<_i37.Product>) {
      return (data as List).map((e) => deserialize<_i37.Product>(e)).toList()
          as dynamic;
    }
    if (t == List<_i38.BeautyStyle>) {
      return (data as List)
          .map((e) => deserialize<_i38.BeautyStyle>(e))
          .toList() as dynamic;
    }
    try {
      return _i39.Protocol().deserialize<T>(data, t);
    } catch (_) {}
    try {
      return _i40.Protocol().deserialize<T>(data, t);
    } catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    String? className;
    className = _i39.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    className = _i40.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_chat.$className';
    }
    if (data is _i2.BeautyStyle) {
      return 'BeautyStyle';
    }
    if (data is _i3.BeautyStyleCreateMessage) {
      return 'BeautyStyleCreateMessage';
    }
    if (data is _i4.Images) {
      return 'Images';
    }
    if (data is _i5.BeautyStyleAppendMessage) {
      return 'BeautyStyleAppendMessage';
    }
    if (data is _i6.BeautyStyleStateMessage) {
      return 'BeautyStyleStateMessage';
    }
    if (data is _i7.BeautyStylistsState) {
      return 'BeautyStylistsState';
    }
    if (data is _i8.BeautyStylistsStateMessage) {
      return 'BeautyStylistsStateMessage';
    }
    if (data is _i9.BookingOrder) {
      return 'BookingOrder';
    }
    if (data is _i10.AppendBookingMessage) {
      return 'AppendBookingMessage';
    }
    if (data is _i11.BookingOrderAppendMessage) {
      return 'BookingOrderAppendMessage';
    }
    if (data is _i12.BookingOrderChatAppendMessage) {
      return 'BookingOrderChatAppendMessage';
    }
    if (data is _i13.BookingMessage) {
      return 'BookingMessage';
    }
    if (data is _i14.BookingOrderCreateMessage) {
      return 'BookingOrderCreateMessage';
    }
    if (data is _i15.BookingOrderChat) {
      return 'BookingOrderChat';
    }
    if (data is _i16.BookingOrderStateMessage) {
      return 'BookingOrderStateMessage';
    }
    if (data is _i17.Channel) {
      return 'Channel';
    }
    if (data is _i18.ChatMessage) {
      return 'ChatMessage';
    }
    if (data is _i19.ChatMessageCreateMessage) {
      return 'ChatMessageCreateMessage';
    }
    if (data is _i20.Example) {
      return 'Example';
    }
    if (data is _i21.Location) {
      return 'Location';
    }
    if (data is _i22.Message) {
      return 'Message';
    }
    if (data is _i23.OrderChat) {
      return 'OrderChat';
    }
    if (data is _i24.OrderChatAppendMessage) {
      return 'OrderChatAppendMessage';
    }
    if (data is _i25.OrderMessage) {
      return 'OrderMessage';
    }
    if (data is _i26.SaleOrder) {
      return 'SaleOrder';
    }
    if (data is _i27.Person) {
      return 'Person';
    }
    if (data is _i28.Product) {
      return 'Product';
    }
    if (data is _i29.ProfileImages) {
      return 'ProfileImages';
    }
    if (data is _i30.Share) {
      return 'Share';
    }
    if (data is _i31.Tag) {
      return 'Tag';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'].startsWith('serverpod_auth.')) {
      data['className'] = data['className'].substring(15);
      return _i39.Protocol().deserializeByClassName(data);
    }
    if (data['className'].startsWith('serverpod_chat.')) {
      data['className'] = data['className'].substring(15);
      return _i40.Protocol().deserializeByClassName(data);
    }
    if (data['className'] == 'BeautyStyle') {
      return deserialize<_i2.BeautyStyle>(data['data']);
    }
    if (data['className'] == 'BeautyStyleCreateMessage') {
      return deserialize<_i3.BeautyStyleCreateMessage>(data['data']);
    }
    if (data['className'] == 'Images') {
      return deserialize<_i4.Images>(data['data']);
    }
    if (data['className'] == 'BeautyStyleAppendMessage') {
      return deserialize<_i5.BeautyStyleAppendMessage>(data['data']);
    }
    if (data['className'] == 'BeautyStyleStateMessage') {
      return deserialize<_i6.BeautyStyleStateMessage>(data['data']);
    }
    if (data['className'] == 'BeautyStylistsState') {
      return deserialize<_i7.BeautyStylistsState>(data['data']);
    }
    if (data['className'] == 'BeautyStylistsStateMessage') {
      return deserialize<_i8.BeautyStylistsStateMessage>(data['data']);
    }
    if (data['className'] == 'BookingOrder') {
      return deserialize<_i9.BookingOrder>(data['data']);
    }
    if (data['className'] == 'AppendBookingMessage') {
      return deserialize<_i10.AppendBookingMessage>(data['data']);
    }
    if (data['className'] == 'BookingOrderAppendMessage') {
      return deserialize<_i11.BookingOrderAppendMessage>(data['data']);
    }
    if (data['className'] == 'BookingOrderChatAppendMessage') {
      return deserialize<_i12.BookingOrderChatAppendMessage>(data['data']);
    }
    if (data['className'] == 'BookingMessage') {
      return deserialize<_i13.BookingMessage>(data['data']);
    }
    if (data['className'] == 'BookingOrderCreateMessage') {
      return deserialize<_i14.BookingOrderCreateMessage>(data['data']);
    }
    if (data['className'] == 'BookingOrderChat') {
      return deserialize<_i15.BookingOrderChat>(data['data']);
    }
    if (data['className'] == 'BookingOrderStateMessage') {
      return deserialize<_i16.BookingOrderStateMessage>(data['data']);
    }
    if (data['className'] == 'Channel') {
      return deserialize<_i17.Channel>(data['data']);
    }
    if (data['className'] == 'ChatMessage') {
      return deserialize<_i18.ChatMessage>(data['data']);
    }
    if (data['className'] == 'ChatMessageCreateMessage') {
      return deserialize<_i19.ChatMessageCreateMessage>(data['data']);
    }
    if (data['className'] == 'Example') {
      return deserialize<_i20.Example>(data['data']);
    }
    if (data['className'] == 'Location') {
      return deserialize<_i21.Location>(data['data']);
    }
    if (data['className'] == 'Message') {
      return deserialize<_i22.Message>(data['data']);
    }
    if (data['className'] == 'OrderChat') {
      return deserialize<_i23.OrderChat>(data['data']);
    }
    if (data['className'] == 'OrderChatAppendMessage') {
      return deserialize<_i24.OrderChatAppendMessage>(data['data']);
    }
    if (data['className'] == 'OrderMessage') {
      return deserialize<_i25.OrderMessage>(data['data']);
    }
    if (data['className'] == 'SaleOrder') {
      return deserialize<_i26.SaleOrder>(data['data']);
    }
    if (data['className'] == 'Person') {
      return deserialize<_i27.Person>(data['data']);
    }
    if (data['className'] == 'Product') {
      return deserialize<_i28.Product>(data['data']);
    }
    if (data['className'] == 'ProfileImages') {
      return deserialize<_i29.ProfileImages>(data['data']);
    }
    if (data['className'] == 'Share') {
      return deserialize<_i30.Share>(data['data']);
    }
    if (data['className'] == 'Tag') {
      return deserialize<_i31.Tag>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
