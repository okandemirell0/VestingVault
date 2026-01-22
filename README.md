# VestingVault ⏳

**VestingVault**, belirlenen kullanıcı(lar)a zaman içinde token dağıtımı (vesting) yapmaya yarayan bir akıllı kontrattır. Özellikle yatırımcılar, ekip üyeleri veya danışmanlar için kullanılabilir.

## 🚀 Özellikler

- 📅 **Zaman Bazlı Vesting**: Token'lar belirli bir süre boyunca eşit olarak açılır.
- 🔐 **Token Kilitleme**: Belirli bir süre boyunca token'lar çekilemez.
- 👤 **Kullanıcı Bazlı Vesting**: Her kullanıcı için özel vesting planı tanımlanabilir.
- ⚡ **ERC20 Uyumlu**: Herhangi bir ERC20 token ile çalışır.
- 🔒 Güvenlik: Reentrancy koruması, overflow kontrolleri, güvenli `transfer`

---

## 🧠 Kullanım Senaryoları

- Startuplarda **ekip token'ları** dağıtımı
- **Yatırımcı token'ları** için kilit süreci
- DAO'larda **grants / ödül programları**
- Danışmanlık ve partner anlaşmaları

---

## 📦 Teknolojiler

- Solidity `^0.8.20`
- OpenZeppelin ERC20 kütüphanesi
- Hardhat / Foundry destekli geliştirme

---

## 📜 Fonksiyonlar

| Fonksiyon              | Açıklama                                 |
|------------------------|------------------------------------------|
| `createVesting()`      | Yeni bir vesting planı başlatır          |
| `release()`            | Kullanıcıya açılan token'ı gönderir      |
| `releasableAmount()`   | Şu ana kadar hak edilmiş token miktarı   |
| `vestingSchedule()`    | Vesting detaylarını görüntüler           |

> Fonksiyon isimleri örnektir. Gerçek kontrata göre güncellenebilir.

---

## 🛠️ Kurulum

```bash
git clone https://github.com/okandemirell0/vestingvault.git
cd vestingvault
npm install
