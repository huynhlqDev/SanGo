# ⚽ SanGo App

Ứng dụng di động giúp người dùng tìm và đặt sân bóng gần nhất, đồng thời hỗ trợ chủ sân quản lý lịch đặt và thông tin sân của mình.

---

## 🚀 Tính năng

### 🧍 Người dùng (khách đặt sân):
- Tìm kiếm sân bóng theo vị trí (quận, thành phố)
- Lọc sân theo:
  - Khu vực
  - Khung giờ
  - Loại sân (5 người, 7 người…)
  - Giá
- Xem thông tin sân bóng (địa chỉ, giá, khung giờ trống)
- Đặt sân bằng tên và số điện thoại, **không cần đăng nhập**
- Tính năng **"cáp kèo đá"** với người dùng khác (dự kiến)

### 🏠 Chủ sân:
- Đăng nhập/đăng ký tài khoản
- Thêm và quản lý sân bóng
- Cập nhật thời gian trống, giá và loại sân
- Xem danh sách đặt sân theo ngày

---

## 🧱 Công nghệ sử dụng

| Thành phần     | Mô tả                                  |
|----------------|-----------------------------------------|
| `SwiftUI`      | Giao diện người dùng                    |
| `Combine`      | Quản lý trạng thái và reactive binding  |
| `Firebase`     | Dữ liệu thời gian thực, auth            |
| `Firestore`    | Lưu thông tin sân, lịch đặt             |

---

## 📱 Giao diện chính

| Màn hình      | Mô tả                                           |
|---------------|--------------------------------------------------|
| `MainTabView` | Gồm 3 tab: Tìm kiếm - Quản lý sân - Tài khoản   |
| `SearchView`  | Tìm kiếm sân + lọc + danh sách                  |
| `MyFieldsView`| Dành cho chủ sân – quản lý các sân đã tạo       |
| `AccountView` | Đăng nhập/đăng xuất, chuyển đổi chế độ          |

---

## 🛠 Thiết lập Firebase

1. Tạo project trên [Firebase Console](https://console.firebase.google.com/)
2. Thêm app iOS (bundle ID phải trùng)
3. Tải `GoogleService-Info.plist` → kéo vào Xcode
4. Bật **Firestore** và **Authentication** (email/password)

---

## 📌 Ghi chú

- Ứng dụng vẫn đang trong giai đoạn phát triển.
- Chủ sân phải đăng nhập, người dùng thường chỉ cần nhập tên + số điện thoại khi đặt sân.
- Tính năng "cáp kèo" sẽ phát triển sau khi xong phần đặt sân cơ bản.

---

## ✍️ Tác giả

- iOS Developer: [Tên bạn]
- Thiết kế ý tưởng & sản phẩm: [Tên bạn nếu cùng]

---

## ✅ TODO

- [x] Thiết kế giao diện tìm kiếm
- [ ] Tích hợp Firestore
- [ ] Màn hình chi tiết sân
- [ ] Đặt sân & xác nhận
- [ ] Giao diện quản lý của chủ sân
- [ ] Cáp kèo đá

---

