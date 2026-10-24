# Rime-Quick5-Setup-iOS

適用於 iOS Hamster 的 Rime 速成輸入法設定，整合繁體中文與粵語詞庫、英文輸入、粵語語法模型，以及上屏後的聯想候選。

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
| `quick5_lite.schema.yaml` | 速成方案與輸入引擎設定 |
| `quick5_lite.custom.yaml` | 啟用粵語語法模型及聯想功能的補丁 |
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

`quick5_lite.custom.yaml` 已加入聯想處理器、翻譯器及開關：

```yaml
patch:
  __include: grammar:/hant-cantonese
  "engine/processors/@before 0": predictor
  "engine/translators/@before 0": predict_translator
  "switches/+":
    - name: prediction
      states: [ 關閉聯想, 開啟聯想 ]
      reset: 1
  predictor:
    db: predict.db
    max_candidates: 9
    max_iterations: 1
```

- 在方案選單切換「關閉聯想／開啟聯想」。若要預設關閉，將 `reset` 改為 `0`。
- `max_candidates` 設定聯想候選數，目前為 `9`，與每頁候選數一致。
- `max_iterations` 設定連續聯想輪數，目前為 `1`。
- `predict.db` 提供上屏後的候選；`.gram` 模型協助輸入過程中的組詞與排序，兩者用途不同。

變更設定後須重新部署。請將上述項目合併在現有的同一個 `patch:` 區塊內。

## 自訂

- **短語**：編輯 `custom_phrase.txt`，以 Tab 分隔詞語、編碼及權重。
- **中文詞庫**：在 `quick5_lite.extended.dict.yaml` 的 `import_tables` 調整要載入的詞庫。
- **候選數量**：修改 `default.yaml` 的 `menu/page_size`；如需一致，可同步調整 `predictor/max_candidates`。
- **日期及其他功能**：可輸入 `date`、`time`、`week`、`datetime`、`timestamp` 或 `lunar`；`U`、`R`、`N`、`V` 前綴分別用於 Unicode、數字、公曆轉農曆及計算器。

## 排查問題

- **沒有聯想候選**：確認 `predict.db` 位於 Rime 使用者資料目錄、已開啟「聯想」，並已重新部署。詞庫未收錄的上文可能沒有候選。
- **找不到 `predictor` 或 `predict_translator`**：檢查輸入法是否包含 `librime-predict`。
- **部署失敗**：先檢查部署日誌、YAML 縮排與檔案是否完整；尤其不要漏傳 `lua/`、`opencc/`、詞庫及模型檔案。

已檢查聯想設定的 YAML 結構、元件位置及詞庫完整性；不同元書版本的聯想支援與候選結果仍以實機測試為準。

## 來源與致謝

- 聯想元件、`predict.db` 資料庫格式與設定方式：RIME 官方的 [`rime/librime-predict`](https://github.com/rime/librime-predict)。官方亦提供 [`predict.db` 參考詞庫](https://github.com/rime/librime-predict/releases/download/data-1.0/predict.db)。
- 繁體中文及粵語語法模型處理：[`JACKCHAN000/rime-corpus-processing`](https://github.com/JACKCHAN000/rime-corpus-processing)。
- 輸入引擎與 Lua 擴充：[`rime/librime`](https://github.com/rime/librime)、[`hchunhui/librime-lua`](https://github.com/hchunhui/librime-lua)。

其他設定、腳本及詞庫的來源資訊請參閱各檔案內的註解；使用與再散布時請依各來源的授權條款辦理。
