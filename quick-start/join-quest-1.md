---
description: 各位新人們好，你也準備好要 All-in 結果導向的 AI x BDD 軟體全自動化開發方法了嗎？
---

# 新手任務 - AI x BDD 實戰上手

### 任務目標

### 任務目標

撰寫一份完整、明確且 AI 可理解的 BDD Feature File，描述一項你感興趣或熟悉的小型應用功能，作為日後全自動化開發任務的共同規格參考。

### 評核要點

* 使用 Gherkin 語法撰寫
* 條列清楚的 1. `Title / Description`和 2. Scenarios 描述 （ `Given / When / Then` )
* 須符合軟體開發邏輯，可被開發人員與 AI 理解與執行
* 題目需具備實用性與通用性，方便後續研究延伸

### 提交方式

* 將 Feature File 上傳至指定 GitHub Repository
* 並於 Discord 指定頻道完成提交回報

### 福利回饋

* 完成任務者可獲得 **NT$500 課程折扣碼**
* 可晉升進入「新手任務二」階段

首先，請你用底下指示生成一個 BDD 的雛形專案。

### 需求







````
# Role
你是專精於後端自動化測試＆Cucumber 的軟體工程師。

# Objective
你必須參考底下 Tech-Stack，架設好這份 Tech-Stack 的最小可行版本（又稱之為 Walking Skeleton）並用一個最小可行的自動化驗收測試，來確認其可運行。

# Tech Stack

## Language Environment
(改成你所使用的程式語言環境)
- Java 11
- Package Management: Maven (Build Tool)

## Lib/Tools (in Language Environment)
- Lombok
- Json 處理：Jackson (JSON Processing)

## Testing Environment
- BDD 測試框架：Cucumber （不可改）
- 單元測試套件：Jupiter (Junit 5)

# Specs
- 專案目錄： app/ 

# Task
1. 先參考 tech-stack 架設好完全遵守此 tech-stack 的 walking skeleton 於 <專案目錄>/ 目錄中，包含 Cucumber 自動化測試框架。

2. 架設好 walking skeleton 之後，接著設計一個最小可行的自動化驗收測試（hello-world.feature) 來嚴格確認 Cucumber+test framework+tech stack 順利運行。驗收測試規格如下：
    a. 建立 hello-world.feature 檔案於 <專案目錄>/features 目錄中，內容為底下：
        - Feature file 內容：
            ```
            Feature: Game Initialization
            As a user
            I want to say "Hello world, <your name>." to You while greeting.

            Scenario: Greeting
                When the user greeting with the name "Johnny"
                Then return the message "Hello world, Johnny."
                And a new greeting record has been added with the content "Hello world, Johnny."
            ```
    b. 接著使用 Cucumber 自動化測試套件來關聯上述 hello-world.feature，撰寫一個自動化 E2E 測試，E2E 測試中所定義的 API 為： [GET] /greeting/<name>。這個 API 除了會回傳改編過後的招呼訊息之外，還會把訊息透過 ORM 儲存到 DBMS 中的 "Test" 實體資料表中。
    c. 結合後端 web-framework，開發最小可行程式碼來通過上述的測試案例
    d. 此 Scenario 中其中兩個 assertion 的測試目的和測試方法必須做到以下兩者，必須從嚴：
        i. "Then return the message "Hello world, Johnny." --> 測試 API 回傳的訊息中涵蓋此訊息，直接比較值即可知道是否正確
        ii. "And a new greeting record has been added with the content "Hello world, Johnny." --> 透過測試環境中的 Repository 中實際模擬資料庫存取，從 Test 實體資料表中去查詢最新 record，並確定此 record 的訊息與預期訊息一致。
    d. 確定 Cucumber/測試框架有「實際執行」到上述的測試案例 (Test case)，並且通過 (passed)，否則就要修改程式碼，直到通過為止。

3. 最後，確認 Cucumber/測試框架有產生「測試報告」，一定要產生測試報告，且報告中的通過測試數目必須符合。
````
