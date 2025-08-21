
     ┌─────────┐                          
     │  Home   ├─────────────────┬───────────────────────┬──────────────────────┐
     └────┬────┘                 │                       │                      │
          │                      │                       │                      │
     ┌────┴────┐            ┌────┴────┐             ┌────┴────┐            ┌────┴────┐
     │  Home/2 │            │  Send   │             │  Recv   │            │ Settings│
     └────┬────┘            └────┬────┘             └────┬────┘            └─────────┘
          │                      │                       │
     ┌────┴────┐            ┌────┴────┐          ┌───────┴───────┐
     │  Home/. │            │   Tx    │          │               │
     └────┬────┘            └────┬────┘     ┌────┴────┐     ┌────┴────┐
          │                      │          │  Hist.  │     │  List   │
     ┌────┴────┐            ┌────┴────┐     └─────────┘     └─────────┘
     │  Home/n │            │  Verif  │
     └─────────┘            └────┬────┘
                                 │     
                            ┌────┴────┐
                            │  Sign   │
                            └─────────┘

```
[AppBloc] <--- (Manages Rust State, Navigation Events, Home Pagination)
   |          (Tracks: pageIndex, entryLength, sendDiscovered)
   v
[BlocProvider] <--- (Provides AppBloc globally)
   |
   v
[RouterDelegate] <--- (Manages Root Stack: List<Page>)
   |
   v
[RootNavigator] <--- (Root Stack: Contains Substack Navigators)
   |
   +--[HomeSubstack] <--- (Navigator: Single HomeScreen with Pagination)
   |      |
   |      +-- HomeScreen (/home?pageIndex=X&entryLength=Y)
   |
   +--[SendSubstack] <--- (Navigator: Linear Flow with Jump Backward/Forward)
   |      |
   |      +-- SendScreen (/send)
   |      +-- TxScreen (/send/tx)
   |      +-- VerifScreen (/send/verif)
   |      +-- SignScreen (/send/sign)
   |
   +--[RecvSubstack] <--- (Navigator: Branching Flow)
   |      |
   |      +-- RecvScreen (/recv)
   |      +-- HistoryScreen (/recv/history)  OR  ListScreen (/recv/list)
   |
   +--[SettingsSubstack] <--- (Navigator: Single Screen)
          |
          +-- SettingsScreen (/settings)
```

Navigation Flow:
1. AppBloc -> NavigationEvent (NavigateTo, JumpTo, ChangeHomePage)
2. HomeSubstack -> Single HomeScreen with pageIndex/entryLength
3. SendSubstack -> Linear with Jump (Backward: Any; Forward: If discovered)
4. RecvSubstack -> Branch to History or List
5. SettingsSubstack -> Single screen

```
lib/
├── models/                    # Data models
│   └── app_state.dart         # AppState model (FRB-generated or custom)
├── screens/                   # UI screens and models
│   ├── receive/               # Receive flow (branching)
│   │   ├── history.dart       # HistoryScreen (Receive flow branch)
│   │   ├── list.dart          # ListScreen (Receive flow branch)
│   │   └── receive.dart       # ReceiveScreen (Receive flow entry)
│   ├── send/                  # Send flow (linear with jumps)
│   │   ├── send.dart          # SendScreen (Send flow entry)
│   │   ├── sign.dart          # SignScreen
│   │   ├── transactions.dart  # TxScreen (Transaction screen)
│   │   └── verif.dart         # VerifScreen
│   ├── home.dart              # HomeScreen with pagination (pageIndex, entryLength)
│   ├── app_bloc.dart          # AppBloc for state management (Rust state, navigation, pagination)
│   ├── app_route.dart         # AppRoute model for parsing routes and query parameters
│   ├── main.dart              # Entry point, sets up BlocProvider and MaterialApp.router
│   ├── router_delegate.dart   # RouterDelegate and RouteInformationParser for Navigator 2.0
│   └── settings.dart          # SettingsScreen (Settings flow)
├── src/                       # FRB bindings and core app logic
│   ├── rust/                  # FRB-generated bindings
│   │   └── controller.dart    # FRB-generated Controller (assumed, with methods like incrementCounter)
pubspec.yaml                   # Dependencies (flutter_bloc, rxdart, etc.)
```

