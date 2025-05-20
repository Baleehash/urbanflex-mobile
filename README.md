# UrbanFlex 🏙️👟

**UrbanFlex** is a modern and minimal e-commerce mobile application built with Flutter. This project is based on the tutorial by Mitch Koko ([YouTube](https://www.youtube.com/watch?v=UcwsuZP071Y)) and extended to suit a more dynamic shopping experience like Adidas or Nike mobile apps.

## ✨ Features

- 🏠 **Home Page** displaying curated shoe products.
- 🛒 **Shopping Cart** with add/remove item capability.
- 💬 **Checkout via WhatsApp** with auto-generated message.
- 📱 **Mobile-optimized UI** with sleek design.
- 🔧 **Provider** for efficient state management.
- 🚀 **Intro Page** for first-time launch.

## 📦 Folder Structure

```
lib/
├── components/
│   └── CartItem.dart
├── models/
│   ├── cart.dart
│   └── shoe.dart
├── pages/
│   ├── home_page.dart
│   ├── cart_page.dart
│   └── intro_page.dart
├── main.dart
```

## 🚀 Getting Started

1. **Clone the repository:**
   ```bash
   git clone https://github.com/Baleehash/urbanflex-mobile-app.git
   cd urbanflex
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

3. **Run the app:**
   ```bash
   flutter run
   ```

## 📲 WhatsApp Checkout

This feature creates a pre-filled WhatsApp message containing cart item names and total price:
```
Hello! I want to order:
- Air Jordan 1 (low) ($140)
- Air Jordan 1 (low) ($140)

Total: $280.00
```

## 🙌 Credits

- 🧠 UI and structure inspired by Mitch Koko’s Flutter tutorial:  
  [🖥️ YouTube Video](https://www.youtube.com/watch?v=UcwsuZP071Y)

## 🖼️ Screenshots

| Intro Page | Home Page | Cart Page |
|------------|-----------|-----------|
| <img src="https://raw.githubusercontent.com/Baleehash/urbanflex-mobile-app/main/screenshoots/intro-page.jpg" width="250"/> | <img src="https://raw.githubusercontent.com/Baleehash/urbanflex-mobile-app/main/screenshoots/Homepage.jpg" width="250"/> | <img src="https://raw.githubusercontent.com/Baleehash/urbanflex-mobile-app/main/screenshoots/cart-page.jpg" width="250"/> |

| Product Page | App Drawer | Profile Page |
|--------------|------------|--------------|
| <img src="https://raw.githubusercontent.com/Baleehash/urbanflex-mobile-app/main/screenshoots/product-page.jpg" width="250"/> | <img src="https://raw.githubusercontent.com/Baleehash/urbanflex-mobile-app/main/screenshoots/app-drawer.jpg" width="250"/> | <img src="https://raw.githubusercontent.com/Baleehash/urbanflex-mobile-app/main/screenshoots/profile.jpg" width="250"/> |


## 🔮 To-Do

- [ ] Product detail page  
- [ ] Authentication (Login/Register)  
- [ ] Payment gateway integration  
- [ ] Wishlist functionality  

## 👨‍💻 Author

- **Name:** Iqbal Maulana  
- **GitHub:** [https://github.com/Baleehash](https://github.com/Baleehash)

## 📄 License

This project is licensed under the [MIT License](https://opensource.org/licenses/MIT).

