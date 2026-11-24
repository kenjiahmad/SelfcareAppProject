# Self-Care & Mental Health Management Application

A desktop application developed with **VB.NET (Windows Forms)** and **Microsoft SQL Server** designed to help students manage daily mental wellness, personal productivity, and peer/counselor consultations in a single platform.

## Key Features

### User Module
- **Authentication & Profile Management:** Secure sign-up, login, password management, and account settings (`SignIn`, `SignUp`, `AccountCenterUser`, `ChangePassword`).
- **Mood Tracker & History:** Daily emotional state logging with historical review (`MoodTracker`, `MoodHistory`).
- **Personal Journaling:** Private digital diary for daily self-reflection (`Journal`).
- **Productivity & Finance:** Built-in task management with completion logs (`ToDoList`, `ToDoHistory`) and personal expense tracking (`FinanceTracker`).
- **Counselor Consultation:** Browse available counselors, send pairing requests, and communicate via an integrated messaging interface (`FindCounselor`, `PairWithCounselor`, `ChatRoom`).

### Counselor Module
- **Consultation Management:** Review and accept incoming student consultation requests (`IncomingReq`) and manage counselor profiles (`AccountCenterCounselor`).
- **Client Support & Monitoring:** Engage in consultation sessions via `ChatRoom` and review shared wellness logs.

## Tech Stack
- **Language & Framework:** Visual Basic .NET (VB.NET), .NET Framework (Windows Forms)
- **Database:** Microsoft SQLite (ADO.NET via `Module1.vb` & `App.config`)
- **IDE:** Microsoft Visual Studio

## Project Status & Planned Improvements
Core CRUD operations, authentication, dual-role workflows, and SQL Server database integration are implemented. Planned future updates include:
- Adding automated mood analytics charts and monthly financial summary reports.
- Implementing password hashing and role-based session encryption enhancements.
- Including full SQL Server database schema scripts (`.sql`) for one-click local setup.
