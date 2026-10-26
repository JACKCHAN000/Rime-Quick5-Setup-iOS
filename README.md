# Rime-Quick5-Setup-iOS

適用於 iOS Hamster 的 Rime 速成輸入法設定，整合繁體中文與粵語詞庫、英文輸入、粵語語法模型，以及上屏後的聯想候選。

## 元書輸入法與 RIME

[元書輸入法（Hamster）](https://ihsiao.com/apps/hamster/v3/docs/guides/intro/)是一款基於 RIME 引擎的 iPhone／iPad 第三方鍵盤，支援匯入輸入方案、詞庫，以及自訂鍵盤佈局、皮膚與按鍵操作。

[RIME（中州韻輸入法引擎）](https://rime.im/)是一個開源輸入法框架，支援速成、倉頡、注音、拼音、粵拼等多種方案，也能透過設定檔與擴充元件調整輸入行為。

兩者各有分工：

- **元書**提供 iOS 上的鍵盤介面、操作方式與皮膚。
- **RIME**處理輸入編碼、組詞與候選字等輸入邏輯。
- **本專案**提供 `quick5_lite` 速成方案、繁體中文與粵語詞庫、英文輸入，以及語法模型與聯想功能的設定。

## 為甚麼選擇元書＋RIME？

- **自行調整詞庫與候選排序**：可加入常用詞、自訂短語及粵語詞彙，讓配置更符合日常書寫習慣。
- **延續熟悉的輸入方式**：保留速成操作習慣，同時使用中英混輸、反查及 Lua 工具等擴充功能。
- **鍵盤外觀與操作都能修改**：從字根顯示、符號位置，到上下滑快捷與長按選單，都能按需要調整。
- **核心輸入可離線運作**：一般輸入由裝置本機處理，不需要依賴雲端候選服務。[元書 App Store 介紹](https://apps.apple.com/tw/app/%E5%85%83%E4%B9%A6%E8%BE%93%E5%85%A5%E6%B3%95/id6744464701)

這個組合適合希望保留速成使用習慣，同時進一步調整詞庫、輸入功能與鍵盤外觀的使用者。本專案整理了所需配置，方便匯入元書後使用及繼續修改。

**開始使用：**[下載元書輸入法](https://apps.apple.com/tw/app/%E5%85%83%E4%B9%A6%E8%BE%93%E5%85%A5%E6%B3%95/id6744464701) · [閱讀元書官方文件](https://ihsiao.com/apps/hamster/v3/docs/guides/intro/)

## 實機畫面

<p align="center">
  <img src="https://github.com/user-attachments/assets/cf5c58f3-9d7c-40b0-bc2e-75c588dc4149" alt="元書輸入法實機畫面：倉頡字根皮膚與繁體中文候選列" width="420" />
</p>

元書實機畫面，展示倉頡字根鍵面與候選列。圖片使用 GitHub 附件圖床託管。

## 功能

- **速成輸入**：方案 ID 為 `quick5_lite`，搭配多個中文及粵語詞庫。
- **英文輸入**：速成方案內掛載 `melt_eng`，亦可切換至獨立英文方案。
- **粵語語法模型**：使用 `zh-hant-cantonese.gram`，協助輸入時的候選排序與語句組合。
- **上屏聯想**：透過 RIME 官方的 [`librime-predict`](https://github.com/rime/librime-predict) 讀取 `predict.db`，在字詞上屏後顯示後續候選；預設開啟，每次聯想一輪。
- **輔助功能**：Emoji、繁簡切換、自訂短語、日期時間、農曆、Unicode、數字及計算器。

## 皮膚設計器

可搭配 [元書造型所 Hamster Skin Studio](https://jackchan000.github.io/rime-hamster-ios-skin-designer/) 自訂鍵盤外觀，使用繁體中文介面調整倉頡字根／字母字面、配色、工具列、上下滑快捷及長按標點，並匯出 `.cskin` 皮膚。

- [開啟線上皮膚設計器](https://jackchan000.github.io/rime-hamster-ios-skin-designer/)
- [皮膚設計器原始碼](https://github.com/JACKCHAN000/rime-hamster-ios-skin-designer)

設計器預設綁定中文 `quick5_lite`、英文 `melt_eng`。調整完成後選擇「匯出皮膚」，再分享至元書安裝；輸入方案與皮膚分開管理，也可在設計器修改綁定的方案 ID。

## 安裝

### 方式一：以下載連結導入元書

在元書的下載連結導入功能貼上以下網址，即可下載本方案：

```text
https://codeload.github.com/JACKCHAN000/Rime-Quick5-Setup-iOS/zip/refs/heads/main
```

[下載方案 ZIP](https://codeload.github.com/JACKCHAN000/Rime-Quick5-Setup-iOS/zip/refs/heads/main)

導入後執行重新部署，再選擇「速成」方案。

### 方式二：手動下載與匯入

1. 下載本儲存庫的 [ZIP 壓縮檔](https://github.com/JACKCHAN000/Rime-Quick5-Setup-iOS/archive/refs/heads/main.zip)，並解壓縮。
2. 透過 Hamster 的檔案匯入或傳檔功能，將儲存庫內的設定檔與資料夾放入 Rime 使用者資料目錄，保留原本的目錄結構。`quick5_lite.schema.yaml`、`predict.db` 和 `zh-hant-cantonese.gram` 應位於同一層。
3. 執行重新部署，然後選擇「速成」方案。

若已有自己的 Rime 設定，請先備份，再合併同名設定檔。使用聯想功能的輸入法版本須內建 `librime-predict`；使用語法模型亦須具備對應的 Rime 支援。

## 主要檔案

| 檔案或目錄 | 用途 |
| --- | --- |
| `quick5_lite.schema.yaml` | 速成方案、輸入引擎、選單開關及聯想設定 |
| `quick5_lite.custom.yaml` | 僅載入粵語語法模型的補丁 |
| `quick5_lite.extended.dict.yaml` | 中文詞庫載入清單 |
| `cn_dicts/` | 速成、粵語及其他中文詞庫 |
| `melt_eng.schema.yaml`、`melt_eng.dict.yaml` | 英文方案及詞庫載入設定 |
| `en_dicts/` | 英文詞庫 |
| `grammar.yaml`、`zh-hant-cantonese.gram` | 語法模型設定及模型資料 |
| `essay-cantonese.txt` | 粵語詞彙資料 |
| `predict.db` | 上屏後聯想詞庫，約 10 MB |
| `custom_phrase.txt` | 自訂短語與優先候選 |
| `rime.lua`、`lua/` | Lua 擴充功能 |
| `opencc/` | Emoji 轉換設定及資料 |
| `default.yaml`、`default.custom.yaml` | 全域設定、候選選單與方案清單 |

## 聯想設定

聯想設定位於 `quick5_lite.schema.yaml`：`predictor` 處理器放在 `key_binder` 之前，`predict_translator` 放在翻譯器清單開頭，`prediction` 開關與原有的中英、標點、繁簡、Emoji 及全半形開關一起列在 `switches` 中。

可在方案內調整以下參數：

```yaml
predictor:
  db: predict.db
  max_candidates: 9
  max_iterations: 1
```

`quick5_lite.custom.yaml` 僅保留語法模型載入：

```yaml
patch:
  __include: grammar:/hant-cantonese
```

- 在方案選單切換「關閉聯想／開啟聯想」。若要預設關閉，將 `quick5_lite.schema.yaml` 中 `prediction` 開關的 `reset` 改為 `0`。
- `max_candidates` 設定聯想候選數，目前為 `9`，與每頁候選數一致。
- `max_iterations` 設定連續聯想輪數，目前為 `1`。
- `predict.db` 提供上屏後的候選；`.gram` 模型協助輸入過程中的組詞與排序，兩者用途不同。

變更設定後須重新部署。聯想設定請直接修改 `quick5_lite.schema.yaml` 中的對應欄位。

## 自訂

- **短語**：編輯 `custom_phrase.txt`，以 Tab 分隔詞語、編碼及權重。
- **中文詞庫**：在 `quick5_lite.extended.dict.yaml` 的 `import_tables` 調整要載入的詞庫。
- **候選數量**：修改 `default.yaml` 的 `menu/page_size`；如需一致，可同步調整 `predictor/max_candidates`。
- **日期及其他功能**：可輸入 `date`、`time`、`week`、`datetime`、`timestamp` 或 `lunar`；`U`、`R`、`N`、`V` 前綴分別用於 Unicode、數字、公曆轉農曆及計算器。

## 排查問題

- **沒有聯想候選**：確認 `predict.db` 位於 Rime 使用者資料目錄、已開啟「聯想」，並已重新部署。詞庫未收錄的上文可能沒有候選。
- **找不到 `predictor` 或 `predict_translator`**：檢查輸入法是否包含 `librime-predict`。
- **部署失敗**：先檢查部署日誌、YAML 縮排與檔案是否完整；尤其不要漏傳 `lua/`、`opencc/`、詞庫及模型檔案。

已檢查聯想設定的 YAML 結構、元件位置及詞庫完整性；使用者已確認重新部署後，聯想功能與方案選單均已生效。

## 來源與致謝

- 聯想元件、`predict.db` 資料庫格式與設定方式：RIME 官方的 [`rime/librime-predict`](https://github.com/rime/librime-predict)。官方亦提供 [`predict.db` 參考詞庫](https://github.com/rime/librime-predict/releases/download/data-1.0/predict.db)。
- 繁體中文及粵語語法模型處理：[`JACKCHAN000/rime-corpus-processing`](https://github.com/JACKCHAN000/rime-corpus-processing)。
- 輸入引擎與 Lua 擴充：[`rime/librime`](https://github.com/rime/librime)、[`hchunhui/librime-lua`](https://github.com/hchunhui/librime-lua)。

其他設定、腳本及詞庫的來源資訊請參閱各檔案內的註解；使用與再散布時請依各來源的授權條款辦理。
